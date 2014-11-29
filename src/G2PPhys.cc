// -*- C++ -*-

/* class G2PPhys
 * It will calculate cross sections at reaction point.
 *
 * Elastic cross section models (G2PPhysEl):
 * * All: Form factors from K. C. Stansfield et al., Phys. Rev. C, 3(1971)1448
 * * H1 : Form factors from S. Venkat et al., Phys. Rev. C, 83(2011)015203 (global fit, with TPE correction)
 *                          J. Arrington et al., Phys. Rev. C 76(2007)035201 (low Q2, with/without TPE correction)
 * * 4He: Charge and magnetization densities from De Jager, At. Data Nucl. Data Tables, 14(1974)
 * * 12C: Charge distribution from L. S. Cardman et al., Phys. Lett. B, 91(1970)203
 * * 14N: Charge and magnetization densities from De Jager, At. Data Nucl. Data Tables, 14(1974)
 *
 * Inelastic cross section models:
 * * G2PPhysEPC: J. W. Lightbody et al, Computers in Physics, 2(1988)57
 * * G2PPhysPB: P. E. Bosted et al, Phys. Rev. C, 78(2008)015202 and arXiv:1203.2262
 * * G2PPhysQFS: J. W. Lightbody et al, Computers in Physics, 2(1988)57
 * * G2PPhysWISER: D. E. Wiser, Ph.D. Thesis
 *
 * Radiative correction added for P. Bosted model and QFS.
 *
 * Meaning of parameters:
 * fPID: incident particle ID, following the PDG definition:
 *       2212 for p        ;   2112 for n     ;   211 for pi+   ;
 *       -211 for pi-      ;   111  for pi0   ;   11  for e-    ;
 *       22   for photon   ;
 * fZ, fA: proton and mass number of the nucleus.
 *
 * Please also read headers of QFS, PBosted, EPC and WISER models. They contains very important usage information!
 *
 * Unit of elastic cross section is ub/sr.
 * Unit of inelastic cross section is ub/MeV-sr.
 */

// History:
//   Mar 2013, C. Gu, First public version.
//   Apr 2013, C. Gu, Add P. Bosted's model.
//   Apr 2013, C. Gu, Add WISER model.
//   May 2013, C. Gu, Add L. Cardman's C12 elastic model.
//   Oct 2013, C. Gu, Add H, He, N form factors.
//   Feb 2014, C. Gu, Add EPC model.
//   Apr 2014, C. Gu, Update H form factors.
//

#include <cstdlib>
#include <cstdio>
#include <cmath>
#include <cstring>
#include <map>

#include "TROOT.h"
#include "TError.h"
#include "TObject.h"

#include "G2PPhysBase.hh"
#include "G2PPhysEl/G2PPhysEl.hh"
#include "G2PPhysEPC/G2PPhysEPC.hh"
#include "G2PPhysPB/G2PPhysPB.hh"
#include "G2PPhysQFS/G2PPhysQFS.hh"
#include "G2PPhysWISER/G2PPhysWISER.hh"

#include "G2PAppBase.hh"
#include "G2PAppList.hh"
#include "G2PGlobals.hh"
#include "G2PProcBase.hh"
#include "G2PVar.hh"
#include "G2PVarDef.hh"
#include "G2PVarList.hh"

#include "G2PPhys.hh"

using namespace std;

static const double kDEG = 3.14159265358979323846 / 180.0;

G2PPhys* G2PPhys::pG2PPhys = NULL;

G2PPhys::G2PPhys()
{
    // Only for ROOT I/O
}

G2PPhys::G2PPhys(const char *model) :
fSetting(1), fPID(11), fZ(1), fA(1), fTargetMass(0.0), fPars(NULL), fNPars(0), fHRSAngle(0.0), fHRSMomentum(0.0), fBeamEnergy(0.0), pModel(NULL)
{
    if (pG2PPhys) {
        Error("G2PPhys()", "Only one instance of G2PPhys allowed.");
        MakeZombie();
        return;
    }
    pG2PPhys = this;

    fPriority = 7;
    map<string, int> model_map;
    model_map["elastic"] = 1;
    model_map["epc"] = 21;
    model_map["pbosted"] = 11;
    model_map["qfs"] = 12;
    model_map["wiser"] = 22;

    fSetting = model_map[model];
}

G2PPhys::~G2PPhys()
{
    if (pG2PPhys == this) pG2PPhys = NULL;
}

int G2PPhys::Begin()
{
    static const char* const here = "Begin()";

    if (G2PProcBase::Begin() != 0) return fStatus;

    switch (fSetting) {
    case 1:
        pModel = new G2PPhysEl();
        break;
    case 11:
        pModel = new G2PPhysPB();
        break;
    case 12:
        pModel = new G2PPhysQFS();
        break;
    case 21:
        pModel = new G2PPhysEPC();
        break;
    case 22:
        pModel = new G2PPhysWISER();
        break;
    default:
        Error(here, "Cannot initialize, invalid setting.");
        return (fStatus = kINITERROR);
        break;
    }

    pModel->SetTarget(fZ, fA);
    pModel->SetParticle(fPID);
    pModel->SetPars(fPars, fNPars);

    return (fStatus = kOK);
}

int G2PPhys::Process()
{
    static const char* const here = "Process()";

    if (fDebug > 2) Info(here, " ");

    double V51[5], V52[5];
    if (gG2PVars->FindSuffix("gun.beam.l_x") && gG2PVars->FindSuffix("gun.react.x")
            && gG2PVars->FindSuffix("gun.beam.l_t") && gG2PVars->FindSuffix("gun.react.t")
            && gG2PVars->FindSuffix("gun.beam.l_y") && gG2PVars->FindSuffix("gun.react.y")
            && gG2PVars->FindSuffix("gun.beam.l_p") && gG2PVars->FindSuffix("gun.react.p")
            && gG2PVars->FindSuffix("gun.beam.l_z") && gG2PVars->FindSuffix("gun.react.d")) {
        V51[0] = gG2PVars->FindSuffix("gun.beam.l_x")->GetValue();
        V51[1] = gG2PVars->FindSuffix("gun.beam.l_t")->GetValue();
        V51[2] = gG2PVars->FindSuffix("gun.beam.l_y")->GetValue();
        V51[3] = gG2PVars->FindSuffix("gun.beam.l_p")->GetValue();
        V51[4] = gG2PVars->FindSuffix("gun.beam.l_z")->GetValue();

        V52[0] = gG2PVars->FindSuffix("gun.react.x")->GetValue();
        V52[1] = gG2PVars->FindSuffix("gun.react.t")->GetValue();
        V52[2] = gG2PVars->FindSuffix("gun.react.y")->GetValue();
        V52[3] = gG2PVars->FindSuffix("gun.react.p")->GetValue();
        V52[4] = gG2PVars->FindSuffix("gun.react.d")->GetValue();

        fXSreact = CalXS(V51, V52, fTHreact);
    } else {
        fXSreact = 0;
    }

    if (gG2PVars->FindSuffix("bpm.l_x") && gG2PVars->FindSuffix("tp.rec.x")
            && gG2PVars->FindSuffix("bpm.l_t") && gG2PVars->FindSuffix("tp.rec.t")
            && gG2PVars->FindSuffix("bpm.l_y") && gG2PVars->FindSuffix("tp.rec.y")
            && gG2PVars->FindSuffix("bpm.l_p") && gG2PVars->FindSuffix("tp.rec.p")
            && gG2PVars->FindSuffix("bpm.l_z") && gG2PVars->FindSuffix("tp.rec.d")) {
        V51[0] = gG2PVars->FindSuffix("bpm.l_x")->GetValue();
        V51[1] = gG2PVars->FindSuffix("bpm.l_t")->GetValue();
        V51[2] = gG2PVars->FindSuffix("bpm.l_y")->GetValue();
        V51[3] = gG2PVars->FindSuffix("bpm.l_p")->GetValue();
        V51[4] = gG2PVars->FindSuffix("bpm.l_z")->GetValue();

        V52[0] = gG2PVars->FindSuffix("tp.rec.x")->GetValue();
        V52[1] = gG2PVars->FindSuffix("tp.rec.t")->GetValue();
        V52[2] = gG2PVars->FindSuffix("tp.rec.y")->GetValue();
        V52[3] = gG2PVars->FindSuffix("tp.rec.p")->GetValue();
        V52[4] = gG2PVars->FindSuffix("tp.rec.d")->GetValue();

        fXSrec = CalXS(V51, V52, fTHrec);
    } else {
        fXSrec = 0;
    }

    if (fDebug > 1) {
        Info(here, "phys_react: %10.3e %10.3e", fTHreact / kDEG, fXSreact);
        Info(here, "phys_rec  : %10.3e %10.3e", fTHrec / kDEG, fXSrec);
    }

    return 0;
}

void G2PPhys::Clear(Option_t* option)
{
    fTHreact = 0.0;
    fXSreact = 0.0;
    fTHrec = 0.0;
    fXSrec = 0.0;

    G2PProcBase::Clear(option);
}

void G2PPhys::SetPars(double* array, int n)
{
    fPars = array;
    fNPars = n;
}

double G2PPhys::CalXS(const double* V5lab, const double* V5tr, double& scatangle)
{
    static const char* const here = "CalXS()";

    double Eb[3] = {sin(V5lab[1]) * cos(V5lab[3]), sin(V5lab[1]) * sin(V5lab[3]), cos(V5lab[1])};

    double theta, phi;
    TCS2HCS(V5tr[1], V5tr[3], fHRSAngle, theta, phi);

    double Ef[3] = {sin(theta) * cos(phi), sin(theta) * sin(phi), cos(theta)};

    scatangle = acos(Eb[0] * Ef[0] + Eb[1] * Ef[1] + Eb[2] * Ef[2]);

    double Ebval = fBeamEnergy;
    double Efval = (1 + V5tr[4]) * fHRSMomentum;

    if (fDebug > 2) {
        Info(here, "%10.3e %10.3e %10.3e", Ebval, Efval, scatangle / kDEG);
    }

    return pModel->GetXS(Ebval, Efval, scatangle);
}

int G2PPhys::Configure(EMode mode)
{
    if (mode == kREAD || mode == kTWOWAY) {
        if (fIsInit) return 0;
        else fIsInit = true;
    }

    ConfDef confs[] = {
        {"run.particle.id", "Particle ID", kINT, &fPID},
        {"run.target.z", "Target Z", kINT, &fZ},
        {"run.target.a", "Target A", kINT, &fA},
        {"run.target.mass", "Target Mass", kDOUBLE, &fTargetMass},
        {"run.hrs.angle", "HRS Angle", kDOUBLE, &fHRSAngle},
        {"run.hrs.p0", "HRS Momentum", kDOUBLE, &fHRSMomentum},
        {"run.e0", "Beam Energy", kDOUBLE, &fBeamEnergy},
        {0}
    };

    return ConfigureFromList(confs, mode);
}

int G2PPhys::DefineVariables(EMode mode)
{
    if (mode == kDEFINE && fIsSetup) return 0;
    fIsSetup = (mode == kDEFINE);

    VarDef vars[] = {
        {"react.angle", "Real scattering angle", kDOUBLE, &fTHreact},
        {"react.xs", "Cross section with real kins", kDOUBLE, &fXSreact},
        {"rec.angle", "Rec scattering angle", kDOUBLE, &fTHrec},
        {"rec.xs", "Cross section with rec kins", kDOUBLE, &fXSrec},
        {0}
    };

    return DefineVarsFromList(vars, mode);
}

void G2PPhys::MakePrefix()
{
    const char* base = "phys";

    G2PAppBase::MakePrefix(base);
}

ClassImp(G2PPhys)
