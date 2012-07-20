within OpenFDM.Aerodynamics.Datcom;

partial model Table
  import Modelica.Blocks.Tables.*;
  input AircraftState state;
  output AeroConnector coef;
  parameter Boolean tableOnFile = false;
  CombiTable1D CD_FLAPS;
  CombiTable1D CL_FLAPS;
  CombiTable1D CM_FLAPS;
  CombiTable1D CN_FLAPS;
  CombiTable1D CA_FLAPS;
  CombiTable1D XCP_FLAPS;
  CombiTable1D CLA_FLAPS;
  CombiTable1D CMA_FLAPS;
  CombiTable1D CYB_FLAPS;
  CombiTable1D CNB_FLAPS;
  CombiTable1D CLB_FLAPS;
  CombiTable1D CLQ_FLAPS;
  CombiTable1D CMQ_FLAPS;
  CombiTable1D CLAD_FLAPS;
  CombiTable1D CMAD_FLAPS;
  CombiTable1D CLP_FLAPS;
  CombiTable1D CYP_FLAPS;
  CombiTable1D CNP_FLAPS;
  CombiTable1D CNR_FLAPS;
  CombiTable1D CLR_FLAPS;
  CombiTable1D CD_AILERONS;
  CombiTable1D CL_AILERONS;
  CombiTable1D CM_AILERONS;
  CombiTable1D CN_AILERONS;
  CombiTable1D CA_AILERONS;
  CombiTable1D XCP_AILERONS;
  CombiTable1D CLA_AILERONS;
  CombiTable1D CMA_AILERONS;
  CombiTable1D CYB_AILERONS;
  CombiTable1D CNB_AILERONS;
  CombiTable1D CLB_AILERONS;
  CombiTable1D CLQ_AILERONS;
  CombiTable1D CMQ_AILERONS;
  CombiTable1D CLAD_AILERONS;
  CombiTable1D CMAD_AILERONS;
  CombiTable1D CLP_AILERONS;
  CombiTable1D CYP_AILERONS;
  CombiTable1D CNP_AILERONS;
  CombiTable1D CNR_AILERONS;
  CombiTable1D CLR_AILERONS;
  CombiTable1D CD_TOTAL;
  CombiTable1D CL_TOTAL;
  CombiTable1D CM_TOTAL;
  CombiTable1D CN_TOTAL;
  CombiTable1D CA_TOTAL;
  CombiTable1D XCP_TOTAL;
  CombiTable1D CLA_TOTAL;
  CombiTable1D CMA_TOTAL;
  CombiTable1D CYB_TOTAL;
  CombiTable1D CNB_TOTAL;
  CombiTable1D CLB_TOTAL;
  CombiTable1D CLQ_TOTAL;
  CombiTable1D CMQ_TOTAL;
  CombiTable1D CLAD_TOTAL;
  CombiTable1D CMAD_TOTAL;
  CombiTable1D CLP_TOTAL;
  CombiTable1D CYP_TOTAL;
  CombiTable1D CNP_TOTAL;
  CombiTable1D CNR_TOTAL;
  CombiTable1D CLR_TOTAL;
equation
  connect(CD_FLAPS.u[1],state.alpha);
  connect(CD_FLAPS.y[1],coef.CD_FLAPS);
  connect(CL_FLAPS.u[1],state.alpha);
  connect(CL_FLAPS.y[1],coef.CL_FLAPS);
  connect(CM_FLAPS.u[1],state.alpha);
  connect(CM_FLAPS.y[1],coef.CM_FLAPS);
  connect(CN_FLAPS.u[1],state.alpha);
  connect(CN_FLAPS.y[1],coef.CN_FLAPS);
  connect(CA_FLAPS.u[1],state.alpha);
  connect(CA_FLAPS.y[1],coef.CA_FLAPS);
  connect(XCP_FLAPS.u[1],state.alpha);
  connect(XCP_FLAPS.y[1],coef.XCP_FLAPS);
  connect(CLA_FLAPS.u[1],state.alpha);
  connect(CLA_FLAPS.y[1],coef.CLA_FLAPS);
  connect(CMA_FLAPS.u[1],state.alpha);
  connect(CMA_FLAPS.y[1],coef.CMA_FLAPS);
  connect(CYB_FLAPS.u[1],state.alpha);
  connect(CYB_FLAPS.y[1],coef.CYB_FLAPS);
  connect(CNB_FLAPS.u[1],state.alpha);
  connect(CNB_FLAPS.y[1],coef.CNB_FLAPS);
  connect(CLB_FLAPS.u[1],state.alpha);
  connect(CLB_FLAPS.y[1],coef.CLB_FLAPS);
  connect(CLQ_FLAPS.u[1],state.alpha);
  connect(CLQ_FLAPS.y[1],coef.CLQ_FLAPS);
  connect(CMQ_FLAPS.u[1],state.alpha);
  connect(CMQ_FLAPS.y[1],coef.CMQ_FLAPS);
  connect(CLAD_FLAPS.u[1],state.alpha);
  connect(CLAD_FLAPS.y[1],coef.CLAD_FLAPS);
  connect(CMAD_FLAPS.u[1],state.alpha);
  connect(CMAD_FLAPS.y[1],coef.CMAD_FLAPS);
  connect(CLP_FLAPS.u[1],state.alpha);
  connect(CLP_FLAPS.y[1],coef.CLP_FLAPS);
  connect(CYP_FLAPS.u[1],state.alpha);
  connect(CYP_FLAPS.y[1],coef.CYP_FLAPS);
  connect(CNP_FLAPS.u[1],state.alpha);
  connect(CNP_FLAPS.y[1],coef.CNP_FLAPS);
  connect(CNR_FLAPS.u[1],state.alpha);
  connect(CNR_FLAPS.y[1],coef.CNR_FLAPS);
  connect(CLR_FLAPS.u[1],state.alpha);
  connect(CLR_FLAPS.y[1],coef.CLR_FLAPS);
  connect(CD_AILERONS.u[1],state.alpha);
  connect(CD_AILERONS.y[1],coef.CD_AILERONS);
  connect(CL_AILERONS.u[1],state.alpha);
  connect(CL_AILERONS.y[1],coef.CL_AILERONS);
  connect(CM_AILERONS.u[1],state.alpha);
  connect(CM_AILERONS.y[1],coef.CM_AILERONS);
  connect(CN_AILERONS.u[1],state.alpha);
  connect(CN_AILERONS.y[1],coef.CN_AILERONS);
  connect(CA_AILERONS.u[1],state.alpha);
  connect(CA_AILERONS.y[1],coef.CA_AILERONS);
  connect(XCP_AILERONS.u[1],state.alpha);
  connect(XCP_AILERONS.y[1],coef.XCP_AILERONS);
  connect(CLA_AILERONS.u[1],state.alpha);
  connect(CLA_AILERONS.y[1],coef.CLA_AILERONS);
  connect(CMA_AILERONS.u[1],state.alpha);
  connect(CMA_AILERONS.y[1],coef.CMA_AILERONS);
  connect(CYB_AILERONS.u[1],state.alpha);
  connect(CYB_AILERONS.y[1],coef.CYB_AILERONS);
  connect(CNB_AILERONS.u[1],state.alpha);
  connect(CNB_AILERONS.y[1],coef.CNB_AILERONS);
  connect(CLB_AILERONS.u[1],state.alpha);
  connect(CLB_AILERONS.y[1],coef.CLB_AILERONS);
  connect(CLQ_AILERONS.u[1],state.alpha);
  connect(CLQ_AILERONS.y[1],coef.CLQ_AILERONS);
  connect(CMQ_AILERONS.u[1],state.alpha);
  connect(CMQ_AILERONS.y[1],coef.CMQ_AILERONS);
  connect(CLAD_AILERONS.u[1],state.alpha);
  connect(CLAD_AILERONS.y[1],coef.CLAD_AILERONS);
  connect(CMAD_AILERONS.u[1],state.alpha);
  connect(CMAD_AILERONS.y[1],coef.CMAD_AILERONS);
  connect(CLP_AILERONS.u[1],state.alpha);
  connect(CLP_AILERONS.y[1],coef.CLP_AILERONS);
  connect(CYP_AILERONS.u[1],state.alpha);
  connect(CYP_AILERONS.y[1],coef.CYP_AILERONS);
  connect(CNP_AILERONS.u[1],state.alpha);
  connect(CNP_AILERONS.y[1],coef.CNP_AILERONS);
  connect(CNR_AILERONS.u[1],state.alpha);
  connect(CNR_AILERONS.y[1],coef.CNR_AILERONS);
  connect(CLR_AILERONS.u[1],state.alpha);
  connect(CLR_AILERONS.y[1],coef.CLR_AILERONS);
  connect(CD_TOTAL.u[1],state.alpha);
  connect(CD_TOTAL.y[1],coef.CD_TOTAL);
  connect(CL_TOTAL.u[1],state.alpha);
  connect(CL_TOTAL.y[1],coef.CL_TOTAL);
  connect(CM_TOTAL.u[1],state.alpha);
  connect(CM_TOTAL.y[1],coef.CM_TOTAL);
  connect(CN_TOTAL.u[1],state.alpha);
  connect(CN_TOTAL.y[1],coef.CN_TOTAL);
  connect(CA_TOTAL.u[1],state.alpha);
  connect(CA_TOTAL.y[1],coef.CA_TOTAL);
  connect(XCP_TOTAL.u[1],state.alpha);
  connect(XCP_TOTAL.y[1],coef.XCP_TOTAL);
  connect(CLA_TOTAL.u[1],state.alpha);
  connect(CLA_TOTAL.y[1],coef.CLA_TOTAL);
  connect(CMA_TOTAL.u[1],state.alpha);
  connect(CMA_TOTAL.y[1],coef.CMA_TOTAL);
  connect(CYB_TOTAL.u[1],state.alpha);
  connect(CYB_TOTAL.y[1],coef.CYB_TOTAL);
  connect(CNB_TOTAL.u[1],state.alpha);
  connect(CNB_TOTAL.y[1],coef.CNB_TOTAL);
  connect(CLB_TOTAL.u[1],state.alpha);
  connect(CLB_TOTAL.y[1],coef.CLB_TOTAL);
  connect(CLQ_TOTAL.u[1],state.alpha);
  connect(CLQ_TOTAL.y[1],coef.CLQ_TOTAL);
  connect(CMQ_TOTAL.u[1],state.alpha);
  connect(CMQ_TOTAL.y[1],coef.CMQ_TOTAL);
  connect(CLAD_TOTAL.u[1],state.alpha);
  connect(CLAD_TOTAL.y[1],coef.CLAD_TOTAL);
  connect(CMAD_TOTAL.u[1],state.alpha);
  connect(CMAD_TOTAL.y[1],coef.CMAD_TOTAL);
  connect(CLP_TOTAL.u[1],state.alpha);
  connect(CLP_TOTAL.y[1],coef.CLP_TOTAL);
  connect(CYP_TOTAL.u[1],state.alpha);
  connect(CYP_TOTAL.y[1],coef.CYP_TOTAL);
  connect(CNP_TOTAL.u[1],state.alpha);
  connect(CNP_TOTAL.y[1],coef.CNP_TOTAL);
  connect(CNR_TOTAL.u[1],state.alpha);
  connect(CNR_TOTAL.y[1],coef.CNR_TOTAL);
  connect(CLR_TOTAL.u[1],state.alpha);
  connect(CLR_TOTAL.y[1],coef.CLR_TOTAL);
end Table;

// vim:ts=2:sw=2:expandtab
