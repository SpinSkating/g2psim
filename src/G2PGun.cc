// -*- C++ -*-

/* class G2PGun
 * Abstract base class of g2p event generator classes.
 * Use function Shoot() to get reaction point kinematics.
 * Shoot() is a pure virtual method so each derived class should define its own implement.
 */

// History:
//   Mar 2013, C. Gu, First public version.
//   Sep 2013, C. Gu, Rewrite it as a G2PProcBase class.
//

#include <cstdlib>
#include <cstdio>
#include <cmath>

#include "TROOT.h"
#include "TError.h"
#include "TObject.h"

#include "G2PAppBase.hh"
#include "G2PAppList.hh"
#include "G2PDrift.hh"
#include "G2PGlobals.hh"
#include "G2PProcBase.hh"
#include "G2PVarDef.hh"

#include "G2PGun.hh"

using namespace std;

static const double kDEG = 3.14159265358979323846 / 180.0;

G2PGun* G2PGun::pG2PGun = NULL;

G2PGun::G2PGun() :
fHRSAngle(5.767 * kDEG), fHRSMomentum(2.251), fBeamEnergy(2.254), fFieldRatio(0.0), fBeamX_lab(0.0), fBeamY_lab(0.0), fBeamR_lab(0.0), fReactZLow_lab(0.0), fReactZHigh_lab(0.0), fTargetThLow_tr(0.0), fTargetThHigh_tr(0.0), fTargetPhLow_tr(0.0), fTargetPhHigh_tr(0.0), fDeltaLow(0.0), fDeltaHigh(0.0), fBeamTiltAngle(0.0), pDrift(NULL) {
    if (pG2PGun) {
        Error("G2PGun()", "Only one instance of G2PGun allowed.");
        MakeZombie();
        return;
    }
    pG2PGun = this;

    fPriority = 1;
    Clear();
}

G2PGun::~G2PGun() {
    if (pG2PGun == this) pG2PGun = NULL;
}

int G2PGun::Init() {
    //static const char* const here = "Init()";

    if (G2PProcBase::Init() != 0) return fStatus;

    pDrift = static_cast<G2PDrift*> (gG2PApps->Find("G2PDrift"));
    if (!pDrift) {
        pDrift = new G2PDrift();
        gG2PApps->Add(pDrift);
    }

    return (fStatus = kOK);
}

int G2PGun::Begin() {
    //static const char* const here = "Begin()";

    if (G2PProcBase::Begin() != 0) return fStatus;

    SetTiltAngle();

    return (fStatus = kOK);
}

int G2PGun::Process() {
    static const char* const here = "Process()";

    if (fDebug > 2) Info(here, " ");

    double V5[5];

    Shoot(fV5beam_lab, fV5react_tr);
    ArrayCopy(fV5react_lab, fV5beam_lab, 5);
    TCS2HCS(fV5react_tr[1], fV5react_tr[3], fHRSAngle, fV5react_lab[1], fV5react_lab[3]);

    if (fDebug > 1) {
        Info(here, "beam_lab  : %10.3e %10.3e %10.3e %10.3e %10.3e", fV5beam_lab[0], fV5beam_lab[1], fV5beam_lab[2], fV5beam_lab[3], fV5beam_lab[4]);
    }

    HCS2TCS(fV5beam_lab[0], fV5beam_lab[2], fV5beam_lab[4], fHRSAngle, V5[0], V5[2], V5[4]);
    pDrift->Drift(fV5react_tr, fHRSMomentum, V5[4], fHRSAngle, 0.0, 10.0, fV5tp_tr);

    if (fDebug > 1) {
        Info(here, "tp_tr     : %10.3e %10.3e %10.3e %10.3e %10.3e", fV5tp_tr[0], fV5tp_tr[1], fV5tp_tr[2], fV5tp_tr[3], fV5tp_tr[4]);
    }

    return 0;
}

void G2PGun::Clear() {
    memset(fV5beam_lab, 0, sizeof (fV5beam_lab));
    memset(fV5react_tr, 0, sizeof (fV5react_tr));
    memset(fV5react_lab, 0, sizeof (fV5react_lab));
    memset(fV5tp_tr, 0, sizeof (fV5tp_tr));
}

void G2PGun::SetBeamPos(double x, double y) {
    fBeamX_lab = x;
    fBeamY_lab = y;

    fConfigIsSet.insert((unsigned long) &fBeamX_lab);
    fConfigIsSet.insert((unsigned long) &fBeamY_lab);
}

void G2PGun::SetReactZ(double low, double high) {

    fReactZLow_lab = low;
    fReactZHigh_lab = high;

    fConfigIsSet.insert((unsigned long) &fReactZLow_lab);
    fConfigIsSet.insert((unsigned long) &fReactZHigh_lab);
}

void G2PGun::SetRasterSize(double val) {

    fBeamR_lab = val;

    fConfigIsSet.insert((unsigned long) &fBeamR_lab);
}

void G2PGun::SetTargetTh(double low, double high) {

    fTargetThLow_tr = low;
    fTargetThHigh_tr = high;

    fConfigIsSet.insert((unsigned long) &fTargetThLow_tr);
    fConfigIsSet.insert((unsigned long) &fTargetThHigh_tr);
}

void G2PGun::SetTargetPh(double low, double high) {

    fTargetPhLow_tr = low;
    fTargetPhHigh_tr = high;

    fConfigIsSet.insert((unsigned long) &fTargetPhLow_tr);
    fConfigIsSet.insert((unsigned long) &fTargetPhHigh_tr);
}

void G2PGun::SetDelta(double low, double high) {
    fDeltaLow = low;
    fDeltaHigh = high;

    fConfigIsSet.insert((unsigned long) &fDeltaLow);
    fConfigIsSet.insert((unsigned long) &fDeltaHigh);
}

void G2PGun::SetTiltAngle() {
    static const char* const here = "SetTiltAngle()";

    if (fabs(fFieldRatio - 0.5) < 1e-8) {
        if (fabs(fBeamEnergy - 2.254) < 0.2) fBeamTiltAngle = 3.31 * kDEG;
        else if (fabs(fBeamEnergy - 1.706) < 0.2) fBeamTiltAngle = 4.03 * kDEG;
        else if (fabs(fBeamEnergy - 1.159) < 0.2) fBeamTiltAngle = 5.97 * kDEG;
        else fBeamTiltAngle = 0.0;
    }
    else if (fabs(fFieldRatio - 1.0) < 1e-8) {
        if (fabs(fBeamEnergy - 2.254) < 0.2) fBeamTiltAngle = 0.0;
        else if (fabs(fBeamEnergy - 3.355) < 0.2) fBeamTiltAngle = 0.0;
        else fBeamTiltAngle = 0.0;
    }
    else fBeamTiltAngle = 0.0;

    if (fDebug > 0) Info(here, "Beam tilt angle is %10.3e deg.", fBeamTiltAngle / kDEG);
}

void G2PGun::GetReactPoint(double x, double y, double z, double* V5) {
    static const char* const here = "GetReactPoint()";

    double xb[3] = {x, y, 0.0};
    double pb[3] = {0.0, fBeamEnergy * sin(fBeamTiltAngle), fBeamEnergy * cos(fBeamTiltAngle)};

    pDrift->Drift(xb, pb, z, 10.0, xb, pb);
    V5[0] = xb[0];
    V5[1] = acos(pb[2] / fBeamEnergy);
    V5[2] = xb[1];
    V5[3] = atan2(pb[1], pb[0]);
    V5[4] = xb[2];

    if (fDebug > 2) Info(here, "%10.3e %10.3e %10.3e -> %10.3e %10.3e %10.3e %10.3e %10.3e", x, y, z, V5[0], V5[1], V5[2], V5[3], V5[4]);
}

int G2PGun::Configure(EMode mode) {
    if (mode == kREAD || mode == kTWOWAY) {
        if (fIsInit) return 0;
        else fIsInit = true;
    }

    ConfDef confs[] = {
        {"run.e0", "Beam Energy", kDOUBLE, &fBeamEnergy},
        {"field.ratio", "Field Ratio", kDOUBLE, &fFieldRatio},
        {"run.hrs.angle", "HRS Angle", kDOUBLE, &fHRSAngle},
        {"run.hrs.p0", "HRS Momentum", kDOUBLE, &fHRSMomentum},
        {"beam.l_x", "Beam X", kDOUBLE, &fBeamX_lab},
        {"beam.l_y", "Beam Y", kDOUBLE, &fBeamY_lab},
        {"beam.l_z.min", "React Z Min", kDOUBLE, &fReactZLow_lab},
        {"beam.l_z.max", "React Z Max", kDOUBLE, &fReactZHigh_lab},
        {"raster.size", "Raster Size", kDOUBLE, &fBeamR_lab},
        {"react.t.min", "Theta Min", kDOUBLE, &fTargetThLow_tr},
        {"react.t.max", "Theta Max", kDOUBLE, &fTargetThHigh_tr},
        {"react.p.min", "Phi Min", kDOUBLE, &fTargetPhLow_tr},
        {"react.p.max", "Phi Max", kDOUBLE, &fTargetPhHigh_tr},
        {"react.d.min", "Delta Min", kDOUBLE, &fDeltaLow},
        {"react.d.max", "Delta Max", kDOUBLE, &fDeltaHigh},
        {0}
    };

    return ConfigureFromList(confs, mode);
}

int G2PGun::DefineVariables(EMode mode) {
    if (mode == kDEFINE && fIsSetup) return 0;
    fIsSetup = (mode == kDEFINE);

    VarDef vars[] = {
        {"beam.l_x", "Beam X (lab)", kDOUBLE, &fV5beam_lab[0]},
        {"beam.l_t", "Beam T (lab)", kDOUBLE, &fV5beam_lab[1]},
        {"beam.l_y", "Beam Y (lab)", kDOUBLE, &fV5beam_lab[2]},
        {"beam.l_p", "Beam P (lab)", kDOUBLE, &fV5beam_lab[3]},
        {"beam.l_z", "Beam Z (lab)", kDOUBLE, &fV5beam_lab[4]},
        {"react.x", "React Point X", kDOUBLE, &fV5react_tr[0]},
        {"react.t", "React Point T", kDOUBLE, &fV5react_tr[1]},
        {"react.y", "React Point Y", kDOUBLE, &fV5react_tr[2]},
        {"react.p", "React Point P", kDOUBLE, &fV5react_tr[3]},
        {"react.d", "React Point D", kDOUBLE, &fV5react_tr[4]},
        {"react.l_x", "React Point X (lab)", kDOUBLE, &fV5react_lab[0]},
        {"react.l_t", "React Point T (lab)", kDOUBLE, &fV5react_lab[1]},
        {"react.l_y", "React Point Y (lab)", kDOUBLE, &fV5react_lab[2]},
        {"react.l_p", "React Point P (lab)", kDOUBLE, &fV5react_lab[3]},
        {"react.l_z", "React Point Z (lab)", kDOUBLE, &fV5react_lab[4]},
        {"tp.x", "Target Plane X", kDOUBLE, &fV5tp_tr[0]},
        {"tp.t", "Target Plane T", kDOUBLE, &fV5tp_tr[1]},
        {"tp.y", "Target Plane Y", kDOUBLE, &fV5tp_tr[2]},
        {"tp.p", "Target Plane P", kDOUBLE, &fV5tp_tr[3]},
        {"tp.d", "Target Plane D", kDOUBLE, &fV5tp_tr[4]},
        {0}
    };

    return DefineVarsFromList(vars, mode);
}

void G2PGun::MakePrefix() {
    const char* base = "gun";

    G2PAppBase::MakePrefix(base);
}

ClassImp(G2PGun)
