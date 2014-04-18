// -*- C++ -*-

/* class G2PTrans484816R15
 * 484816 septum with shims, 5.77 central ray, no target field, 15mm beam xy size
 * By M. Huang 4/14/2014
 */

// History:
//   Inheritated from Sep 2013, C. Gu, First public version.
//
//   Sep 30, M. Huang, first add this module
//   Apr 14, 2014 M. Huang, complete the module with forward transport functions to multiple end-planes along the trajectory

#include <cmath>

#include "Fwd_l5p77_484816R15.h"
#include "Bwd_l5p77_484816R15.h"

#include "G2PTrans484816R15.hh"

#define CORRECTION_ORDER -1

using namespace S484816R15;

const float m2cm = 100.0;
const float m2mm = 1000.;
const double kDEG = 3.14159265358979323846 / 180.0;

G2PTrans484816R15::G2PTrans484816R15() {
    fModelAngle = 5.77 * kDEG;
}

G2PTrans484816R15::~G2PTrans484816R15() {
    // Nothing to do
}

bool G2PTrans484816R15::TransLeftHRS(double* pV5) {
    float vector_jjl[] = {pV5[0], pV5[1], pV5[2], pV5[3], pV5[4]};
    int ii = 5;

    float x_test, y_test;

    //Target to Septum entrance ep5
    //y, -480., 0.,none,84.0,388.,97.,97.,-97.,-97.  ;84.388.
    x_test = x_l5p77_sen(vector_jjl, ii)*m2cm;
    y_test = y_l5p77_sen(vector_jjl, ii)*m2cm;
    if( fabs(x_test)<8.4 || fabs(x_test)>38.8 || fabs(y_test)>9.7 )
        return false;

    //Target to Septum exit ep7
    //y, 480., 0.,none,84.0,388.,97.,97.,-97.,-97.
    x_test = x_l5p77_sex(vector_jjl, ii)*m2cm;
    y_test = y_l5p77_sex(vector_jjl, ii)*m2cm;
    if( fabs(x_test)<8.4 || fabs(x_test)>38.8 || fabs(y_test)>9.7 )
        return false;

    //Target to Q1 entrance ep10
    //y,-200., 0.,none,149.2,149.2,0.,0.,0.,0.
    x_test = x_l5p77_q1en(vector_jjl, ii)*m2cm;
    y_test = y_l5p77_q1en(vector_jjl, ii)*m2cm;
    if( sqrt(x_test*x_test + y_test*y_test) > 14.92 )
        return false;

    //Target to Q1 exit ep13
    //y,610.4, 0. ,none,149.2,149.2,0.,0.,0.,0.
    x_test = x_l5p77_q1ex(vector_jjl, ii)*m2cm;
    y_test = y_l5p77_q1ex(vector_jjl, ii)*m2cm;
    if( sqrt(x_test*x_test + y_test*y_test) > 14.92 )
        return false;

    //Target to Q2 exit ep20
    //y,-3040.40, 30.,none, 259.81, 300., 1316.53, 0.,0.,0.
    //30 deg wrt y, elliptical collimator
    x_test = x_l5p77_q2ex(vector_jjl, ii)*m2mm;
    y_test = y_l5p77_q2ex(vector_jjl, ii)*m2mm;
    if( ((x_test-1316.53)/259.81/cos(30.* kDEG))*((x_test-1316.53)/259.81/cos(30.* kDEG))+(y_test/300.)*(y_test/300.) > 1)
      return false;

//     //in TCS,             xmin,xmax,ymax1,ymax2,ymin1,ymin2,
//     //Target to dipole entrance, ep23, trapezoid -616.999cm<x<-596.293cm  |y| < 14.55cm
//     //y,15121.67, -105.,none,-5220.08,-4980.99,132.44,117.56,-132.44,-117.56

//     //y,-26812.93, -75.,none,-6169.99,-5962.93,145.5,145.5,-145.5,-145.5
//     x_test = x_l5p77_den(vector_jjl, ii)*m2cm;
//     y_test = y_l5p77_den(vector_jjl, ii)*m2cm;
//     if( (x_test<-616.999) || (x_test>-596.293) || fabs(y_test)>145.5 )
//         return false;

    //Target to dipole exit, ep24, trapezoid -46.19cm<x<46.19cm  |y| < -0.0161*x+12.5
    //y,0., 0.,none,-461.88,461.88,132.44,117.56,-132.44,-117.56
    x_test = x_l5p77_dex(vector_jjl, ii)*m2cm;
    y_test = y_l5p77_dex(vector_jjl, ii)*m2cm;
    if( (x_test<-46.19) || (x_test>46.19) || fabs(y_test) > fabs(-0.0161*x_test+12.5) )
        return false;

    //Target to Q3 entrance, ep26, circle of radius 30.0 cm
    x_test = x_l5p77_q3en(vector_jjl, ii)*m2cm;
    y_test = y_l5p77_q3en(vector_jjl, ii)*m2cm;
    if( sqrt(x_test*x_test + y_test*y_test) > 30.0 )
        return false;

    //Target to Q3 exit, circle of radius 30.0 cm
    x_test = x_l5p77_q3ex(vector_jjl, ii)*m2cm;
    y_test = y_l5p77_q3ex(vector_jjl, ii)*m2cm;
    if( sqrt(x_test*x_test + y_test*y_test) > 30.0)
        return false;

    /////////////////////////////////////////////////////////////
    // succesfully reach focus plane
    float x_fp = x_l5p77_fp(vector_jjl, ii);
    float theta_fp = t_l5p77_fp(vector_jjl, ii);
    float y_fp = y_l5p77_fp(vector_jjl, ii);
    float phi_fp = p_l5p77_fp(vector_jjl, ii);

    //reset the vector and return it back to the caller
    pV5[0] = (double) x_fp;
    pV5[1] = (double) theta_fp;
    pV5[2] = (double) y_fp;
    pV5[3] = (double) phi_fp;
    //pV5[4] = (double)delta_fp;  // delta is not change

    return true;
}

bool G2PTrans484816R15::TransRightHRS(double* pV5) {
    //use right arm routines for left arm before left arm is ready
    //return TransportLeftHRS(pV5);
    pV5[2] *= -1.;
    pV5[3] *= -1.;
    bool bGoodParticle = TransLeftHRS(pV5);
    pV5[2] *= -1.;
    pV5[3] *= -1.;
    return bGoodParticle;
}

void G2PTrans484816R15::ReconLeftHRS(double* pV5) {
    float vector_jjl[] = {pV5[0], pV5[1], pV5[2], pV5[3], pV5[4]};
    int ii = 5;

    vector_jjl[1] = vector_jjl[1] - txfit_l5p77(vector_jjl, ii);

    float x_or = vector_jjl[4];
    float delta_rec = delta_l5p77(vector_jjl, ii);
    float theta_rec = theta_l5p77(vector_jjl, ii);
    float phi_rec = phi_l5p77(vector_jjl, ii);
    float y_rec = y00_l5p77(vector_jjl, ii);

    //reset the vector and return it back to the caller
    pV5[0] = (double) x_or;
    pV5[1] = (double) theta_rec;
    pV5[2] = (double) y_rec;
    pV5[3] = (double) phi_rec;
    pV5[4] = (double) delta_rec;
}

void G2PTrans484816R15::ReconRightHRS(double* pV5) {
    //in order to call right arm routines, need to flip y, phi
    pV5[2] *= -1;
    pV5[3] *= -1;
    ReconLeftHRS(pV5);
    pV5[2] *= -1;
    pV5[3] *= -1;
}

void G2PTrans484816R15::FPCorrLeft(const double* V5tg, double* V5fp) {
#if CORRECTION_ORDER == 0
    V5fp[0] += (-5.91123e-03);
    V5fp[1] += (-6.76146e-05);
    V5fp[2] += (-1.89684e-02);
    V5fp[3] += (-1.11524e-02);
#endif
#if CORRECTION_ORDER == 1
    //    V5fp[0] += (-5.91123e-03)+(-9.98542e-02) * V5tg[0]+(-2.96956e-02) * V5tg[1]+(0.00000e+00) * V5tg[2]+(0.00000e+00) * V5tg[3]+(-3.22433e-03) * V5tg[4];
    //    V5fp[1] += (-6.76146e-05)+(7.34029e-02) * V5tg[0]+(1.78179e-02) * V5tg[1]+(0.00000e+00) * V5tg[2]+(0.00000e+00) * V5tg[3]+(9.88179e-02) * V5tg[4];
    //    V5fp[2] += (-1.89684e-02)+(0.00000e+00) * V5tg[0]+(0.00000e+00) * V5tg[1]+(3.54528e-02) * V5tg[2]+(-9.47126e-04) * V5tg[3]+(-6.55867e-02) * V5tg[4];
    //    V5fp[3] += (-1.11524e-02)+(0.00000e+00) * V5tg[0]+(0.00000e+00) * V5tg[1]+(4.73617e-02) * V5tg[2]+(1.11894e-03) * V5tg[3]+(-6.39965e-02) * V5tg[4];
    //
    //    V5fp[0] += (-1.50923e-03)+(0.00000e+00) * V5tg[0]+(-2.98481e-02) * V5tg[1]+(9.98334e-03) * V5tg[2]+(-8.19924e-02) * V5tg[3]+(9.76081e+00) * V5tg[4];
    //    V5fp[1] += (1.35902e-03)+(0.00000e+00) * V5tg[0]+(2.29618e-02) * V5tg[1]+(-2.04595e-02) * V5tg[2]+(-2.20224e-03) * V5tg[3]+(5.30659e-01) * V5tg[4];
    //    V5fp[2] += (-1.78416e-02)+(0.00000e+00) * V5tg[0]+(9.90491e-03) * V5tg[1]+(-9.49504e-02) * V5tg[2]+(2.52013e-02) * V5tg[3]+(1.00987e+01) * V5tg[4];
    //    V5fp[3] += (-9.72573e-03)+(0.00000e+00) * V5tg[0]+(4.58426e-02) * V5tg[1]+(-9.99992e-02) * V5tg[2]+(1.55553e-02) * V5tg[3]+(1.00998e+01) * V5tg[4];

    V5fp[0] += (-1.50612e-03)+(0.00000e+00) * V5tg[0]+(-2.72655e-02) * V5tg[1]+(-9.48539e-03) * V5tg[2]+(-7.25842e-02) * V5tg[3]+(8.58806e+00) * V5tg[4];
    V5fp[1] += (1.35279e-03)+(0.00000e+00) * V5tg[0]+(2.23088e-02) * V5tg[1]+(1.21097e-02) * V5tg[2]+(-2.95080e-03) * V5tg[3]+(6.71229e-01) * V5tg[4];
    V5fp[2] += (-1.83197e-02)+(0.00000e+00) * V5tg[0]+(9.00558e-03) * V5tg[1]+(-5.02045e-02) * V5tg[2]+(-2.48741e-03) * V5tg[3]+(9.62701e+00) * V5tg[4];
    V5fp[3] += (-1.01323e-02)+(0.00000e+00) * V5tg[0]+(4.51187e-02) * V5tg[1]+(-9.76615e-02) * V5tg[2]+(-7.28207e-03) * V5tg[3]+(9.69853e+00) * V5tg[4];
#endif
}

void G2PTrans484816R15::FPCorrRight(const double* V5tg, double* V5fp) {
#if CORRECTION_ORDER == 0
    V5fp[0] += (-5.91123e-03);
    V5fp[1] += (-6.76146e-05);
    V5fp[2] -= (-1.89684e-02);
    V5fp[3] -= (-1.11524e-02);
#endif
#if CORRECTION_ORDER == 1
    V5fp[0] += (-5.91123e-03)+(-9.98542e-02) * V5tg[0]+(-2.96956e-02) * V5tg[1]+(0.00000e+00) * V5tg[2]+(0.00000e+00) * V5tg[3]+(-3.22433e-03) * V5tg[4];
    V5fp[1] += (-6.76146e-05)+(7.34029e-02) * V5tg[0]+(1.78179e-02) * V5tg[1]+(0.00000e+00) * V5tg[2]+(0.00000e+00) * V5tg[3]+(9.88179e-02) * V5tg[4];
    V5fp[2] -= (-1.89684e-02)+(0.00000e+00) * V5tg[0]+(0.00000e+00) * V5tg[1]+(3.54528e-02) * V5tg[2]+(-9.47126e-04) * V5tg[3]+(-6.55867e-02) * V5tg[4];
    V5fp[3] -= (-1.11524e-02)+(0.00000e+00) * V5tg[0]+(0.00000e+00) * V5tg[1]+(4.73617e-02) * V5tg[2]+(1.11894e-03) * V5tg[3]+(-6.39965e-02) * V5tg[4];
#endif
}
