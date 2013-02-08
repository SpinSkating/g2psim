////////////////////////////////////////////////////////////////////////
// 484816 septum with shims, 5.767 central ray
// no target field, no raster 
// by M. Huang 1/7/2013
////////////////////////////////////////////////////////////////////////

#include <cmath>

#include "TROOT.h"
#include "TMath.h"

#include "Fwd_l5p77_484816R00.h"
#include "Bwd_l5p77_484816R00.h"

#include "G2PTrans484816R00.hh"

using namespace S484816R00;

const float m2cm = 100.0;

G2PTrans484816R00::G2PTrans484816R00()
    :cModelAngle(5.77*TMath::Pi()/180.0)
{
    // Nothing to do
}

G2PTrans484816R00::~G2PTrans484816R00()
{
    // Nothing to do
}

bool G2PTrans484816R00::TransLeftHRS(double* pV5)
{
    float vector_jjl[]={pV5[0],pV5[1],pV5[2],pV5[3],pV5[4]};
    int ii=5;

    // float x_test, y_test;

    // //Target to Septum ep5
    // //y, -480., 0.,none,84.0,388.,97.,97.,-97.,-97.  ;84.388.
    // x_test = x_r5p65_ep5(vector_jjl, ii)*m2cm;
    // y_test = y_r5p65_ep5(vector_jjl, ii)*m2cm;
    // if( fabs(x_test)<8.4 || fabs(x_test)>38.8 || fabs(y_test)>9.7 )
    //     return false;

    // //Target to Septum ep7
    // //y, 480., 0.,none,84.0,388.,97.,97.,-97.,-97.
    // x_test = x_r5p65_ep7(vector_jjl, ii)*m2cm;
    // y_test = y_r5p65_ep7(vector_jjl, ii)*m2cm;
    // if( fabs(x_test)<8.4 || fabs(x_test)>38.8 || fabs(y_test)>9.7 )
    //     return false;

    // //Target to Q1 en ep10
    // //y,-200., 0.,none,149.2,149.2,0.,0.,0.,0.
    // x_test = x_r5p65_ep11_q1en(vector_jjl, ii)*m2cm;
    // y_test = y_r5p65_ep11_q1en(vector_jjl, ii)*m2cm;
    // if( sqrt(x_test*x_test + y_test*y_test) > 17.0 )
    //     return false;
    // //Target to Q1 mid plane,
    // //y,0., 0. ,none,150.,150.,0.,0.,0.,0.
    // x_test = x_r5p65_ep13_q1(vector_jjl, ii)*m2cm;
    // y_test = y_r5p65_ep13_q1(vector_jjl, ii)*m2cm;
    // if( sqrt(x_test*x_test + y_test*y_test) > 15.)
    //     return false;

    // //Target to Q1 ex,
    // //y,610.4, 0. ,none,149.2,149.2,0.,0.,0.,0.
    // x_test = x_r5p65_ep14_q1ex(vector_jjl, ii)*m2cm;
    // y_test = y_r5p65_ep14_q1ex(vector_jjl, ii)*m2cm;
    // if( sqrt(x_test*x_test + y_test*y_test) > 14.92 )
    //     return false;

    // //in TCS,             xmin,xmax,ymax1,ymax2,ymin1,ymin2,  
    // //Target to dipole entrance, trapezoid -616.999cm<x<-596.293cm  |y| < 14.55cm
    // //y,-26812.93, -75.,none,-6169.99,-5962.93,145.5,145.5,-145.5,-145.5
    // x_test = x_r5p65_ep23_den(vector_jjl, ii)*m2cm;
    // y_test = y_r5p65_ep23_den(vector_jjl, ii)*m2cm;
    // if( (x_test<-616.999) || (x_test>-596.293) || fabs(y_test)>145.5 )
    //     return false;

    // //Target to dipole exit, trapezoid -46.19cm<x<46.19cm  |y| < -0.0161*x+12.5
    // //y,0., 0.,none,-461.88,461.88,132.44,117.56,-132.44,-117.56
    // x_test = x_r5p65_ep25_dex(vector_jjl, ii)*m2cm;
    // y_test = y_r5p65_ep25_dex(vector_jjl, ii)*m2cm;
    // if( (x_test<-46.19) || (x_test>46.19) || fabs(y_test) > fabs(-0.0161*x_test+12.5) )
    //     return false;

    // //Target to Q3 entrance, circle of radius 30.0 cm
    // x_test = x_r5p65_ep27_q3en(vector_jjl, ii)*m2cm;
    // y_test = y_r5p65_ep27_q3en(vector_jjl, ii)*m2cm;
    // if( sqrt(x_test*x_test + y_test*y_test) > 30.0 )
    //     return false;

    // //Target to Q3 exit, circle of radius 30.0 cm
    // x_test = x_r5p65_ep30_q3ex(vector_jjl, ii)*m2cm;
    // y_test = y_r5p65_ep30_q3ex(vector_jjl, ii)*m2cm;
    // if( sqrt(x_test*x_test + y_test*y_test) > 30.0)
    //     return false;

    /////////////////////////////////////////////////////////////
    // succesfully reach focus plane
    float x_fp     = x_l5p77_fp(vector_jjl,ii);
    float theta_fp = t_l5p77_fp(vector_jjl,ii);
    float y_fp     = y_l5p77_fp(vector_jjl,ii);
    float phi_fp   = p_l5p77_fp(vector_jjl,ii);

    //reset the vector and return it back to the caller
    pV5[0] = (double)x_fp;
    pV5[1] = (double)theta_fp;
    pV5[2] = (double)y_fp;
    pV5[3] = (double)phi_fp;
    //pV5[4] = (double)delta_fp;  // delta is not change
    
    return true;
}

bool G2PTrans484816R00::TransRightHRS(double* pV5)
{
    //use right arm routines for left arm before left arm is ready
    //return TransportLeftHRS(pV5);
    pV5[2]*=-1.;
    pV5[3]*=-1.;
    bool bGoodParticle=TransLeftHRS(pV5);
    pV5[2]*=-1.;
    pV5[3]*=-1.;
    return bGoodParticle;
}

void G2PTrans484816R00::ReconLeftHRS(double* pV5)
{   
    float vector_jjl[]={pV5[0],pV5[1],pV5[2],pV5[3],pV5[4]};
    int ii=5;
    
    vector_jjl[1]   = vector_jjl[1] - txfit_l5p77(vector_jjl,ii);
    
    float x_or      = vector_jjl[4];
    float delta_rec = delta_l5p77(vector_jjl,ii);
    float theta_rec = theta_l5p77(vector_jjl,ii);
    float phi_rec   = phi_l5p77(vector_jjl,ii); 
    float y_rec     = 0.0;
    
    //reset the vector and return it back to the caller
    pV5[0] = (double)x_or;
    pV5[1] = (double)theta_rec;
    pV5[2] = (double)y_rec;
    pV5[3] = (double)phi_rec;
    pV5[4] = (double)delta_rec;
}

void G2PTrans484816R00::ReconRightHRS(double* pV5)
{
    //in order to call right arm routines, need to flip y, phi 
    pV5[2]*=-1;
    pV5[3]*=-1;
    ReconLeftHRS(pV5);
    pV5[2]*=-1;
    pV5[3]*=-1;
}

void G2PTrans484816R00::FPCorrection(double *v)
{
    // v[0]+=-0.00591361;
    // v[1]+=-0.0000659499;
    // v[2]+=-0.0190684;
    // v[3]+=-0.011203;
}
