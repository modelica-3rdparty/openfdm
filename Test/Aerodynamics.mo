within Test;

partial model AerodynamicBody "aerodynamic force/torque with multibody frame connector"
  extends Modelica.Mechanics.MultiBody.Parts.BodyShape;
  import SI = Modelica.SIunits;
  import Modelica.Math.Vectors;
  import Modelica.Mechanics.MultiBody;
  import Modelica.Mechanics.MultiBody.Frames.*;
  import Modelica.Blocks.Interfaces.RealInput;
  RealInput aileron;
  RealInput elevator;
  RealInput rudder;
  RealInput flap;
  parameter Real aero_rp[3];
  parameter Real vtTol=0.1 "Velocity above which aerodynamics are enabled";
  MultiBody.Interfaces.Frame_b frame_aero "aerodynamic reference frame";
  MultiBody.Parts.FixedTranslation aero_trans(r=aero_rp) "aerodynamic reference frame translation";
protected
  Environment env;
  MultiBody.Forces.WorldForceAndTorque forceTorque;
  SI.Force lift;
  SI.Force drag;
  SI.Force sideForce;
  SI.Torque rollMoment;
  SI.Torque pitchMoment;
  SI.Torque yawMoment;

  SI.Velocity vt "true airspeed";
  SI.Angle alpha "angle of attack";
  SI.AngularVelocity alphaDot "angle of attack derivative";
  SI.Angle beta "side slip angle";
  SI.Pressure qBar "average dynamics pressure";
  SI.AngularVelocity aero_p "roll rate";
  SI.AngularVelocity aero_q "pitch rate";
  SI.AngularVelocity aero_r "yaw rate";

  SI.Velocity vRelative_ECEF[3];
  SI.Velocity vRelative_XYZ[3];
  SI.Velocity aRelative_ECEF[3];
  SI.Velocity aRelative_XYZ[3];
  
equation

  connect(aero_trans.frame_a,frame_a);
  connect(aero_trans.frame_b,frame_aero);

  // TODO
  vRelative_ECEF = v_0 - env.wind_ECEF;
  aRelative_ECEF = a_0; // TODO: - der(env.wind_ECEF);
  vRelative_XYZ = resolve2(frame_a.R,vRelative_ECEF);
  aRelative_XYZ = resolve2(frame_a.R,aRelative_ECEF);
  vt = Vectors.norm(vRelative_XYZ);
  {aero_p,aero_q,aero_r} = angularVelocity2(frame_aero.R);

  alpha = atan2(vRelative_XYZ[3],vRelative_XYZ[1]);
  qBar = 0.5*env.rho*vt^2;

  // avoid singularity in side slip angle calc
  if (vt > vtTol) then
    beta = asin(vRelative_XYZ[2]/vt);
  else
    beta = 0;
  end if;

  // if negligible airspeed, set wind angles to zero
  // to avoid singularity
  if ( (vRelative_XYZ[1]^2 + vRelative_XYZ[3]^2) > vtTol) then
    alphaDot = (vRelative_XYZ[1]*aRelative_XYZ[3]-vRelative_XYZ[3]*aRelative_XYZ[1])/(vRelative_XYZ[1]^2 + vRelative_XYZ[3]^2); //stevens & lewis pg 78
  else
    alphaDot = 0;
  end if;

  connect(env.frame,frame_aero);
  connect(frame_aero,forceTorque.frame_b);
  // right hand set (forward, right, down)
  // TODO check frames, gravity currently in 2nd comp
  // of world frame, this doesn't match NED
  forceTorque.force = {-drag,sideForce,-lift};
  forceTorque.torque = {rollMoment,pitchMoment,yawMoment};
end AerodynamicBody;

model AerodynamicBodyCoefficientBased "coefficient based aerodynamics"
  import SI = Modelica.SIunits;
  extends AerodynamicBody;
  parameter SI.Area s "reference area";
  parameter SI.Length b "span";
  parameter SI.Length cBar "mean chord";
protected
  Real cL "lift coefficient";
  Real cD "drag coefficient";
  Real cC "cross-wind coefficient";
  Real cl "roll moment coefficient";
  Real cm "pitch moment coefficient";
  Real cn "yaw moment coefficient";
equation
  lift = cL*qBar*s;
  drag = cD*qBar*s;
  sideForce = cC*qBar*s;
  rollMoment = cl*qBar*b*s;
  pitchMoment = cm*qBar*cBar*s;
  yawMoment = cn*qBar*b*s;
end AerodynamicBodyCoefficientBased;

model AerodynamicBodyCoefficientBased_Null
  extends AerodynamicBodyCoefficientBased;
equation
  cL = 0;
  cD = 0;
  cC = 0;
  cl = 0;
  cm = 0;
  cn = 0;
end AerodynamicBodyCoefficientBased_Null;

block AerodynamicBodyCoefficientBasedBlock
  extends AerodynamicBodyCoefficientBased;
  import Modelica.Blocks.Interfaces.RealInput;
  RealInput u[6];
equation
  u = {cL,cD,cC,cl,cm,cn};
end AerodynamicBodyCoefficientBasedBlock;

model TestAerodynamicBody
  inner Modelica.Mechanics.MultiBody.World world;
  //AerodynamicBodyDatcom_Null body(
  AerodynamicBodyCoefficientBased_Null body(
    rudder = 0,
    aileron = 0,
    elevator = 0,
    flap = 0,
    aero_rp = {1,0,0},
    s = 0,
    b = 0,
    cBar = 0,
    m=1,
    I_11=1,
    I_22=1,
    I_33=1,
    r={0.4,0,0},
    r_CM={0.2,0,0},
    width=0.05,
    r_0(start={0.2,-0.5,0.1}, fixed=true),
    v_0(start={0,0,0}, fixed=true),
    angles_fixed=true,
    w_0_fixed=true,
    angles_start={90,0,0}*0.174532925199433);
end TestAerodynamicBody;

// vim:ts=2:sw=2:expandtab:
