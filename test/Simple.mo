within test;

model Simple
  import OpenFDM.*;
  inner World.Earth world;
  Parts.RigidReferencePoint p(
    r_r(start={0,0,-10},fixed=true),
    euler(start={0,0,0},fixed=true));
  Parts.ForceMoment fM1(
    F_b=1*{0,1,0},
    M_b=1*{0,0,1});
  Parts.ForceMoment fM2(
    F_b=1*{0,1,0},
    M_b=1*{0,0,-1});
  Parts.RigidBody b1(m=1,I_b=identity(3));
  Parts.PointMass b2(m=1);
  Parts.RigidLink_B321 t(r_a={1,0,0}, angles={0,0,0});
equation
  connect(p.fA,b1.fA);
  connect(fM1.fA,b1.fA);
  connect(fM2.fA,b2.fA);
  connect(b1.fA,t.fA);
  connect(t.fB,b2.fA);
end Simple;

// vim:ts=2:sw=2:expandtab:
