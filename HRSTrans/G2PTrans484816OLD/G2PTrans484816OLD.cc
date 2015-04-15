// -*- C++ -*-

/* class G2PTrans484816OLD
 * 484816 septum with shims, 5.65 central ray, no target field, 3cm raster
 * By J.J. LeRose 10/05/2012
 */

// History:
//   Sep 2013, C. Gu, First public version.
//

#include <cmath>

#include "Fwd_r5p65_484816OLD.h"
#include "Bwd_r5p65_484816OLD.h"

#include "G2PTrans484816OLD.hh"

#define CORRECTION_ORDER -1

//using namespace S484816OLD; //unfortunately fortran does not support namespace

const float m2cm = 100.0;
const double kDEG = 3.14159265358979323846 / 180.0;

G2PTrans484816OLD::G2PTrans484816OLD()
{
    fModelAngle = 5.65 * kDEG;
}

G2PTrans484816OLD::~G2PTrans484816OLD()
{
    // Nothing to do
}

int G2PTrans484816OLD::TransLeftHRS(double* pV5, double* PlanePosX, double* PlanePosY)
{
    // Use right arm routines for left arm before left arm is ready

    pV5[2] *= -1.;
    pV5[3] *= -1.;
    int fGoodParticle = TransRightHRS(pV5, PlanePosX, PlanePosY);
    pV5[2] *= -1.;
    pV5[3] *= -1.;

    return fGoodParticle;
}

int G2PTrans484816OLD::TransRightHRS(double* pV5, double* PlanePosX, double* PlanePosY)
{
    float vector_jjl[] = {pV5[0], pV5[1], pV5[2], pV5[3], pV5[4]};
    int iii = 5;
    int *ii = &iii;

    float x_test, y_test;

    // Target to Septum exit, ep7
    x_test = x_r5p65_484816old_sepex_(vector_jjl, ii) * m2cm;
    y_test = y_r5p65_484816old_sepex_(vector_jjl, ii) * m2cm;
    PlanePosX[7] = x_test;
    PlanePosY[7] = y_test;
    if (fabs(x_test) < 8.4 || fabs(x_test) > 38.8 || fabs(y_test) > 9.7)
        return 7;

    // Target to Q1 en ep10
    x_test = x_r5p65_484816old_q1ent_(vector_jjl, ii) * m2cm;
    y_test = y_r5p65_484816old_q1ent_(vector_jjl, ii) * m2cm;
    PlanePosX[10] = x_test;
    PlanePosY[10] = y_test;
    if (sqrt(x_test * x_test + y_test * y_test) > 15.0)
        return 10;

    // Target to Q1 ex, ep13
    x_test = x_r5p65_484816old_q1ext_(vector_jjl, ii) * m2cm;
    y_test = y_r5p65_484816old_q1ext_(vector_jjl, ii) * m2cm;
    PlanePosX[13] = x_test;
    PlanePosY[13] = y_test;
    if (sqrt(x_test * x_test + y_test * y_test) > 14.92)
        return 13;

    // Target to Q2 ex, ep20
    x_test = x_r5p65_484816old_q2ext_(vector_jjl, ii) * m2cm;
    y_test = y_r5p65_484816old_q2ext_(vector_jjl, ii) * m2cm;
    PlanePosX[20] = x_test;
    PlanePosY[20] = y_test;
    if (sqrt(x_test * x_test + y_test * y_test) > 30.0)
        return 20;

    // Target to dipole entrance, ep23
    x_test = x_r5p65_484816old_den_(vector_jjl, ii) * m2cm;
    y_test = y_r5p65_484816old_den_(vector_jjl, ii) * m2cm;
    PlanePosX[23] = x_test;
    PlanePosY[23] = y_test;
    if ((x_test < -522.0) || (x_test>-498.1) || fabs(y_test) > 13.244)
        return 23;

    // Target to dipole exit, ep24
    // trapezoid -46.19cm < x < 46.19cm, |y| < -0.0161 * x + 12.5
    x_test = x_r5p65_484816old_dex_(vector_jjl, ii) * m2cm;
    y_test = y_r5p65_484816old_dex_(vector_jjl, ii) * m2cm;
    PlanePosX[24]= x_test;
    PlanePosY[24] = y_test;
    if (fabs(x_test) > 46.19 || fabs(y_test) > fabs(-0.0161 * x_test + 12.5))
        return 24;

    // Target to Q3 entrance, ep26
    // circle of radius 30.0 cm
    x_test = x_r5p65_484816old_q3ent_(vector_jjl, ii) * m2cm;
    y_test = y_r5p65_484816old_q3ent_(vector_jjl, ii) * m2cm;
    PlanePosX[26] = x_test;
    PlanePosY[26] = y_test;
    if (sqrt(x_test * x_test + y_test * y_test) > 30.0)
        return 26;

    // Target to Q3 exit, ep29
    // circle of radius 30.0 cm
    x_test = x_r5p65_484816old_q3ext_(vector_jjl, ii) * m2cm;
    y_test = y_r5p65_484816old_q3ext_(vector_jjl, ii) * m2cm;
    PlanePosX[29] = x_test;
    PlanePosY[29] = y_test;
    if (sqrt(x_test * x_test + y_test * y_test) > 30.0)
        return 29;

    // Successfully reach focus plane
    float x_fp = x_r5p65_484816old_fp_(vector_jjl, ii);
    float theta_fp = t_r5p65_484816old_fp_(vector_jjl, ii);
    float y_fp = y_r5p65_484816old_fp_(vector_jjl, ii);
    float phi_fp = p_r5p65_484816old_fp_(vector_jjl, ii);

    // Reset the vector and return it back to the caller
    pV5[0] = (double) x_fp;
    pV5[1] = (double) theta_fp;
    pV5[2] = (double) y_fp;
    pV5[3] = (double) phi_fp;
    //pV5[4] = (double)delta_fp;  // delta is not change

    return 0;
}

void G2PTrans484816OLD::ReconLeftHRS(double* pV5)
{
    // In order to call right arm routines, need to flip y, phi
    pV5[2] *= -1;
    pV5[3] *= -1;
    ReconRightHRS(pV5);
    pV5[2] *= -1;
    pV5[3] *= -1;
}

void G2PTrans484816OLD::ReconRightHRS(double* pV5)
{
    float vector_jjl[] = {pV5[0], pV5[1], pV5[2], pV5[3], pV5[4]};
    int iii = 5;
    int *ii = &iii;

    vector_jjl[1] = vector_jjl[1] - txfit_r5p65_484816old_(vector_jjl, ii);

    float x_or = vector_jjl[4];
    float delta_rec = delta_r5p65_484816old_(vector_jjl, ii);
    float theta_rec = theta_r5p65_484816old_(vector_jjl, ii);
    float phi_rec = phi_r5p65_484816old_(vector_jjl, ii);
    float y_rec = y00_r5p65_484816old_(vector_jjl, ii);

    // Reset the vector and return it back to the caller
    pV5[0] = (double) x_or;
    pV5[1] = (double) theta_rec;
    pV5[2] = (double) y_rec;
    pV5[3] = (double) phi_rec;
    pV5[4] = (double) delta_rec;
}

void G2PTrans484816OLD::FPCorrLeft(const double* V5tg, double* V5fp)
{
#if CORRECTION_ORDER == 0
    V5fp[0] += (1.99661e-03);
    V5fp[1] += (6.63373e-04);
    V5fp[2] += (-2.41468e-02);
    V5fp[3] += (-1.48819e-02);
#endif
#if CORRECTION_ORDER == 1
    V5fp[0] += (1.99661e-03)+(-9.66663e-02) * V5tg[0]+(6.91887e-02) * V5tg[1]+(0.00000e+00) * V5tg[2]+(0.00000e+00) * V5tg[3]+(8.91337e-02) * V5tg[4];
    V5fp[1] += (6.63373e-04)+(-1.38583e-02) * V5tg[0]+(1.64156e-02) * V5tg[1]+(0.00000e+00) * V5tg[2]+(0.00000e+00) * V5tg[3]+(5.99316e-02) * V5tg[4];
    V5fp[2] += (-2.41468e-02)+(0.00000e+00) * V5tg[0]+(0.00000e+00) * V5tg[1]+(4.53343e-02) * V5tg[2]+(1.95084e-02) * V5tg[3]+(-4.89414e-02) * V5tg[4];
    V5fp[3] += (-1.48819e-02)+(0.00000e+00) * V5tg[0]+(0.00000e+00) * V5tg[1]+(-3.48790e-02) * V5tg[2]+(1.72860e-03) * V5tg[3]+(8.37687e-02) * V5tg[4];
#endif
}

void G2PTrans484816OLD::FPCorrRight(const double* V5tg, double* V5fp)
{
    // Nothing to do
}

