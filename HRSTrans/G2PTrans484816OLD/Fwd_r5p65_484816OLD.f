      function x_r5p65_484816old_sepex(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 91)
      data ncoeff/ 90/
      data avdat/  0.2668243E+00/
      data xmin/
     1 -0.14934E-01,-0.49046E-01,-0.15984E-01,-0.26925E-01,-0.49980E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48199E-01, 0.15995E-01, 0.26999E-01, 0.49957E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     + -0.78785950E-02, 0.67077385E-03,-0.18005447E-01,-0.60117051E-01,
     + -0.29132492E-02, 0.49397708E-02, 0.23133175E-02,-0.12982311E-02,
     + -0.11910747E-02, 0.33687518E-02, 0.16568796E-02, 0.45771606E-03,
     +  0.16518850E-02, 0.17717047E-03, 0.80183474E-03, 0.23279731E-03,
     + -0.32931054E-03, 0.20054105E-03, 0.15265871E-03, 0.13989084E-02,
     + -0.51306237E-04,-0.21623306E-03, 0.13816438E-02, 0.13111139E-03,
     +  0.10829777E-03,-0.86663850E-03, 0.56430593E-03, 0.66398375E-03,
     +  0.17411965E-03,-0.17531910E-03, 0.15555244E-03, 0.16779709E-03,
     + -0.24563455E-03,-0.20791647E-03,-0.84748748E-03, 0.32579087E-03,
     +  0.44261014E-04, 0.44420089E-04,-0.21242854E-03,-0.93822113E-04,
     + -0.47915077E-03, 0.16745029E-03, 0.25764480E-05,-0.14180772E-03,
     +  0.58072917E-04,-0.60142833E-04,-0.35487334E-03, 0.86649176E-04,
     + -0.56136010E-04,-0.22229679E-03, 0.23943334E-03,-0.15203233E-03,
     + -0.74136500E-04, 0.25036366E-04,-0.13612680E-04,-0.52064344E-04,
     + -0.54245120E-04, 0.73252930E-04,-0.23575714E-03,-0.16868474E-03,
     +  0.46741174E-04,-0.31952841E-04,-0.98869721E-04,-0.27317306E-04,
     + -0.24681530E-03, 0.23256254E-03, 0.19999986E-03,-0.27445913E-04,
     + -0.28479681E-04,-0.52615997E-04,-0.10869144E-04, 0.17936522E-04,
     +  0.38062757E-04,-0.42985437E-04,-0.31809086E-04, 0.18888470E-03,
     +  0.94336494E-04, 0.22216982E-03,-0.79494661E-04, 0.18716195E-03,
     + -0.47060548E-04,-0.27068932E-04, 0.42582378E-04,-0.26716429E-04,
     + -0.82519022E-04,-0.51771873E-04,-0.42921165E-04, 0.12146320E-03,
     +  0.15469371E-03, 0.37294518E-04,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x34 = x33*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x44 = x43*x4
      x51 = x5
      x52 = x51*x5
      x53 = x52*x5
      x54 = x53*x5
c
c                  function
c
      x_r5p65_484816old_sepex=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)    *x21            
     3  +coeff(  3)        *x31        
     4  +coeff(  4)            *x41    
     5  +coeff(  5)                *x51
     6  +coeff(  6)    *x22            
     7  +coeff(  7)*x11*x21            
     8  +coeff(  8)        *x31*x41    
      x_r5p65_484816old_sepex=x_r5p65_484816old_sepex
     9  +coeff(  9)            *x42    
     1  +coeff( 10)    *x22    *x41    
     2  +coeff( 11)*x11*x21    *x41    
     3  +coeff( 12)    *x21    *x41    
     4  +coeff( 13)    *x22*x31        
     5  +coeff( 14)*x11                
     6  +coeff( 15)*x11*x21*x31        
     7  +coeff( 16)    *x21*x31        
     8  +coeff( 17)        *x32        
      x_r5p65_484816old_sepex=x_r5p65_484816old_sepex
     9  +coeff( 18)            *x41*x51
     1  +coeff( 19)                *x52
     2  +coeff( 20)    *x22    *x42    
     3  +coeff( 21)    *x24*x31*x41    
     4  +coeff( 22)    *x22        *x51
     5  +coeff( 23)    *x22*x31*x41    
     6  +coeff( 24)*x11        *x41    
     7  +coeff( 25)    *x24    *x42    
     8  +coeff( 26)*x11*x23            
      x_r5p65_484816old_sepex=x_r5p65_484816old_sepex
     9  +coeff( 27)*x11*x21*x31*x41    
     1  +coeff( 28)*x11*x21    *x42    
     2  +coeff( 29)        *x31    *x51
     3  +coeff( 30)    *x23            
     4  +coeff( 31)    *x21*x31*x41    
     5  +coeff( 32)    *x21    *x42    
     6  +coeff( 33)        *x31*x42    
     7  +coeff( 34)            *x43    
     8  +coeff( 35)    *x24            
      x_r5p65_484816old_sepex=x_r5p65_484816old_sepex
     9  +coeff( 36)    *x22*x32        
     1  +coeff( 37)*x11    *x31        
     2  +coeff( 38)        *x34*x41    
     3  +coeff( 39)*x11*x22            
     4  +coeff( 40)*x11*x21        *x51
     5  +coeff( 41)*x11*x23    *x41    
     6  +coeff( 42)*x11*x23*x32        
     7  +coeff( 43)    *x21        *x51
     8  +coeff( 44)        *x32*x41    
      x_r5p65_484816old_sepex=x_r5p65_484816old_sepex
     9  +coeff( 45)            *x42*x51
     1  +coeff( 46)    *x22    *x41*x51
     2  +coeff( 47)    *x24    *x41    
     3  +coeff( 48)    *x22*x31*x41*x51
     4  +coeff( 49)*x11        *x43    
     5  +coeff( 50)*x11*x23*x31        
     6  +coeff( 51)        *x34*x42*x52
     7  +coeff( 52)        *x32*x44*x52
     8  +coeff( 53)*x11        *x41*x53
      x_r5p65_484816old_sepex=x_r5p65_484816old_sepex
     9  +coeff( 54)    *x21*x32        
     1  +coeff( 55)        *x33        
     2  +coeff( 56)    *x23*x31        
     3  +coeff( 57)    *x23    *x41    
     4  +coeff( 58)        *x31*x43    
     5  +coeff( 59)    *x22*x31    *x51
     6  +coeff( 60)        *x31*x42*x51
     7  +coeff( 61)    *x22        *x52
     8  +coeff( 62)    *x21        *x53
      x_r5p65_484816old_sepex=x_r5p65_484816old_sepex
     9  +coeff( 63)        *x31    *x53
     1  +coeff( 64)                *x54
     2  +coeff( 65)    *x24*x31        
     3  +coeff( 66)    *x22*x31*x42    
     4  +coeff( 67)    *x22    *x43    
     5  +coeff( 68)    *x21*x31*x43    
     6  +coeff( 69)    *x21    *x41*x53
     7  +coeff( 70)            *x42*x53
     8  +coeff( 71)*x11    *x32        
      x_r5p65_484816old_sepex=x_r5p65_484816old_sepex
     9  +coeff( 72)*x11        *x42    
     1  +coeff( 73)        *x34*x42    
     2  +coeff( 74)    *x23    *x43    
     3  +coeff( 75)    *x21*x34    *x51
     4  +coeff( 76)    *x22*x31*x42*x51
     5  +coeff( 77)        *x31*x44*x51
     6  +coeff( 78)    *x22*x31    *x53
     7  +coeff( 79)*x11*x22    *x41    
     8  +coeff( 80)    *x24*x32*x41    
      x_r5p65_484816old_sepex=x_r5p65_484816old_sepex
     9  +coeff( 81)*x11*x21*x31    *x51
     1  +coeff( 82)*x11        *x42*x51
     2  +coeff( 83)*x11*x21        *x52
     3  +coeff( 84)*x11    *x31    *x52
     4  +coeff( 85)    *x21*x31*x43*x52
     5  +coeff( 86)        *x31*x43*x53
     6  +coeff( 87)    *x21    *x42*x54
     7  +coeff( 88)*x11*x24            
     8  +coeff( 89)*x11*x21    *x43    
      x_r5p65_484816old_sepex=x_r5p65_484816old_sepex
     9  +coeff( 90)*x11*x22*x31    *x51
c
      return
      end
      function t_r5p65_484816old_sepex(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 86)
      data ncoeff/ 85/
      data avdat/  0.2189843E+00/
      data xmin/
     1 -0.14934E-01,-0.49046E-01,-0.15984E-01,-0.26925E-01,-0.49980E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48199E-01, 0.15995E-01, 0.26999E-01, 0.49957E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     + -0.53880503E-02, 0.12046378E-02,-0.25295692E-02,-0.33971362E-01,
     + -0.59376769E-02, 0.98294886E-02, 0.39589638E-02, 0.51895925E-02,
     + -0.22607469E-02,-0.24545488E-02, 0.22329492E-02, 0.24191886E-02,
     +  0.26658678E-03,-0.48112392E-03, 0.69864281E-03, 0.31534265E-03,
     +  0.44247351E-03, 0.10811636E-02, 0.30930734E-02,-0.32385412E-03,
     +  0.29372895E-03, 0.29838964E-03,-0.42364965E-03,-0.15393854E-02,
     +  0.26850959E-02,-0.12173248E-02, 0.13638564E-02,-0.30317518E-03,
     + -0.37591916E-03, 0.15670272E-03, 0.30402598E-03,-0.50496426E-03,
     + -0.42461618E-03,-0.23894175E-03, 0.49594126E-03,-0.17561477E-03,
     +  0.25948382E-03, 0.11625944E-02,-0.19174440E-04,-0.38035499E-03,
     + -0.51973730E-04, 0.88444198E-04, 0.69846436E-04, 0.25640550E-03,
     + -0.19391820E-03, 0.12502183E-03, 0.20732057E-03, 0.47662284E-04,
     +  0.61578554E-04, 0.92557566E-04,-0.11206722E-03,-0.83709398E-04,
     + -0.55993336E-04,-0.81750062E-04,-0.65520656E-03, 0.10887779E-03,
     + -0.23741527E-03, 0.20775617E-04,-0.15924421E-04, 0.76645483E-05,
     + -0.25163696E-03,-0.12001277E-04,-0.17607324E-04, 0.46814832E-04,
     +  0.59096652E-04, 0.14106685E-04,-0.50529733E-03, 0.33636857E-03,
     +  0.24374298E-03,-0.22323016E-04,-0.49810071E-04,-0.21886494E-03,
     + -0.31637544E-04, 0.77280209E-04, 0.21588148E-03, 0.14954655E-03,
     + -0.12098253E-03, 0.20899541E-03,-0.30965195E-03,-0.37915699E-04,
     + -0.81824655E-04, 0.20652084E-03,-0.12947753E-03,-0.28840129E-03,
     + -0.11245978E-03,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x12 = x11*x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x44 = x43*x4
      x51 = x5
      x52 = x51*x5
c
c                  function
c
      t_r5p65_484816old_sepex=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)    *x21            
     3  +coeff(  3)        *x31        
     4  +coeff(  4)            *x41    
     5  +coeff(  5)                *x51
     6  +coeff(  6)    *x22            
     7  +coeff(  7)*x11*x21            
     8  +coeff(  8)    *x22    *x41    
      t_r5p65_484816old_sepex=t_r5p65_484816old_sepex
     9  +coeff(  9)        *x31*x41    
     1  +coeff( 10)            *x42    
     2  +coeff( 11)    *x22*x31        
     3  +coeff( 12)*x11*x21    *x41    
     4  +coeff( 13)*x11                
     5  +coeff( 14)        *x32        
     6  +coeff( 15)    *x21    *x41    
     7  +coeff( 16)                *x52
     8  +coeff( 17)*x12                
      t_r5p65_484816old_sepex=t_r5p65_484816old_sepex
     9  +coeff( 18)*x11*x21*x31        
     1  +coeff( 19)    *x22    *x42    
     2  +coeff( 20)    *x24*x31*x41    
     3  +coeff( 21)    *x21*x31        
     4  +coeff( 22)            *x41*x51
     5  +coeff( 23)    *x22        *x51
     6  +coeff( 24)    *x24            
     7  +coeff( 25)    *x22*x31*x41    
     8  +coeff( 26)*x11*x23            
      t_r5p65_484816old_sepex=t_r5p65_484816old_sepex
     9  +coeff( 27)*x11*x21    *x42    
     1  +coeff( 28)*x11*x23*x31*x41    
     2  +coeff( 29)    *x23            
     3  +coeff( 30)*x11        *x41    
     4  +coeff( 31)    *x21    *x42    
     5  +coeff( 32)        *x31*x42    
     6  +coeff( 33)            *x43    
     7  +coeff( 34)*x11*x22            
     8  +coeff( 35)    *x22*x32        
      t_r5p65_484816old_sepex=t_r5p65_484816old_sepex
     9  +coeff( 36)*x11*x21        *x51
     1  +coeff( 37)*x12        *x41    
     2  +coeff( 38)*x11*x21*x31*x41    
     3  +coeff( 39)    *x23*x31*x41    
     4  +coeff( 40)*x12*x22            
     5  +coeff( 41)    *x21        *x51
     6  +coeff( 42)        *x31    *x51
     7  +coeff( 43)*x11    *x31        
     8  +coeff( 44)    *x21*x31*x41    
      t_r5p65_484816old_sepex=t_r5p65_484816old_sepex
     9  +coeff( 45)        *x32*x41    
     1  +coeff( 46)*x12    *x31        
     2  +coeff( 47)*x11*x21*x32        
     3  +coeff( 48)    *x21*x32        
     4  +coeff( 49)        *x31*x41*x51
     5  +coeff( 50)            *x42*x51
     6  +coeff( 51)    *x23    *x41    
     7  +coeff( 52)    *x22    *x41*x51
     8  +coeff( 53)*x12*x21            
      t_r5p65_484816old_sepex=t_r5p65_484816old_sepex
     9  +coeff( 54)*x11*x22    *x41    
     1  +coeff( 55)*x11*x23    *x41    
     2  +coeff( 56)*x12        *x42    
     3  +coeff( 57)    *x22*x31*x43    
     4  +coeff( 58)    *x22    *x44    
     5  +coeff( 59)*x11    *x31*x44    
     6  +coeff( 60)*x12    *x33*x41    
     7  +coeff( 61)*x12*x24    *x41    
     8  +coeff( 62)*x11            *x51
      t_r5p65_484816old_sepex=t_r5p65_484816old_sepex
     9  +coeff( 63)    *x21    *x41*x51
     1  +coeff( 64)*x11    *x31*x41    
     2  +coeff( 65)*x11        *x42    
     3  +coeff( 66)        *x31*x43    
     4  +coeff( 67)    *x24    *x41    
     5  +coeff( 68)    *x22*x31*x42    
     6  +coeff( 69)    *x22    *x43    
     7  +coeff( 70)*x12            *x51
     8  +coeff( 71)*x11*x21    *x41*x51
      t_r5p65_484816old_sepex=t_r5p65_484816old_sepex
     9  +coeff( 72)*x11*x23*x31        
     1  +coeff( 73)*x12*x21    *x41    
     2  +coeff( 74)*x12    *x31*x41    
     3  +coeff( 75)*x11*x21*x31*x42    
     4  +coeff( 76)*x11*x21    *x43    
     5  +coeff( 77)    *x24*x33        
     6  +coeff( 78)    *x24*x32*x41    
     7  +coeff( 79)*x11*x23    *x42    
     8  +coeff( 80)*x11*x21*x31*x43    
      t_r5p65_484816old_sepex=t_r5p65_484816old_sepex
     9  +coeff( 81)    *x22    *x44*x51
     1  +coeff( 82)*x11*x23*x32*x41    
     2  +coeff( 83)    *x24*x32*x42    
     3  +coeff( 84)    *x24    *x44    
     4  +coeff( 85)*x12*x24*x31        
c
      return
      end
      function y_r5p65_484816old_sepex(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 21)
      data ncoeff/ 20/
      data avdat/ -0.2890460E-03/
      data xmin/
     1 -0.14934E-01,-0.49046E-01,-0.15984E-01,-0.26925E-01,-0.49980E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48199E-01, 0.15995E-01, 0.26999E-01, 0.49957E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     + -0.10183130E-02,-0.11499161E-03,-0.25971103E-03, 0.94194070E-01,
     + -0.56250291E-02, 0.22625229E-04, 0.13392503E-01, 0.11678303E-03,
     + -0.11083580E-02,-0.22166965E-02,-0.14441365E-02,-0.41031948E-03,
     +  0.19261815E-02, 0.12529796E-02, 0.26948866E-03, 0.30559755E-03,
     +  0.18889904E-03,-0.13329457E-02, 0.14554875E-02, 0.84639201E-03,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x41 = x4
      x42 = x41*x4
      x51 = x5
c
c                  function
c
      y_r5p65_484816old_sepex=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)        *x31        
     3  +coeff(  3)            *x41    
     4  +coeff(  4)    *x21            
     5  +coeff(  5)    *x21    *x41    
     6  +coeff(  6)            *x41*x51
     7  +coeff(  7)*x11                
     8  +coeff(  8)    *x21*x33        
      y_r5p65_484816old_sepex=y_r5p65_484816old_sepex
     9  +coeff(  9)*x11        *x41    
     1  +coeff( 10)    *x21*x31        
     2  +coeff( 11)    *x21    *x42    
     3  +coeff( 12)*x11    *x31        
     4  +coeff( 13)    *x23            
     5  +coeff( 14)*x11*x22            
     6  +coeff( 15)    *x21*x33*x41    
     7  +coeff( 16)    *x22            
     8  +coeff( 17)    *x21        *x51
      y_r5p65_484816old_sepex=y_r5p65_484816old_sepex
     9  +coeff( 18)    *x21*x31*x41    
     1  +coeff( 19)    *x23    *x41    
     2  +coeff( 20)*x11*x22    *x41    
c
      return
      end
      function p_r5p65_484816old_sepex(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 36)
      data ncoeff/ 35/
      data avdat/ -0.5492379E-03/
      data xmin/
     1 -0.14934E-01,-0.49046E-01,-0.15984E-01,-0.26925E-01,-0.49980E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48199E-01, 0.15995E-01, 0.26999E-01, 0.49957E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     + -0.54756500E-03, 0.40258836E-01,-0.21722121E-02,-0.89345453E-02,
     + -0.19066562E-02, 0.13999291E-02,-0.37845396E-02, 0.29723789E-02,
     +  0.19948732E-02,-0.53127797E-03, 0.58001420E-03,-0.82427455E-03,
     + -0.23357661E-02,-0.25178250E-02, 0.31335226E-02, 0.18941902E-02,
     + -0.21952124E-03, 0.30806666E-03, 0.25422600E-03, 0.54150319E-03,
     +  0.26602554E-03,-0.46285719E-03, 0.44081066E-03, 0.64113777E-03,
     +  0.17525419E-03,-0.50570141E-03, 0.80024482E-04, 0.21940024E-03,
     + -0.37733788E-03,-0.59420313E-03,-0.10293779E-03, 0.69613941E-03,
     +  0.52126939E-03, 0.35268647E-03,-0.74766035E-03,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x12 = x11*x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x31 = x3
      x32 = x31*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x44 = x43*x4
      x51 = x5
c
c                  function
c
      p_r5p65_484816old_sepex=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)    *x21            
     3  +coeff(  3)*x11                
     4  +coeff(  4)    *x21    *x41    
     5  +coeff(  5)*x11        *x41    
     6  +coeff(  6)    *x23*x31        
     7  +coeff(  7)    *x21*x31        
     8  +coeff(  8)    *x23            
      p_r5p65_484816old_sepex=p_r5p65_484816old_sepex
     9  +coeff(  9)*x11*x22            
     1  +coeff( 10)            *x41    
     2  +coeff( 11)    *x22            
     3  +coeff( 12)*x11    *x31        
     4  +coeff( 13)    *x21*x31*x41    
     5  +coeff( 14)    *x21    *x42    
     6  +coeff( 15)    *x23    *x41    
     7  +coeff( 16)*x11*x22    *x41    
     8  +coeff( 17)        *x31        
      p_r5p65_484816old_sepex=p_r5p65_484816old_sepex
     9  +coeff( 18)    *x21        *x51
     1  +coeff( 19)*x11*x21            
     2  +coeff( 20)    *x22    *x41    
     3  +coeff( 21)    *x21    *x41*x51
     4  +coeff( 22)*x11        *x42    
     5  +coeff( 23)*x12*x21            
     6  +coeff( 24)    *x21*x31*x43    
     7  +coeff( 25)    *x22*x31        
     8  +coeff( 26)    *x21*x32        
      p_r5p65_484816old_sepex=p_r5p65_484816old_sepex
     9  +coeff( 27)*x11            *x51
     1  +coeff( 28)*x11*x21    *x41    
     2  +coeff( 29)*x11    *x31*x41    
     3  +coeff( 30)    *x21    *x43    
     4  +coeff( 31)            *x44    
     5  +coeff( 32)*x11*x22*x31        
     6  +coeff( 33)    *x21*x32*x42    
     7  +coeff( 34)*x12*x21    *x41    
     8  +coeff( 35)    *x23*x31*x42    
c
      return
      end
      function sl_r5p65_484816old_sepex(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 11)
      data ncoeff/ 10/
      data avdat/ -0.1871906E-02/
      data xmin/
     1 -0.14934E-01,-0.49046E-01,-0.15984E-01,-0.26925E-01,-0.49980E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48199E-01, 0.15995E-01, 0.26999E-01, 0.49957E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     +  0.18761134E-02,-0.44090964E-04, 0.18541159E-02, 0.76745683E-02,
     +  0.52465498E-03,-0.30266175E-02, 0.10648021E-03,-0.69522427E-03,
     + -0.30119545E-03,-0.11139426E-03,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x21 = x2
      x22 = x21*x2
      x31 = x3
      x41 = x4
      x42 = x41*x4
      x51 = x5
c
c                  function
c
      sl_r5p65_484816old_sepex=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)    *x21            
     3  +coeff(  3)        *x31        
     4  +coeff(  4)            *x41    
     5  +coeff(  5)                *x51
     6  +coeff(  6)    *x22            
     7  +coeff(  7)        *x31*x41    
     8  +coeff(  8)            *x42    
      sl_r5p65_484816old_sepex=sl_r5p65_484816old_sepex
     9  +coeff(  9)*x11*x21            
     1  +coeff( 10)            *x41*x51
c
      return
      end
      function x_r5p65_484816old_q1ent(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 91)
      data ncoeff/ 90/
      data avdat/ -0.2336896E-05/
      data xmin/
     1 -0.14934E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.49980E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26999E-01, 0.49957E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     + -0.11478971E-02, 0.10192701E+00,-0.67035374E-02, 0.22578209E-02,
     +  0.13025840E-01,-0.29913683E-02,-0.16980959E-02,-0.52308693E-03,
     + -0.25751602E-02,-0.76250272E-03, 0.47745620E-03, 0.19427693E-02,
     + -0.23550008E-03, 0.59760653E-03, 0.35203397E-03, 0.49116643E-03,
     + -0.24043068E-02, 0.22696774E-02, 0.27404676E-03, 0.17574002E-02,
     + -0.56645967E-03, 0.33088375E-03, 0.10310430E-02,-0.99743844E-03,
     + -0.79774502E-03,-0.57227095E-03,-0.56522310E-03, 0.69284486E-03,
     +  0.37958445E-04,-0.17351643E-03,-0.16512706E-03, 0.20689849E-03,
     +  0.12072277E-03,-0.39429922E-03, 0.10020962E-03, 0.19546939E-03,
     + -0.64135867E-03,-0.44479948E-04, 0.45240766E-03, 0.90057976E-04,
     + -0.13517690E-03, 0.10252135E-03, 0.15893482E-03, 0.14142794E-03,
     +  0.46208374E-04,-0.72261399E-04,-0.41720537E-04, 0.12656466E-03,
     + -0.10608124E-03, 0.21199271E-05,-0.34522844E-04,-0.69277034E-04,
     +  0.42323989E-03, 0.36784293E-03,-0.60929120E-04,-0.42006152E-03,
     +  0.11515248E-03, 0.80750187E-05,-0.65559754E-04,-0.12815855E-04,
     + -0.77027125E-05,-0.13719528E-03, 0.18081380E-03, 0.25133757E-04,
     + -0.54134169E-04, 0.65544162E-04, 0.75058466E-04,-0.51437379E-04,
     +  0.12897796E-03,-0.12536114E-03, 0.25989066E-04,-0.14426922E-04,
     + -0.84283609E-04, 0.36515030E-04, 0.51778166E-04,-0.52556305E-04,
     +  0.26730802E-04,-0.16370862E-03, 0.14846021E-04, 0.52863881E-04,
     +  0.39131417E-04,-0.81441154E-04, 0.43198768E-04,-0.62096617E-04,
     + -0.44659409E-04,-0.21973608E-04, 0.18785018E-03,-0.14323217E-03,
     + -0.34080782E-04, 0.79265577E-04,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x34 = x33*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x44 = x43*x4
      x51 = x5
      x52 = x51*x5
      x53 = x52*x5
      x54 = x53*x5
c
c                  function
c
      x_r5p65_484816old_q1ent=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)    *x21            
     3  +coeff(  3)    *x21    *x41    
     4  +coeff(  4)    *x23            
     5  +coeff(  5)*x11                
     6  +coeff(  6)    *x21*x31        
     7  +coeff(  7)*x11        *x41    
     8  +coeff(  8)            *x41    
      x_r5p65_484816old_q1ent=x_r5p65_484816old_q1ent
     9  +coeff(  9)    *x21    *x42    
     1  +coeff( 10)*x11    *x31        
     2  +coeff( 11)    *x23*x31*x41    
     3  +coeff( 12)*x11*x22            
     4  +coeff( 13)        *x31        
     5  +coeff( 14)    *x22            
     6  +coeff( 15)    *x21        *x51
     7  +coeff( 16)    *x22    *x41    
     8  +coeff( 17)    *x21*x31*x41    
      x_r5p65_484816old_q1ent=x_r5p65_484816old_q1ent
     9  +coeff( 18)    *x23    *x41    
     1  +coeff( 19)*x11*x21            
     2  +coeff( 20)*x11*x22    *x41    
     3  +coeff( 21)    *x21*x32        
     4  +coeff( 22)    *x21    *x41*x51
     5  +coeff( 23)    *x23*x31        
     6  +coeff( 24)    *x21*x31*x42    
     7  +coeff( 25)    *x21    *x43    
     8  +coeff( 26)*x11    *x31*x41    
      x_r5p65_484816old_q1ent=x_r5p65_484816old_q1ent
     9  +coeff( 27)*x11        *x42    
     1  +coeff( 28)*x11*x22*x31        
     2  +coeff( 29)                *x51
     3  +coeff( 30)        *x31*x41    
     4  +coeff( 31)            *x42    
     5  +coeff( 32)    *x22*x31        
     6  +coeff( 33)    *x21*x31    *x51
     7  +coeff( 34)    *x21*x32*x41    
     8  +coeff( 35)*x11            *x51
      x_r5p65_484816old_q1ent=x_r5p65_484816old_q1ent
     9  +coeff( 36)*x11*x21    *x41    
     1  +coeff( 37)*x11*x24            
     2  +coeff( 38)        *x32        
     3  +coeff( 39)    *x23    *x42    
     4  +coeff( 40)*x11*x21*x31        
     5  +coeff( 41)*x11    *x32        
     6  +coeff( 42)*x11        *x41*x51
     7  +coeff( 43)*x11    *x31*x43    
     8  +coeff( 44)*x11    *x32*x44    
      x_r5p65_484816old_q1ent=x_r5p65_484816old_q1ent
     9  +coeff( 45)            *x41*x51
     1  +coeff( 46)            *x43    
     2  +coeff( 47)    *x21*x33        
     3  +coeff( 48)    *x22    *x42    
     4  +coeff( 49)    *x23        *x51
     5  +coeff( 50)    *x22*x31*x42    
     6  +coeff( 51)    *x21        *x54
     7  +coeff( 52)*x11*x22        *x51
     8  +coeff( 53)*x11*x22*x31*x41    
      x_r5p65_484816old_q1ent=x_r5p65_484816old_q1ent
     9  +coeff( 54)*x11*x22    *x42    
     1  +coeff( 55)*x11        *x43*x51
     2  +coeff( 56)*x11*x24    *x41    
     3  +coeff( 57)*x11*x23*x31    *x51
     4  +coeff( 58)        *x31    *x51
     5  +coeff( 59)        *x31*x42    
     6  +coeff( 60)            *x42*x51
     7  +coeff( 61)                *x53
     8  +coeff( 62)    *x24            
      x_r5p65_484816old_q1ent=x_r5p65_484816old_q1ent
     9  +coeff( 63)    *x22*x31*x41    
     1  +coeff( 64)        *x32*x42    
     2  +coeff( 65)            *x44    
     3  +coeff( 66)    *x21*x31*x41*x51
     4  +coeff( 67)    *x21    *x42*x51
     5  +coeff( 68)            *x41*x53
     6  +coeff( 69)    *x23*x32        
     7  +coeff( 70)    *x21    *x44    
     8  +coeff( 71)    *x24        *x51
      x_r5p65_484816old_q1ent=x_r5p65_484816old_q1ent
     9  +coeff( 72)    *x22*x32    *x51
     1  +coeff( 73)    *x23    *x41*x51
     2  +coeff( 74)            *x44*x51
     3  +coeff( 75)    *x21*x32    *x52
     4  +coeff( 76)    *x22        *x53
     5  +coeff( 77)    *x24*x32        
     6  +coeff( 78)    *x22*x31*x43    
     7  +coeff( 79)*x11    *x31    *x51
     8  +coeff( 80)    *x22*x33    *x51
      x_r5p65_484816old_q1ent=x_r5p65_484816old_q1ent
     9  +coeff( 81)            *x43*x53
     1  +coeff( 82)*x11*x23            
     2  +coeff( 83)*x11*x21    *x42    
     3  +coeff( 84)*x11    *x31*x42    
     4  +coeff( 85)*x11        *x43    
     5  +coeff( 86)*x11    *x32    *x51
     6  +coeff( 87)    *x22*x33*x41*x51
     7  +coeff( 88)    *x22*x31*x43*x51
     8  +coeff( 89)        *x34*x41*x52
      x_r5p65_484816old_q1ent=x_r5p65_484816old_q1ent
     9  +coeff( 90)*x11*x22*x32        
c
      return
      end
      function t_r5p65_484816old_q1ent(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 67)
      data ncoeff/ 66/
      data avdat/ -0.3858009E-03/
      data xmin/
     1 -0.14934E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.49980E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26999E-01, 0.49957E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     + -0.54518838E-03, 0.38881801E-01,-0.21165230E-02,-0.86672902E-02,
     + -0.18649418E-02, 0.13411776E-02,-0.60566538E-03,-0.36785502E-02,
     + -0.25907610E-03, 0.58600109E-03, 0.27128626E-02,-0.82210521E-03,
     + -0.24453632E-02,-0.27828594E-02, 0.18480206E-02, 0.33438182E-02,
     + -0.58940839E-06, 0.20077582E-02, 0.27756547E-03, 0.63387590E-03,
     +  0.37167605E-03,-0.63106266E-03, 0.42816432E-03, 0.83570014E-03,
     +  0.13419854E-04,-0.19183406E-03, 0.36438869E-03, 0.25040453E-03,
     + -0.51383406E-03, 0.81213439E-04, 0.24719516E-03,-0.57320623E-03,
     +  0.48394736E-05,-0.12121674E-02,-0.10557637E-02, 0.38590661E-03,
     +  0.26582264E-04, 0.24013196E-04,-0.16578214E-03, 0.13563613E-03,
     +  0.10046975E-03,-0.11493707E-03,-0.48473451E-03, 0.15766584E-03,
     + -0.30937194E-04, 0.30044532E-04, 0.64422151E-04,-0.24472651E-03,
     + -0.21000009E-03, 0.40168393E-05, 0.15696056E-04,-0.66268709E-04,
     + -0.58629648E-04,-0.57997502E-04, 0.76214965E-04, 0.29106070E-04,
     +  0.22134169E-04, 0.35558621E-03,-0.98888442E-04,-0.45661709E-04,
     +  0.40170102E-03,-0.10356821E-03, 0.26215820E-03, 0.13189444E-03,
     +  0.29606582E-03, 0.94691008E-04,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x12 = x11*x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x51 = x5
      x52 = x51*x5
      x53 = x52*x5
c
c                  function
c
      t_r5p65_484816old_q1ent=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)    *x21            
     3  +coeff(  3)*x11                
     4  +coeff(  4)    *x21    *x41    
     5  +coeff(  5)*x11        *x41    
     6  +coeff(  6)    *x23*x31        
     7  +coeff(  7)            *x41    
     8  +coeff(  8)    *x21*x31        
      t_r5p65_484816old_q1ent=t_r5p65_484816old_q1ent
     9  +coeff(  9)        *x31        
     1  +coeff( 10)    *x22            
     2  +coeff( 11)    *x23            
     3  +coeff( 12)*x11    *x31        
     4  +coeff( 13)    *x21*x31*x41    
     5  +coeff( 14)    *x21    *x42    
     6  +coeff( 15)*x11*x22            
     7  +coeff( 16)    *x23    *x41    
     8  +coeff( 17)    *x21        *x53
      t_r5p65_484816old_q1ent=t_r5p65_484816old_q1ent
     9  +coeff( 18)*x11*x22    *x41    
     1  +coeff( 19)*x11*x21            
     2  +coeff( 20)    *x22    *x41    
     3  +coeff( 21)    *x21    *x41*x51
     4  +coeff( 22)*x11        *x42    
     5  +coeff( 23)*x12*x21            
     6  +coeff( 24)*x11*x22*x31        
     7  +coeff( 25)*x11    *x33*x41    
     8  +coeff( 26)            *x42    
      t_r5p65_484816old_q1ent=t_r5p65_484816old_q1ent
     9  +coeff( 27)    *x21        *x51
     1  +coeff( 28)    *x22*x31        
     2  +coeff( 29)    *x21*x32        
     3  +coeff( 30)*x11            *x51
     4  +coeff( 31)*x11*x21    *x41    
     5  +coeff( 32)*x11    *x31*x41    
     6  +coeff( 33)        *x33*x41    
     7  +coeff( 34)    *x21*x31*x42    
     8  +coeff( 35)    *x21    *x43    
      t_r5p65_484816old_q1ent=t_r5p65_484816old_q1ent
     9  +coeff( 36)*x12*x21    *x41    
     1  +coeff( 37)    *x23*x32*x41    
     2  +coeff( 38)                *x51
     3  +coeff( 39)        *x31*x41    
     4  +coeff( 40)    *x21*x31    *x51
     5  +coeff( 41)*x11*x21*x31        
     6  +coeff( 42)*x11    *x32        
     7  +coeff( 43)    *x21*x32*x41    
     8  +coeff( 44)*x12*x21*x31        
      t_r5p65_484816old_q1ent=t_r5p65_484816old_q1ent
     9  +coeff( 45)        *x32        
     1  +coeff( 46)*x12                
     2  +coeff( 47)*x11        *x41*x51
     3  +coeff( 48)*x11    *x31*x42    
     4  +coeff( 49)*x11        *x43    
     5  +coeff( 50)*x11*x22*x32*x41    
     6  +coeff( 51)            *x41*x51
     7  +coeff( 52)        *x31*x42    
     8  +coeff( 53)            *x43    
      t_r5p65_484816old_q1ent=t_r5p65_484816old_q1ent
     9  +coeff( 54)    *x21*x33        
     1  +coeff( 55)    *x22    *x42    
     2  +coeff( 56)*x11    *x31    *x51
     3  +coeff( 57)*x12        *x41    
     4  +coeff( 58)    *x23*x31*x41    
     5  +coeff( 59)*x11    *x32*x41    
     6  +coeff( 60)    *x22*x32*x41    
     7  +coeff( 61)    *x23    *x42    
     8  +coeff( 62)    *x23    *x41*x51
      t_r5p65_484816old_q1ent=t_r5p65_484816old_q1ent
     9  +coeff( 63)*x11*x22*x31*x41    
     1  +coeff( 64)    *x24*x31*x41    
     2  +coeff( 65)*x11*x22    *x42    
     3  +coeff( 66)*x11*x23*x31*x41    
c
      return
      end
      function y_r5p65_484816old_q1ent(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 24)
      data ncoeff/ 23/
      data avdat/ -0.7883550E-02/
      data xmin/
     1 -0.14934E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.49980E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26999E-01, 0.49957E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     +  0.86188111E-02, 0.18109137E-01, 0.65489419E-01,-0.87452127E-03,
     +  0.41137445E-02,-0.61394419E-02,-0.41671279E-02,-0.26876898E-02,
     +  0.15788757E-02, 0.19079116E-02,-0.18846192E-02,-0.18396839E-02,
     +  0.25681223E-03,-0.48856577E-03,-0.18008043E-03,-0.81969262E-03,
     + -0.29694432E-03,-0.18290557E-03,-0.19071256E-03,-0.13922304E-02,
     + -0.18069152E-02,-0.73466520E-03,-0.76453935E-03,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x12 = x11*x1
      x21 = x2
      x22 = x21*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x41 = x4
      x42 = x41*x4
      x51 = x5
      x52 = x51*x5
c
c                  function
c
      y_r5p65_484816old_q1ent=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)        *x31        
     3  +coeff(  3)            *x41    
     4  +coeff(  4)    *x21            
     5  +coeff(  5)                *x51
     6  +coeff(  6)    *x22            
     7  +coeff(  7)    *x22    *x41    
     8  +coeff(  8)*x11*x21            
      y_r5p65_484816old_q1ent=y_r5p65_484816old_q1ent
     9  +coeff(  9)        *x31*x41    
     1  +coeff( 10)            *x42    
     2  +coeff( 11)    *x22*x31        
     3  +coeff( 12)*x11*x21    *x41    
     4  +coeff( 13)        *x32        
     5  +coeff( 14)    *x21    *x41    
     6  +coeff( 15)*x11                
     7  +coeff( 16)*x11*x21*x31        
     8  +coeff( 17)*x12                
      y_r5p65_484816old_q1ent=y_r5p65_484816old_q1ent
     9  +coeff( 18)    *x21*x31        
     1  +coeff( 19)                *x52
     2  +coeff( 20)    *x22*x31*x41    
     3  +coeff( 21)    *x22    *x42    
     4  +coeff( 22)*x11*x21    *x42    
     5  +coeff( 23)*x11*x21*x33*x41    
c
      return
      end
      function p_r5p65_484816old_q1ent(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 42)
      data ncoeff/ 41/
      data avdat/ -0.2792990E-03/
      data xmin/
     1 -0.14934E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.49980E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26999E-01, 0.49957E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     +  0.48035737E-02,-0.11519407E-02, 0.23412944E-02, 0.32374091E-01,
     +  0.58324924E-02,-0.89142360E-02, 0.25821342E-02,-0.37034743E-02,
     + -0.47618048E-02,-0.72261770E-04,-0.62449666E-03, 0.21460413E-02,
     + -0.21026204E-02,-0.21528576E-02,-0.25907854E-03, 0.40403559E-03,
     + -0.29273060E-03,-0.41991257E-03,-0.93344017E-03,-0.28684402E-02,
     + -0.19592005E-03,-0.25073768E-03,-0.12679239E-03, 0.36797192E-03,
     + -0.20727168E-02,-0.11141783E-02,-0.19296452E-03, 0.33989400E-03,
     + -0.10396808E-03,-0.28415921E-03, 0.32732665E-03, 0.32575501E-03,
     +  0.20052904E-03, 0.15151405E-02,-0.33218047E-03, 0.14455522E-03,
     +  0.12178762E-02,-0.17804663E-03,-0.77275134E-03,-0.35321692E-03,
     +  0.37222466E-03,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x12 = x11*x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x51 = x5
      x52 = x51*x5
c
c                  function
c
      p_r5p65_484816old_q1ent=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)    *x21            
     3  +coeff(  3)        *x31        
     4  +coeff(  4)            *x41    
     5  +coeff(  5)                *x51
     6  +coeff(  6)    *x22            
     7  +coeff(  7)            *x42    
     8  +coeff(  8)*x11*x21            
      p_r5p65_484816old_q1ent=p_r5p65_484816old_q1ent
     9  +coeff(  9)    *x22    *x41    
     1  +coeff( 10)        *x33*x41    
     2  +coeff( 11)    *x21    *x41    
     3  +coeff( 12)        *x31*x41    
     4  +coeff( 13)    *x22*x31        
     5  +coeff( 14)*x11*x21    *x41    
     6  +coeff( 15)*x11                
     7  +coeff( 16)        *x32        
     8  +coeff( 17)                *x52
      p_r5p65_484816old_q1ent=p_r5p65_484816old_q1ent
     9  +coeff( 18)*x12                
     1  +coeff( 19)*x11*x21*x31        
     2  +coeff( 20)    *x22    *x42    
     3  +coeff( 21)    *x24*x31*x41    
     4  +coeff( 22)    *x21*x31        
     5  +coeff( 23)            *x41*x51
     6  +coeff( 24)    *x22        *x51
     7  +coeff( 25)    *x22*x31*x41    
     8  +coeff( 26)*x11*x21    *x42    
      p_r5p65_484816old_q1ent=p_r5p65_484816old_q1ent
     9  +coeff( 27)*x11*x23*x31*x41    
     1  +coeff( 28)    *x23            
     2  +coeff( 29)*x11        *x41    
     3  +coeff( 30)    *x21    *x42    
     4  +coeff( 31)        *x31*x42    
     5  +coeff( 32)            *x43    
     6  +coeff( 33)*x11*x22            
     7  +coeff( 34)    *x24            
     8  +coeff( 35)    *x22*x32        
      p_r5p65_484816old_q1ent=p_r5p65_484816old_q1ent
     9  +coeff( 36)*x11*x21        *x51
     1  +coeff( 37)*x11*x23            
     2  +coeff( 38)*x12        *x41    
     3  +coeff( 39)*x11*x21*x31*x41    
     4  +coeff( 40)    *x23*x31*x41    
     5  +coeff( 41)*x12*x22            
c
      return
      end
      function sl_r5p65_484816old_q1ent(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 15)
      data ncoeff/ 14/
      data avdat/ -0.1918459E-03/
      data xmin/
     1 -0.14934E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.49980E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26999E-01, 0.49957E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     +  0.17302600E-03, 0.72702540E-04,-0.19957037E-02,-0.53232014E-02,
     + -0.12367337E-03,-0.21188152E-02,-0.69193207E-04,-0.94541005E-03,
     +  0.52605715E-03,-0.11943899E-03, 0.16074241E-03, 0.16635323E-03,
     +  0.46447181E-04, 0.12804638E-03,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x21 = x2
      x22 = x21*x2
      x31 = x3
      x41 = x4
      x42 = x41*x4
      x51 = x5
c
c                  function
c
      sl_r5p65_484816old_q1ent=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)    *x21            
     3  +coeff(  3)        *x31        
     4  +coeff(  4)            *x41    
     5  +coeff(  5)                *x51
     6  +coeff(  6)    *x22            
     7  +coeff(  7)        *x31*x41    
     8  +coeff(  8)            *x42    
      sl_r5p65_484816old_q1ent=sl_r5p65_484816old_q1ent
     9  +coeff(  9)    *x22    *x41    
     1  +coeff( 10)            *x41*x51
     2  +coeff( 11)*x11*x21            
     3  +coeff( 12)*x11*x21    *x41    
     4  +coeff( 13)    *x21    *x41    
     5  +coeff( 14)    *x22*x31        
c
      return
      end
      function x_r5p65_484816old_q1ext(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 91)
      data ncoeff/ 90/
      data avdat/ -0.1131662E-02/
      data xmin/
     1 -0.14934E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.49980E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26788E-01, 0.49957E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     + -0.98138035E-03, 0.12212209E+00,-0.16853372E-01, 0.47862451E-02,
     +  0.27169753E-02,-0.73083392E-02, 0.30854049E-02,-0.39440678E-02,
     + -0.12198811E-02, 0.50147655E-02,-0.17075310E-02, 0.44169044E-02,
     + -0.53624960E-03, 0.14345446E-02,-0.54690558E-02,-0.61751683E-02,
     +  0.62600453E-02, 0.63567288E-03, 0.50087897E-02,-0.12646966E-02,
     +  0.13144650E-02, 0.40488911E-03,-0.12603204E-02, 0.16715687E-02,
     +  0.83274947E-03,-0.31247266E-03, 0.53847808E-03, 0.43097796E-03,
     +  0.47432244E-03, 0.51728028E-04,-0.26434029E-02,-0.23723571E-02,
     +  0.50157093E-03,-0.11404880E-02, 0.17095005E-03,-0.14489250E-02,
     +  0.54212374E-04,-0.77311721E-04,-0.41530168E-03, 0.18691506E-03,
     + -0.11727637E-03,-0.12022895E-02, 0.22856740E-03,-0.27697365E-03,
     +  0.11799096E-03,-0.17914458E-03, 0.22466140E-03, 0.10646469E-02,
     +  0.10838578E-02, 0.10063626E-03, 0.44611112E-04,-0.37051496E-03,
     + -0.22911170E-03, 0.11455712E-03, 0.70907339E-03,-0.13043687E-02,
     + -0.17055622E-02, 0.38077607E-03,-0.60961227E-03,-0.14273830E-03,
     +  0.22651157E-02, 0.10712786E-03,-0.21467077E-03,-0.23389723E-04,
     + -0.48268601E-03,-0.12092830E-03,-0.16324756E-03, 0.21614351E-03,
     + -0.88553701E-04, 0.21216283E-03,-0.24736152E-03,-0.15697729E-03,
     +  0.11765713E-03, 0.18566425E-03,-0.86100023E-04,-0.96491953E-04,
     +  0.45216022E-03,-0.51328185E-03,-0.18513792E-03,-0.28981062E-03,
     + -0.25761293E-03, 0.43668956E-03,-0.15834143E-03,-0.22685618E-03,
     + -0.21498212E-03,-0.44770026E-04, 0.87003122E-04, 0.20813130E-03,
     +  0.24777878E-03, 0.56618537E-04,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x34 = x33*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x44 = x43*x4
      x51 = x5
      x52 = x51*x5
      x53 = x52*x5
      x54 = x53*x5
c
c                  function
c
      x_r5p65_484816old_q1ext=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)    *x21            
     3  +coeff(  3)    *x21    *x41    
     4  +coeff(  4)*x11                
     5  +coeff(  5)    *x23*x31        
     6  +coeff(  6)    *x21*x31        
     7  +coeff(  7)    *x21        *x51
     8  +coeff(  8)*x11        *x41    
      x_r5p65_484816old_q1ext=x_r5p65_484816old_q1ext
     9  +coeff(  9)            *x41    
     1  +coeff( 10)    *x23            
     2  +coeff( 11)*x11    *x31        
     3  +coeff( 12)*x11*x22            
     4  +coeff( 13)        *x31        
     5  +coeff( 14)    *x22            
     6  +coeff( 15)    *x21*x31*x41    
     7  +coeff( 16)    *x21    *x42    
     8  +coeff( 17)    *x23    *x41    
      x_r5p65_484816old_q1ext=x_r5p65_484816old_q1ext
     9  +coeff( 18)*x11*x21            
     1  +coeff( 19)*x11*x22    *x41    
     2  +coeff( 20)    *x21*x32        
     3  +coeff( 21)    *x22    *x41    
     4  +coeff( 22)*x11            *x51
     5  +coeff( 23)*x11        *x42    
     6  +coeff( 24)*x11*x22*x31        
     7  +coeff( 25)*x11*x22*x31*x41    
     8  +coeff( 26)            *x42    
      x_r5p65_484816old_q1ext=x_r5p65_484816old_q1ext
     9  +coeff( 27)    *x22*x31        
     1  +coeff( 28)    *x21    *x41*x51
     2  +coeff( 29)    *x22*x31*x41    
     3  +coeff( 30)        *x33*x41    
     4  +coeff( 31)    *x21*x31*x42    
     5  +coeff( 32)    *x21    *x43    
     6  +coeff( 33)*x11*x21    *x41    
     7  +coeff( 34)*x11    *x31*x41    
     8  +coeff( 35)    *x21*x34*x41    
      x_r5p65_484816old_q1ext=x_r5p65_484816old_q1ext
     9  +coeff( 36)*x11*x24            
     1  +coeff( 37)                *x51
     2  +coeff( 38)        *x32        
     3  +coeff( 39)        *x31*x41    
     4  +coeff( 40)    *x21*x31    *x51
     5  +coeff( 41)    *x21        *x52
     6  +coeff( 42)    *x21*x32*x41    
     7  +coeff( 43)*x11*x21*x31        
     8  +coeff( 44)*x11    *x32        
      x_r5p65_484816old_q1ext=x_r5p65_484816old_q1ext
     9  +coeff( 45)*x11        *x41*x51
     1  +coeff( 46)            *x43    
     2  +coeff( 47)    *x22    *x42    
     3  +coeff( 48)    *x23*x31*x41    
     4  +coeff( 49)    *x23    *x42    
     5  +coeff( 50)        *x33*x42    
     6  +coeff( 51)    *x22*x32*x42    
     7  +coeff( 52)*x11    *x31*x42    
     8  +coeff( 53)*x11        *x43    
      x_r5p65_484816old_q1ext=x_r5p65_484816old_q1ext
     9  +coeff( 54)*x11*x21*x31    *x51
     1  +coeff( 55)*x11*x22    *x42    
     2  +coeff( 56)*x11*x24    *x41    
     3  +coeff( 57)*x11*x22*x32*x41    
     4  +coeff( 58)*x11*x21    *x42*x52
     5  +coeff( 59)*x11*x22*x31*x41*x52
     6  +coeff( 60)*x11    *x34    *x53
     7  +coeff( 61)*x11*x24*x34*x41    
     8  +coeff( 62)            *x41*x51
      x_r5p65_484816old_q1ext=x_r5p65_484816old_q1ext
     9  +coeff( 63)        *x31*x42    
     1  +coeff( 64)                *x53
     2  +coeff( 65)    *x24            
     3  +coeff( 66)    *x21*x33        
     4  +coeff( 67)            *x44    
     5  +coeff( 68)    *x22*x31    *x51
     6  +coeff( 69)            *x41*x53
     7  +coeff( 70)    *x23*x32        
     8  +coeff( 71)    *x21    *x44    
      x_r5p65_484816old_q1ext=x_r5p65_484816old_q1ext
     9  +coeff( 72)    *x22*x32    *x51
     1  +coeff( 73)            *x44*x51
     2  +coeff( 74)    *x21*x32    *x52
     3  +coeff( 75)            *x42*x53
     4  +coeff( 76)    *x21        *x54
     5  +coeff( 77)    *x23    *x43    
     6  +coeff( 78)    *x22*x31*x43    
     7  +coeff( 79)    *x24*x31    *x51
     8  +coeff( 80)    *x22*x32*x41*x51
      x_r5p65_484816old_q1ext=x_r5p65_484816old_q1ext
     9  +coeff( 81)    *x22*x31*x42*x51
     1  +coeff( 82)    *x24        *x52
     2  +coeff( 83)    *x22    *x42*x52
     3  +coeff( 84)    *x22        *x54
     4  +coeff( 85)*x11*x23            
     5  +coeff( 86)*x11*x21*x32        
     6  +coeff( 87)*x11*x21*x31*x41    
     7  +coeff( 88)    *x24*x32    *x51
     8  +coeff( 89)    *x22*x33*x41*x51
      x_r5p65_484816old_q1ext=x_r5p65_484816old_q1ext
     9  +coeff( 90)*x11        *x42*x51
c
      return
      end
      function t_r5p65_484816old_q1ext(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 91)
      data ncoeff/ 90/
      data avdat/ -0.3063961E-03/
      data xmin/
     1 -0.14934E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.49980E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26788E-01, 0.49957E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     +  0.69136545E-05,-0.61919284E-02,-0.61837747E-02,-0.17173579E-02,
     + -0.41862451E-02, 0.22822730E-02, 0.10821046E-02,-0.83993399E-03,
     + -0.12902131E-02, 0.22600168E-03, 0.80368848E-03,-0.26821261E-03,
     +  0.28158945E-03,-0.35737563E-03,-0.10890791E-02, 0.18304954E-02,
     +  0.10493285E-02,-0.11422441E-03, 0.12958181E-03, 0.34216579E-03,
     +  0.68153208E-03,-0.28273871E-03, 0.17343237E-03, 0.41691726E-03,
     +  0.12835468E-04, 0.12800882E-03,-0.24351057E-03,-0.64181091E-04,
     + -0.10886526E-03, 0.12242797E-03,-0.23973940E-03,-0.64384955E-03,
     +  0.20890307E-03, 0.22563820E-03,-0.18463883E-04,-0.67187204E-04,
     + -0.75729273E-04,-0.32640244E-04, 0.51183826E-04,-0.48274174E-04,
     + -0.22598387E-03,-0.66425750E-03, 0.79416408E-04,-0.13360501E-04,
     +  0.12910939E-04, 0.10015267E-03,-0.26287511E-04,-0.31584484E-03,
     + -0.82713566E-04,-0.40102258E-03, 0.46265963E-04,-0.13499081E-03,
     + -0.16045239E-03, 0.12585260E-04, 0.47288326E-04, 0.88080733E-05,
     +  0.15329588E-04,-0.30350784E-04, 0.74034135E-04,-0.70609617E-05,
     + -0.88060860E-05, 0.11072604E-04,-0.42309810E-04,-0.85086875E-04,
     + -0.27742225E-03,-0.73641255E-04, 0.57215333E-04, 0.40977335E-03,
     +  0.15160788E-03,-0.92726577E-06,-0.28656277E-04,-0.27573196E-04,
     + -0.53235439E-04, 0.44190059E-04, 0.46682230E-05,-0.18545763E-04,
     +  0.19692337E-04,-0.42595522E-04, 0.38738881E-05, 0.26810476E-04,
     + -0.84512913E-05,-0.27302352E-04, 0.18533405E-04,-0.13145755E-04,
     + -0.87711378E-05, 0.16454256E-04,-0.41915158E-04, 0.28550330E-04,
     + -0.18806368E-04,-0.33773969E-04,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x12 = x11*x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x34 = x33*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x44 = x43*x4
      x51 = x5
      x52 = x51*x5
c
c                  function
c
      t_r5p65_484816old_q1ext=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)    *x21            
     3  +coeff(  3)*x11                
     4  +coeff(  4)    *x21*x31        
     5  +coeff(  5)    *x21    *x41    
     6  +coeff(  6)    *x21        *x51
     7  +coeff(  7)    *x23            
     8  +coeff(  8)*x11        *x41    
      t_r5p65_484816old_q1ext=t_r5p65_484816old_q1ext
     9  +coeff(  9)    *x21    *x42    
     1  +coeff( 10)*x11            *x51
     2  +coeff( 11)*x11*x22            
     3  +coeff( 12)            *x41    
     4  +coeff( 13)    *x22            
     5  +coeff( 14)*x11    *x31        
     6  +coeff( 15)    *x21*x31*x41    
     7  +coeff( 16)    *x23    *x41    
     8  +coeff( 17)*x11*x22    *x41    
      t_r5p65_484816old_q1ext=t_r5p65_484816old_q1ext
     9  +coeff( 18)        *x31        
     1  +coeff( 19)*x11*x21            
     2  +coeff( 20)    *x22    *x41    
     3  +coeff( 21)    *x23*x31        
     4  +coeff( 22)*x11        *x42    
     5  +coeff( 23)*x12*x21            
     6  +coeff( 24)*x11*x22*x31        
     7  +coeff( 25)    *x21*x32    *x52
     8  +coeff( 26)    *x22*x31        
      t_r5p65_484816old_q1ext=t_r5p65_484816old_q1ext
     9  +coeff( 27)    *x21*x32        
     1  +coeff( 28)    *x21    *x41*x51
     2  +coeff( 29)    *x21        *x52
     3  +coeff( 30)*x11*x21    *x41    
     4  +coeff( 31)*x11    *x31*x41    
     5  +coeff( 32)    *x21    *x43    
     6  +coeff( 33)*x12*x21    *x41    
     7  +coeff( 34)    *x23*x31*x42    
     8  +coeff( 35)                *x51
      t_r5p65_484816old_q1ext=t_r5p65_484816old_q1ext
     9  +coeff( 36)        *x31*x41    
     1  +coeff( 37)            *x42    
     2  +coeff( 38)    *x21*x31    *x51
     3  +coeff( 39)*x11*x21*x31        
     4  +coeff( 40)*x11    *x32        
     5  +coeff( 41)    *x21*x32*x41    
     6  +coeff( 42)    *x21*x31*x42    
     7  +coeff( 43)*x12*x21*x31        
     8  +coeff( 44)        *x32        
      t_r5p65_484816old_q1ext=t_r5p65_484816old_q1ext
     9  +coeff( 45)*x12                
     1  +coeff( 46)    *x23        *x51
     2  +coeff( 47)*x11        *x41*x51
     3  +coeff( 48)    *x23    *x42    
     4  +coeff( 49)*x11        *x43    
     5  +coeff( 50)    *x21    *x44    
     6  +coeff( 51)*x11*x22        *x51
     7  +coeff( 52)    *x23    *x41*x51
     8  +coeff( 53)    *x21    *x43*x51
      t_r5p65_484816old_q1ext=t_r5p65_484816old_q1ext
     9  +coeff( 54)*x11    *x31*x43    
     1  +coeff( 55)    *x23*x31*x43    
     2  +coeff( 56)*x11    *x31*x44    
     3  +coeff( 57)    *x22        *x51
     4  +coeff( 58)    *x21*x33        
     5  +coeff( 59)    *x22    *x42    
     6  +coeff( 60)*x11    *x31    *x51
     7  +coeff( 61)*x11            *x52
     8  +coeff( 62)*x12        *x41    
      t_r5p65_484816old_q1ext=t_r5p65_484816old_q1ext
     9  +coeff( 63)*x11    *x32*x41    
     1  +coeff( 64)*x11    *x31*x42    
     2  +coeff( 65)    *x21*x31*x43    
     3  +coeff( 66)    *x21*x31*x42*x51
     4  +coeff( 67)*x11*x22*x31*x41    
     5  +coeff( 68)    *x23    *x43    
     6  +coeff( 69)*x11*x22    *x43    
     7  +coeff( 70)        *x31    *x51
     8  +coeff( 71)        *x31*x42    
      t_r5p65_484816old_q1ext=t_r5p65_484816old_q1ext
     9  +coeff( 72)            *x43    
     1  +coeff( 73)    *x24            
     2  +coeff( 74)    *x22*x31*x41    
     3  +coeff( 75)*x11*x21        *x51
     4  +coeff( 76)    *x21*x31*x41*x51
     5  +coeff( 77)    *x21    *x41*x52
     6  +coeff( 78)*x11*x23            
     7  +coeff( 79)*x12    *x31        
     8  +coeff( 80)    *x23*x32        
      t_r5p65_484816old_q1ext=t_r5p65_484816old_q1ext
     9  +coeff( 81)*x11    *x33        
     1  +coeff( 82)    *x24    *x41    
     2  +coeff( 83)*x11*x21*x31*x41    
     3  +coeff( 84)    *x22*x32*x41    
     4  +coeff( 85)        *x34*x41    
     5  +coeff( 86)*x11*x21    *x42    
     6  +coeff( 87)    *x21*x32*x42    
     7  +coeff( 88)    *x22    *x43    
     8  +coeff( 89)    *x21    *x42*x52
      t_r5p65_484816old_q1ext=t_r5p65_484816old_q1ext
     9  +coeff( 90)*x11*x24            
c
      return
      end
      function y_r5p65_484816old_q1ext(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 53)
      data ncoeff/ 52/
      data avdat/ -0.4623001E-02/
      data xmin/
     1 -0.14934E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.49980E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26788E-01, 0.49957E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     +  0.14073502E-01, 0.30492038E-01, 0.15715592E+00,-0.36961157E-02,
     +  0.17343823E-01, 0.83231144E-02,-0.27173037E-01,-0.15701378E-01,
     + -0.11489773E-01, 0.13659808E-04,-0.71861576E-02, 0.15100568E-02,
     +  0.70376587E-02,-0.21359427E-02,-0.23043887E-02,-0.87394001E-03,
     + -0.70156301E-02,-0.32747639E-02, 0.27560767E-04,-0.96784293E-03,
     + -0.63318945E-03,-0.91391001E-02,-0.42280382E-04,-0.10674258E-02,
     + -0.92942623E-03,-0.43997905E-03, 0.11808577E-02, 0.13979551E-02,
     + -0.73068761E-02,-0.13976526E-02, 0.45439084E-02,-0.36100245E-02,
     + -0.75814553E-03, 0.38768903E-02,-0.89905625E-05, 0.17787199E-03,
     +  0.15633628E-02, 0.13905659E-02,-0.77876431E-03,-0.20086266E-03,
     + -0.14792313E-02, 0.77453459E-03,-0.13704539E-04, 0.59000764E-03,
     + -0.61693776E-03,-0.29675849E-02,-0.34989291E-03, 0.12644364E-02,
     +  0.60470111E-03,-0.17468705E-03, 0.14315394E-03, 0.19561693E-03,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x12 = x11*x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x34 = x33*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x51 = x5
      x52 = x51*x5
c
c                  function
c
      y_r5p65_484816old_q1ext=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)        *x31        
     3  +coeff(  3)            *x41    
     4  +coeff(  4)    *x21            
     5  +coeff(  5)                *x51
     6  +coeff(  6)            *x42    
     7  +coeff(  7)    *x22            
     8  +coeff(  8)    *x22    *x41    
      y_r5p65_484816old_q1ext=y_r5p65_484816old_q1ext
     9  +coeff(  9)*x11*x21            
     1  +coeff( 10)        *x33*x41    
     2  +coeff( 11)*x11*x21    *x41    
     3  +coeff( 12)        *x32        
     4  +coeff( 13)        *x31*x41    
     5  +coeff( 14)    *x21    *x41    
     6  +coeff( 15)            *x41*x51
     7  +coeff( 16)*x11                
     8  +coeff( 17)    *x22*x31        
      y_r5p65_484816old_q1ext=y_r5p65_484816old_q1ext
     9  +coeff( 18)*x11*x21*x31        
     1  +coeff( 19)*x12            *x52
     2  +coeff( 20)    *x21*x31        
     3  +coeff( 21)        *x31    *x51
     4  +coeff( 22)    *x22    *x42    
     5  +coeff( 23)    *x22*x33*x41    
     6  +coeff( 24)                *x52
     7  +coeff( 25)    *x21    *x42    
     8  +coeff( 26)*x11        *x41    
      y_r5p65_484816old_q1ext=y_r5p65_484816old_q1ext
     9  +coeff( 27)    *x23            
     1  +coeff( 28)    *x22        *x51
     2  +coeff( 29)    *x22*x31*x41    
     3  +coeff( 30)*x12                
     4  +coeff( 31)    *x24            
     5  +coeff( 32)*x11*x21    *x42    
     6  +coeff( 33)*x12        *x41    
     7  +coeff( 34)*x11*x23            
     8  +coeff( 35)*x11*x21*x33*x41    
      y_r5p65_484816old_q1ext=y_r5p65_484816old_q1ext
     9  +coeff( 36)    *x21        *x51
     1  +coeff( 37)        *x31*x42    
     2  +coeff( 38)            *x43    
     3  +coeff( 39)    *x21*x31*x41    
     4  +coeff( 40)*x11    *x31        
     5  +coeff( 41)    *x22*x32        
     6  +coeff( 42)*x11*x22            
     7  +coeff( 43)        *x34*x41    
     8  +coeff( 44)*x11*x21        *x51
      y_r5p65_484816old_q1ext=y_r5p65_484816old_q1ext
     9  +coeff( 45)*x11*x21*x32        
     1  +coeff( 46)*x11*x21*x31*x41    
     2  +coeff( 47)*x12    *x31        
     3  +coeff( 48)*x12*x22            
     4  +coeff( 49)        *x32*x41    
     5  +coeff( 50)    *x21*x32        
     6  +coeff( 51)            *x41*x52
     7  +coeff( 52)*x12*x21            
c
      return
      end
      function p_r5p65_484816old_q1ext(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 77)
      data ncoeff/ 76/
      data avdat/ -0.5220283E-03/
      data xmin/
     1 -0.14934E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.49980E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26788E-01, 0.49957E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     +  0.62219626E-02,-0.18337782E-02, 0.10167876E-01, 0.66475108E-01,
     +  0.88961208E-02,-0.13788937E-01,-0.21006351E-02,-0.57523311E-02,
     +  0.42643058E-02,-0.82119489E-02,-0.38250347E-02,-0.37023963E-02,
     + -0.60058290E-04,-0.42133412E-03, 0.75679849E-03,-0.11737406E-02,
     +  0.36027301E-02,-0.62538800E-03,-0.34611982E-02,-0.65637357E-03,
     + -0.16160908E-02,-0.47131167E-02,-0.48015488E-03,-0.54533174E-03,
     +  0.80552744E-03, 0.58463373E-03,-0.26276402E-03, 0.39514538E-03,
     +  0.23419864E-02, 0.35122095E-03, 0.19469893E-02,-0.44116998E-03,
     + -0.15063834E-02,-0.18925000E-02, 0.11095819E-03,-0.11188249E-03,
     + -0.53024269E-03, 0.68181619E-03, 0.69174316E-03, 0.11037750E-03,
     + -0.71617082E-03,-0.13230596E-03,-0.96758515E-04, 0.90847621E-04,
     + -0.18780929E-03,-0.28338601E-03, 0.25758936E-04,-0.32796732E-04,
     +  0.60358545E-03,-0.44211262E-03,-0.15205634E-03,-0.17022244E-03,
     +  0.25573894E-03, 0.30654843E-03, 0.67991685E-04, 0.13964916E-03,
     + -0.19213103E-03,-0.11926719E-03, 0.25855837E-03, 0.24752855E-04,
     +  0.53330830E-04, 0.33030337E-04,-0.76605240E-04,-0.97781260E-04,
     +  0.96725409E-04, 0.16588690E-03, 0.61564293E-03,-0.32850145E-03,
     +  0.46304918E-04,-0.33503769E-04, 0.48537444E-04, 0.61430328E-04,
     +  0.72794105E-03,-0.13304736E-03, 0.24586072E-03,-0.33010644E-03,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x12 = x11*x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x34 = x33*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x51 = x5
      x52 = x51*x5
      x53 = x52*x5
c
c                  function
c
      p_r5p65_484816old_q1ext=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)    *x21            
     3  +coeff(  3)        *x31        
     4  +coeff(  4)            *x41    
     5  +coeff(  5)                *x51
     6  +coeff(  6)    *x22            
     7  +coeff(  7)            *x41*x51
     8  +coeff(  8)*x11*x21            
      p_r5p65_484816old_q1ext=p_r5p65_484816old_q1ext
     9  +coeff(  9)            *x42    
     1  +coeff( 10)    *x22    *x41    
     2  +coeff( 11)*x11*x21    *x41    
     3  +coeff( 12)    *x22*x31*x41    
     4  +coeff( 13)        *x33*x41    
     5  +coeff( 14)*x11                
     6  +coeff( 15)        *x32        
     7  +coeff( 16)    *x21    *x41    
     8  +coeff( 17)        *x31*x41    
      p_r5p65_484816old_q1ext=p_r5p65_484816old_q1ext
     9  +coeff( 18)                *x52
     1  +coeff( 19)    *x22*x31        
     2  +coeff( 20)*x12                
     3  +coeff( 21)*x11*x21*x31        
     4  +coeff( 22)    *x22    *x42    
     5  +coeff( 23)    *x21*x31        
     6  +coeff( 24)        *x31    *x51
     7  +coeff( 25)    *x22        *x51
     8  +coeff( 26)    *x23            
      p_r5p65_484816old_q1ext=p_r5p65_484816old_q1ext
     9  +coeff( 27)*x11        *x41    
     1  +coeff( 28)*x11*x22            
     2  +coeff( 29)    *x24            
     3  +coeff( 30)*x11*x21        *x51
     4  +coeff( 31)*x11*x23            
     5  +coeff( 32)*x12        *x41    
     6  +coeff( 33)*x11*x21*x31*x41    
     7  +coeff( 34)*x11*x21    *x42    
     8  +coeff( 35)    *x21        *x51
      p_r5p65_484816old_q1ext=p_r5p65_484816old_q1ext
     9  +coeff( 36)*x11    *x31        
     1  +coeff( 37)    *x21    *x42    
     2  +coeff( 38)        *x31*x42    
     3  +coeff( 39)            *x43    
     4  +coeff( 40)            *x41*x52
     5  +coeff( 41)    *x22*x32        
     6  +coeff( 42)        *x32*x42    
     7  +coeff( 43)        *x31*x43    
     8  +coeff( 44)*x12*x21            
      p_r5p65_484816old_q1ext=p_r5p65_484816old_q1ext
     9  +coeff( 45)*x12    *x31        
     1  +coeff( 46)*x11*x21*x32        
     2  +coeff( 47)    *x23*x31*x41    
     3  +coeff( 48)        *x34*x41    
     4  +coeff( 49)*x12*x22            
     5  +coeff( 50)    *x21*x31*x41    
     6  +coeff( 51)        *x31*x41*x51
     7  +coeff( 52)            *x42*x51
     8  +coeff( 53)    *x23    *x41    
      p_r5p65_484816old_q1ext=p_r5p65_484816old_q1ext
     9  +coeff( 54)    *x22    *x41*x51
     1  +coeff( 55)    *x23*x32        
     2  +coeff( 56)*x11*x21    *x41*x51
     3  +coeff( 57)*x12        *x42    
     4  +coeff( 58)    *x21*x32        
     5  +coeff( 59)        *x32*x41    
     6  +coeff( 60)*x11            *x51
     7  +coeff( 61)    *x21    *x41*x51
     8  +coeff( 62)        *x31    *x52
      p_r5p65_484816old_q1ext=p_r5p65_484816old_q1ext
     9  +coeff( 63)*x11    *x31*x41    
     1  +coeff( 64)*x11        *x42    
     2  +coeff( 65)    *x22*x31    *x51
     3  +coeff( 66)*x11*x22    *x41    
     4  +coeff( 67)    *x24    *x41    
     5  +coeff( 68)    *x22    *x43    
     6  +coeff( 69)*x12            *x51
     7  +coeff( 70)        *x34    *x51
     8  +coeff( 71)    *x21*x31    *x53
      p_r5p65_484816old_q1ext=p_r5p65_484816old_q1ext
     9  +coeff( 72)*x12*x21    *x41    
     1  +coeff( 73)*x11*x23    *x41    
     2  +coeff( 74)*x12    *x31*x41    
     3  +coeff( 75)*x12*x22    *x41    
     4  +coeff( 76)    *x24*x31*x42    
c
      return
      end
      function sl_r5p65_484816old_q1ext(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 28)
      data ncoeff/ 27/
      data avdat/ -0.1018994E-02/
      data xmin/
     1 -0.14934E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.49980E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26788E-01, 0.49957E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     +  0.10217534E-02,-0.20937808E-02,-0.57815230E-02,-0.19048878E-03,
     + -0.25395206E-02,-0.76398026E-03,-0.35754608E-02,-0.82899473E-03,
     +  0.20247481E-03,-0.71598872E-04, 0.18243938E-02, 0.59574563E-03,
     +  0.17315608E-03,-0.10219808E-03, 0.41591894E-03, 0.13428608E-03,
     + -0.61749735E-04,-0.27659195E-03, 0.14757759E-03, 0.85270716E-04,
     +  0.65881039E-04, 0.81746775E-03, 0.91401984E-04, 0.24116485E-03,
     + -0.23837740E-03, 0.19006913E-03, 0.57981320E-03,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x44 = x43*x4
      x51 = x5
      x52 = x51*x5
c
c                  function
c
      sl_r5p65_484816old_q1ext=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)        *x31        
     3  +coeff(  3)            *x41    
     4  +coeff(  4)                *x51
     5  +coeff(  5)    *x22            
     6  +coeff(  6)        *x31*x41    
     7  +coeff(  7)            *x42    
     8  +coeff(  8)            *x41*x51
      sl_r5p65_484816old_q1ext=sl_r5p65_484816old_q1ext
     9  +coeff(  9)*x11*x21            
     1  +coeff( 10)    *x23            
     2  +coeff( 11)    *x22    *x41    
     3  +coeff( 12)*x11*x21    *x41    
     4  +coeff( 13)    *x21    *x41    
     5  +coeff( 14)        *x31    *x51
     6  +coeff( 15)    *x22*x31        
     7  +coeff( 16)    *x21            
     8  +coeff( 17)                *x52
      sl_r5p65_484816old_q1ext=sl_r5p65_484816old_q1ext
     9  +coeff( 18)            *x43    
     1  +coeff( 19)    *x22        *x51
     2  +coeff( 20)            *x42*x51
     3  +coeff( 21)            *x41*x52
     4  +coeff( 22)    *x22    *x42    
     5  +coeff( 23)*x11*x21        *x51
     6  +coeff( 24)*x11*x21    *x42    
     7  +coeff( 25)        *x31*x44    
     8  +coeff( 26)*x11*x23*x31        
      sl_r5p65_484816old_q1ext=sl_r5p65_484816old_q1ext
     9  +coeff( 27)    *x24*x31*x41    
c
      return
      end
      function x_r5p65_484816old_q2ext(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 91)
      data ncoeff/ 90/
      data avdat/ -0.3005324E-02/
      data xmin/
     1 -0.14934E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.49980E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26788E-01, 0.49957E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     + -0.15749719E-02, 0.17815971E+00,-0.43569215E-01, 0.95646884E-02,
     +  0.12259752E-01,-0.15147617E-01, 0.72047552E-02,-0.97729014E-02,
     + -0.29999095E-02,-0.18497787E-01,-0.41744229E-02, 0.10333517E-01,
     + -0.13355875E-02, 0.34365791E-02,-0.15544139E-01, 0.18118074E-01,
     +  0.17781740E-02, 0.16980655E-02, 0.12103981E-01, 0.34596131E-02,
     + -0.13499618E-01, 0.15034379E-02, 0.27090477E-03,-0.35217782E-02,
     +  0.42628520E-02, 0.28296438E-03, 0.13534121E-02,-0.30073046E-02,
     + -0.79035206E-03,-0.51808273E-02, 0.13412213E-02,-0.30745545E-02,
     + -0.33391378E-03,-0.31231360E-02,-0.88477886E-03,-0.85185113E-03,
     +  0.12532935E-02,-0.24286702E-02,-0.58972146E-02, 0.60165115E-03,
     +  0.49198483E-03,-0.71870367E-03, 0.13499268E-03,-0.18852750E-03,
     +  0.17033433E-03,-0.15838502E-02,-0.97410375E-03, 0.15103092E-02,
     +  0.32914808E-03, 0.34691469E-03, 0.93198579E-03, 0.65965141E-04,
     + -0.29272845E-03, 0.86881497E-04,-0.10435514E-03,-0.82209398E-03,
     + -0.24460809E-03, 0.27559881E-03, 0.16348013E-03, 0.48071292E-03,
     +  0.13731589E-03,-0.25382606E-03,-0.67116035E-03, 0.36301347E-03,
     +  0.93544961E-03,-0.24174256E-03,-0.24795681E-03, 0.29356527E-03,
     +  0.53247908E-03,-0.47877259E-03,-0.40733567E-03,-0.20693488E-03,
     + -0.34588156E-03, 0.23347414E-02, 0.26107375E-02, 0.66145306E-03,
     +  0.50571834E-03, 0.66626805E-03,-0.20385750E-03, 0.23306150E-03,
     + -0.18360579E-02,-0.95956860E-03, 0.55046409E-03, 0.15862174E-02,
     +  0.17431192E-02, 0.46878154E-03, 0.63850865E-03,-0.16974120E-02,
     + -0.17041941E-02, 0.85709448E-03,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x34 = x33*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x44 = x43*x4
      x51 = x5
      x52 = x51*x5
      x53 = x52*x5
c
c                  function
c
      x_r5p65_484816old_q2ext=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)    *x21            
     3  +coeff(  3)    *x21    *x41    
     4  +coeff(  4)    *x21        *x51
     5  +coeff(  5)    *x23            
     6  +coeff(  6)*x11                
     7  +coeff(  7)    *x23*x31        
     8  +coeff(  8)*x11        *x41    
      x_r5p65_484816old_q2ext=x_r5p65_484816old_q2ext
     9  +coeff(  9)            *x41    
     1  +coeff( 10)    *x21*x31        
     2  +coeff( 11)*x11    *x31        
     3  +coeff( 12)*x11*x22            
     4  +coeff( 13)        *x31        
     5  +coeff( 14)    *x22            
     6  +coeff( 15)    *x21    *x42    
     7  +coeff( 16)    *x23    *x41    
     8  +coeff( 17)    *x23*x31*x41    
      x_r5p65_484816old_q2ext=x_r5p65_484816old_q2ext
     9  +coeff( 18)*x11            *x51
     1  +coeff( 19)*x11*x22    *x41    
     2  +coeff( 20)    *x22    *x41    
     3  +coeff( 21)    *x21*x31*x41    
     4  +coeff( 22)*x11*x21            
     5  +coeff( 23)    *x23*x32        
     6  +coeff( 24)*x11        *x42    
     7  +coeff( 25)*x11*x22*x31        
     8  +coeff( 26)*x11    *x33*x41    
      x_r5p65_484816old_q2ext=x_r5p65_484816old_q2ext
     9  +coeff( 27)    *x22*x31        
     1  +coeff( 28)    *x21*x32        
     2  +coeff( 29)    *x21        *x52
     3  +coeff( 30)    *x21    *x43    
     4  +coeff( 31)*x11*x21    *x41    
     5  +coeff( 32)*x11    *x31*x41    
     6  +coeff( 33)    *x23*x31*x42    
     7  +coeff( 34)*x11*x24            
     8  +coeff( 35)        *x31*x41    
      x_r5p65_484816old_q2ext=x_r5p65_484816old_q2ext
     9  +coeff( 36)            *x42    
     1  +coeff( 37)    *x21    *x41*x51
     2  +coeff( 38)    *x21*x32*x41    
     3  +coeff( 39)    *x21*x31*x42    
     4  +coeff( 40)    *x21*x31    *x53
     5  +coeff( 41)*x11*x21*x31        
     6  +coeff( 42)*x11    *x32        
     7  +coeff( 43)                *x51
     8  +coeff( 44)        *x32        
      x_r5p65_484816old_q2ext=x_r5p65_484816old_q2ext
     9  +coeff( 45)            *x41*x51
     1  +coeff( 46)    *x21    *x44    
     2  +coeff( 47)    *x23    *x41*x51
     3  +coeff( 48)    *x22*x32*x42    
     4  +coeff( 49)*x11        *x41*x51
     5  +coeff( 50)*x11*x21*x31    *x51
     6  +coeff( 51)*x11    *x31*x43    
     7  +coeff( 52)        *x31    *x51
     8  +coeff( 53)            *x43    
      x_r5p65_484816old_q2ext=x_r5p65_484816old_q2ext
     9  +coeff( 54)            *x42*x51
     1  +coeff( 55)                *x53
     2  +coeff( 56)    *x24            
     3  +coeff( 57)    *x21*x33        
     4  +coeff( 58)    *x22*x31*x41    
     5  +coeff( 59)        *x31*x43    
     6  +coeff( 60)    *x21    *x42*x51
     7  +coeff( 61)    *x22*x31*x42    
     8  +coeff( 62)        *x31*x44    
      x_r5p65_484816old_q2ext=x_r5p65_484816old_q2ext
     9  +coeff( 63)    *x21    *x43*x51
     1  +coeff( 64)    *x21*x32    *x52
     2  +coeff( 65)    *x22*x33*x41    
     3  +coeff( 66)    *x23*x31*x41*x51
     4  +coeff( 67)    *x22*x32*x41*x51
     5  +coeff( 68)    *x23        *x53
     6  +coeff( 69)    *x21*x31*x41*x53
     7  +coeff( 70)*x11*x23            
     8  +coeff( 71)*x11    *x31*x42    
      x_r5p65_484816old_q2ext=x_r5p65_484816old_q2ext
     9  +coeff( 72)*x11        *x43    
     1  +coeff( 73)*x11    *x32    *x51
     2  +coeff( 74)*x11*x22*x31*x41    
     3  +coeff( 75)*x11*x22    *x42    
     4  +coeff( 76)*x11    *x32*x42    
     5  +coeff( 77)*x11        *x44    
     6  +coeff( 78)*x11*x21*x31*x41*x51
     7  +coeff( 79)*x11    *x32*x41*x51
     8  +coeff( 80)*x11*x21    *x42*x51
      x_r5p65_484816old_q2ext=x_r5p65_484816old_q2ext
     9  +coeff( 81)*x11*x24    *x41    
     1  +coeff( 82)*x11*x22*x32*x41    
     2  +coeff( 83)*x11*x21*x33*x41    
     3  +coeff( 84)    *x23*x34*x42    
     4  +coeff( 85)    *x24*x33*x41*x51
     5  +coeff( 86)*x11    *x32*x42*x51
     6  +coeff( 87)*x11*x21    *x42*x52
     7  +coeff( 88)*x11*x22*x33*x41    
     8  +coeff( 89)*x11*x24    *x42    
      x_r5p65_484816old_q2ext=x_r5p65_484816old_q2ext
     9  +coeff( 90)*x11*x23*x31*x42    
c
      return
      end
      function t_r5p65_484816old_q2ext(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 88)
      data ncoeff/ 87/
      data avdat/ -0.1017037E-02/
      data xmin/
     1 -0.14934E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.49980E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26788E-01, 0.49957E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     + -0.44201358E-03, 0.45267649E-01,-0.79271635E-02,-0.14772232E-01,
     +  0.22407603E-02,-0.30973679E-02, 0.23407619E-02,-0.99761609E-03,
     + -0.62031103E-02, 0.41658008E-02,-0.13659628E-02,-0.54068589E-02,
     +  0.65347669E-03, 0.30618247E-02, 0.63968450E-03,-0.43097523E-03,
     +  0.10787037E-02, 0.50309487E-03, 0.11865168E-02,-0.44385367E-02,
     +  0.61597805E-02, 0.36157977E-02,-0.99029951E-03,-0.10797669E-02,
     +  0.75941673E-03, 0.14590963E-02, 0.55965531E-03,-0.28677264E-03,
     +  0.45045986E-03, 0.62597985E-03,-0.25370732E-03, 0.42975019E-03,
     + -0.94660645E-03, 0.14872935E-03,-0.64157821E-05,-0.20754249E-02,
     +  0.72584872E-03, 0.89559209E-03, 0.45501605E-04,-0.55543263E-04,
     + -0.26411255E-03, 0.22617642E-03, 0.48280104E-04, 0.17492018E-03,
     + -0.21139157E-03,-0.81281498E-03,-0.23209669E-02, 0.13044477E-03,
     +  0.29403041E-03, 0.45099878E-04,-0.10152555E-03, 0.20947660E-03,
     +  0.33855197E-03,-0.50851977E-04,-0.37011958E-03,-0.34084744E-03,
     + -0.99276472E-03,-0.66602771E-03,-0.36587135E-03, 0.51969913E-03,
     + -0.16588576E-04, 0.35111032E-04, 0.82243285E-04, 0.19514569E-04,
     +  0.16239044E-04,-0.10331853E-03,-0.89994232E-04,-0.20282182E-03,
     +  0.59711427E-04, 0.20098504E-03,-0.15340443E-03, 0.23332806E-03,
     +  0.31938300E-04,-0.12155054E-03,-0.22751350E-03,-0.45061093E-04,
     +  0.71112838E-04,-0.57744281E-03,-0.61421946E-04,-0.23740843E-03,
     +  0.11876510E-03, 0.11722229E-02,-0.16761634E-03,-0.19567655E-03,
     +  0.49679691E-03,-0.35823171E-03, 0.45370287E-03,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x12 = x11*x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x34 = x33*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x44 = x43*x4
      x51 = x5
      x52 = x51*x5
c
c                  function
c
      t_r5p65_484816old_q2ext=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)    *x21            
     3  +coeff(  3)*x11                
     4  +coeff(  4)    *x21    *x41    
     5  +coeff(  5)    *x21        *x51
     6  +coeff(  6)*x11        *x41    
     7  +coeff(  7)    *x23*x31        
     8  +coeff(  8)            *x41    
      t_r5p65_484816old_q2ext=t_r5p65_484816old_q2ext
     9  +coeff(  9)    *x21*x31        
     1  +coeff( 10)    *x23            
     2  +coeff( 11)*x11    *x31        
     3  +coeff( 12)    *x21    *x42    
     4  +coeff( 13)*x11            *x51
     5  +coeff( 14)*x11*x22            
     6  +coeff( 15)    *x23*x31*x41    
     7  +coeff( 16)        *x31        
     8  +coeff( 17)    *x22            
      t_r5p65_484816old_q2ext=t_r5p65_484816old_q2ext
     9  +coeff( 18)*x11*x21            
     1  +coeff( 19)    *x22    *x41    
     2  +coeff( 20)    *x21*x31*x41    
     3  +coeff( 21)    *x23    *x41    
     4  +coeff( 22)*x11*x22    *x41    
     5  +coeff( 23)    *x21*x32        
     6  +coeff( 24)*x11        *x42    
     7  +coeff( 25)*x12*x21            
     8  +coeff( 26)*x11*x22*x31        
      t_r5p65_484816old_q2ext=t_r5p65_484816old_q2ext
     9  +coeff( 27)*x11*x22*x31*x41    
     1  +coeff( 28)            *x42    
     2  +coeff( 29)    *x22*x31        
     3  +coeff( 30)    *x21    *x41*x51
     4  +coeff( 31)    *x21        *x52
     5  +coeff( 32)*x11*x21    *x41    
     6  +coeff( 33)*x11    *x31*x41    
     7  +coeff( 34)    *x22*x31*x41    
     8  +coeff( 35)        *x33*x41    
      t_r5p65_484816old_q2ext=t_r5p65_484816old_q2ext
     9  +coeff( 36)    *x21    *x43    
     1  +coeff( 37)*x12*x21    *x41    
     2  +coeff( 38)    *x23*x31*x42    
     3  +coeff( 39)                *x51
     4  +coeff( 40)        *x32        
     5  +coeff( 41)        *x31*x41    
     6  +coeff( 42)    *x21*x31    *x51
     7  +coeff( 43)*x12                
     8  +coeff( 44)*x11*x21*x31        
      t_r5p65_484816old_q2ext=t_r5p65_484816old_q2ext
     9  +coeff( 45)*x11    *x32        
     1  +coeff( 46)    *x21*x32*x41    
     2  +coeff( 47)    *x21*x31*x42    
     3  +coeff( 48)*x11        *x41*x51
     4  +coeff( 49)*x12*x21*x31        
     5  +coeff( 50)            *x41*x51
     6  +coeff( 51)    *x21*x33        
     7  +coeff( 52)    *x22    *x42    
     8  +coeff( 53)    *x21    *x42*x51
      t_r5p65_484816old_q2ext=t_r5p65_484816old_q2ext
     9  +coeff( 54)*x11            *x52
     1  +coeff( 55)*x11    *x31*x42    
     2  +coeff( 56)*x11        *x43    
     3  +coeff( 57)    *x21    *x44    
     4  +coeff( 58)    *x23    *x41*x51
     5  +coeff( 59)    *x21    *x43*x51
     6  +coeff( 60)*x11*x22    *x42    
     7  +coeff( 61)*x11    *x33    *x51
     8  +coeff( 62)    *x23*x31*x41*x51
      t_r5p65_484816old_q2ext=t_r5p65_484816old_q2ext
     9  +coeff( 63)*x11    *x34*x41    
     1  +coeff( 64)    *x23*x31*x43    
     2  +coeff( 65)        *x31    *x51
     3  +coeff( 66)        *x31*x42    
     4  +coeff( 67)            *x43    
     5  +coeff( 68)    *x24            
     6  +coeff( 69)*x11    *x31    *x51
     7  +coeff( 70)    *x21*x31*x41*x51
     8  +coeff( 71)*x11*x23            
      t_r5p65_484816old_q2ext=t_r5p65_484816old_q2ext
     9  +coeff( 72)    *x23*x32        
     1  +coeff( 73)*x12        *x41    
     2  +coeff( 74)    *x24    *x41    
     3  +coeff( 75)*x11    *x32*x41    
     4  +coeff( 76)        *x34*x41    
     5  +coeff( 77)    *x22    *x43    
     6  +coeff( 78)    *x21*x31*x43    
     7  +coeff( 79)*x11*x22        *x51
     8  +coeff( 80)*x11*x24            
      t_r5p65_484816old_q2ext=t_r5p65_484816old_q2ext
     9  +coeff( 81)*x11*x22*x32        
     1  +coeff( 82)    *x23    *x43    
     2  +coeff( 83)*x11*x22    *x41*x51
     3  +coeff( 84)*x12*x23            
     4  +coeff( 85)*x11*x22    *x43    
     5  +coeff( 86)    *x23*x31*x42*x51
     6  +coeff( 87)*x11*x24*x31*x42    
c
      return
      end
      function y_r5p65_484816old_q2ext(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 54)
      data ncoeff/ 53/
      data avdat/ -0.3114072E-02/
      data xmin/
     1 -0.14934E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.49980E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26788E-01, 0.49957E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     +  0.20196600E-01, 0.36633138E-01, 0.22028556E+00,-0.58253719E-02,
     +  0.28228641E-01, 0.12910481E-01,-0.43314453E-01,-0.25174465E-01,
     + -0.18106835E-01,-0.22606957E-04,-0.11602836E-01, 0.23515089E-02,
     +  0.10988037E-01,-0.32782585E-02,-0.13749119E-02,-0.11039568E-01,
     + -0.50718514E-02,-0.21637434E-02,-0.15022286E-02, 0.34715640E-03,
     + -0.11372272E-02,-0.13889494E-01, 0.43988653E-04,-0.14308145E-02,
     + -0.69979578E-03, 0.18962977E-02, 0.12692128E-02,-0.22531056E-02,
     + -0.11297277E-01, 0.74548232E-02,-0.56206374E-02,-0.11418723E-02,
     +  0.61597098E-02, 0.27511848E-03,-0.42258500E-03, 0.20536419E-02,
     +  0.14206844E-02,-0.12288806E-02,-0.31466904E-03, 0.12389346E-02,
     + -0.49511764E-04, 0.58319321E-03,-0.91047003E-03,-0.47554020E-02,
     + -0.53277321E-03, 0.19712194E-02, 0.19037092E-03, 0.89409802E-03,
     + -0.27104537E-03,-0.40954765E-03,-0.38661752E-03, 0.30544965E-03,
     +  0.10684468E-02,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x12 = x11*x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x34 = x33*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x51 = x5
      x52 = x51*x5
c
c                  function
c
      y_r5p65_484816old_q2ext=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)        *x31        
     3  +coeff(  3)            *x41    
     4  +coeff(  4)    *x21            
     5  +coeff(  5)                *x51
     6  +coeff(  6)            *x42    
     7  +coeff(  7)    *x22            
     8  +coeff(  8)    *x22    *x41    
      y_r5p65_484816old_q2ext=y_r5p65_484816old_q2ext
     9  +coeff(  9)*x11*x21            
     1  +coeff( 10)        *x33*x41    
     2  +coeff( 11)*x11*x21    *x41    
     3  +coeff( 12)        *x32        
     4  +coeff( 13)        *x31*x41    
     5  +coeff( 14)    *x21    *x41    
     6  +coeff( 15)*x11                
     7  +coeff( 16)    *x22*x31        
     8  +coeff( 17)*x11*x21*x31        
      y_r5p65_484816old_q2ext=y_r5p65_484816old_q2ext
     9  +coeff( 18)*x12                
     1  +coeff( 19)    *x21*x31        
     2  +coeff( 20)            *x41*x51
     3  +coeff( 21)                *x52
     4  +coeff( 22)    *x22    *x42    
     5  +coeff( 23)    *x22*x33*x41    
     6  +coeff( 24)    *x21    *x42    
     7  +coeff( 25)*x11        *x41    
     8  +coeff( 26)    *x23            
      y_r5p65_484816old_q2ext=y_r5p65_484816old_q2ext
     9  +coeff( 27)    *x22        *x51
     1  +coeff( 28)    *x22*x32        
     2  +coeff( 29)    *x22*x31*x41    
     3  +coeff( 30)    *x24            
     4  +coeff( 31)*x11*x21    *x42    
     5  +coeff( 32)*x12        *x41    
     6  +coeff( 33)*x11*x23            
     7  +coeff( 34)*x11*x21*x33*x41    
     8  +coeff( 35)        *x31    *x51
      y_r5p65_484816old_q2ext=y_r5p65_484816old_q2ext
     9  +coeff( 36)        *x31*x42    
     1  +coeff( 37)            *x43    
     2  +coeff( 38)    *x21*x31*x41    
     3  +coeff( 39)*x11    *x31        
     4  +coeff( 40)*x11*x22            
     5  +coeff( 41)        *x34*x41    
     6  +coeff( 42)*x11*x21        *x51
     7  +coeff( 43)*x11*x21*x32        
     8  +coeff( 44)*x11*x21*x31*x41    
      y_r5p65_484816old_q2ext=y_r5p65_484816old_q2ext
     9  +coeff( 45)*x12    *x31        
     1  +coeff( 46)*x12*x22            
     2  +coeff( 47)    *x21        *x51
     3  +coeff( 48)        *x32*x41    
     4  +coeff( 49)    *x21*x32        
     5  +coeff( 50)            *x42*x51
     6  +coeff( 51)        *x33*x41*x51
     7  +coeff( 52)*x12*x21            
     8  +coeff( 53)*x11*x23    *x41    
c
      return
      end
      function p_r5p65_484816old_q2ext(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 91)
      data ncoeff/ 90/
      data avdat/  0.1502860E-02/
      data xmin/
     1 -0.14934E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.49980E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26788E-01, 0.49957E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     + -0.21922668E-02,-0.60598156E-02,-0.24726454E-01,-0.17256630E-02,
     +  0.31766011E-02, 0.39165542E-02, 0.14058691E-02, 0.44818397E-03,
     +  0.71431434E-03, 0.55553904E-03,-0.84414426E-03, 0.32914185E-03,
     + -0.91398036E-03,-0.10840335E-02, 0.17741723E-02, 0.98368351E-03,
     + -0.14910937E-03,-0.10854840E-03, 0.10695374E-03, 0.13104336E-03,
     + -0.18930637E-03,-0.12414812E-03,-0.49800321E-03,-0.26758327E-03,
     +  0.16644970E-03, 0.14194199E-02,-0.37753483E-03,-0.13390242E-03,
     +  0.88944403E-03, 0.15860570E-03,-0.35851958E-03, 0.45572998E-03,
     +  0.11654933E-02,-0.37060719E-03, 0.56458561E-03,-0.93387665E-04,
     + -0.14151950E-03, 0.64755957E-04, 0.10897301E-03,-0.84366162E-04,
     + -0.28424380E-04, 0.15938492E-03,-0.53623622E-04,-0.10247446E-03,
     + -0.45705336E-03, 0.19592758E-03,-0.18157728E-03,-0.46363790E-03,
     +  0.87208471E-04, 0.44580601E-03,-0.38585731E-04,-0.19363537E-03,
     +  0.16045167E-04,-0.29238224E-05,-0.15744644E-03, 0.81584112E-04,
     +  0.26821270E-04, 0.17878452E-04, 0.27665021E-04,-0.57633984E-04,
     +  0.84365711E-04,-0.23265429E-04, 0.40270290E-04,-0.44203660E-03,
     + -0.87632878E-04, 0.12521079E-04,-0.34188124E-03,-0.22141078E-03,
     +  0.18517514E-03,-0.33195989E-04, 0.11223314E-03, 0.11266624E-04,
     + -0.54038857E-04,-0.79402351E-04, 0.13329704E-04,-0.54617347E-04,
     +  0.44452081E-04,-0.16774335E-04, 0.50097340E-04,-0.52303185E-04,
     +  0.11731189E-03, 0.24206076E-04,-0.19453473E-03, 0.30771433E-04,
     +  0.26797534E-04, 0.10201178E-03, 0.14462901E-03, 0.68089350E-04,
     + -0.29025608E-04,-0.48604543E-04,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x12 = x11*x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x34 = x33*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x44 = x43*x4
      x51 = x5
      x52 = x51*x5
      x53 = x52*x5
      x54 = x53*x5
c
c                  function
c
      p_r5p65_484816old_q2ext=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)        *x31        
     3  +coeff(  3)            *x41    
     4  +coeff(  4)                *x51
     5  +coeff(  5)    *x22            
     6  +coeff(  6)            *x41*x51
     7  +coeff(  7)*x11*x21            
     8  +coeff(  8)    *x21            
      p_r5p65_484816old_q2ext=p_r5p65_484816old_q2ext
     9  +coeff(  9)        *x31    *x51
     1  +coeff( 10)                *x52
     2  +coeff( 11)    *x22        *x51
     3  +coeff( 12)    *x21    *x41    
     4  +coeff( 13)        *x31*x41    
     5  +coeff( 14)            *x42    
     6  +coeff( 15)    *x22    *x41    
     7  +coeff( 16)*x11*x21    *x41    
     8  +coeff( 17)    *x24*x31        
      p_r5p65_484816old_q2ext=p_r5p65_484816old_q2ext
     9  +coeff( 18)*x11*x23*x31        
     1  +coeff( 19)*x11                
     2  +coeff( 20)    *x21*x31        
     3  +coeff( 21)        *x32        
     4  +coeff( 22)    *x21        *x51
     5  +coeff( 23)            *x43    
     6  +coeff( 24)            *x41*x52
     7  +coeff( 25)*x12                
     8  +coeff( 26)    *x22    *x42    
      p_r5p65_484816old_q2ext=p_r5p65_484816old_q2ext
     9  +coeff( 27)*x11*x21        *x51
     1  +coeff( 28)    *x24*x31*x41    
     2  +coeff( 29)    *x22*x31        
     3  +coeff( 30)    *x21    *x42    
     4  +coeff( 31)        *x31*x42    
     5  +coeff( 32)*x11*x21*x31        
     6  +coeff( 33)    *x22*x31*x41    
     7  +coeff( 34)    *x22    *x41*x51
     8  +coeff( 35)*x11*x21    *x42    
      p_r5p65_484816old_q2ext=p_r5p65_484816old_q2ext
     9  +coeff( 36)*x11*x23*x31*x41    
     1  +coeff( 37)    *x23            
     2  +coeff( 38)*x11        *x41    
     3  +coeff( 39)    *x21*x31*x41    
     4  +coeff( 40)        *x32*x41    
     5  +coeff( 41)*x11            *x51
     6  +coeff( 42)        *x31*x41*x51
     7  +coeff( 43)                *x53
     8  +coeff( 44)*x11*x22            
      p_r5p65_484816old_q2ext=p_r5p65_484816old_q2ext
     9  +coeff( 45)    *x24            
     1  +coeff( 46)    *x22*x32        
     2  +coeff( 47)    *x22*x31    *x51
     3  +coeff( 48)*x11*x23            
     4  +coeff( 49)*x12        *x41    
     5  +coeff( 50)*x11*x21*x31*x41    
     6  +coeff( 51)*x12            *x51
     7  +coeff( 52)*x11*x21    *x41*x51
     8  +coeff( 53)            *x44*x51
      p_r5p65_484816old_q2ext=p_r5p65_484816old_q2ext
     9  +coeff( 54)        *x31    *x54
     1  +coeff( 55)*x12*x22            
     2  +coeff( 56)*x11*x21*x34        
     3  +coeff( 57)*x11    *x31        
     4  +coeff( 58)    *x21*x32        
     5  +coeff( 59)        *x32    *x51
     6  +coeff( 60)    *x21    *x41*x51
     7  +coeff( 61)    *x22        *x52
     8  +coeff( 62)*x12*x21            
      p_r5p65_484816old_q2ext=p_r5p65_484816old_q2ext
     9  +coeff( 63)*x12    *x31        
     1  +coeff( 64)    *x24    *x41    
     2  +coeff( 65)*x11*x21*x31    *x51
     3  +coeff( 66)    *x23*x31    *x51
     4  +coeff( 67)    *x22    *x42*x51
     5  +coeff( 68)*x11*x23    *x41    
     6  +coeff( 69)*x11*x21    *x43    
     7  +coeff( 70)    *x21*x31    *x51
     8  +coeff( 71)            *x42*x51
      p_r5p65_484816old_q2ext=p_r5p65_484816old_q2ext
     9  +coeff( 72)    *x21        *x52
     1  +coeff( 73)        *x31    *x52
     2  +coeff( 74)    *x23    *x41    
     3  +coeff( 75)*x11        *x42    
     4  +coeff( 76)            *x44    
     5  +coeff( 77)    *x23        *x51
     6  +coeff( 78)*x11        *x41*x51
     7  +coeff( 79)            *x43*x51
     8  +coeff( 80)*x11*x22    *x41    
      p_r5p65_484816old_q2ext=p_r5p65_484816old_q2ext
     9  +coeff( 81)    *x22*x31*x42    
     1  +coeff( 82)*x11*x22        *x51
     2  +coeff( 83)    *x22*x31*x41*x51
     3  +coeff( 84)*x11*x21        *x52
     4  +coeff( 85)*x12        *x42    
     5  +coeff( 86)*x11*x21*x31*x42    
     6  +coeff( 87)    *x22    *x44    
     7  +coeff( 88)*x11*x23        *x51
     8  +coeff( 89)*x12        *x41*x51
      p_r5p65_484816old_q2ext=p_r5p65_484816old_q2ext
     9  +coeff( 90)*x11*x21*x31*x41*x51
c
      return
      end
      function sl_r5p65_484816old_q2ext(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 30)
      data ncoeff/ 29/
      data avdat/ -0.1843967E-02/
      data xmin/
     1 -0.14934E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.49980E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26788E-01, 0.49957E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     +  0.18677361E-02,-0.21372603E-02,-0.61931252E-02,-0.20177459E-03,
     + -0.36582646E-02,-0.83612300E-04,-0.15175237E-02,-0.60264063E-02,
     + -0.18920566E-03,-0.14529855E-02, 0.68203913E-03,-0.13258387E-03,
     +  0.34057919E-02, 0.11030029E-03, 0.92216767E-03,-0.18671939E-04,
     + -0.42706921E-04, 0.23203250E-03, 0.28429809E-03,-0.11529528E-03,
     +  0.81047410E-03,-0.46135002E-03, 0.17339474E-03,-0.78651050E-04,
     +  0.13079137E-02, 0.27676022E-04, 0.11271843E-02, 0.55623976E-04,
     + -0.42026673E-03,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x12 = x11*x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x44 = x43*x4
      x51 = x5
      x52 = x51*x5
c
c                  function
c
      sl_r5p65_484816old_q2ext=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)        *x31        
     3  +coeff(  3)            *x41    
     4  +coeff(  4)                *x51
     5  +coeff(  5)    *x22            
     6  +coeff(  6)        *x32        
     7  +coeff(  7)        *x31*x41    
     8  +coeff(  8)            *x42    
      sl_r5p65_484816old_q2ext=sl_r5p65_484816old_q2ext
     9  +coeff(  9)        *x31    *x51
     1  +coeff( 10)            *x41*x51
     2  +coeff( 11)*x11*x21            
     3  +coeff( 12)    *x23            
     4  +coeff( 13)    *x22    *x41    
     5  +coeff( 14)*x11*x21*x31        
     6  +coeff( 15)*x11*x21    *x41    
     7  +coeff( 16)    *x21    *x43    
     8  +coeff( 17)    *x24*x31        
      sl_r5p65_484816old_q2ext=sl_r5p65_484816old_q2ext
     9  +coeff( 18)    *x21            
     1  +coeff( 19)    *x21    *x41    
     2  +coeff( 20)                *x52
     3  +coeff( 21)    *x22*x31        
     4  +coeff( 22)            *x43    
     5  +coeff( 23)            *x42*x51
     6  +coeff( 24)*x12                
     7  +coeff( 25)    *x22    *x42    
     8  +coeff( 26)        *x31*x44    
      sl_r5p65_484816old_q2ext=sl_r5p65_484816old_q2ext
     9  +coeff( 27)    *x24*x31*x41    
     1  +coeff( 28)    *x21        *x51
     2  +coeff( 29)        *x31*x42    
c
      return
      end
      function x_r5p65_484816old_den(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 91)
      data ncoeff/ 90/
      data avdat/ -0.5097749E+01/
      data xmin/
     1 -0.14934E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.49980E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26369E-01, 0.49957E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     +  0.73948747E-03,-0.10659643E+00, 0.12584014E-01, 0.29258728E-01,
     + -0.54437201E-02,-0.80538681E-02, 0.13775573E-01, 0.66050957E-02,
     +  0.19952415E-02, 0.10767630E-01,-0.18039842E-02, 0.28147374E-02,
     + -0.98560762E-03,-0.71397396E-02, 0.89781435E-03,-0.38974925E-02,
     +  0.90850722E-02,-0.11856857E-01,-0.12692835E-02,-0.85180569E-02,
     +  0.35380325E-03,-0.14756394E-02, 0.20640159E-02,-0.49811071E-02,
     +  0.20354509E-02,-0.29380242E-02, 0.89341542E-04, 0.52930834E-03,
     +  0.57142565E-03, 0.41338671E-02, 0.40236418E-02,-0.84439857E-03,
     +  0.17489054E-02, 0.39344042E-04, 0.24605202E-02, 0.46920881E-03,
     + -0.27596092E-03,-0.52743562E-03,-0.10042420E-02, 0.10585423E-02,
     +  0.17453444E-02,-0.36700536E-03, 0.42327703E-03,-0.23523928E-03,
     + -0.12871012E-03, 0.11627239E-03, 0.26621218E-03, 0.19619740E-03,
     + -0.11170908E-02,-0.60992339E-03, 0.15882006E-02, 0.87708334E-03,
     + -0.11123928E-02, 0.11807611E-03,-0.49908902E-03, 0.48372257E-03,
     +  0.54279715E-03, 0.26820783E-03,-0.23916614E-03,-0.89295034E-03,
     + -0.93691447E-03,-0.25874362E-02, 0.13306573E-02, 0.10982655E-02,
     +  0.46587025E-03,-0.36368401E-04, 0.22372116E-03,-0.21613232E-03,
     +  0.17721975E-04,-0.13431862E-04, 0.19412255E-03,-0.28724555E-03,
     +  0.46642148E-03, 0.58426865E-03, 0.22212465E-03, 0.47312776E-03,
     +  0.29100431E-03, 0.41326816E-03,-0.26776988E-03, 0.13454094E-03,
     +  0.27242806E-03,-0.62966964E-03,-0.15482223E-02, 0.66159648E-03,
     +  0.67479144E-04,-0.24376799E-03,-0.37625915E-03,-0.18319745E-03,
     +  0.87096312E-04,-0.13268316E-03,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x34 = x33*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x44 = x43*x4
      x51 = x5
      x52 = x51*x5
      x53 = x52*x5
      x54 = x53*x5
c
c                  function
c
      x_r5p65_484816old_den=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)    *x21            
     3  +coeff(  3)    *x21*x31        
     4  +coeff(  4)    *x21    *x41    
     5  +coeff(  5)    *x21        *x51
     6  +coeff(  6)    *x23            
     7  +coeff(  7)*x11                
     8  +coeff(  8)*x11        *x41    
      x_r5p65_484816old_den=x_r5p65_484816old_den
     9  +coeff(  9)            *x41    
     1  +coeff( 10)    *x21    *x42    
     2  +coeff( 11)*x11*x21            
     3  +coeff( 12)*x11    *x31        
     4  +coeff( 13)    *x23*x31*x41    
     5  +coeff( 14)*x11*x22            
     6  +coeff( 15)        *x31        
     7  +coeff( 16)    *x22    *x41    
     8  +coeff( 17)    *x21*x31*x41    
      x_r5p65_484816old_den=x_r5p65_484816old_den
     9  +coeff( 18)    *x23    *x41    
     1  +coeff( 19)*x11            *x51
     2  +coeff( 20)*x11*x22    *x41    
     3  +coeff( 21)    *x22            
     4  +coeff( 22)    *x22*x31        
     5  +coeff( 23)    *x21*x32        
     6  +coeff( 24)    *x23*x31        
     7  +coeff( 25)*x11        *x42    
     8  +coeff( 26)*x11*x22*x31        
      x_r5p65_484816old_den=x_r5p65_484816old_den
     9  +coeff( 27)*x11    *x33*x41    
     1  +coeff( 28)        *x31*x41    
     2  +coeff( 29)    *x21        *x52
     3  +coeff( 30)    *x21*x31*x42    
     4  +coeff( 31)    *x21    *x43    
     5  +coeff( 32)*x11*x21    *x41    
     6  +coeff( 33)*x11    *x31*x41    
     7  +coeff( 34)    *x21*x34*x41    
     8  +coeff( 35)*x11*x24            
      x_r5p65_484816old_den=x_r5p65_484816old_den
     9  +coeff( 36)            *x42    
     1  +coeff( 37)            *x41*x51
     2  +coeff( 38)    *x21*x31    *x51
     3  +coeff( 39)    *x21    *x41*x51
     4  +coeff( 40)    *x24            
     5  +coeff( 41)    *x21*x32*x41    
     6  +coeff( 42)*x11*x21*x31        
     7  +coeff( 43)*x11    *x32        
     8  +coeff( 44)*x11        *x41*x51
      x_r5p65_484816old_den=x_r5p65_484816old_den
     9  +coeff( 45)                *x51
     1  +coeff( 46)        *x32        
     2  +coeff( 47)    *x22        *x51
     3  +coeff( 48)    *x21*x33        
     4  +coeff( 49)    *x22    *x42    
     5  +coeff( 50)    *x21    *x42*x51
     6  +coeff( 51)    *x21    *x44    
     7  +coeff( 52)    *x23    *x41*x51
     8  +coeff( 53)    *x24*x31*x41    
      x_r5p65_484816old_den=x_r5p65_484816old_den
     9  +coeff( 54)    *x22*x32*x42    
     1  +coeff( 55)    *x23*x31*x41*x51
     2  +coeff( 56)*x11*x23            
     3  +coeff( 57)*x11    *x31*x42    
     4  +coeff( 58)*x11        *x43    
     5  +coeff( 59)*x11*x21*x31    *x51
     6  +coeff( 60)*x11*x22*x31*x41    
     7  +coeff( 61)*x11*x22    *x42    
     8  +coeff( 62)    *x24*x32*x42    
      x_r5p65_484816old_den=x_r5p65_484816old_den
     9  +coeff( 63)*x11*x24    *x41    
     1  +coeff( 64)*x11*x22*x32*x41    
     2  +coeff( 65)*x11*x22*x32    *x51
     3  +coeff( 66)        *x31    *x51
     4  +coeff( 67)            *x43    
     5  +coeff( 68)            *x42*x51
     6  +coeff( 69)                *x53
     7  +coeff( 70)        *x31*x43    
     8  +coeff( 71)            *x41*x53
      x_r5p65_484816old_den=x_r5p65_484816old_den
     9  +coeff( 72)    *x23*x32        
     1  +coeff( 73)    *x24    *x41    
     2  +coeff( 74)    *x21*x31*x43    
     3  +coeff( 75)        *x31*x44    
     4  +coeff( 76)    *x23*x31    *x51
     5  +coeff( 77)    *x22*x32    *x51
     6  +coeff( 78)    *x21    *x43*x51
     7  +coeff( 79)    *x21*x32    *x52
     8  +coeff( 80)        *x32*x41*x52
      x_r5p65_484816old_den=x_r5p65_484816old_den
     9  +coeff( 81)            *x42*x53
     1  +coeff( 82)    *x22*x33*x41    
     2  +coeff( 83)    *x23    *x43    
     3  +coeff( 84)    *x22    *x44    
     4  +coeff( 85)*x11*x21        *x51
     5  +coeff( 86)    *x22*x33    *x51
     6  +coeff( 87)    *x21*x31*x43*x51
     7  +coeff( 88)    *x23        *x53
     8  +coeff( 89)            *x42*x54
      x_r5p65_484816old_den=x_r5p65_484816old_den
     9  +coeff( 90)*x11*x21*x31*x41    
c
      return
      end
      function t_r5p65_484816old_den(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 91)
      data ncoeff/ 90/
      data avdat/  0.3609786E+01/
      data xmin/
     1 -0.14934E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.49980E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26369E-01, 0.49957E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     + -0.54841921E-01, 0.63416237E+00, 0.90933498E-02,-0.11069287E+00,
     +  0.16489425E+00,-0.90245686E-01,-0.21416913E+00, 0.33057798E-01,
     + -0.41498214E-01, 0.10508135E+00,-0.43389726E-01,-0.96220180E-01,
     +  0.12608564E-01, 0.23814606E-01,-0.18521558E-01,-0.76176926E-01,
     +  0.13649609E-02,-0.50730444E-02,-0.75425231E-02, 0.10588540E-01,
     + -0.60995288E-01, 0.85345609E-02, 0.49240217E-02, 0.30145759E-01,
     +  0.71840703E-01, 0.11835341E-01, 0.55230994E-01,-0.36681827E-01,
     + -0.12833185E-01, 0.11774821E-01, 0.29213108E-01, 0.25772929E-01,
     + -0.13198039E-01,-0.30278502E-01, 0.21424323E-01,-0.74406271E-02,
     +  0.92370930E-03, 0.13588502E-02, 0.60416278E-02,-0.35356649E-02,
     + -0.10993560E-01,-0.21530747E-01, 0.11721555E-01, 0.10571719E-01,
     + -0.12989693E-02,-0.21752058E-01,-0.47136279E-03, 0.22609357E-02,
     +  0.88810986E-02,-0.20971540E-02,-0.10929428E-01,-0.25528293E-01,
     +  0.51405448E-02,-0.72983410E-02, 0.28816643E-02, 0.37711684E-01,
     + -0.11244323E-01, 0.44047842E-02, 0.14265445E-01,-0.92364112E-02,
     +  0.25086112E-02,-0.12036897E-03, 0.23666890E-02, 0.18261460E-02,
     +  0.11190710E-02, 0.20566273E-03,-0.35746640E-02,-0.12920243E-02,
     + -0.33601155E-02,-0.16863776E-01, 0.94847375E-03,-0.14166913E-02,
     +  0.10139733E-02, 0.40775049E-02,-0.43321212E-03, 0.14430149E-02,
     + -0.31199553E-02,-0.26672743E-02, 0.15431156E-02,-0.67778572E-03,
     + -0.17523825E-02,-0.42088963E-02, 0.13193028E-02, 0.46158242E-02,
     +  0.41706231E-02,-0.92957886E-02,-0.51234653E-02, 0.31687896E-03,
     +  0.31583803E-03,-0.76431769E-03,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x12 = x11*x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x44 = x43*x4
      x51 = x5
      x52 = x51*x5
c
c                  function
c
      t_r5p65_484816old_den=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)    *x21            
     3  +coeff(  3)                *x51
     4  +coeff(  4)*x11                
     5  +coeff(  5)    *x22            
     6  +coeff(  6)    *x21*x31        
     7  +coeff(  7)    *x21    *x41    
     8  +coeff(  8)    *x21        *x51
      t_r5p65_484816old_den=t_r5p65_484816old_den
     9  +coeff(  9)*x11*x21            
     1  +coeff( 10)    *x23            
     2  +coeff( 11)*x11        *x41    
     3  +coeff( 12)    *x22    *x41    
     4  +coeff( 13)    *x24*x31        
     5  +coeff( 14)            *x42    
     6  +coeff( 15)*x11    *x31        
     7  +coeff( 16)    *x21    *x42    
     8  +coeff( 17)    *x23*x31*x41    
      t_r5p65_484816old_den=t_r5p65_484816old_den
     9  +coeff( 18)        *x31        
     1  +coeff( 19)            *x41    
     2  +coeff( 20)            *x41*x51
     3  +coeff( 21)    *x21*x31*x41    
     4  +coeff( 22)*x11            *x51
     5  +coeff( 23)*x12                
     6  +coeff( 24)*x11*x22            
     7  +coeff( 25)    *x23    *x41    
     8  +coeff( 26)*x12*x21            
      t_r5p65_484816old_den=t_r5p65_484816old_den
     9  +coeff( 27)*x11*x22    *x41    
     1  +coeff( 28)    *x22*x31        
     2  +coeff( 29)    *x21*x32        
     3  +coeff( 30)    *x22        *x51
     4  +coeff( 31)    *x24            
     5  +coeff( 32)    *x23*x31        
     6  +coeff( 33)*x11        *x42    
     7  +coeff( 34)    *x22    *x42    
     8  +coeff( 35)*x11*x22*x31        
      t_r5p65_484816old_den=t_r5p65_484816old_den
     9  +coeff( 36)    *x24*x31*x41    
     1  +coeff( 37)*x11    *x33*x41    
     2  +coeff( 38)        *x31    *x51
     3  +coeff( 39)            *x42*x51
     4  +coeff( 40)    *x21        *x52
     5  +coeff( 41)*x11    *x31*x41    
     6  +coeff( 42)    *x21    *x43    
     7  +coeff( 43)*x11*x23            
     8  +coeff( 44)*x12*x21    *x41    
      t_r5p65_484816old_den=t_r5p65_484816old_den
     9  +coeff( 45)    *x23*x31*x42    
     1  +coeff( 46)    *x23    *x44    
     2  +coeff( 47)        *x32        
     3  +coeff( 48)    *x21*x31    *x51
     4  +coeff( 49)    *x21    *x41*x51
     5  +coeff( 50)*x11    *x32        
     6  +coeff( 51)    *x21*x32*x41    
     7  +coeff( 52)    *x21*x31*x42    
     8  +coeff( 53)    *x23        *x51
      t_r5p65_484816old_den=t_r5p65_484816old_den
     9  +coeff( 54)    *x22    *x41*x51
     1  +coeff( 55)*x12        *x41    
     2  +coeff( 56)    *x24    *x41    
     3  +coeff( 57)    *x23    *x41*x51
     4  +coeff( 58)*x12*x21*x31        
     5  +coeff( 59)*x11*x23    *x41    
     6  +coeff( 60)    *x24    *x42    
     7  +coeff( 61)        *x31*x41    
     8  +coeff( 62)        *x32*x41    
      t_r5p65_484816old_den=t_r5p65_484816old_den
     9  +coeff( 63)            *x43    
     1  +coeff( 64)        *x31*x41*x51
     2  +coeff( 65)            *x41*x52
     3  +coeff( 66)*x11*x21*x31        
     4  +coeff( 67)    *x22*x32        
     5  +coeff( 68)    *x21*x33        
     6  +coeff( 69)*x11*x21    *x41    
     7  +coeff( 70)    *x22*x31*x41    
     8  +coeff( 71)*x11*x21        *x51
      t_r5p65_484816old_den=t_r5p65_484816old_den
     9  +coeff( 72)    *x22*x31    *x51
     1  +coeff( 73)*x11        *x41*x51
     2  +coeff( 74)    *x21    *x42*x51
     3  +coeff( 75)*x11            *x52
     4  +coeff( 76)*x12    *x31        
     5  +coeff( 77)*x11    *x31*x42    
     6  +coeff( 78)*x11        *x43    
     7  +coeff( 79)        *x31*x44    
     8  +coeff( 80)*x12            *x51
      t_r5p65_484816old_den=t_r5p65_484816old_den
     9  +coeff( 81)*x11*x21    *x41*x51
     1  +coeff( 82)    *x21    *x43*x51
     2  +coeff( 83)*x12*x22            
     3  +coeff( 84)*x11*x23*x31        
     4  +coeff( 85)    *x23*x31*x41*x51
     5  +coeff( 86)    *x23*x31*x43    
     6  +coeff( 87)*x11*x24    *x41*x51
     7  +coeff( 88)        *x32    *x51
     8  +coeff( 89)*x11    *x31    *x51
      t_r5p65_484816old_den=t_r5p65_484816old_den
     9  +coeff( 90)    *x22        *x52
c
      return
      end
      function y_r5p65_484816old_den(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 69)
      data ncoeff/ 68/
      data avdat/  0.1501634E-02/
      data xmin/
     1 -0.14934E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.49980E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26369E-01, 0.49957E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     +  0.12009279E-01, 0.13182215E-01, 0.12417156E+00,-0.40844269E-02,
     +  0.21558225E-01, 0.75013884E-02, 0.85023660E-02, 0.18798279E-02,
     +  0.22707216E-02, 0.15381441E-01,-0.31045569E-01,-0.19117279E-01,
     + -0.12700922E-01,-0.74997847E-02, 0.27363701E-03, 0.16122020E-02,
     + -0.94680645E-03, 0.10745939E-02,-0.80760820E-02,-0.21268982E-02,
     + -0.33696326E-02,-0.14538460E-02,-0.47288075E-03,-0.19120580E-02,
     + -0.10800519E-02,-0.11789671E-02,-0.71114521E-02,-0.78459522E-02,
     +  0.57358085E-02, 0.44563338E-02, 0.99926154E-04,-0.14752242E-02,
     + -0.24651061E-03,-0.40324137E-03,-0.74757374E-03,-0.14946003E-02,
     + -0.70619042E-03,-0.29988836E-02,-0.34522791E-02,-0.83896314E-03,
     +  0.13486495E-02, 0.16085079E-03,-0.25154039E-03,-0.21360611E-03,
     +  0.94488903E-03,-0.13524629E-03,-0.38564880E-03,-0.93660079E-03,
     +  0.78387116E-03,-0.59563201E-03,-0.38718476E-03, 0.49696758E-03,
     +  0.58506295E-03,-0.19504841E-03,-0.56473731E-04,-0.19813857E-03,
     + -0.28691872E-03, 0.68973290E-03,-0.49418205E-03, 0.14012989E-03,
     + -0.93891402E-03,-0.68366469E-03,-0.41379035E-03, 0.20171254E-03,
     + -0.24456080E-03, 0.77541452E-03,-0.32986444E-03,-0.39784436E-03,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x12 = x11*x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x51 = x5
      x52 = x51*x5
      x53 = x52*x5
c
c                  function
c
      y_r5p65_484816old_den=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)        *x31        
     3  +coeff(  3)            *x41    
     4  +coeff(  4)    *x21            
     5  +coeff(  5)                *x51
     6  +coeff(  6)        *x31*x41    
     7  +coeff(  7)            *x42    
     8  +coeff(  8)    *x21    *x41    
      y_r5p65_484816old_den=y_r5p65_484816old_den
     9  +coeff(  9)        *x31    *x51
     1  +coeff( 10)            *x41*x51
     2  +coeff( 11)    *x22            
     3  +coeff( 12)    *x22    *x41    
     4  +coeff( 13)*x11*x21            
     5  +coeff( 14)*x11*x21    *x41    
     6  +coeff( 15)    *x22*x33        
     7  +coeff( 16)        *x32        
     8  +coeff( 17)*x11                
      y_r5p65_484816old_den=y_r5p65_484816old_den
     9  +coeff( 18)                *x52
     1  +coeff( 19)    *x22*x31        
     2  +coeff( 20)    *x22        *x51
     3  +coeff( 21)*x11*x21*x31        
     4  +coeff( 22)*x12                
     5  +coeff( 23)            *x43    
     6  +coeff( 24)    *x21    *x42    
     7  +coeff( 25)*x11        *x41    
     8  +coeff( 26)            *x41*x52
      y_r5p65_484816old_den=y_r5p65_484816old_den
     9  +coeff( 27)    *x22*x31*x41    
     1  +coeff( 28)    *x22    *x42    
     2  +coeff( 29)    *x24            
     3  +coeff( 30)*x11*x23            
     4  +coeff( 31)    *x21*x31        
     5  +coeff( 32)    *x21*x31*x41    
     6  +coeff( 33)            *x42*x51
     7  +coeff( 34)*x11    *x31        
     8  +coeff( 35)    *x21    *x41*x51
      y_r5p65_484816old_den=y_r5p65_484816old_den
     9  +coeff( 36)    *x22*x32        
     1  +coeff( 37)*x11*x21        *x51
     2  +coeff( 38)*x11*x21*x31*x41    
     3  +coeff( 39)*x11*x21    *x42    
     4  +coeff( 40)*x12        *x41    
     5  +coeff( 41)*x12*x22            
     6  +coeff( 42)    *x21        *x51
     7  +coeff( 43)    *x21*x32        
     8  +coeff( 44)        *x31    *x52
      y_r5p65_484816old_den=y_r5p65_484816old_den
     9  +coeff( 45)    *x23            
     1  +coeff( 46)        *x31*x43    
     2  +coeff( 47)*x11        *x42    
     3  +coeff( 48)    *x22    *x41*x51
     4  +coeff( 49)*x11*x22            
     5  +coeff( 50)*x11*x21*x32        
     6  +coeff( 51)*x12    *x31        
     7  +coeff( 52)        *x32*x41    
     8  +coeff( 53)        *x31*x42    
      y_r5p65_484816old_den=y_r5p65_484816old_den
     9  +coeff( 54)    *x21*x31    *x51
     1  +coeff( 55)*x11            *x51
     2  +coeff( 56)                *x53
     3  +coeff( 57)*x11    *x31*x41    
     4  +coeff( 58)    *x23    *x41    
     5  +coeff( 59)    *x22*x31    *x51
     6  +coeff( 60)*x11        *x41*x51
     7  +coeff( 61)    *x22    *x43    
     8  +coeff( 62)    *x22    *x42*x51
      y_r5p65_484816old_den=y_r5p65_484816old_den
     9  +coeff( 63)*x11*x21    *x41*x51
     1  +coeff( 64)*x12*x21            
     2  +coeff( 65)*x12        *x42    
     3  +coeff( 66)*x11*x23    *x41    
     4  +coeff( 67)*x11*x21*x33    *x51
     5  +coeff( 68)*x12    *x31*x41*x52
c
      return
      end
      function p_r5p65_484816old_den(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 91)
      data ncoeff/ 90/
      data avdat/  0.6770597E-02/
      data xmin/
     1 -0.14934E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.49980E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26369E-01, 0.49957E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     + -0.65999064E-02,-0.23416354E-03,-0.71266264E-01,-0.33846218E-02,
     +  0.71787308E-02,-0.22870133E-01,-0.18563825E-02,-0.23219334E-02,
     +  0.15446578E-01, 0.21187095E-02, 0.27518440E-03,-0.17373675E-05,
     +  0.41343328E-02,-0.83693471E-02,-0.10842669E-02,-0.21377808E-03,
     +  0.22117001E-05,-0.20169784E-03,-0.86938200E-03, 0.40418785E-04,
     +  0.11939462E-03, 0.76754201E-04,-0.10962581E-03,-0.12457520E-04,
     + -0.69183420E-05, 0.15654556E-04,-0.20238329E-01, 0.42753184E-03,
     + -0.41007581E-02,-0.32234944E-02, 0.28110067E-02, 0.35571745E-02,
     +  0.72045978E-02,-0.47992119E-02, 0.54568187E-02, 0.37734930E-02,
     +  0.88796194E-03, 0.36736655E-02, 0.14512910E-02, 0.80290483E-02,
     +  0.75270195E-05, 0.63274492E-05,-0.22664473E-02, 0.23148203E-03,
     +  0.91939181E-03,-0.11575897E-02, 0.47074207E-02, 0.15321071E-02,
     + -0.94376435E-03,-0.49965520E-03,-0.38915660E-03, 0.26239219E-03,
     +  0.46159685E-03, 0.29229705E-03, 0.31382844E-03, 0.73795271E-03,
     + -0.13715072E-02, 0.93981915E-03, 0.27487094E-02,-0.13572171E-02,
     + -0.15756879E-02, 0.17424623E-02,-0.78107865E-03, 0.81240066E-03,
     +  0.16544959E-03,-0.14960926E-03,-0.37690823E-03, 0.36927688E-03,
     + -0.13012328E-03, 0.46878180E-03, 0.49983297E-03, 0.18376234E-02,
     + -0.45296494E-03,-0.17405405E-03, 0.11035064E-02,-0.24256494E-02,
     + -0.26492833E-03,-0.75407792E-03,-0.10908506E-02,-0.37445189E-03,
     + -0.45289754E-03,-0.19059175E-02, 0.12317183E-02,-0.16034634E-02,
     + -0.51855313E-03,-0.22973955E-03,-0.13084217E-02,-0.23556544E-03,
     +  0.94545663E-04, 0.90335336E-04,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x12 = x11*x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x34 = x33*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x51 = x5
      x52 = x51*x5
      x53 = x52*x5
c
c                  function
c
      p_r5p65_484816old_den=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)    *x21            
     3  +coeff(  3)            *x41    
     4  +coeff(  4)                *x51
     5  +coeff(  5)    *x22            
     6  +coeff(  6)    *x21    *x41    
     7  +coeff(  7)        *x31*x41    
     8  +coeff(  8)            *x42    
      p_r5p65_484816old_den=p_r5p65_484816old_den
     9  +coeff(  9)            *x41*x51
     1  +coeff( 10)                *x52
     2  +coeff( 11)    *x22*x31        
     3  +coeff( 12)        *x33        
     4  +coeff( 13)*x11        *x41    
     5  +coeff( 14)    *x22    *x41    
     6  +coeff( 15)        *x31*x42    
     7  +coeff( 16)        *x31    *x52
     8  +coeff( 17)    *x23*x31        
      p_r5p65_484816old_den=p_r5p65_484816old_den
     9  +coeff( 18)    *x23        *x51
     1  +coeff( 19)*x11*x23            
     2  +coeff( 20)*x12    *x31        
     3  +coeff( 21)    *x24*x31        
     4  +coeff( 22)    *x22*x33        
     5  +coeff( 23)        *x33*x42    
     6  +coeff( 24)        *x33    *x52
     7  +coeff( 25)        *x33    *x53
     8  +coeff( 26)*x12    *x33        
      p_r5p65_484816old_den=p_r5p65_484816old_den
     9  +coeff( 27)        *x31        
     1  +coeff( 28)*x11                
     2  +coeff( 29)    *x21*x31        
     3  +coeff( 30)    *x21        *x51
     4  +coeff( 31)        *x31    *x51
     5  +coeff( 32)*x11*x21            
     6  +coeff( 33)    *x21    *x42    
     7  +coeff( 34)    *x22        *x51
     8  +coeff( 35)*x11*x21    *x41    
      p_r5p65_484816old_den=p_r5p65_484816old_den
     9  +coeff( 36)    *x23            
     1  +coeff( 37)*x11    *x31        
     2  +coeff( 38)    *x21*x31*x41    
     3  +coeff( 39)*x11*x21*x31        
     4  +coeff( 40)    *x22    *x42    
     5  +coeff( 41)            *x43*x52
     6  +coeff( 42)    *x24*x31*x41    
     7  +coeff( 43)            *x43    
     8  +coeff( 44)*x11            *x51
      p_r5p65_484816old_den=p_r5p65_484816old_den
     9  +coeff( 45)    *x21    *x41*x51
     1  +coeff( 46)            *x41*x52
     2  +coeff( 47)    *x22*x31*x41    
     3  +coeff( 48)*x11        *x42    
     4  +coeff( 49)*x11*x21        *x51
     5  +coeff( 50)*x11        *x41*x51
     6  +coeff( 51)        *x32        
     7  +coeff( 52)    *x21*x31    *x51
     8  +coeff( 53)        *x31*x41*x51
      p_r5p65_484816old_den=p_r5p65_484816old_den
     9  +coeff( 54)    *x21        *x52
     1  +coeff( 55)*x12                
     2  +coeff( 56)*x11*x22            
     3  +coeff( 57)    *x23    *x41    
     4  +coeff( 58)*x11    *x31*x41    
     5  +coeff( 59)    *x21    *x43    
     6  +coeff( 60)    *x22    *x41*x51
     7  +coeff( 61)*x11*x22    *x41    
     8  +coeff( 62)*x11*x21    *x42    
      p_r5p65_484816old_den=p_r5p65_484816old_den
     9  +coeff( 63)*x11*x21    *x41*x51
     1  +coeff( 64)    *x23*x31*x42    
     2  +coeff( 65)    *x23*x34        
     3  +coeff( 66)*x11*x23*x31*x41    
     4  +coeff( 67)*x12*x22    *x42*x51
     5  +coeff( 68)    *x21*x32        
     6  +coeff( 69)                *x53
     7  +coeff( 70)    *x24            
     8  +coeff( 71)    *x22*x32        
      p_r5p65_484816old_den=p_r5p65_484816old_den
     9  +coeff( 72)    *x21*x31*x42    
     1  +coeff( 73)    *x22*x31    *x51
     2  +coeff( 74)*x12*x21            
     3  +coeff( 75)*x11*x21*x31*x41    
     4  +coeff( 76)    *x23    *x42    
     5  +coeff( 77)*x11*x21*x31    *x51
     6  +coeff( 78)    *x22*x31*x41*x51
     7  +coeff( 79)    *x22    *x42*x51
     8  +coeff( 80)*x12*x22            
      p_r5p65_484816old_den=p_r5p65_484816old_den
     9  +coeff( 81)*x12*x21    *x41    
     1  +coeff( 82)*x11*x23    *x41    
     2  +coeff( 83)    *x23*x32*x41    
     3  +coeff( 84)*x11*x22    *x42    
     4  +coeff( 85)*x12*x22    *x41    
     5  +coeff( 86)*x12            *x53
     6  +coeff( 87)*x11*x22*x31*x43    
     7  +coeff( 88)        *x32*x41    
     8  +coeff( 89)        *x32    *x51
      p_r5p65_484816old_den=p_r5p65_484816old_den
     9  +coeff( 90)*x11    *x32        
c
      return
      end
      function sl_r5p65_484816old_den(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 30)
      data ncoeff/ 29/
      data avdat/ -0.2722307E-02/
      data xmin/
     1 -0.14934E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.49980E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26369E-01, 0.49957E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     +  0.14684151E-02, 0.20586634E+00,-0.10077787E-01,-0.26780376E-01,
     + -0.93687009E-02,-0.59278596E-01, 0.10904136E-01,-0.11714923E-01,
     +  0.72211060E-02,-0.38325391E-02,-0.24722373E-01,-0.69181994E-02,
     +  0.50766417E-02, 0.16058188E-01,-0.40058699E-02, 0.12262709E-01,
     + -0.21110786E-01, 0.10972636E-01, 0.13457803E-03,-0.14852000E-01,
     +  0.24204964E-02, 0.23609091E-01, 0.11105911E-01,-0.23219255E-02,
     + -0.13006987E-02, 0.40109968E-02,-0.26883972E-02, 0.23611411E-02,
     + -0.21958977E-02,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x31 = x3
      x32 = x31*x3
      x41 = x4
      x42 = x41*x4
      x51 = x5
c
c                  function
c
      sl_r5p65_484816old_den=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)    *x21            
     3  +coeff(  3)            *x41    
     4  +coeff(  4)*x11                
     5  +coeff(  5)    *x22            
     6  +coeff(  6)    *x21    *x41    
     7  +coeff(  7)    *x21        *x51
     8  +coeff(  8)*x11        *x41    
      sl_r5p65_484816old_den=sl_r5p65_484816old_den
     9  +coeff(  9)    *x23*x31        
     1  +coeff( 10)        *x31        
     2  +coeff( 11)    *x21*x31        
     3  +coeff( 12)            *x42    
     4  +coeff( 13)*x11*x21            
     5  +coeff( 14)    *x23            
     6  +coeff( 15)*x11    *x31        
     7  +coeff( 16)    *x22    *x41    
     8  +coeff( 17)    *x21    *x42    
      sl_r5p65_484816old_den=sl_r5p65_484816old_den
     9  +coeff( 18)*x11*x22            
     1  +coeff( 19)    *x23*x31*x41    
     2  +coeff( 20)    *x21*x31*x41    
     3  +coeff( 21)*x11            *x51
     4  +coeff( 22)    *x23    *x41    
     5  +coeff( 23)*x11*x22    *x41    
     6  +coeff( 24)        *x31*x41    
     7  +coeff( 25)            *x41*x51
     8  +coeff( 26)    *x22*x31        
      sl_r5p65_484816old_den=sl_r5p65_484816old_den
     9  +coeff( 27)    *x21*x32        
     1  +coeff( 28)*x11*x21    *x41    
     2  +coeff( 29)*x11        *x42    
c
      return
      end
      function x_r5p65_484816old_dex(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 91)
      data ncoeff/ 90/
      data avdat/ -0.3703576E-02/
      data xmin/
     1 -0.14934E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.49980E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26369E-01, 0.49957E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     + -0.49491934E-02, 0.28832701E+00,-0.68697473E-02, 0.13265042E+00,
     +  0.16334526E-01,-0.37964620E-01,-0.90728089E-01, 0.36226589E-01,
     +  0.26647653E-01,-0.49633987E-01,-0.19616345E-01,-0.36461543E-01,
     + -0.86441468E-02, 0.26671358E-02, 0.21846278E-01,-0.27048416E-02,
     + -0.52320906E-02,-0.35492589E-02,-0.28560160E-01, 0.37834495E-01,
     +  0.23710726E-01,-0.65821502E-02, 0.56670802E-02,-0.32698689E-02,
     +  0.13920463E-01,-0.46695913E-02, 0.88119898E-02,-0.43591027E-03,
     + -0.25716093E-02,-0.12934988E-02,-0.79071574E-03,-0.19654611E-02,
     + -0.11805377E-01, 0.12237267E-02, 0.93146798E-03, 0.28641038E-02,
     + -0.45207301E-02, 0.68071717E-02,-0.77474099E-02, 0.14300126E-02,
     + -0.12271361E-02,-0.50773020E-02,-0.16181096E-01, 0.14433867E-02,
     +  0.82424493E-03,-0.10962428E-02,-0.20843933E-02,-0.54099754E-03,
     + -0.12448515E-02,-0.69878722E-03, 0.50595065E-03, 0.26911843E-03,
     + -0.48942342E-02, 0.62786014E-03, 0.33545520E-02, 0.53104246E-03,
     +  0.49013481E-02, 0.91272587E-03,-0.54150540E-02, 0.24746461E-02,
     + -0.11858591E-02, 0.10712643E-02,-0.31468851E-03,-0.25861880E-04,
     + -0.64791617E-03, 0.13643390E-02, 0.14089451E-02,-0.19138993E-03,
     + -0.69247634E-03,-0.12761144E-02, 0.28249850E-02,-0.13512191E-03,
     +  0.14226292E-02,-0.37140964E-03,-0.23469194E-02,-0.15623242E-02,
     + -0.91510895E-03,-0.13208531E-02,-0.19488850E-02, 0.88739872E-03,
     + -0.50193263E-03, 0.60153482E-02, 0.23143888E-02, 0.62445353E-03,
     +  0.14746798E-02, 0.24877707E-03,-0.11668638E-02, 0.69360220E-03,
     + -0.16687992E-02,-0.28397632E-02,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x34 = x33*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x44 = x43*x4
      x51 = x5
      x52 = x51*x5
      x53 = x52*x5
      x54 = x53*x5
c
c                  function
c
      x_r5p65_484816old_dex=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)    *x21            
     3  +coeff(  3)            *x41    
     4  +coeff(  4)                *x51
     5  +coeff(  5)    *x22            
     6  +coeff(  6)    *x21*x31        
     7  +coeff(  7)    *x21    *x41    
     8  +coeff(  8)    *x21        *x51
      x_r5p65_484816old_dex=x_r5p65_484816old_dex
     9  +coeff(  9)    *x23            
     1  +coeff( 10)*x11                
     2  +coeff( 11)*x11        *x41    
     3  +coeff( 12)    *x21    *x42    
     4  +coeff( 13)*x11    *x31        
     5  +coeff( 14)    *x23*x31*x41    
     6  +coeff( 15)*x11*x22            
     7  +coeff( 16)        *x31        
     8  +coeff( 17)            *x42    
      x_r5p65_484816old_dex=x_r5p65_484816old_dex
     9  +coeff( 18)                *x52
     1  +coeff( 19)    *x21*x31*x41    
     2  +coeff( 20)    *x23    *x41    
     3  +coeff( 21)*x11*x22    *x41    
     4  +coeff( 22)    *x21*x32        
     5  +coeff( 23)    *x22    *x41    
     6  +coeff( 24)    *x21    *x41*x51
     7  +coeff( 25)    *x23*x31        
     8  +coeff( 26)*x11        *x42    
      x_r5p65_484816old_dex=x_r5p65_484816old_dex
     9  +coeff( 27)*x11*x22*x31        
     1  +coeff( 28)*x11    *x33*x41    
     2  +coeff( 29)        *x31*x41    
     3  +coeff( 30)            *x41*x51
     4  +coeff( 31)    *x21*x31    *x51
     5  +coeff( 32)    *x24            
     6  +coeff( 33)    *x21    *x43    
     7  +coeff( 34)*x11*x21            
     8  +coeff( 35)*x11            *x51
      x_r5p65_484816old_dex=x_r5p65_484816old_dex
     9  +coeff( 36)*x11*x21    *x41    
     1  +coeff( 37)*x11    *x31*x41    
     2  +coeff( 38)    *x23*x31*x42    
     3  +coeff( 39)*x11*x24            
     4  +coeff( 40)    *x22*x31        
     5  +coeff( 41)    *x21        *x52
     6  +coeff( 42)    *x21*x32*x41    
     7  +coeff( 43)    *x21*x31*x42    
     8  +coeff( 44)    *x23        *x51
      x_r5p65_484816old_dex=x_r5p65_484816old_dex
     9  +coeff( 45)*x11*x21*x31        
     1  +coeff( 46)*x11    *x32        
     2  +coeff( 47)*x11*x22*x31    *x53
     3  +coeff( 48)        *x32        
     4  +coeff( 49)            *x43    
     5  +coeff( 50)            *x42*x51
     6  +coeff( 51)    *x22*x31*x42    
     7  +coeff( 52)    *x22    *x43    
     8  +coeff( 53)    *x21    *x44    
      x_r5p65_484816old_dex=x_r5p65_484816old_dex
     9  +coeff( 54)*x11*x21        *x51
     1  +coeff( 55)    *x24    *x41*x51
     2  +coeff( 56)*x11*x21*x31    *x51
     3  +coeff( 57)    *x24*x32*x42    
     4  +coeff( 58)*x11    *x31*x43    
     5  +coeff( 59)*x11*x24*x32*x41    
     6  +coeff( 60)*x11*x22    *x42*x53
     7  +coeff( 61)        *x31*x42    
     8  +coeff( 62)    *x22        *x51
      x_r5p65_484816old_dex=x_r5p65_484816old_dex
     9  +coeff( 63)            *x41*x52
     1  +coeff( 64)    *x22*x32        
     2  +coeff( 65)    *x21*x33        
     3  +coeff( 66)    *x22*x31*x41    
     4  +coeff( 67)    *x22    *x42    
     5  +coeff( 68)        *x31*x43    
     6  +coeff( 69)            *x44    
     7  +coeff( 70)        *x31*x42*x51
     8  +coeff( 71)    *x21    *x41*x52
      x_r5p65_484816old_dex=x_r5p65_484816old_dex
     9  +coeff( 72)            *x41*x53
     1  +coeff( 73)    *x23*x32        
     2  +coeff( 74)        *x34*x41    
     3  +coeff( 75)    *x21*x31*x43    
     4  +coeff( 76)    *x23*x31    *x51
     5  +coeff( 77)    *x22*x32    *x51
     6  +coeff( 78)    *x23    *x41*x51
     7  +coeff( 79)    *x21    *x43*x51
     8  +coeff( 80)    *x21*x32    *x52
      x_r5p65_484816old_dex=x_r5p65_484816old_dex
     9  +coeff( 81)    *x22        *x53
     1  +coeff( 82)    *x23    *x43    
     2  +coeff( 83)    *x21*x31*x44    
     3  +coeff( 84)    *x22*x33    *x51
     4  +coeff( 85)        *x31*x44*x51
     5  +coeff( 86)*x11            *x52
     6  +coeff( 87)    *x22    *x42*x52
     7  +coeff( 88)    *x23        *x53
     8  +coeff( 89)    *x22    *x41*x53
      x_r5p65_484816old_dex=x_r5p65_484816old_dex
     9  +coeff( 90)    *x21    *x41*x54
c
      return
      end
      function t_r5p65_484816old_dex(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 91)
      data ncoeff/ 90/
      data avdat/  0.5929024E+00/
      data xmin/
     1 -0.14934E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.49980E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26369E-01, 0.49957E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     +  0.17334304E-02,-0.89266151E-01, 0.11941150E-02, 0.30582324E-01,
     +  0.11430576E-01, 0.25748048E-01,-0.65379911E-02, 0.54093516E-02,
     + -0.39625634E-02, 0.10748179E-01,-0.14299594E-02,-0.81477882E-02,
     +  0.23603779E-02, 0.97216973E-02,-0.52665635E-02,-0.90603036E-03,
     +  0.88694826E-03,-0.14689158E-02,-0.12194879E-02, 0.72548664E-02,
     + -0.70096541E-03,-0.10818255E-01,-0.65756775E-02, 0.63940918E-03,
     + -0.58270496E-03, 0.14877554E-02, 0.16029779E-02,-0.11817621E-02,
     + -0.25518609E-02,-0.11182908E-03,-0.36751002E-03,-0.81624236E-03,
     +  0.94717578E-03, 0.47754808E-03, 0.16887455E-03,-0.10771336E-02,
     +  0.51029632E-03,-0.59699512E-03, 0.16159045E-02,-0.11932842E-02,
     + -0.81610621E-03,-0.12669108E-03,-0.41746342E-03, 0.34004016E-03,
     + -0.52935473E-03, 0.33649760E-02, 0.29687404E-02, 0.10796133E-02,
     + -0.48531653E-03, 0.10133895E-03, 0.40393832E-04, 0.73339732E-04,
     + -0.92403636E-04, 0.17506088E-03,-0.32180009E-03, 0.13061693E-02,
     +  0.73888310E-04, 0.66553440E-03, 0.30048314E-03,-0.37427459E-03,
     +  0.11793161E-02,-0.57200046E-03, 0.25733159E-03, 0.46682861E-04,
     + -0.97821081E-04, 0.25504452E-03, 0.13394015E-03,-0.91438582E-04,
     +  0.11862253E-03,-0.87111192E-04, 0.57088990E-04,-0.47885344E-04,
     + -0.47867321E-04, 0.25949016E-03, 0.20659021E-03,-0.16942434E-03,
     +  0.54713147E-03,-0.14284338E-03,-0.98139964E-04, 0.51423529E-03,
     +  0.40593295E-03, 0.26487446E-03, 0.39016336E-03,-0.71110483E-03,
     + -0.55258698E-03,-0.29403708E-03,-0.88955433E-03,-0.27202111E-03,
     + -0.55668544E-03, 0.13721986E-03,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x12 = x11*x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x34 = x33*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x44 = x43*x4
      x51 = x5
      x52 = x51*x5
      x53 = x52*x5
c
c                  function
c
      t_r5p65_484816old_dex=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)    *x21            
     3  +coeff(  3)            *x41    
     4  +coeff(  4)                *x51
     5  +coeff(  5)*x11                
     6  +coeff(  6)    *x21    *x41    
     7  +coeff(  7)    *x21        *x51
     8  +coeff(  8)*x11        *x41    
      t_r5p65_484816old_dex=t_r5p65_484816old_dex
     9  +coeff(  9)    *x23*x31        
     1  +coeff( 10)    *x21*x31        
     2  +coeff( 11)                *x52
     3  +coeff( 12)    *x23            
     4  +coeff( 13)*x11    *x31        
     5  +coeff( 14)    *x21    *x42    
     6  +coeff( 15)*x11*x22            
     7  +coeff( 16)    *x23*x31*x41    
     8  +coeff( 17)        *x31        
      t_r5p65_484816old_dex=t_r5p65_484816old_dex
     9  +coeff( 18)    *x22            
     1  +coeff( 19)            *x41*x51
     2  +coeff( 20)    *x21*x31*x41    
     3  +coeff( 21)*x11            *x51
     4  +coeff( 22)    *x23    *x41    
     5  +coeff( 23)*x11*x22    *x41    
     6  +coeff( 24)        *x31*x41    
     7  +coeff( 25)            *x42    
     8  +coeff( 26)    *x21*x32        
      t_r5p65_484816old_dex=t_r5p65_484816old_dex
     9  +coeff( 27)*x11        *x42    
     1  +coeff( 28)*x12*x21            
     2  +coeff( 29)*x11*x22*x31        
     3  +coeff( 30)*x11    *x33*x41    
     4  +coeff( 31)*x11*x21            
     5  +coeff( 32)    *x22*x31        
     6  +coeff( 33)    *x22        *x51
     7  +coeff( 34)    *x21    *x41*x51
     8  +coeff( 35)        *x31*x41*x51
      t_r5p65_484816old_dex=t_r5p65_484816old_dex
     9  +coeff( 36)            *x42*x51
     1  +coeff( 37)    *x21        *x52
     2  +coeff( 38)            *x41*x52
     3  +coeff( 39)*x11    *x31*x41    
     4  +coeff( 40)*x12*x21    *x41    
     5  +coeff( 41)    *x22    *x41    
     6  +coeff( 42)*x12                
     7  +coeff( 43)*x11*x21*x31        
     8  +coeff( 44)*x11    *x32        
      t_r5p65_484816old_dex=t_r5p65_484816old_dex
     9  +coeff( 45)*x11*x21    *x41    
     1  +coeff( 46)    *x21*x31*x42    
     2  +coeff( 47)    *x21    *x43    
     3  +coeff( 48)    *x22    *x41*x51
     4  +coeff( 49)*x12*x21*x31        
     5  +coeff( 50)    *x23*x32*x41    
     6  +coeff( 51)    *x21*x34*x41    
     7  +coeff( 52)        *x31    *x51
     8  +coeff( 53)    *x21*x31    *x51
      t_r5p65_484816old_dex=t_r5p65_484816old_dex
     9  +coeff( 54)    *x21*x33        
     1  +coeff( 55)    *x22*x31*x41    
     2  +coeff( 56)    *x21*x32*x41    
     3  +coeff( 57)*x11*x21        *x51
     4  +coeff( 58)    *x21    *x42*x51
     5  +coeff( 59)    *x22        *x52
     6  +coeff( 60)            *x42*x52
     7  +coeff( 61)    *x21    *x44    
     8  +coeff( 62)    *x24        *x51
      t_r5p65_484816old_dex=t_r5p65_484816old_dex
     9  +coeff( 63)*x11*x21    *x41*x51
     1  +coeff( 64)                *x53
     2  +coeff( 65)    *x22*x32        
     3  +coeff( 66)    *x22    *x42    
     4  +coeff( 67)            *x44    
     5  +coeff( 68)*x11        *x41*x51
     6  +coeff( 69)    *x21    *x41*x52
     7  +coeff( 70)        *x31*x41*x52
     8  +coeff( 71)*x11*x23            
      t_r5p65_484816old_dex=t_r5p65_484816old_dex
     9  +coeff( 72)*x12    *x31        
     1  +coeff( 73)*x12        *x41    
     2  +coeff( 74)*x11    *x31*x42    
     3  +coeff( 75)*x11        *x43    
     4  +coeff( 76)    *x22    *x43    
     5  +coeff( 77)    *x21*x31*x43    
     6  +coeff( 78)*x11*x22        *x51
     7  +coeff( 79)*x11        *x42*x51
     8  +coeff( 80)    *x22    *x42*x51
      t_r5p65_484816old_dex=t_r5p65_484816old_dex
     9  +coeff( 81)    *x21    *x43*x51
     1  +coeff( 82)    *x22    *x41*x52
     2  +coeff( 83)*x11*x24            
     3  +coeff( 84)*x11*x22*x31*x41    
     4  +coeff( 85)*x11*x22    *x42    
     5  +coeff( 86)*x11    *x32*x42    
     6  +coeff( 87)    *x23    *x43    
     7  +coeff( 88)*x11    *x31*x43    
     8  +coeff( 89)    *x23    *x42*x51
      t_r5p65_484816old_dex=t_r5p65_484816old_dex
     9  +coeff( 90)*x11*x22        *x52
c
      return
      end
      function y_r5p65_484816old_dex(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 96)
      data ncoeff/ 95/
      data avdat/  0.1496580E-01/
      data xmin/
     1 -0.14934E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.49980E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26369E-01, 0.49957E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     +  0.72680120E-02,-0.17203918E-01, 0.65083846E-01,-0.85913418E-02,
     +  0.28475121E-01, 0.86577795E-02, 0.98929871E-02,-0.64359447E-02,
     + -0.45761526E-01, 0.83828643E-02, 0.50676838E-01,-0.36572792E-01,
     + -0.79795644E-02, 0.51929867E-02, 0.10809850E-01, 0.74810808E-03,
     +  0.60219252E-02,-0.40116590E-01,-0.38331465E-02,-0.14013664E-01,
     +  0.10933469E-01,-0.11268664E-01,-0.65798660E-04, 0.25247326E-02,
     + -0.48987339E-02,-0.49270228E-02,-0.17042198E-02,-0.32729591E-03,
     + -0.28447227E-02, 0.25838602E-03,-0.46137222E-04, 0.42219998E-03,
     +  0.11216823E-03, 0.24949240E-04, 0.47238697E-02,-0.11108225E-01,
     + -0.32839226E-02, 0.62082958E-03, 0.54838839E-02,-0.32025345E-02,
     +  0.32275240E-02, 0.97054616E-02,-0.14244033E-02, 0.55543804E-02,
     +  0.19010945E-02,-0.42175900E-03, 0.45005858E-03,-0.59560570E-03,
     + -0.33547801E-02, 0.12241537E-02,-0.72620972E-03, 0.39631687E-02,
     +  0.13345899E-02,-0.43641580E-02,-0.20449702E-02,-0.30785869E-02,
     + -0.30851478E-02, 0.40916665E-03,-0.27598673E-02,-0.17490897E-02,
     +  0.16460710E-03,-0.76803559E-03,-0.10978532E-02, 0.11842103E-02,
     +  0.30244738E-03,-0.68303104E-03,-0.59175938E-02,-0.33795896E-02,
     + -0.51855016E-03,-0.86277758E-03,-0.42098141E-03, 0.84400701E-03,
     + -0.28866935E-02,-0.64216182E-03, 0.14798634E-02,-0.32400910E-02,
     +  0.72548987E-03,-0.23196575E-03,-0.17907865E-03, 0.86814055E-03,
     + -0.16879119E-02, 0.75297238E-03, 0.56816969E-03, 0.54437027E-03,
     +  0.46356770E-03, 0.61803038E-03,-0.25378927E-02,-0.15687314E-02,
     +  0.36675687E-03, 0.31575546E-03, 0.11267217E-02,-0.12794284E-02,
     + -0.49915892E-03, 0.67211239E-03,-0.39121826E-03,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x12 = x11*x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x34 = x33*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x44 = x43*x4
      x45 = x44*x4
      x51 = x5
      x52 = x51*x5
      x53 = x52*x5
      x54 = x53*x5
c
c                  function
c
      y_r5p65_484816old_dex=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)        *x31        
     3  +coeff(  3)            *x41    
     4  +coeff(  4)    *x21            
     5  +coeff(  5)                *x51
     6  +coeff(  6)        *x31*x41    
     7  +coeff(  7)            *x42    
     8  +coeff(  8)    *x21*x31        
      y_r5p65_484816old_dex=y_r5p65_484816old_dex
     9  +coeff(  9)    *x21    *x41    
     1  +coeff( 10)        *x31    *x51
     2  +coeff( 11)            *x41*x51
     3  +coeff( 12)    *x22            
     4  +coeff( 13)    *x21        *x51
     5  +coeff( 14)                *x52
     6  +coeff( 15)    *x21    *x42    
     7  +coeff( 16)*x11    *x31        
     8  +coeff( 17)*x11        *x41    
      y_r5p65_484816old_dex=y_r5p65_484816old_dex
     9  +coeff( 18)    *x22    *x41    
     1  +coeff( 19)            *x41*x52
     2  +coeff( 20)*x11*x21            
     3  +coeff( 21)    *x23            
     4  +coeff( 22)    *x22        *x51
     5  +coeff( 23)        *x34        
     6  +coeff( 24)*x11        *x42    
     7  +coeff( 25)*x11*x21    *x41    
     8  +coeff( 26)    *x22    *x41*x51
      y_r5p65_484816old_dex=y_r5p65_484816old_dex
     9  +coeff( 27)*x12                
     1  +coeff( 28)            *x45    
     2  +coeff( 29)*x11*x21        *x51
     3  +coeff( 30)    *x22*x33        
     4  +coeff( 31)    *x21    *x43*x51
     5  +coeff( 32)    *x24*x31        
     6  +coeff( 33)*x11*x21*x33        
     7  +coeff( 34)        *x33        
     8  +coeff( 35)    *x21*x31*x41    
      y_r5p65_484816old_dex=y_r5p65_484816old_dex
     9  +coeff( 36)    *x22*x31        
     1  +coeff( 37)    *x21    *x41*x51
     2  +coeff( 38)*x11            *x51
     3  +coeff( 39)    *x21    *x43    
     4  +coeff( 40)*x11*x21*x31        
     5  +coeff( 41)*x11*x22            
     6  +coeff( 42)    *x24            
     7  +coeff( 43)*x12        *x41    
     8  +coeff( 44)*x11*x23            
      y_r5p65_484816old_dex=y_r5p65_484816old_dex
     9  +coeff( 45)        *x32        
     1  +coeff( 46)*x11                
     2  +coeff( 47)        *x32*x41    
     3  +coeff( 48)        *x31*x42    
     4  +coeff( 49)            *x43    
     5  +coeff( 50)        *x31*x41*x51
     6  +coeff( 51)        *x31    *x52
     7  +coeff( 52)    *x21*x31*x42    
     8  +coeff( 53)*x11    *x31*x41    
      y_r5p65_484816old_dex=y_r5p65_484816old_dex
     9  +coeff( 54)    *x22*x31*x41    
     1  +coeff( 55)    *x22*x31    *x51
     2  +coeff( 56)*x11*x21*x31*x41    
     3  +coeff( 57)*x11*x21    *x42    
     4  +coeff( 58)            *x42*x53
     5  +coeff( 59)*x11*x22    *x41    
     6  +coeff( 60)*x11*x21    *x41*x51
     7  +coeff( 61)    *x22*x34        
     8  +coeff( 62)                *x53
      y_r5p65_484816old_dex=y_r5p65_484816old_dex
     9  +coeff( 63)    *x22    *x42    
     1  +coeff( 64)    *x23*x31        
     2  +coeff( 65)        *x34    *x51
     3  +coeff( 66)*x11*x21*x32        
     4  +coeff( 67)    *x23    *x42    
     5  +coeff( 68)    *x22    *x42*x51
     6  +coeff( 69)*x12    *x31        
     7  +coeff( 70)*x11*x21*x31    *x51
     8  +coeff( 71)*x12            *x51
      y_r5p65_484816old_dex=y_r5p65_484816old_dex
     9  +coeff( 72)            *x43*x53
     1  +coeff( 73)*x11*x22    *x42    
     2  +coeff( 74)*x12*x21    *x41    
     3  +coeff( 75)*x12*x22            
     4  +coeff( 76)    *x24    *x43    
     5  +coeff( 77)    *x22    *x42*x54
     6  +coeff( 78)    *x21*x31    *x51
     7  +coeff( 79)    *x21        *x52
     8  +coeff( 80)    *x21*x32*x41    
      y_r5p65_484816old_dex=y_r5p65_484816old_dex
     9  +coeff( 81)    *x22*x32        
     1  +coeff( 82)    *x21    *x42*x51
     2  +coeff( 83)    *x23    *x41    
     3  +coeff( 84)    *x21    *x41*x52
     4  +coeff( 85)    *x23        *x51
     5  +coeff( 86)    *x22        *x52
     6  +coeff( 87)    *x23*x31*x41    
     7  +coeff( 88)    *x22*x31*x41*x51
     8  +coeff( 89)*x11*x21        *x52
      y_r5p65_484816old_dex=y_r5p65_484816old_dex
     9  +coeff( 90)*x11    *x31*x42*x51
     1  +coeff( 91)    *x22*x31*x42*x51
     2  +coeff( 92)*x11*x22*x31*x41    
     3  +coeff( 93)*x12        *x42    
     4  +coeff( 94)*x11*x21    *x45    
     5  +coeff( 95)*x12    *x33*x41    
c
      return
      end
      function p_r5p65_484816old_dex(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 91)
      data ncoeff/ 90/
      data avdat/  0.3655719E-02/
      data xmin/
     1 -0.14934E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.49980E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26369E-01, 0.49957E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     + -0.14504601E-03,-0.15388018E-02,-0.66118776E-02,-0.37325595E-02,
     +  0.39432659E-02, 0.19937306E-04,-0.44737011E-02,-0.11592743E-02,
     + -0.10122093E-01, 0.92190882E-03, 0.10702146E-02,-0.22088876E-02,
     +  0.16017971E-02, 0.11121855E-01, 0.13798813E-02,-0.14611594E-02,
     +  0.24733283E-02,-0.11768767E-02, 0.14011690E-02,-0.70645101E-02,
     +  0.25093292E-02,-0.29072736E-02,-0.18161464E-02,-0.71059266E-03,
     +  0.18902037E-03, 0.11652971E-02,-0.89353358E-03, 0.17775057E-03,
     + -0.38000548E-03,-0.22515855E-03, 0.64350892E-03, 0.16572466E-02,
     +  0.10033357E-02,-0.15826253E-02, 0.19789101E-03,-0.33290609E-03,
     +  0.32993543E-03,-0.28174542E-03,-0.31242339E-03, 0.70597650E-03,
     +  0.59540034E-03, 0.11873461E-02, 0.58954215E-03, 0.68305666E-03,
     + -0.22478186E-03,-0.80602022E-03, 0.19648887E-04,-0.16835608E-03,
     +  0.84449304E-04,-0.12571954E-03, 0.29242525E-03,-0.45359839E-03,
     + -0.16604700E-03,-0.16713566E-02,-0.12159251E-03, 0.52836709E-04,
     +  0.72044037E-04, 0.30182258E-03,-0.42209729E-04, 0.32407226E-03,
     + -0.11507131E-03,-0.86671404E-04, 0.97405427E-03, 0.82946222E-04,
     +  0.24877212E-03, 0.10253002E-03,-0.55766672E-04,-0.25025921E-03,
     + -0.84107497E-03,-0.16940391E-03,-0.19117229E-03,-0.44779564E-03,
     +  0.42736827E-03,-0.79315912E-03, 0.17585816E-03,-0.13350666E-03,
     +  0.13815143E-04,-0.59495505E-03, 0.25795051E-03, 0.25335012E-03,
     + -0.65892481E-03,-0.44086835E-03,-0.60850580E-03, 0.23725497E-04,
     +  0.17995379E-03, 0.97795753E-04, 0.16564383E-03, 0.19986182E-04,
     + -0.25809806E-04, 0.59756276E-04,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x12 = x11*x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x51 = x5
      x52 = x51*x5
      x53 = x52*x5
c
c                  function
c
      p_r5p65_484816old_dex=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)    *x21            
     3  +coeff(  3)        *x31        
     4  +coeff(  4)            *x41    
     5  +coeff(  5)                *x51
     6  +coeff(  6)*x11                
     7  +coeff(  7)    *x22            
     8  +coeff(  8)    *x21*x31        
      p_r5p65_484816old_dex=p_r5p65_484816old_dex
     9  +coeff(  9)    *x21    *x41    
     1  +coeff( 10)        *x31*x41    
     2  +coeff( 11)            *x42    
     3  +coeff( 12)    *x21        *x51
     4  +coeff( 13)        *x31    *x51
     5  +coeff( 14)            *x41*x51
     6  +coeff( 15)                *x52
     7  +coeff( 16)*x11*x21            
     8  +coeff( 17)    *x23            
      p_r5p65_484816old_dex=p_r5p65_484816old_dex
     9  +coeff( 18)    *x22*x31        
     1  +coeff( 19)*x11        *x41    
     2  +coeff( 20)    *x22    *x41    
     3  +coeff( 21)    *x21    *x42    
     4  +coeff( 22)    *x22        *x51
     5  +coeff( 23)    *x21    *x41*x51
     6  +coeff( 24)*x11*x21        *x51
     7  +coeff( 25)        *x32        
     8  +coeff( 26)    *x21*x31*x41    
      p_r5p65_484816old_dex=p_r5p65_484816old_dex
     9  +coeff( 27)            *x43    
     1  +coeff( 28)*x11            *x51
     2  +coeff( 29)            *x41*x52
     3  +coeff( 30)*x12                
     4  +coeff( 31)*x11*x22            
     5  +coeff( 32)    *x24            
     6  +coeff( 33)    *x22    *x42    
     7  +coeff( 34)    *x22    *x41*x51
     8  +coeff( 35)*x11    *x31        
      p_r5p65_484816old_dex=p_r5p65_484816old_dex
     9  +coeff( 36)        *x31*x42    
     1  +coeff( 37)        *x31*x41*x51
     2  +coeff( 38)    *x21        *x52
     3  +coeff( 39)*x11*x21*x31        
     4  +coeff( 40)    *x23    *x41    
     5  +coeff( 41)*x11        *x42    
     6  +coeff( 42)    *x21    *x43    
     7  +coeff( 43)    *x23        *x51
     8  +coeff( 44)*x11*x23            
      p_r5p65_484816old_dex=p_r5p65_484816old_dex
     9  +coeff( 45)*x12        *x41    
     1  +coeff( 46)*x11*x22    *x41    
     2  +coeff( 47)*x11    *x33*x41    
     3  +coeff( 48)    *x23*x31*x42    
     4  +coeff( 49)*x11*x21    *x43*x51
     5  +coeff( 50)                *x53
     6  +coeff( 51)*x11    *x31*x41    
     7  +coeff( 52)    *x22*x31    *x51
     8  +coeff( 53)    *x21    *x41*x52
      p_r5p65_484816old_dex=p_r5p65_484816old_dex
     9  +coeff( 54)    *x23    *x42    
     1  +coeff( 55)*x12            *x51
     2  +coeff( 56)    *x21*x31    *x51
     3  +coeff( 57)        *x32    *x51
     4  +coeff( 58)            *x42*x51
     5  +coeff( 59)        *x31    *x52
     6  +coeff( 60)    *x23*x31        
     7  +coeff( 61)    *x22*x32        
     8  +coeff( 62)*x11*x21    *x41    
      p_r5p65_484816old_dex=p_r5p65_484816old_dex
     9  +coeff( 63)    *x21*x31*x42    
     1  +coeff( 64)*x11        *x41*x51
     2  +coeff( 65)    *x21    *x42*x51
     3  +coeff( 66)    *x22        *x52
     4  +coeff( 67)*x12    *x31        
     5  +coeff( 68)*x11*x21*x31*x41    
     6  +coeff( 69)    *x23*x31*x41    
     7  +coeff( 70)*x11*x21    *x42    
     8  +coeff( 71)*x11*x21*x31    *x51
      p_r5p65_484816old_dex=p_r5p65_484816old_dex
     9  +coeff( 72)*x11*x21    *x41*x51
     1  +coeff( 73)    *x23    *x41*x51
     2  +coeff( 74)    *x22    *x42*x51
     3  +coeff( 75)*x12*x22            
     4  +coeff( 76)*x12*x21    *x41    
     5  +coeff( 77)    *x23*x32*x41    
     6  +coeff( 78)*x11*x22    *x42    
     7  +coeff( 79)*x11*x21    *x43    
     8  +coeff( 80)    *x24*x31*x42    
      p_r5p65_484816old_dex=p_r5p65_484816old_dex
     9  +coeff( 81)    *x24*x31*x41*x51
     1  +coeff( 82)*x11*x24*x31*x41    
     2  +coeff( 83)*x11*x23*x33*x41*x51
     3  +coeff( 84)*x11    *x32        
     4  +coeff( 85)    *x21*x32*x41    
     5  +coeff( 86)    *x21*x31*x41*x51
     6  +coeff( 87)            *x43*x51
     7  +coeff( 88)*x11            *x52
     8  +coeff( 89)        *x31*x41*x52
      p_r5p65_484816old_dex=p_r5p65_484816old_dex
     9  +coeff( 90)            *x42*x52
c
      return
      end
      function sl_r5p65_484816old_dex(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 30)
      data ncoeff/ 29/
      data avdat/ -0.1022953E-01/
      data xmin/
     1 -0.14934E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.49980E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26369E-01, 0.49957E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     +  0.11932809E-01,-0.40833977E+00,-0.98420478E-01, 0.64462654E-01,
     + -0.33077501E-01, 0.13078120E+00,-0.36276873E-01, 0.26327886E-01,
     + -0.20847604E-01, 0.55653382E-01,-0.39598808E-01, 0.11377973E-01,
     +  0.47754083E-01,-0.25112264E-01, 0.19328041E-02, 0.36835633E-02,
     +  0.32210052E-01,-0.31964169E-02,-0.54040845E-01,-0.29795632E-01,
     +  0.19022304E-02, 0.20709536E-02, 0.16568751E-02, 0.56055663E-02,
     +  0.58235480E-02,-0.57710353E-02,-0.11280628E-01, 0.64512021E-02,
     + -0.37492495E-02,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x12 = x11*x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x41 = x4
      x42 = x41*x4
      x51 = x5
      x52 = x51*x5
c
c                  function
c
      sl_r5p65_484816old_dex=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)    *x21            
     3  +coeff(  3)                *x51
     4  +coeff(  4)*x11                
     5  +coeff(  5)    *x22            
     6  +coeff(  6)    *x21    *x41    
     7  +coeff(  7)    *x21        *x51
     8  +coeff(  8)*x11        *x41    
      sl_r5p65_484816old_dex=sl_r5p65_484816old_dex
     9  +coeff(  9)    *x23*x31        
     1  +coeff( 10)    *x21*x31        
     2  +coeff( 11)    *x23            
     3  +coeff( 12)*x11    *x31        
     4  +coeff( 13)    *x21    *x42    
     5  +coeff( 14)*x11*x22            
     6  +coeff( 15)    *x23*x31*x41    
     7  +coeff( 16)            *x41    
     8  +coeff( 17)    *x21*x31*x41    
      sl_r5p65_484816old_dex=sl_r5p65_484816old_dex
     9  +coeff( 18)*x11            *x51
     1  +coeff( 19)    *x23    *x41    
     2  +coeff( 20)*x11*x22    *x41    
     3  +coeff( 21)        *x31        
     4  +coeff( 22)                *x52
     5  +coeff( 23)*x11*x21            
     6  +coeff( 24)    *x21*x32        
     7  +coeff( 25)*x11        *x42    
     8  +coeff( 26)*x12*x21            
      sl_r5p65_484816old_dex=sl_r5p65_484816old_dex
     9  +coeff( 27)*x11*x22*x31        
     1  +coeff( 28)*x11    *x33*x41    
     2  +coeff( 29)*x12        *x42    
c
      return
      end
      function x_r5p65_484816old_q3ent(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 91)
      data ncoeff/ 90/
      data avdat/ -0.3038388E-02/
      data xmin/
     1 -0.14915E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.49980E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26369E-01, 0.49957E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     + -0.12352692E-02, 0.18131775E+00,-0.46690856E-02, 0.13808127E+00,
     +  0.18699257E-01,-0.59535589E-01, 0.28447464E-01,-0.60896068E-02,
     +  0.18677363E-01,-0.34186985E-01, 0.90935277E-02,-0.12719380E-01,
     + -0.25109369E-01,-0.24263488E-01,-0.56718625E-02, 0.83218631E-03,
     +  0.14105326E-01,-0.17932628E-02,-0.43711346E-02,-0.18378980E-01,
     +  0.23884401E-01, 0.15270570E-01,-0.19289074E-02,-0.44535561E-02,
     + -0.39770342E-02,-0.11249677E-02, 0.60106572E-02,-0.15497529E-02,
     +  0.25433206E-02,-0.10825821E-02, 0.18698901E-02,-0.29719903E-02,
     + -0.29779628E-02,-0.27581991E-03,-0.42782549E-03,-0.62090222E-03,
     + -0.74047555E-03,-0.94843246E-02,-0.85006095E-02, 0.20810706E-02,
     +  0.57983645E-04,-0.73456758E-03, 0.24722831E-02,-0.49373945E-02,
     + -0.17816115E-03,-0.88517304E-03,-0.73395960E-03, 0.14999176E-03,
     +  0.25309325E-03,-0.39202925E-02,-0.85911568E-04, 0.20524377E-02,
     + -0.40624812E-02,-0.13782119E-03, 0.43928227E-03, 0.12438595E-02,
     +  0.56977258E-02, 0.33694811E-03,-0.12958026E-03, 0.27936371E-03,
     +  0.80511486E-03, 0.37227836E-02, 0.96003566E-03,-0.55838772E-03,
     +  0.10093726E-02, 0.20269298E-02,-0.15268427E-02,-0.61020686E-03,
     + -0.72976219E-03,-0.40881650E-03,-0.46742952E-03, 0.16398146E-02,
     + -0.46646944E-03, 0.17480791E-02, 0.11856212E-03, 0.12122503E-02,
     + -0.22463345E-03,-0.32275359E-02,-0.98675862E-03, 0.11624339E-02,
     + -0.13246435E-02, 0.68571157E-03,-0.40875984E-03,-0.48031696E-03,
     +  0.42724689E-02, 0.56108541E-03,-0.61361358E-03,-0.17295635E-02,
     + -0.17279556E-02,-0.28864678E-03,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x34 = x33*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x44 = x43*x4
      x51 = x5
      x52 = x51*x5
      x53 = x52*x5
      x54 = x53*x5
c
c                  function
c
      x_r5p65_484816old_q3ent=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)    *x21            
     3  +coeff(  3)            *x41    
     4  +coeff(  4)                *x51
     5  +coeff(  5)    *x22            
     6  +coeff(  6)    *x21    *x41    
     7  +coeff(  7)    *x21        *x51
     8  +coeff(  8)                *x52
      x_r5p65_484816old_q3ent=x_r5p65_484816old_q3ent
     9  +coeff(  9)    *x23            
     1  +coeff( 10)*x11                
     2  +coeff( 11)    *x23*x31        
     3  +coeff( 12)*x11        *x41    
     4  +coeff( 13)    *x21*x31        
     5  +coeff( 14)    *x21    *x42    
     6  +coeff( 15)*x11    *x31        
     7  +coeff( 16)    *x23*x31*x41    
     8  +coeff( 17)*x11*x22            
      x_r5p65_484816old_q3ent=x_r5p65_484816old_q3ent
     9  +coeff( 18)        *x31        
     1  +coeff( 19)            *x42    
     2  +coeff( 20)    *x21*x31*x41    
     3  +coeff( 21)    *x23    *x41    
     4  +coeff( 22)*x11*x22    *x41    
     5  +coeff( 23)        *x31*x41    
     6  +coeff( 24)    *x21*x32        
     7  +coeff( 25)    *x21    *x41*x51
     8  +coeff( 26)*x11*x21            
      x_r5p65_484816old_q3ent=x_r5p65_484816old_q3ent
     9  +coeff( 27)*x11*x22*x31        
     1  +coeff( 28)            *x41*x51
     2  +coeff( 29)    *x22        *x51
     3  +coeff( 30)    *x21*x31    *x51
     4  +coeff( 31)*x11*x21    *x41    
     5  +coeff( 32)*x11    *x31*x41    
     6  +coeff( 33)*x11        *x42    
     7  +coeff( 34)    *x23    *x44    
     8  +coeff( 35)        *x32        
      x_r5p65_484816old_q3ent=x_r5p65_484816old_q3ent
     9  +coeff( 36)    *x22*x31        
     1  +coeff( 37)    *x21        *x52
     2  +coeff( 38)    *x21*x31*x42    
     3  +coeff( 39)    *x21    *x43    
     4  +coeff( 40)    *x24    *x41    
     5  +coeff( 41)*x11            *x51
     6  +coeff( 42)*x11    *x32        
     7  +coeff( 43)    *x23*x32*x41    
     8  +coeff( 44)*x11*x24            
      x_r5p65_484816old_q3ent=x_r5p65_484816old_q3ent
     9  +coeff( 45)        *x31    *x51
     1  +coeff( 46)            *x43    
     2  +coeff( 47)            *x42*x51
     3  +coeff( 48)            *x41*x52
     4  +coeff( 49)                *x53
     5  +coeff( 50)    *x21*x32*x41    
     6  +coeff( 51)        *x31*x43    
     7  +coeff( 52)    *x23        *x51
     8  +coeff( 53)    *x21    *x44    
      x_r5p65_484816old_q3ent=x_r5p65_484816old_q3ent
     9  +coeff( 54)        *x31*x44    
     1  +coeff( 55)*x11*x21*x31        
     2  +coeff( 56)    *x22*x32*x42    
     3  +coeff( 57)    *x23    *x43    
     4  +coeff( 58)*x11*x21        *x51
     5  +coeff( 59)*x11    *x31    *x51
     6  +coeff( 60)*x11            *x52
     7  +coeff( 61)*x11*x23            
     8  +coeff( 62)    *x23*x31*x43    
      x_r5p65_484816old_q3ent=x_r5p65_484816old_q3ent
     9  +coeff( 63)*x11*x22        *x51
     1  +coeff( 64)*x11    *x32*x41*x51
     2  +coeff( 65)*x11*x23*x31    *x51
     3  +coeff( 66)*x11*x22*x31*x43    
     4  +coeff( 67)*x11*x22*x31    *x53
     5  +coeff( 68)    *x22    *x41    
     6  +coeff( 69)        *x31*x42    
     7  +coeff( 70)    *x21*x33        
     8  +coeff( 71)            *x44    
      x_r5p65_484816old_q3ent=x_r5p65_484816old_q3ent
     9  +coeff( 72)    *x22    *x41*x51
     1  +coeff( 73)    *x21    *x42*x51
     2  +coeff( 74)    *x21    *x41*x52
     3  +coeff( 75)            *x41*x53
     4  +coeff( 76)    *x23*x32        
     5  +coeff( 77)        *x34*x41    
     6  +coeff( 78)    *x21*x31*x43    
     7  +coeff( 79)    *x23*x31    *x51
     8  +coeff( 80)    *x22    *x42*x51
      x_r5p65_484816old_q3ent=x_r5p65_484816old_q3ent
     9  +coeff( 81)    *x21    *x43*x51
     1  +coeff( 82)    *x21*x32    *x52
     2  +coeff( 83)    *x22        *x53
     3  +coeff( 84)            *x41*x54
     4  +coeff( 85)    *x23*x31*x42    
     5  +coeff( 86)    *x22*x33    *x51
     6  +coeff( 87)    *x21*x33*x41*x51
     7  +coeff( 88)    *x22    *x41*x53
     8  +coeff( 89)    *x21    *x41*x54
      x_r5p65_484816old_q3ent=x_r5p65_484816old_q3ent
     9  +coeff( 90)*x11*x21*x32        
c
      return
      end
      function t_r5p65_484816old_q3ent(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 91)
      data ncoeff/ 90/
      data avdat/ -0.4223298E-03/
      data xmin/
     1 -0.14915E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.49980E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26369E-01, 0.49957E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     +  0.17313567E-02,-0.66465177E-01, 0.22788296E-01, 0.85304752E-02,
     + -0.47414969E-02, 0.18744366E-01,-0.39874162E-02, 0.40542954E-02,
     + -0.28774422E-02, 0.14467121E-02, 0.80269696E-02,-0.13867181E-02,
     + -0.59434325E-02, 0.17553564E-02, 0.63667777E-02,-0.39123138E-02,
     + -0.63822488E-03, 0.53770992E-03, 0.52789075E-03, 0.57107029E-02,
     + -0.57256955E-03,-0.74843885E-02,-0.47525074E-02, 0.42738768E-03,
     +  0.12215007E-02, 0.13352197E-02,-0.88855030E-03,-0.18967716E-02,
     + -0.45735545E-04, 0.19806265E-03, 0.21024916E-03, 0.46667139E-03,
     + -0.18944325E-03,-0.65924006E-03, 0.11219013E-02, 0.24538233E-02,
     +  0.10864779E-03,-0.89679263E-03,-0.94629207E-03,-0.60783830E-04,
     +  0.17637284E-03, 0.29736274E-03,-0.67454972E-03,-0.19443659E-03,
     +  0.21488732E-03, 0.96745242E-03, 0.34391854E-03, 0.27676295E-02,
     + -0.13757229E-03,-0.36513314E-03, 0.10424693E-03, 0.25655158E-03,
     +  0.96141361E-04,-0.64006163E-03, 0.10580952E-03, 0.14645539E-03,
     +  0.18180614E-03,-0.17869395E-03,-0.49790001E-03, 0.26871241E-03,
     +  0.10484027E-02, 0.25693697E-03, 0.83825766E-03,-0.31296088E-03,
     + -0.15518042E-03, 0.13626291E-03, 0.11908715E-03,-0.19639322E-03,
     + -0.30912575E-04, 0.11025795E-03,-0.27552585E-03,-0.87330736E-04,
     + -0.65324799E-04,-0.55074273E-04,-0.17555075E-03, 0.15718020E-03,
     + -0.18005019E-03, 0.25659736E-03, 0.31837987E-03, 0.46554484E-03,
     + -0.43724911E-03,-0.10657214E-03, 0.34057643E-03, 0.49710747E-04,
     + -0.19824535E-03, 0.16771855E-03, 0.27146965E-03,-0.48790593E-03,
     + -0.52088255E-03,-0.10917472E-02,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x12 = x11*x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x44 = x43*x4
      x51 = x5
      x52 = x51*x5
      x53 = x52*x5
c
c                  function
c
      t_r5p65_484816old_q3ent=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)    *x21            
     3  +coeff(  3)                *x51
     4  +coeff(  4)*x11                
     5  +coeff(  5)    *x22            
     6  +coeff(  6)    *x21    *x41    
     7  +coeff(  7)    *x21        *x51
     8  +coeff(  8)*x11        *x41    
      t_r5p65_484816old_q3ent=t_r5p65_484816old_q3ent
     9  +coeff(  9)    *x23*x31        
     1  +coeff( 10)            *x41    
     2  +coeff( 11)    *x21*x31        
     3  +coeff( 12)                *x52
     4  +coeff( 13)    *x23            
     5  +coeff( 14)*x11    *x31        
     6  +coeff( 15)    *x21    *x42    
     7  +coeff( 16)*x11*x22            
     8  +coeff( 17)    *x23*x31*x41    
      t_r5p65_484816old_q3ent=t_r5p65_484816old_q3ent
     9  +coeff( 18)        *x31        
     1  +coeff( 19)*x11*x21            
     2  +coeff( 20)    *x21*x31*x41    
     3  +coeff( 21)*x11            *x51
     4  +coeff( 22)    *x23    *x41    
     5  +coeff( 23)*x11*x22    *x41    
     6  +coeff( 24)            *x42    
     7  +coeff( 25)    *x21*x32        
     8  +coeff( 26)*x11        *x42    
      t_r5p65_484816old_q3ent=t_r5p65_484816old_q3ent
     9  +coeff( 27)*x12*x21            
     1  +coeff( 28)*x11*x22*x31        
     2  +coeff( 29)*x11    *x33*x41    
     3  +coeff( 30)        *x31*x41    
     4  +coeff( 31)    *x22    *x41    
     5  +coeff( 32)    *x21        *x52
     6  +coeff( 33)*x12                
     7  +coeff( 34)*x11*x21    *x41    
     8  +coeff( 35)*x11    *x31*x41    
      t_r5p65_484816old_q3ent=t_r5p65_484816old_q3ent
     9  +coeff( 36)    *x21    *x43    
     1  +coeff( 37)    *x24*x31        
     2  +coeff( 38)*x12*x21    *x41    
     3  +coeff( 39)    *x23*x31*x42    
     4  +coeff( 40)        *x31    *x51
     5  +coeff( 41)            *x41*x51
     6  +coeff( 42)            *x42*x51
     7  +coeff( 43)    *x24            
     8  +coeff( 44)*x11*x21*x31        
      t_r5p65_484816old_q3ent=t_r5p65_484816old_q3ent
     9  +coeff( 45)*x11    *x32        
     1  +coeff( 46)    *x21*x32*x41    
     2  +coeff( 47)    *x22    *x42    
     3  +coeff( 48)    *x21*x31*x42    
     4  +coeff( 49)*x12        *x41    
     5  +coeff( 50)*x12*x21*x31        
     6  +coeff( 51)        *x32        
     7  +coeff( 52)    *x22*x31        
     8  +coeff( 53)    *x22        *x51
      t_r5p65_484816old_q3ent=t_r5p65_484816old_q3ent
     9  +coeff( 54)    *x21    *x41*x51
     1  +coeff( 55)            *x41*x52
     2  +coeff( 56)                *x53
     3  +coeff( 57)    *x22*x31*x41    
     4  +coeff( 58)*x11*x21        *x51
     5  +coeff( 59)    *x21    *x42*x51
     6  +coeff( 60)*x11        *x43    
     7  +coeff( 61)    *x21    *x44    
     8  +coeff( 62)    *x23*x31    *x51
      t_r5p65_484816old_q3ent=t_r5p65_484816old_q3ent
     9  +coeff( 63)    *x23    *x41*x51
     1  +coeff( 64)    *x21*x31*x43*x51
     2  +coeff( 65)*x11*x22*x31*x42    
     3  +coeff( 66)        *x31*x42    
     4  +coeff( 67)            *x43    
     5  +coeff( 68)    *x21*x31    *x51
     6  +coeff( 69)        *x31*x41*x51
     7  +coeff( 70)    *x21*x33        
     8  +coeff( 71)    *x23        *x51
      t_r5p65_484816old_q3ent=t_r5p65_484816old_q3ent
     9  +coeff( 72)    *x22    *x41*x51
     1  +coeff( 73)    *x21    *x41*x52
     2  +coeff( 74)*x12    *x31        
     3  +coeff( 75)    *x23*x32        
     4  +coeff( 76)    *x22*x32*x41    
     5  +coeff( 77)*x11*x21    *x42    
     6  +coeff( 78)    *x23    *x42    
     7  +coeff( 79)*x11    *x31*x42    
     8  +coeff( 80)    *x21*x31*x43    
      t_r5p65_484816old_q3ent=t_r5p65_484816old_q3ent
     9  +coeff( 81)    *x24        *x51
     1  +coeff( 82)*x11*x21    *x41*x51
     2  +coeff( 83)    *x21    *x43*x51
     3  +coeff( 84)*x11*x21        *x52
     4  +coeff( 85)    *x23        *x52
     5  +coeff( 86)    *x22    *x41*x52
     6  +coeff( 87)*x11*x24            
     7  +coeff( 88)*x11*x22*x31*x41    
     8  +coeff( 89)*x11*x22    *x42    
      t_r5p65_484816old_q3ent=t_r5p65_484816old_q3ent
     9  +coeff( 90)    *x23    *x43    
c
      return
      end
      function y_r5p65_484816old_q3ent(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 96)
      data ncoeff/ 95/
      data avdat/  0.1858140E-01/
      data xmin/
     1 -0.14915E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.49980E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26369E-01, 0.49957E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     +  0.76975487E-02,-0.23787955E-01, 0.64246729E-01,-0.10620585E-01,
     +  0.32765795E-01, 0.97004455E-02, 0.10961092E-01,-0.69969576E-02,
     + -0.56430727E-01, 0.10459674E-01, 0.62782064E-01,-0.42122044E-01,
     + -0.10738199E-01, 0.63644759E-02, 0.11752175E-01, 0.75464707E-03,
     +  0.73151505E-02,-0.44697449E-01,-0.51350011E-02,-0.50800219E-02,
     + -0.15969012E-01, 0.13819401E-01,-0.13781724E-01, 0.21599688E-04,
     +  0.14587515E-03, 0.32625198E-02,-0.58827647E-02,-0.20543023E-02,
     +  0.39659985E-02,-0.36068101E-03,-0.35628956E-02, 0.13519447E-03,
     +  0.10590795E-02, 0.97116263E-03,-0.43291340E-03, 0.82275423E-04,
     +  0.99745703E-05, 0.37660075E-02, 0.18943294E-02,-0.12521174E-01,
     +  0.88162272E-03, 0.69186096E-02,-0.50007734E-02, 0.11493766E-01,
     + -0.16062947E-02,-0.36834821E-02, 0.63711675E-02, 0.20814729E-02,
     +  0.49422315E-03,-0.99495309E-03,-0.41940734E-02,-0.85402530E-03,
     + -0.92057046E-03, 0.48066517E-02, 0.16428274E-02,-0.47425097E-02,
     + -0.39666551E-02, 0.15665019E-02,-0.22686787E-02,-0.36607245E-02,
     + -0.31701960E-02,-0.60300878E-02,-0.51180236E-02,-0.22287527E-02,
     + -0.56787522E-03, 0.46645710E-04, 0.17127596E-02,-0.39485967E-03,
     +  0.35944014E-03,-0.52084972E-03, 0.11094642E-02, 0.21502804E-02,
     +  0.12678483E-02, 0.12744145E-02,-0.27433652E-02,-0.83103107E-03,
     + -0.26780507E-02,-0.51433296E-03,-0.30740995E-02,-0.98449644E-03,
     +  0.63388568E-03,-0.25974502E-03,-0.27518887E-02,-0.77353866E-03,
     +  0.76515431E-03, 0.96052134E-03, 0.80671132E-03,-0.17875935E-02,
     +  0.55005454E-03, 0.16765182E-02, 0.51944441E-03, 0.16576109E-02,
     +  0.15076183E-02, 0.63589093E-03, 0.56445465E-03,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x12 = x11*x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x34 = x33*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x44 = x43*x4
      x45 = x44*x4
      x51 = x5
      x52 = x51*x5
      x53 = x52*x5
c
c                  function
c
      y_r5p65_484816old_q3ent=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)        *x31        
     3  +coeff(  3)            *x41    
     4  +coeff(  4)    *x21            
     5  +coeff(  5)                *x51
     6  +coeff(  6)        *x31*x41    
     7  +coeff(  7)            *x42    
     8  +coeff(  8)    *x21*x31        
      y_r5p65_484816old_q3ent=y_r5p65_484816old_q3ent
     9  +coeff(  9)    *x21    *x41    
     1  +coeff( 10)        *x31    *x51
     2  +coeff( 11)            *x41*x51
     3  +coeff( 12)    *x22            
     4  +coeff( 13)    *x21        *x51
     5  +coeff( 14)                *x52
     6  +coeff( 15)    *x21    *x42    
     7  +coeff( 16)*x11    *x31        
     8  +coeff( 17)*x11        *x41    
      y_r5p65_484816old_q3ent=y_r5p65_484816old_q3ent
     9  +coeff( 18)    *x22    *x41    
     1  +coeff( 19)    *x21    *x41*x51
     2  +coeff( 20)            *x41*x52
     3  +coeff( 21)*x11*x21            
     4  +coeff( 22)    *x23            
     5  +coeff( 23)    *x22        *x51
     6  +coeff( 24)        *x34        
     7  +coeff( 25)*x11    *x32        
     8  +coeff( 26)*x11        *x42    
      y_r5p65_484816old_q3ent=y_r5p65_484816old_q3ent
     9  +coeff( 27)    *x22    *x41*x51
     1  +coeff( 28)*x12                
     2  +coeff( 29)*x11*x22            
     3  +coeff( 30)            *x45    
     4  +coeff( 31)*x11*x21        *x51
     5  +coeff( 32)    *x22*x33        
     6  +coeff( 33)    *x24*x31        
     7  +coeff( 34)*x11*x23*x31        
     8  +coeff( 35)*x11*x23    *x41    
      y_r5p65_484816old_q3ent=y_r5p65_484816old_q3ent
     9  +coeff( 36)        *x33        
     1  +coeff( 37)    *x21*x32        
     2  +coeff( 38)    *x21*x31*x41    
     3  +coeff( 39)        *x31*x41*x51
     4  +coeff( 40)    *x22*x31        
     5  +coeff( 41)*x11            *x51
     6  +coeff( 42)    *x21    *x43    
     7  +coeff( 43)*x11*x21    *x41    
     8  +coeff( 44)    *x24            
      y_r5p65_484816old_q3ent=y_r5p65_484816old_q3ent
     9  +coeff( 45)*x12        *x41    
     1  +coeff( 46)*x11*x22    *x41    
     2  +coeff( 47)*x11*x23            
     3  +coeff( 48)        *x32        
     4  +coeff( 49)        *x32*x41    
     5  +coeff( 50)        *x31*x42    
     6  +coeff( 51)            *x43    
     7  +coeff( 52)        *x31    *x52
     8  +coeff( 53)                *x53
      y_r5p65_484816old_q3ent=y_r5p65_484816old_q3ent
     9  +coeff( 54)    *x21*x31*x42    
     1  +coeff( 55)*x11    *x31*x41    
     2  +coeff( 56)    *x22*x31*x41    
     3  +coeff( 57)*x11*x21*x31        
     4  +coeff( 58)    *x23*x31        
     5  +coeff( 59)    *x22*x31    *x51
     6  +coeff( 60)*x11*x21*x31*x41    
     7  +coeff( 61)*x11*x21    *x42    
     8  +coeff( 62)    *x23    *x42    
      y_r5p65_484816old_q3ent=y_r5p65_484816old_q3ent
     9  +coeff( 63)    *x22    *x42*x51
     1  +coeff( 64)*x11*x21    *x41*x51
     2  +coeff( 65)*x12            *x51
     3  +coeff( 66)    *x22*x34        
     4  +coeff( 67)*x12*x22            
     5  +coeff( 68)*x11                
     6  +coeff( 69)        *x32    *x51
     7  +coeff( 70)    *x21        *x52
     8  +coeff( 71)            *x43*x51
      y_r5p65_484816old_q3ent=y_r5p65_484816old_q3ent
     9  +coeff( 72)    *x23    *x41    
     1  +coeff( 73)    *x23        *x51
     2  +coeff( 74)    *x22        *x52
     3  +coeff( 75)    *x22    *x43    
     4  +coeff( 76)*x11*x21*x32        
     5  +coeff( 77)    *x22*x31*x41*x51
     6  +coeff( 78)*x12    *x31        
     7  +coeff( 79)    *x24    *x41    
     8  +coeff( 80)*x11*x21*x31    *x51
      y_r5p65_484816old_q3ent=y_r5p65_484816old_q3ent
     9  +coeff( 81)*x11*x21        *x52
     1  +coeff( 82)    *x21    *x44*x51
     2  +coeff( 83)*x11*x22    *x42    
     3  +coeff( 84)*x12*x21    *x41    
     4  +coeff( 85)            *x42*x51
     5  +coeff( 86)    *x21*x32*x41    
     6  +coeff( 87)        *x31*x42*x51
     7  +coeff( 88)    *x22*x32        
     8  +coeff( 89)    *x21*x31*x41*x51
      y_r5p65_484816old_q3ent=y_r5p65_484816old_q3ent
     9  +coeff( 90)    *x21    *x42*x51
     1  +coeff( 91)    *x21    *x41*x52
     2  +coeff( 92)    *x21*x31*x43    
     3  +coeff( 93)    *x21    *x44    
     4  +coeff( 94)*x11    *x31*x42    
     5  +coeff( 95)*x11        *x43    
c
      return
      end
      function p_r5p65_484816old_q3ent(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 91)
      data ncoeff/ 90/
      data avdat/  0.3909997E-02/
      data xmin/
     1 -0.14915E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.49980E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26369E-01, 0.49957E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     +  0.22805654E-03,-0.15349084E-02,-0.65883305E-02,-0.21866579E-04,
     +  0.49045430E-02,-0.39123312E-04,-0.57350886E-02,-0.16122014E-02,
     + -0.10977392E-01, 0.12340683E-02, 0.14006145E-02,-0.20464743E-02,
     +  0.17757701E-02, 0.12484443E-01, 0.15507063E-02,-0.19576442E-02,
     +  0.24096365E-02, 0.14559614E-02,-0.83501721E-02, 0.25795132E-02,
     + -0.32358284E-02,-0.13057495E-02,-0.80776116E-03,-0.16058830E-02,
     +  0.64226797E-05, 0.26814980E-03, 0.25758770E-03,-0.16344435E-02,
     +  0.10605670E-02,-0.10168062E-02,-0.24683823E-03, 0.66852226E-03,
     +  0.20235577E-02, 0.61779574E-03, 0.11825692E-02,-0.58521098E-04,
     + -0.29583677E-03, 0.12374661E-03, 0.45172923E-03,-0.40363354E-03,
     +  0.33976673E-03, 0.11798346E-02,-0.62050426E-03, 0.92383428E-03,
     + -0.76958543E-03, 0.34284961E-03, 0.83583720E-04,-0.13722206E-03,
     + -0.46395641E-03,-0.12755542E-03,-0.23461726E-03, 0.31846532E-03,
     +  0.45929034E-03,-0.28561475E-03,-0.11971676E-02,-0.12926912E-03,
     + -0.43942305E-03, 0.34684307E-03,-0.44551540E-04, 0.75021142E-03,
     +  0.18766562E-03,-0.87490545E-04, 0.14148098E-03,-0.71964518E-03,
     + -0.37830250E-03,-0.25783715E-03,-0.16711840E-03, 0.33819812E-03,
     + -0.70858799E-03,-0.17334874E-03,-0.18163510E-04, 0.17374568E-03,
     + -0.16926760E-03,-0.40043140E-03, 0.46469152E-03,-0.14935163E-03,
     + -0.66209509E-03, 0.21937356E-03,-0.20555354E-03,-0.70633157E-03,
     + -0.28429076E-03,-0.54922618E-03,-0.43955562E-03, 0.31825464E-04,
     +  0.17903039E-03, 0.14953995E-03, 0.24851443E-04, 0.91121743E-04,
     +  0.80445272E-04,-0.67988112E-04,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x12 = x11*x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x44 = x43*x4
      x51 = x5
      x52 = x51*x5
      x53 = x52*x5
c
c                  function
c
      p_r5p65_484816old_q3ent=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)    *x21            
     3  +coeff(  3)        *x31        
     4  +coeff(  4)            *x41    
     5  +coeff(  5)                *x51
     6  +coeff(  6)*x11                
     7  +coeff(  7)    *x22            
     8  +coeff(  8)    *x21*x31        
      p_r5p65_484816old_q3ent=p_r5p65_484816old_q3ent
     9  +coeff(  9)    *x21    *x41    
     1  +coeff( 10)        *x31*x41    
     2  +coeff( 11)            *x42    
     3  +coeff( 12)    *x21        *x51
     4  +coeff( 13)        *x31    *x51
     5  +coeff( 14)            *x41*x51
     6  +coeff( 15)                *x52
     7  +coeff( 16)*x11*x21            
     8  +coeff( 17)    *x23            
      p_r5p65_484816old_q3ent=p_r5p65_484816old_q3ent
     9  +coeff( 18)*x11        *x41    
     1  +coeff( 19)    *x22    *x41    
     2  +coeff( 20)    *x21    *x42    
     3  +coeff( 21)    *x22        *x51
     4  +coeff( 22)    *x21    *x41*x51
     5  +coeff( 23)*x11*x21        *x51
     6  +coeff( 24)    *x22    *x41*x51
     7  +coeff( 25)    *x24*x31        
     8  +coeff( 26)        *x32        
      p_r5p65_484816old_q3ent=p_r5p65_484816old_q3ent
     9  +coeff( 27)*x11    *x31        
     1  +coeff( 28)    *x22*x31        
     2  +coeff( 29)    *x21*x31*x41    
     3  +coeff( 30)            *x43    
     4  +coeff( 31)*x12                
     5  +coeff( 32)*x11*x22            
     6  +coeff( 33)    *x24            
     7  +coeff( 34)*x11        *x42    
     8  +coeff( 35)    *x22    *x42    
      p_r5p65_484816old_q3ent=p_r5p65_484816old_q3ent
     9  +coeff( 36)*x12        *x41*x52
     1  +coeff( 37)        *x31*x42    
     2  +coeff( 38)*x11            *x51
     3  +coeff( 39)        *x31*x41*x51
     4  +coeff( 40)*x11*x21*x31        
     5  +coeff( 41)*x11    *x31*x41    
     6  +coeff( 42)    *x21    *x43    
     7  +coeff( 43)    *x22*x31    *x51
     8  +coeff( 44)*x11*x23            
      p_r5p65_484816old_q3ent=p_r5p65_484816old_q3ent
     9  +coeff( 45)*x11*x22    *x41    
     1  +coeff( 46)    *x23*x31*x42    
     2  +coeff( 47)        *x32    *x51
     3  +coeff( 48)    *x21        *x52
     4  +coeff( 49)            *x41*x52
     5  +coeff( 50)                *x53
     6  +coeff( 51)    *x22*x32        
     7  +coeff( 52)    *x23    *x41    
     8  +coeff( 53)    *x23        *x51
      p_r5p65_484816old_q3ent=p_r5p65_484816old_q3ent
     9  +coeff( 54)*x12        *x41    
     1  +coeff( 55)    *x23    *x42    
     2  +coeff( 56)*x12            *x51
     3  +coeff( 57)*x11*x21    *x41*x51
     4  +coeff( 58)    *x22    *x41*x52
     5  +coeff( 59)        *x31    *x52
     6  +coeff( 60)    *x21*x31*x42    
     7  +coeff( 61)    *x22        *x52
     8  +coeff( 62)*x12    *x31        
      p_r5p65_484816old_q3ent=p_r5p65_484816old_q3ent
     9  +coeff( 63)    *x23*x32        
     1  +coeff( 64)    *x24    *x41    
     2  +coeff( 65)*x11*x21*x31*x41    
     3  +coeff( 66)*x11*x21    *x42    
     4  +coeff( 67)*x11*x21*x31    *x51
     5  +coeff( 68)    *x23    *x41*x51
     6  +coeff( 69)    *x22    *x42*x51
     7  +coeff( 70)        *x31*x43*x51
     8  +coeff( 71)            *x44*x51
      p_r5p65_484816old_q3ent=p_r5p65_484816old_q3ent
     9  +coeff( 72)*x12*x22            
     1  +coeff( 73)*x12*x21    *x41    
     2  +coeff( 74)*x11*x23    *x41    
     3  +coeff( 75)    *x23*x32*x41    
     4  +coeff( 76)*x12        *x42    
     5  +coeff( 77)*x11*x22    *x42    
     6  +coeff( 78)*x11*x21    *x43    
     7  +coeff( 79)*x11*x23*x32        
     8  +coeff( 80)    *x24*x31*x41*x51
      p_r5p65_484816old_q3ent=p_r5p65_484816old_q3ent
     9  +coeff( 81)*x12*x22*x31*x41    
     1  +coeff( 82)*x11*x22*x31*x43    
     2  +coeff( 83)*x11*x23*x31*x41*x51
     3  +coeff( 84)        *x32*x41    
     4  +coeff( 85)            *x42*x51
     5  +coeff( 86)    *x23*x31        
     6  +coeff( 87)*x11    *x32        
     7  +coeff( 88)    *x21    *x42*x51
     8  +coeff( 89)            *x43*x51
      p_r5p65_484816old_q3ent=p_r5p65_484816old_q3ent
     9  +coeff( 90)    *x21*x31    *x52
c
      return
      end
      function sl_r5p65_484816old_q3ent(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 30)
      data ncoeff/ 29/
      data avdat/ -0.6422254E-02/
      data xmin/
     1 -0.14915E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.49980E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26369E-01, 0.49957E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     +  0.76277712E-02,-0.26531026E+00,-0.32262314E-01, 0.39618291E-01,
     + -0.27961193E-01, 0.84077448E-01,-0.16082145E-01, 0.16214991E-01,
     + -0.13411514E-01, 0.35551280E-01,-0.25613008E-01, 0.67765024E-02,
     +  0.30248636E-01,-0.16142190E-01,-0.42436429E-03,-0.43489151E-02,
     +  0.29054058E-02, 0.20758841E-01,-0.29120555E-02,-0.35485338E-01,
     + -0.18084582E-01, 0.88992814E-03,-0.19004992E-03,-0.17838887E-02,
     +  0.36570346E-02, 0.51162671E-02, 0.25937310E-02,-0.38355768E-02,
     + -0.66875056E-02,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x12 = x11*x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x31 = x3
      x32 = x31*x3
      x41 = x4
      x42 = x41*x4
      x51 = x5
c
c                  function
c
      sl_r5p65_484816old_q3ent=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)    *x21            
     3  +coeff(  3)                *x51
     4  +coeff(  4)*x11                
     5  +coeff(  5)    *x22            
     6  +coeff(  6)    *x21    *x41    
     7  +coeff(  7)    *x21        *x51
     8  +coeff(  8)*x11        *x41    
      sl_r5p65_484816old_q3ent=sl_r5p65_484816old_q3ent
     9  +coeff(  9)    *x23*x31        
     1  +coeff( 10)    *x21*x31        
     2  +coeff( 11)    *x23            
     3  +coeff( 12)*x11    *x31        
     4  +coeff( 13)    *x21    *x42    
     5  +coeff( 14)*x11*x22            
     6  +coeff( 15)    *x23*x31*x41    
     7  +coeff( 16)            *x42    
     8  +coeff( 17)*x11*x21            
      sl_r5p65_484816old_q3ent=sl_r5p65_484816old_q3ent
     9  +coeff( 18)    *x21*x31*x41    
     1  +coeff( 19)*x11            *x51
     2  +coeff( 20)    *x23    *x41    
     3  +coeff( 21)*x11*x22    *x41    
     4  +coeff( 22)        *x31        
     5  +coeff( 23)            *x41    
     6  +coeff( 24)            *x41*x51
     7  +coeff( 25)    *x21*x32        
     8  +coeff( 26)    *x22    *x41    
      sl_r5p65_484816old_q3ent=sl_r5p65_484816old_q3ent
     9  +coeff( 27)*x11        *x42    
     1  +coeff( 28)*x12*x21            
     2  +coeff( 29)*x11*x22*x31        
c
      return
      end
      function x_r5p65_484816old_q3ext(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 91)
      data ncoeff/ 90/
      data avdat/  0.4644721E-02/
      data xmin/
     1 -0.14915E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.47305E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26369E-01, 0.49936E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     +  0.15248631E-02, 0.58824506E-01,-0.11733623E-02,-0.29201608E-02,
     +  0.32574528E+00,-0.34187261E-01, 0.29864455E-01,-0.21694597E-01,
     +  0.11592402E-01,-0.26740139E-01, 0.14788826E-01,-0.13658176E-01,
     + -0.64544296E-02,-0.17231574E-01,-0.64244368E-02,-0.26158465E-02,
     + -0.10182231E-01,-0.75765601E-02, 0.24484238E-02, 0.16149327E-01,
     + -0.29871110E-02, 0.65454599E-02, 0.87871822E-02,-0.18219815E-02,
     + -0.20873316E-02, 0.35245568E-02,-0.19298964E-02,-0.13051813E-02,
     + -0.42567740E-03, 0.10903085E-02,-0.36544347E-03,-0.26113095E-02,
     +  0.51414710E-02,-0.14051218E-02,-0.98321610E-03, 0.31731911E-02,
     + -0.83773350E-03,-0.13800012E-03, 0.14171128E-03, 0.20568729E-02,
     + -0.36924190E-02,-0.25588584E-02, 0.17601913E-02,-0.20900944E-02,
     + -0.38991275E-03,-0.11837747E-04, 0.19657821E-02,-0.44713813E-03,
     +  0.57550787E-03, 0.65791834E-03,-0.80448767E-03, 0.20415501E-02,
     +  0.18609584E-02,-0.16890966E-02, 0.11179944E-03,-0.25306403E-03,
     + -0.39860490E-03,-0.15915041E-02,-0.24969049E-03, 0.19752923E-03,
     +  0.17792527E-02,-0.12567827E-02,-0.71923161E-03,-0.52183942E-03,
     +  0.17171985E-02,-0.23595733E-02,-0.22603460E-02, 0.21111725E-02,
     + -0.16030275E-02,-0.13600388E-02, 0.87769347E-03,-0.42892140E-03,
     +  0.13010656E-02, 0.23281323E-03, 0.20632793E-02, 0.15145454E-02,
     +  0.19184576E-02, 0.15735762E-02,-0.20609349E-03,-0.73869305E-03,
     +  0.21311350E-03, 0.11068204E-03,-0.18350151E-03,-0.29513298E-03,
     +  0.83723612E-03,-0.46947266E-05,-0.10154109E-02,-0.93296770E-03,
     + -0.33561385E-03,-0.11572959E-02,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x34 = x33*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x44 = x43*x4
      x51 = x5
      x52 = x51*x5
      x53 = x52*x5
      x54 = x53*x5
c
c                  function
c
      x_r5p65_484816old_q3ext=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)    *x21            
     3  +coeff(  3)        *x31        
     4  +coeff(  4)            *x41    
     5  +coeff(  5)                *x51
     6  +coeff(  6)    *x21    *x41    
     7  +coeff(  7)    *x21        *x51
     8  +coeff(  8)                *x52
      x_r5p65_484816old_q3ext=x_r5p65_484816old_q3ext
     9  +coeff(  9)    *x23            
     1  +coeff( 10)*x11                
     2  +coeff( 11)    *x22            
     3  +coeff( 12)    *x21*x31        
     4  +coeff( 13)            *x42    
     5  +coeff( 14)    *x21    *x42    
     6  +coeff( 15)*x11        *x41    
     7  +coeff( 16)        *x31*x41    
     8  +coeff( 17)    *x21*x31*x41    
      x_r5p65_484816old_q3ext=x_r5p65_484816old_q3ext
     9  +coeff( 18)    *x21    *x41*x51
     1  +coeff( 19)                *x53
     2  +coeff( 20)    *x23    *x41    
     3  +coeff( 21)*x11    *x31        
     4  +coeff( 22)*x11*x22            
     5  +coeff( 23)*x11*x22    *x41    
     6  +coeff( 24)            *x41*x51
     7  +coeff( 25)    *x21*x32        
     8  +coeff( 26)    *x22        *x51
      x_r5p65_484816old_q3ext=x_r5p65_484816old_q3ext
     9  +coeff( 27)    *x21*x31    *x51
     1  +coeff( 28)*x11            *x51
     2  +coeff( 29)        *x31    *x51
     3  +coeff( 30)    *x22    *x41    
     4  +coeff( 31)    *x21        *x52
     5  +coeff( 32)    *x24            
     6  +coeff( 33)    *x23*x31        
     7  +coeff( 34)*x11    *x31*x41    
     8  +coeff( 35)*x11        *x42    
      x_r5p65_484816old_q3ext=x_r5p65_484816old_q3ext
     9  +coeff( 36)*x11*x22*x31        
     1  +coeff( 37)            *x43    
     2  +coeff( 38)            *x42*x51
     3  +coeff( 39)    *x22*x31*x41    
     4  +coeff( 40)    *x22    *x42    
     5  +coeff( 41)    *x21*x31*x42    
     6  +coeff( 42)    *x21    *x43    
     7  +coeff( 43)    *x23        *x51
     8  +coeff( 44)    *x21    *x42*x51
      x_r5p65_484816old_q3ext=x_r5p65_484816old_q3ext
     9  +coeff( 45)*x11*x21            
     1  +coeff( 46)        *x31*x44    
     2  +coeff( 47)    *x22    *x42*x51
     3  +coeff( 48)*x11    *x32        
     4  +coeff( 49)*x11*x21    *x41    
     5  +coeff( 50)    *x23*x32*x41    
     6  +coeff( 51)*x11        *x41*x51
     7  +coeff( 52)*x11*x23            
     8  +coeff( 53)*x11*x22        *x51
      x_r5p65_484816old_q3ext=x_r5p65_484816old_q3ext
     9  +coeff( 54)*x11*x24            
     1  +coeff( 55)*x11*x22*x31    *x51
     2  +coeff( 56)        *x32        
     3  +coeff( 57)    *x22*x31        
     4  +coeff( 58)    *x21*x32*x41    
     5  +coeff( 59)            *x44    
     6  +coeff( 60)    *x22*x31    *x51
     7  +coeff( 61)    *x22    *x41*x51
     8  +coeff( 62)    *x21*x31*x41*x51
      x_r5p65_484816old_q3ext=x_r5p65_484816old_q3ext
     9  +coeff( 63)    *x22        *x52
     1  +coeff( 64)                *x54
     2  +coeff( 65)    *x24    *x41    
     3  +coeff( 66)    *x21    *x44    
     4  +coeff( 67)    *x24        *x51
     5  +coeff( 68)    *x23    *x41*x51
     6  +coeff( 69)    *x21    *x43*x51
     7  +coeff( 70)    *x23        *x52
     8  +coeff( 71)    *x22    *x41*x52
      x_r5p65_484816old_q3ext=x_r5p65_484816old_q3ext
     9  +coeff( 72)*x11    *x31    *x51
     1  +coeff( 73)    *x23    *x41*x52
     2  +coeff( 74)*x11*x21*x31    *x51
     3  +coeff( 75)    *x24*x32*x42    
     4  +coeff( 76)*x11*x22    *x41*x51
     5  +coeff( 77)*x11*x22*x34    *x52
     6  +coeff( 78)*x11*x23*x32    *x53
     7  +coeff( 79)        *x32*x41    
     8  +coeff( 80)        *x31*x42    
      x_r5p65_484816old_q3ext=x_r5p65_484816old_q3ext
     9  +coeff( 81)        *x32    *x51
     1  +coeff( 82)        *x31    *x52
     2  +coeff( 83)    *x21*x33        
     3  +coeff( 84)            *x41*x53
     4  +coeff( 85)    *x24*x31        
     5  +coeff( 86)    *x23*x31*x41    
     6  +coeff( 87)    *x23    *x42    
     7  +coeff( 88)    *x21*x31*x43    
     8  +coeff( 89)        *x34    *x51
      x_r5p65_484816old_q3ext=x_r5p65_484816old_q3ext
     9  +coeff( 90)    *x21*x31*x42*x51
c
      return
      end
      function t_r5p65_484816old_q3ext(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 68)
      data ncoeff/ 67/
      data avdat/  0.1527914E-02/
      data xmin/
     1 -0.14915E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.47305E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26369E-01, 0.49936E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     +  0.14496548E-02,-0.19508362E-01,-0.73269752E-04,-0.13483947E-03,
     +  0.11265062E+00,-0.34321521E-02, 0.56422018E-02,-0.10389529E-01,
     + -0.17777589E-02, 0.17455086E-02, 0.22495587E-03,-0.18055076E-02,
     + -0.22312091E-02,-0.59988513E-03, 0.10892907E-02,-0.45281737E-04,
     + -0.64785691E-03,-0.51998266E-03, 0.35270475E-03, 0.71011984E-03,
     + -0.34361822E-03,-0.62585068E-05, 0.10487171E-02,-0.61692437E-03,
     +  0.18514015E-03,-0.48758672E-03,-0.94577920E-03, 0.35240673E-03,
     +  0.93065843E-03,-0.89217567E-04, 0.43751628E-03, 0.29078935E-03,
     + -0.92520793E-04, 0.37479392E-03, 0.74184201E-04,-0.88679888E-04,
     + -0.12215787E-03, 0.61374769E-03, 0.81305945E-04, 0.37616311E-03,
     + -0.67179423E-03, 0.58105710E-03,-0.39945697E-03,-0.16112207E-03,
     +  0.21083036E-03,-0.80841812E-04, 0.56060142E-03,-0.32897523E-03,
     +  0.94391820E-04, 0.14056414E-03,-0.21979837E-03,-0.16929118E-03,
     + -0.12696584E-03, 0.46200075E-03,-0.12908840E-02, 0.38192928E-03,
     + -0.17924509E-03, 0.90225157E-03,-0.61669195E-03, 0.81154681E-03,
     + -0.23857095E-03, 0.31808336E-03,-0.99166617E-04,-0.76115812E-03,
     +  0.47185709E-03,-0.20235532E-03, 0.53299917E-03,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x12 = x11*x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x44 = x43*x4
      x51 = x5
      x52 = x51*x5
      x53 = x52*x5
      x54 = x53*x5
c
c                  function
c
      t_r5p65_484816old_q3ext=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)    *x21            
     3  +coeff(  3)        *x31        
     4  +coeff(  4)            *x41    
     5  +coeff(  5)                *x51
     6  +coeff(  6)*x11                
     7  +coeff(  7)    *x21        *x51
     8  +coeff(  8)                *x52
      t_r5p65_484816old_q3ext=t_r5p65_484816old_q3ext
     9  +coeff(  9)            *x42    
     1  +coeff( 10)    *x22            
     2  +coeff( 11)*x11*x21            
     3  +coeff( 12)    *x21    *x42    
     4  +coeff( 13)    *x21    *x41*x51
     5  +coeff( 14)    *x21        *x52
     6  +coeff( 15)                *x53
     7  +coeff( 16)    *x21    *x41    
     8  +coeff( 17)        *x31*x41    
      t_r5p65_484816old_q3ext=t_r5p65_484816old_q3ext
     9  +coeff( 18)            *x41*x51
     1  +coeff( 19)*x11        *x41    
     2  +coeff( 20)    *x22    *x41    
     3  +coeff( 21)*x11            *x51
     4  +coeff( 22)    *x21*x33        
     5  +coeff( 23)    *x22        *x51
     6  +coeff( 24)    *x21*x31    *x51
     7  +coeff( 25)            *x42*x51
     8  +coeff( 26)*x11*x22            
      t_r5p65_484816old_q3ext=t_r5p65_484816old_q3ext
     9  +coeff( 27)    *x24            
     1  +coeff( 28)*x11        *x42    
     2  +coeff( 29)    *x22    *x42    
     3  +coeff( 30)    *x22*x31    *x51
     4  +coeff( 31)    *x24*x31        
     5  +coeff( 32)    *x21*x31        
     6  +coeff( 33)        *x31    *x51
     7  +coeff( 34)    *x23            
     8  +coeff( 35)*x11    *x31        
      t_r5p65_484816old_q3ext=t_r5p65_484816old_q3ext
     9  +coeff( 36)*x12                
     1  +coeff( 37)    *x23*x31        
     2  +coeff( 38)    *x23    *x41    
     3  +coeff( 39)*x11    *x31*x41    
     4  +coeff( 40)    *x21    *x43    
     5  +coeff( 41)    *x21    *x42*x51
     6  +coeff( 42)*x11*x23            
     7  +coeff( 43)*x11*x23    *x41    
     8  +coeff( 44)            *x43    
      t_r5p65_484816old_q3ext=t_r5p65_484816old_q3ext
     9  +coeff( 45)    *x21*x31*x42    
     1  +coeff( 46)*x11        *x41*x51
     2  +coeff( 47)    *x22    *x41*x51
     3  +coeff( 48)    *x21*x31*x41*x51
     4  +coeff( 49)*x11            *x52
     5  +coeff( 50)    *x22        *x52
     6  +coeff( 51)                *x54
     7  +coeff( 52)*x11*x21    *x42    
     8  +coeff( 53)        *x31*x44    
      t_r5p65_484816old_q3ext=t_r5p65_484816old_q3ext
     9  +coeff( 54)*x11*x22        *x51
     1  +coeff( 55)    *x24        *x51
     2  +coeff( 56)    *x23*x31    *x51
     3  +coeff( 57)*x11*x21    *x41*x51
     4  +coeff( 58)    *x23    *x41*x51
     5  +coeff( 59)    *x23        *x52
     6  +coeff( 60)    *x22    *x41*x52
     7  +coeff( 61)            *x41*x54
     8  +coeff( 62)*x11*x24            
      t_r5p65_484816old_q3ext=t_r5p65_484816old_q3ext
     9  +coeff( 63)*x11    *x33    *x51
     1  +coeff( 64)    *x24        *x52
     2  +coeff( 65)    *x23    *x41*x52
     3  +coeff( 66)            *x44*x52
     4  +coeff( 67)    *x24    *x42*x51
c
      return
      end
      function y_r5p65_484816old_q3ext(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 96)
      data ncoeff/ 95/
      data avdat/  0.1574863E-01/
      data xmin/
     1 -0.14915E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.47305E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26369E-01, 0.49936E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     +  0.32734179E-02,-0.22584995E-01, 0.24643203E-01,-0.73742461E-02,
     +  0.23062753E-01, 0.13574744E-02, 0.63247192E-02, 0.71133971E-02,
     + -0.60198475E-02,-0.44203006E-01, 0.66072717E-02, 0.50053786E-01,
     + -0.16401974E-03,-0.27947880E-01,-0.85989833E-02, 0.59719137E-02,
     +  0.10728666E-01, 0.75152412E-03,-0.76925843E-02, 0.57053701E-02,
     + -0.35491984E-01,-0.65117427E-02,-0.99744722E-02, 0.10329838E-01,
     + -0.12948104E-01,-0.22745922E-02,-0.70000226E-02,-0.12842054E-02,
     +  0.28409758E-02, 0.85454499E-02,-0.25687023E-03,-0.33311741E-02,
     + -0.40471743E-03,-0.77705423E-03,-0.33654233E-02, 0.49921479E-02,
     +  0.17227388E-02,-0.10125862E-02, 0.59479690E-03, 0.52302047E-02,
     +  0.25691045E-02, 0.21430166E-02,-0.20199446E-02,-0.25381253E-02,
     + -0.11998881E-02,-0.30627074E-02, 0.41173683E-02, 0.10711909E-03,
     +  0.34277691E-03,-0.10012521E-02,-0.72511029E-03, 0.38023936E-02,
     +  0.13815749E-02, 0.97041467E-03, 0.19225101E-02,-0.22342042E-02,
     + -0.65160464E-02,-0.18036745E-02,-0.50528505E-03, 0.12021110E-03,
     + -0.56113862E-03, 0.73450251E-03,-0.11045764E-02,-0.22896410E-02,
     + -0.42904099E-04, 0.14912004E-02, 0.17051264E-02, 0.31641190E-03,
     +  0.45765101E-03,-0.89007942E-03, 0.36411869E-03, 0.19128209E-03,
     + -0.26799967E-02,-0.16212690E-02,-0.36569659E-03,-0.91428973E-03,
     +  0.11063230E-02,-0.42420992E-03,-0.25509940E-02,-0.58474182E-03,
     +  0.10260496E-02,-0.46058389E-03,-0.30416937E-02,-0.18097231E-02,
     +  0.79642388E-03, 0.26306286E-03, 0.46512281E-03,-0.29206378E-03,
     +  0.40855972E-03, 0.56296738E-03, 0.43724652E-03,-0.17272502E-02,
     +  0.27785366E-03,-0.29065821E-02, 0.85985882E-03,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x12 = x11*x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x34 = x33*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x44 = x43*x4
      x45 = x44*x4
      x51 = x5
      x52 = x51*x5
      x53 = x52*x5
c
c                  function
c
      y_r5p65_484816old_q3ext=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)        *x31        
     3  +coeff(  3)            *x41    
     4  +coeff(  4)    *x21            
     5  +coeff(  5)                *x51
     6  +coeff(  6)        *x32        
     7  +coeff(  7)        *x31*x41    
     8  +coeff(  8)            *x42    
      y_r5p65_484816old_q3ext=y_r5p65_484816old_q3ext
     9  +coeff(  9)    *x21*x31        
     1  +coeff( 10)    *x21    *x41    
     2  +coeff( 11)        *x31    *x51
     3  +coeff( 12)            *x41*x51
     4  +coeff( 13)*x11                
     5  +coeff( 14)    *x22            
     6  +coeff( 15)    *x21        *x51
     7  +coeff( 16)                *x52
     8  +coeff( 17)    *x21    *x42    
      y_r5p65_484816old_q3ext=y_r5p65_484816old_q3ext
     9  +coeff( 18)*x11    *x31        
     1  +coeff( 19)    *x22*x31        
     2  +coeff( 20)*x11        *x41    
     3  +coeff( 21)    *x22    *x41    
     4  +coeff( 22)    *x21    *x41*x51
     5  +coeff( 23)*x11*x21            
     6  +coeff( 24)    *x23            
     7  +coeff( 25)    *x22        *x51
     8  +coeff( 26)*x11*x21*x31        
      y_r5p65_484816old_q3ext=y_r5p65_484816old_q3ext
     9  +coeff( 27)    *x22    *x41*x51
     1  +coeff( 28)*x12                
     2  +coeff( 29)*x11*x22            
     3  +coeff( 30)    *x24            
     4  +coeff( 31)            *x45    
     5  +coeff( 32)*x11*x21        *x51
     6  +coeff( 33)    *x21*x33*x41    
     7  +coeff( 34)        *x31*x42    
     8  +coeff( 35)            *x43    
      y_r5p65_484816old_q3ext=y_r5p65_484816old_q3ext
     9  +coeff( 36)    *x21*x31*x41    
     1  +coeff( 37)        *x31*x41*x51
     2  +coeff( 38)            *x41*x52
     3  +coeff( 39)*x11            *x51
     4  +coeff( 40)    *x21    *x43    
     5  +coeff( 41)*x11        *x42    
     6  +coeff( 42)    *x22    *x42    
     7  +coeff( 43)*x11*x21    *x41    
     8  +coeff( 44)    *x22*x31    *x51
      y_r5p65_484816old_q3ext=y_r5p65_484816old_q3ext
     9  +coeff( 45)*x12        *x41    
     1  +coeff( 46)*x11*x22    *x41    
     2  +coeff( 47)*x11*x23            
     3  +coeff( 48)*x11    *x33*x41    
     4  +coeff( 49)        *x32    *x51
     5  +coeff( 50)    *x21        *x52
     6  +coeff( 51)                *x53
     7  +coeff( 52)    *x21*x31*x42    
     8  +coeff( 53)*x11    *x31*x41    
      y_r5p65_484816old_q3ext=y_r5p65_484816old_q3ext
     9  +coeff( 54)    *x23*x31        
     1  +coeff( 55)    *x23        *x51
     2  +coeff( 56)*x11*x21*x31*x41    
     3  +coeff( 57)    *x23    *x42    
     4  +coeff( 58)*x11*x21    *x41*x51
     5  +coeff( 59)*x12            *x51
     6  +coeff( 60)    *x24*x31*x41    
     7  +coeff( 61)*x11*x21    *x44    
     8  +coeff( 62)    *x21*x32*x41    
      y_r5p65_484816old_q3ext=y_r5p65_484816old_q3ext
     9  +coeff( 63)    *x22*x32        
     1  +coeff( 64)    *x22*x31*x41    
     2  +coeff( 65)    *x21*x32    *x51
     3  +coeff( 66)    *x21    *x42*x51
     4  +coeff( 67)    *x23    *x41    
     5  +coeff( 68)*x11        *x41*x51
     6  +coeff( 69)    *x21    *x41*x52
     7  +coeff( 70)            *x41*x53
     8  +coeff( 71)        *x34*x41    
      y_r5p65_484816old_q3ext=y_r5p65_484816old_q3ext
     9  +coeff( 72)        *x33    *x52
     1  +coeff( 73)    *x23*x31*x41    
     2  +coeff( 74)*x11*x21    *x42    
     3  +coeff( 75)*x12    *x31        
     4  +coeff( 76)*x11*x21*x31    *x51
     5  +coeff( 77)    *x22    *x41*x52
     6  +coeff( 78)*x12        *x42    
     7  +coeff( 79)*x11*x22    *x42    
     8  +coeff( 80)*x12*x21    *x41    
      y_r5p65_484816old_q3ext=y_r5p65_484816old_q3ext
     9  +coeff( 81)*x12*x22            
     1  +coeff( 82)*x11*x21*x34        
     2  +coeff( 83)    *x24    *x43    
     3  +coeff( 84)*x11*x22*x33*x41    
     4  +coeff( 85)            *x42*x51
     5  +coeff( 86)        *x31    *x52
     6  +coeff( 87)    *x21*x31*x41*x51
     7  +coeff( 88)        *x31    *x53
     8  +coeff( 89)    *x22        *x52
      y_r5p65_484816old_q3ext=y_r5p65_484816old_q3ext
     9  +coeff( 90)*x11    *x31*x42    
     1  +coeff( 91)*x11        *x43    
     2  +coeff( 92)    *x22*x31*x41*x51
     3  +coeff( 93)*x11        *x42*x51
     4  +coeff( 94)    *x22    *x42*x51
     5  +coeff( 95)    *x23    *x41*x51
c
      return
      end
      function p_r5p65_484816old_q3ext(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 91)
      data ncoeff/ 90/
      data avdat/ -0.6288191E-02/
      data xmin/
     1 -0.14915E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.47305E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26369E-01, 0.49936E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     + -0.31521202E-02, 0.38779366E-02, 0.71514971E-02,-0.26754849E-01,
     + -0.10749409E-01, 0.14945506E-01, 0.22709572E-02, 0.18856920E-01,
     + -0.35185209E-02, 0.31816312E-02,-0.19056579E-01,-0.14370596E-02,
     +  0.58701625E-02,-0.48127226E-02,-0.24904883E-02, 0.16002480E-01,
     + -0.42824112E-02, 0.15023644E-02, 0.36285007E-02, 0.73569320E-03,
     + -0.10363467E-03, 0.46870476E-03, 0.13194454E-04,-0.25073087E-03,
     + -0.70207105E-04,-0.86185413E-04, 0.10534564E-03,-0.78574638E-03,
     + -0.39373040E-02,-0.40215869E-02, 0.43990952E-02, 0.73273957E-03,
     +  0.20929847E-02,-0.24541115E-03,-0.16465749E-02,-0.22504265E-03,
     + -0.15784343E-03, 0.93375333E-03, 0.27254862E-02,-0.13652178E-02,
     + -0.39086454E-02, 0.12878575E-02,-0.10007295E-02,-0.22451342E-02,
     +  0.88286382E-03,-0.24796010E-02, 0.52803539E-03, 0.28767623E-03,
     +  0.31392239E-04,-0.66399650E-03,-0.44389642E-03, 0.19736465E-02,
     + -0.15729411E-02,-0.99709141E-03, 0.11876668E-02, 0.12053797E-02,
     +  0.12268178E-02, 0.23795094E-02, 0.21277308E-03,-0.16115079E-03,
     + -0.57248137E-03, 0.76512515E-03,-0.77887031E-04, 0.80504554E-03,
     + -0.49813819E-03, 0.18579603E-03, 0.18911780E-03,-0.20224466E-03,
     +  0.12532917E-03, 0.64550631E-03, 0.12274013E-02,-0.60060748E-03,
     +  0.30130270E-03, 0.89839747E-03, 0.55297307E-03, 0.15273202E-02,
     + -0.23692155E-04, 0.57473808E-04,-0.56511246E-04, 0.29229451E-03,
     +  0.72521652E-04,-0.23436353E-03, 0.15042833E-03,-0.18207372E-03,
     +  0.10379052E-03,-0.17071039E-03,-0.19250896E-03,-0.27388844E-03,
     +  0.59632026E-03, 0.27001832E-03,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x12 = x11*x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x34 = x33*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x44 = x43*x4
      x51 = x5
      x52 = x51*x5
      x53 = x52*x5
      x54 = x53*x5
c
c                  function
c
      p_r5p65_484816old_q3ext=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)    *x21            
     3  +coeff(  3)        *x31        
     4  +coeff(  4)            *x41    
     5  +coeff(  5)                *x51
     6  +coeff(  6)    *x22            
     7  +coeff(  7)    *x21*x31        
     8  +coeff(  8)    *x21    *x41    
      p_r5p65_484816old_q3ext=p_r5p65_484816old_q3ext
     9  +coeff(  9)        *x31*x41    
     1  +coeff( 10)    *x21        *x51
     2  +coeff( 11)            *x41*x51
     3  +coeff( 12)                *x52
     4  +coeff( 13)*x11*x21            
     5  +coeff( 14)    *x23            
     6  +coeff( 15)*x11        *x41    
     7  +coeff( 16)    *x22    *x41    
     8  +coeff( 17)    *x21    *x42    
      p_r5p65_484816old_q3ext=p_r5p65_484816old_q3ext
     9  +coeff( 18)            *x43    
     1  +coeff( 19)    *x22        *x51
     2  +coeff( 20)    *x22    *x42    
     3  +coeff( 21)            *x44    
     4  +coeff( 22)    *x22*x31    *x51
     5  +coeff( 23)        *x33    *x51
     6  +coeff( 24)        *x31    *x53
     7  +coeff( 25)    *x24*x31        
     8  +coeff( 26)            *x41*x54
      p_r5p65_484816old_q3ext=p_r5p65_484816old_q3ext
     9  +coeff( 27)*x11                
     1  +coeff( 28)        *x32        
     2  +coeff( 29)            *x42    
     3  +coeff( 30)        *x31    *x51
     4  +coeff( 31)    *x22*x31        
     5  +coeff( 32)*x12                
     6  +coeff( 33)*x11*x21    *x41    
     7  +coeff( 34)*x11    *x31        
     8  +coeff( 35)    *x21*x31*x41    
      p_r5p65_484816old_q3ext=p_r5p65_484816old_q3ext
     9  +coeff( 36)*x11            *x51
     1  +coeff( 37)        *x31*x41*x51
     2  +coeff( 38)        *x31    *x52
     3  +coeff( 39)            *x41*x52
     4  +coeff( 40)*x11*x22            
     5  +coeff( 41)    *x24            
     6  +coeff( 42)*x11*x21*x31        
     7  +coeff( 43)*x11        *x42    
     8  +coeff( 44)    *x21    *x43    
      p_r5p65_484816old_q3ext=p_r5p65_484816old_q3ext
     9  +coeff( 45)*x11*x21        *x51
     1  +coeff( 46)*x11*x23            
     2  +coeff( 47)*x12        *x41    
     3  +coeff( 48)        *x31*x42    
     4  +coeff( 49)            *x42*x51
     5  +coeff( 50)    *x23    *x41    
     6  +coeff( 51)*x11    *x31*x41    
     7  +coeff( 52)    *x22*x31*x41    
     8  +coeff( 53)    *x21*x31*x42    
      p_r5p65_484816old_q3ext=p_r5p65_484816old_q3ext
     9  +coeff( 54)            *x41*x53
     1  +coeff( 55)*x11*x22    *x41    
     2  +coeff( 56)*x11*x21*x31*x41    
     3  +coeff( 57)*x11*x21    *x42    
     4  +coeff( 58)    *x23    *x42    
     5  +coeff( 59)    *x21    *x43*x51
     6  +coeff( 60)    *x21        *x52
     7  +coeff( 61)    *x23*x31        
     8  +coeff( 62)    *x22*x32        
      p_r5p65_484816old_q3ext=p_r5p65_484816old_q3ext
     9  +coeff( 63)*x11    *x31    *x51
     1  +coeff( 64)    *x22    *x41*x51
     2  +coeff( 65)            *x43*x51
     3  +coeff( 66)    *x21    *x41*x52
     4  +coeff( 67)*x12    *x31        
     5  +coeff( 68)        *x34*x41    
     6  +coeff( 69)*x12            *x51
     7  +coeff( 70)*x11*x21    *x41*x51
     8  +coeff( 71)    *x22    *x42*x51
      p_r5p65_484816old_q3ext=p_r5p65_484816old_q3ext
     9  +coeff( 72)*x12*x22            
     1  +coeff( 73)*x12*x21    *x41    
     2  +coeff( 74)*x11*x22    *x42    
     3  +coeff( 75)*x11*x23*x32        
     4  +coeff( 76)    *x24    *x43    
     5  +coeff( 77)*x11*x21*x33    *x51
     6  +coeff( 78)    *x21*x32        
     7  +coeff( 79)        *x33        
     8  +coeff( 80)    *x21    *x41*x51
      p_r5p65_484816old_q3ext=p_r5p65_484816old_q3ext
     9  +coeff( 81)                *x53
     1  +coeff( 82)    *x21*x32*x41    
     2  +coeff( 83)*x11        *x41*x51
     3  +coeff( 84)        *x31*x42*x51
     4  +coeff( 85)*x11            *x52
     5  +coeff( 86)    *x22        *x52
     6  +coeff( 87)            *x42*x52
     7  +coeff( 88)                *x54
     8  +coeff( 89)    *x23*x31*x41    
      p_r5p65_484816old_q3ext=p_r5p65_484816old_q3ext
     9  +coeff( 90)*x11*x21*x31    *x51
c
      return
      end
      function sl_r5p65_484816old_q3ext(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 30)
      data ncoeff/ 29/
      data avdat/ -0.7412717E-02/
      data xmin/
     1 -0.14915E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.47305E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26369E-01, 0.49936E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     +  0.77920812E-02,-0.26562589E+00,-0.31384729E-01, 0.39535362E-01,
     + -0.31279512E-01, 0.84339537E-01, 0.15747633E-01,-0.91514476E-02,
     +  0.34377407E-01,-0.93168877E-02,-0.82569821E-02, 0.34913418E-02,
     + -0.26554622E-01, 0.53604599E-02, 0.30422751E-01,-0.16329339E-01,
     + -0.17793835E-03,-0.46585188E-02, 0.20013515E-01,-0.28465334E-02,
     + -0.34913417E-01,-0.15775247E-01, 0.95720217E-02, 0.53806585E-03,
     + -0.22837985E-02, 0.22812355E-02, 0.34833881E-02, 0.26476046E-02,
     + -0.38683820E-02,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x12 = x11*x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x41 = x4
      x42 = x41*x4
      x51 = x5
      x52 = x51*x5
c
c                  function
c
      sl_r5p65_484816old_q3ext=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)    *x21            
     3  +coeff(  3)                *x51
     4  +coeff(  4)*x11                
     5  +coeff(  5)    *x22            
     6  +coeff(  6)    *x21    *x41    
     7  +coeff(  7)*x11        *x41    
     8  +coeff(  8)    *x23*x31        
      sl_r5p65_484816old_q3ext=sl_r5p65_484816old_q3ext
     9  +coeff(  9)    *x21*x31        
     1  +coeff( 10)    *x21        *x51
     2  +coeff( 11)                *x52
     3  +coeff( 12)*x11*x21            
     4  +coeff( 13)    *x23            
     5  +coeff( 14)*x11    *x31        
     6  +coeff( 15)    *x21    *x42    
     7  +coeff( 16)*x11*x22            
     8  +coeff( 17)    *x23*x31*x41    
      sl_r5p65_484816old_q3ext=sl_r5p65_484816old_q3ext
     9  +coeff( 18)            *x42    
     1  +coeff( 19)    *x21*x31*x41    
     2  +coeff( 20)*x11            *x51
     3  +coeff( 21)    *x23    *x41    
     4  +coeff( 22)*x11*x22    *x41    
     5  +coeff( 23)    *x24    *x41    
     6  +coeff( 24)        *x31        
     7  +coeff( 25)            *x41*x51
     8  +coeff( 26)    *x22*x31        
      sl_r5p65_484816old_q3ext=sl_r5p65_484816old_q3ext
     9  +coeff( 27)    *x21*x32        
     1  +coeff( 28)*x11        *x42    
     2  +coeff( 29)*x12*x21            
c
      return
      end
      function x_r5p65_484816old_fp(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 91)
      data ncoeff/ 90/
      data avdat/  0.9042589E-02/
      data xmin/
     1 -0.14915E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.47305E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26369E-01, 0.49936E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     +  0.55896188E-02, 0.29041157E-02,-0.14043563E-02,-0.34446048E-02,
     +  0.65021706E+00,-0.34623802E-01, 0.45893073E-01,-0.51535659E-01,
     + -0.36719870E-01, 0.19601200E-01,-0.12907322E-01,-0.11728756E-01,
     + -0.24001142E-01,-0.46351133E-02, 0.12446793E-01,-0.10424023E-01,
     + -0.14700241E-01,-0.24313030E-02,-0.57900506E-02,-0.29707039E-02,
     +  0.40310356E-02,-0.38526517E-02, 0.54928586E-02,-0.49327039E-02,
     +  0.18566281E-01, 0.10764001E-03,-0.27034518E-02,-0.22026517E-02,
     +  0.55534388E-02, 0.94750188E-02,-0.72710408E-03,-0.21239836E-02,
     +  0.63533392E-02, 0.48442129E-02, 0.32409958E-02,-0.54935232E-03,
     + -0.11087847E-02, 0.44161403E-02,-0.30358708E-02,-0.38176014E-02,
     + -0.12827219E-02,-0.42565129E-03, 0.40205861E-02, 0.28021301E-02,
     +  0.32952549E-02,-0.11604559E-02, 0.21240395E-03,-0.28510080E-03,
     + -0.14471422E-02, 0.23971796E-02, 0.32712799E-02,-0.20041282E-02,
     + -0.10551857E-02,-0.11630233E-02, 0.22844030E-02, 0.14954989E-02,
     + -0.59377863E-02, 0.52821101E-02,-0.30385605E-02, 0.16944718E-02,
     + -0.70720224E-03,-0.11855717E-02, 0.49087772E-03,-0.24279354E-02,
     +  0.35213851E-03, 0.32523826E-02, 0.19822239E-02,-0.35442627E-03,
     + -0.27925239E-03, 0.35471426E-03,-0.13060945E-02, 0.93601173E-03,
     +  0.57616399E-03,-0.57304482E-03,-0.98652334E-03,-0.10656028E-02,
     +  0.12704666E-02,-0.31518639E-03, 0.85810362E-03,-0.71727380E-03,
     +  0.62760693E-03, 0.25549973E-03,-0.40533961E-03,-0.77297329E-03,
     + -0.31173977E-03, 0.51048287E-03,-0.12503392E-02, 0.24732244E-02,
     + -0.10503834E-02, 0.13558832E-02,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x34 = x33*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x44 = x43*x4
      x51 = x5
      x52 = x51*x5
      x53 = x52*x5
      x54 = x53*x5
c
c                  function
c
      x_r5p65_484816old_fp=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)    *x21            
     3  +coeff(  3)        *x31        
     4  +coeff(  4)            *x41    
     5  +coeff(  5)                *x51
     6  +coeff(  6)    *x21    *x41    
     7  +coeff(  7)    *x21        *x51
     8  +coeff(  8)                *x52
      x_r5p65_484816old_fp=x_r5p65_484816old_fp
     9  +coeff(  9)*x11                
     1  +coeff( 10)    *x22            
     2  +coeff( 11)    *x21*x31        
     3  +coeff( 12)            *x42    
     4  +coeff( 13)    *x21    *x42    
     5  +coeff( 14)        *x31*x41    
     6  +coeff( 15)    *x23            
     7  +coeff( 16)    *x21*x31*x41    
     8  +coeff( 17)    *x21    *x41*x51
      x_r5p65_484816old_fp=x_r5p65_484816old_fp
     9  +coeff( 18)    *x21        *x52
     1  +coeff( 19)*x11        *x41    
     2  +coeff( 20)            *x41*x51
     3  +coeff( 21)    *x22    *x41    
     4  +coeff( 22)    *x21*x31    *x51
     5  +coeff( 23)                *x53
     6  +coeff( 24)    *x24            
     7  +coeff( 25)    *x23    *x41    
     8  +coeff( 26)*x11*x21            
      x_r5p65_484816old_fp=x_r5p65_484816old_fp
     9  +coeff( 27)*x11    *x31        
     1  +coeff( 28)*x11            *x51
     2  +coeff( 29)*x11*x22            
     3  +coeff( 30)*x11*x22    *x41    
     4  +coeff( 31)        *x31    *x51
     5  +coeff( 32)    *x21*x32        
     6  +coeff( 33)    *x22        *x51
     7  +coeff( 34)    *x22    *x42    
     8  +coeff( 35)    *x22    *x42*x51
      x_r5p65_484816old_fp=x_r5p65_484816old_fp
     9  +coeff( 36)    *x22*x31        
     1  +coeff( 37)            *x43    
     2  +coeff( 38)    *x23*x31        
     3  +coeff( 39)    *x21*x31*x42    
     4  +coeff( 40)    *x21    *x42*x51
     5  +coeff( 41)*x11    *x31*x41    
     6  +coeff( 42)    *x23        *x53
     7  +coeff( 43)*x11*x23            
     8  +coeff( 44)*x11*x22*x31        
      x_r5p65_484816old_fp=x_r5p65_484816old_fp
     9  +coeff( 45)*x11*x22        *x51
     1  +coeff( 46)        *x31*x42    
     2  +coeff( 47)            *x42*x51
     3  +coeff( 48)        *x34        
     4  +coeff( 49)    *x21*x32*x41    
     5  +coeff( 50)    *x23        *x51
     6  +coeff( 51)    *x22    *x41*x51
     7  +coeff( 52)    *x21*x31*x41*x51
     8  +coeff( 53)            *x41*x53
      x_r5p65_484816old_fp=x_r5p65_484816old_fp
     9  +coeff( 54)                *x54
     1  +coeff( 55)    *x24*x31        
     2  +coeff( 56)    *x24    *x41    
     3  +coeff( 57)    *x24        *x51
     4  +coeff( 58)    *x23    *x41*x51
     5  +coeff( 59)    *x23        *x52
     6  +coeff( 60)    *x21    *x42*x52
     7  +coeff( 61)*x11    *x31    *x51
     8  +coeff( 62)*x11        *x41*x51
      x_r5p65_484816old_fp=x_r5p65_484816old_fp
     9  +coeff( 63)*x11            *x52
     1  +coeff( 64)    *x24        *x52
     2  +coeff( 65)*x11*x21*x31*x41    
     3  +coeff( 66)    *x24    *x41*x52
     4  +coeff( 67)*x11*x22    *x41*x51
     5  +coeff( 68)        *x32*x41    
     6  +coeff( 69)        *x32    *x51
     7  +coeff( 70)        *x31    *x52
     8  +coeff( 71)    *x21    *x43    
      x_r5p65_484816old_fp=x_r5p65_484816old_fp
     9  +coeff( 72)    *x21    *x41*x52
     1  +coeff( 73)        *x31*x41*x52
     2  +coeff( 74)            *x42*x52
     3  +coeff( 75)    *x22    *x43    
     4  +coeff( 76)    *x21    *x44    
     5  +coeff( 77)    *x23*x31    *x51
     6  +coeff( 78)*x11    *x32        
     7  +coeff( 79)    *x23*x31    *x52
     8  +coeff( 80)*x11*x21    *x42    
      x_r5p65_484816old_fp=x_r5p65_484816old_fp
     9  +coeff( 81)*x11        *x43    
     1  +coeff( 82)*x11*x21*x31    *x51
     2  +coeff( 83)*x11    *x32    *x51
     3  +coeff( 84)*x11*x21    *x41*x51
     4  +coeff( 85)*x11    *x31*x41*x51
     5  +coeff( 86)*x11*x21        *x52
     6  +coeff( 87)*x11*x24            
     7  +coeff( 88)    *x22*x33*x42*x51
     8  +coeff( 89)*x11*x22*x32*x41    
      x_r5p65_484816old_fp=x_r5p65_484816old_fp
     9  +coeff( 90)*x11*x22*x31*x43    
c
      return
      end
      function t_r5p65_484816old_fp(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 68)
      data ncoeff/ 67/
      data avdat/  0.1527806E-02/
      data xmin/
     1 -0.14915E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.47305E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26369E-01, 0.49936E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     +  0.14498655E-02,-0.19508336E-01,-0.73196621E-04,-0.13477789E-03,
     +  0.11265152E+00,-0.34321686E-02, 0.56418618E-02,-0.10390101E-01,
     + -0.17778747E-02, 0.17450720E-02, 0.22509608E-03,-0.18052028E-02,
     + -0.22310019E-02,-0.60094055E-03, 0.10858106E-02,-0.45048004E-04,
     + -0.64780517E-03,-0.52112108E-03, 0.35277041E-03, 0.71006629E-03,
     + -0.34356021E-03,-0.63619286E-05, 0.10493525E-02,-0.61693485E-03,
     +  0.18425733E-03,-0.48765840E-03,-0.94552542E-03, 0.35244180E-03,
     +  0.93096681E-03,-0.89554967E-04, 0.43755403E-03, 0.29097684E-03,
     + -0.92258284E-04, 0.37474764E-03, 0.74150812E-04,-0.88677392E-04,
     + -0.12224479E-03, 0.61330595E-03, 0.81295693E-04, 0.37593048E-03,
     + -0.67108276E-03, 0.58087672E-03,-0.39920383E-03,-0.16134280E-03,
     +  0.21059900E-03,-0.80638143E-04, 0.56248286E-03,-0.32942998E-03,
     +  0.94885763E-04, 0.14291018E-03,-0.22028510E-03,-0.16954001E-03,
     + -0.12724435E-03, 0.46211289E-03,-0.12916556E-02, 0.38224796E-03,
     + -0.17915858E-03, 0.90227922E-03,-0.61675644E-03, 0.81404939E-03,
     + -0.24198731E-03, 0.31811360E-03,-0.99205936E-04,-0.76301559E-03,
     +  0.47419590E-03,-0.20361747E-03, 0.53237990E-03,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x12 = x11*x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x44 = x43*x4
      x51 = x5
      x52 = x51*x5
      x53 = x52*x5
      x54 = x53*x5
c
c                  function
c
      t_r5p65_484816old_fp=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)    *x21            
     3  +coeff(  3)        *x31        
     4  +coeff(  4)            *x41    
     5  +coeff(  5)                *x51
     6  +coeff(  6)*x11                
     7  +coeff(  7)    *x21        *x51
     8  +coeff(  8)                *x52
      t_r5p65_484816old_fp=t_r5p65_484816old_fp
     9  +coeff(  9)            *x42    
     1  +coeff( 10)    *x22            
     2  +coeff( 11)*x11*x21            
     3  +coeff( 12)    *x21    *x42    
     4  +coeff( 13)    *x21    *x41*x51
     5  +coeff( 14)    *x21        *x52
     6  +coeff( 15)                *x53
     7  +coeff( 16)    *x21    *x41    
     8  +coeff( 17)        *x31*x41    
      t_r5p65_484816old_fp=t_r5p65_484816old_fp
     9  +coeff( 18)            *x41*x51
     1  +coeff( 19)*x11        *x41    
     2  +coeff( 20)    *x22    *x41    
     3  +coeff( 21)*x11            *x51
     4  +coeff( 22)    *x21*x33        
     5  +coeff( 23)    *x22        *x51
     6  +coeff( 24)    *x21*x31    *x51
     7  +coeff( 25)            *x42*x51
     8  +coeff( 26)*x11*x22            
      t_r5p65_484816old_fp=t_r5p65_484816old_fp
     9  +coeff( 27)    *x24            
     1  +coeff( 28)*x11        *x42    
     2  +coeff( 29)    *x22    *x42    
     3  +coeff( 30)    *x22*x31    *x51
     4  +coeff( 31)    *x24*x31        
     5  +coeff( 32)    *x21*x31        
     6  +coeff( 33)        *x31    *x51
     7  +coeff( 34)    *x23            
     8  +coeff( 35)*x11    *x31        
      t_r5p65_484816old_fp=t_r5p65_484816old_fp
     9  +coeff( 36)*x12                
     1  +coeff( 37)    *x23*x31        
     2  +coeff( 38)    *x23    *x41    
     3  +coeff( 39)*x11    *x31*x41    
     4  +coeff( 40)    *x21    *x43    
     5  +coeff( 41)    *x21    *x42*x51
     6  +coeff( 42)*x11*x23            
     7  +coeff( 43)*x11*x23    *x41    
     8  +coeff( 44)            *x43    
      t_r5p65_484816old_fp=t_r5p65_484816old_fp
     9  +coeff( 45)    *x21*x31*x42    
     1  +coeff( 46)*x11        *x41*x51
     2  +coeff( 47)    *x22    *x41*x51
     3  +coeff( 48)    *x21*x31*x41*x51
     4  +coeff( 49)*x11            *x52
     5  +coeff( 50)    *x22        *x52
     6  +coeff( 51)                *x54
     7  +coeff( 52)*x11*x21    *x42    
     8  +coeff( 53)        *x31*x44    
      t_r5p65_484816old_fp=t_r5p65_484816old_fp
     9  +coeff( 54)*x11*x22        *x51
     1  +coeff( 55)    *x24        *x51
     2  +coeff( 56)    *x23*x31    *x51
     3  +coeff( 57)*x11*x21    *x41*x51
     4  +coeff( 58)    *x23    *x41*x51
     5  +coeff( 59)    *x23        *x52
     6  +coeff( 60)    *x22    *x41*x52
     7  +coeff( 61)            *x41*x54
     8  +coeff( 62)*x11*x24            
      t_r5p65_484816old_fp=t_r5p65_484816old_fp
     9  +coeff( 63)*x11    *x33    *x51
     1  +coeff( 64)    *x24        *x52
     2  +coeff( 65)    *x23    *x41*x52
     3  +coeff( 66)            *x44*x52
     4  +coeff( 67)    *x24    *x42*x51
c
      return
      end
      function y_r5p65_484816old_fp(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 96)
      data ncoeff/ 95/
      data avdat/ -0.2354856E-02/
      data xmin/
     1 -0.14915E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.47305E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26369E-01, 0.49936E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     + -0.57976418E-02,-0.20063110E-02,-0.52149814E-01, 0.36759232E-02,
     + -0.76830299E-02,-0.45218952E-02, 0.52333396E-03, 0.10280630E-01,
     + -0.50480985E-02,-0.47890930E-02, 0.15256491E-01, 0.54149103E-03,
     +  0.20528906E-02, 0.77304599E-03,-0.13910572E-02, 0.98042386E-02,
     + -0.52817850E-02, 0.25792492E-02, 0.61803153E-02, 0.67445501E-02,
     + -0.32762741E-02,-0.42838314E-04, 0.44165594E-02,-0.42552389E-02,
     + -0.99137811E-04, 0.30536488E-04,-0.82314282E-03,-0.37562363E-02,
     + -0.60315266E-04, 0.50628430E-03,-0.15049606E-02, 0.49070450E-02,
     + -0.34423189E-02,-0.15516196E-02, 0.41976925E-02, 0.14710074E-02,
     +  0.91563078E-03,-0.51650382E-02, 0.72757271E-03, 0.97128953E-03,
     + -0.75894367E-03,-0.12308824E-02, 0.31140505E-02,-0.44887362E-03,
     + -0.10486051E-02,-0.10017878E-02,-0.27355240E-02,-0.76621631E-03,
     +  0.23232414E-02, 0.34794988E-03,-0.10601045E-02, 0.17911674E-02,
     + -0.25186655E-02,-0.39291175E-03, 0.12723994E-03, 0.27386585E-03,
     +  0.14206642E-03,-0.69659535E-03,-0.11371931E-02,-0.27814068E-03,
     +  0.15608554E-02,-0.92203566E-03,-0.63654926E-03,-0.96146856E-03,
     + -0.16460085E-03,-0.25978306E-03, 0.17282756E-02, 0.88497257E-03,
     +  0.37085335E-03, 0.28104424E-02, 0.67570404E-03,-0.68538962E-03,
     +  0.18267462E-02, 0.13151696E-03,-0.15822312E-03,-0.25040537E-03,
     +  0.13160036E-02, 0.31355061E-03, 0.17989677E-03, 0.16041027E-02,
     +  0.18623083E-03, 0.22189043E-03, 0.20988708E-03, 0.66814874E-03,
     + -0.12499549E-03, 0.67405612E-03,-0.35930818E-03, 0.93061756E-03,
     + -0.23067754E-03,-0.21394126E-02,-0.52689429E-03,-0.10208488E-02,
     + -0.88980352E-03, 0.20722020E-02, 0.18005597E-02,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x12 = x11*x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x34 = x33*x3
      x35 = x34*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x51 = x5
      x52 = x51*x5
      x53 = x52*x5
      x54 = x53*x5
c
c                  function
c
      y_r5p65_484816old_fp=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)        *x31        
     3  +coeff(  3)            *x41    
     4  +coeff(  4)    *x21            
     5  +coeff(  5)                *x51
     6  +coeff(  6)            *x42    
     7  +coeff(  7)    *x21*x31        
     8  +coeff(  8)    *x21    *x41    
      y_r5p65_484816old_fp=y_r5p65_484816old_fp
     9  +coeff(  9)        *x31    *x51
     1  +coeff( 10)            *x41*x51
     2  +coeff( 11)    *x22            
     3  +coeff( 12)    *x21        *x51
     4  +coeff( 13)                *x52
     5  +coeff( 14)            *x42*x51
     6  +coeff( 15)*x11        *x41    
     7  +coeff( 16)    *x22    *x41    
     8  +coeff( 17)    *x21    *x41*x51
      y_r5p65_484816old_fp=y_r5p65_484816old_fp
     9  +coeff( 18)        *x31    *x52
     1  +coeff( 19)            *x41*x52
     2  +coeff( 20)*x11*x21            
     3  +coeff( 21)    *x23            
     4  +coeff( 22)        *x33*x41    
     5  +coeff( 23)*x11*x21    *x41    
     6  +coeff( 24)            *x41*x53
     7  +coeff( 25)    *x22*x33        
     8  +coeff( 26)        *x35*x41    
      y_r5p65_484816old_fp=y_r5p65_484816old_fp
     9  +coeff( 27)        *x32        
     1  +coeff( 28)        *x31*x41    
     2  +coeff( 29)        *x33        
     3  +coeff( 30)            *x43    
     4  +coeff( 31)    *x21    *x42    
     5  +coeff( 32)    *x22*x31        
     6  +coeff( 33)    *x22        *x51
     7  +coeff( 34)    *x21        *x52
     8  +coeff( 35)    *x22    *x42    
      y_r5p65_484816old_fp=y_r5p65_484816old_fp
     9  +coeff( 36)*x11*x21*x31        
     1  +coeff( 37)*x11        *x41*x51
     2  +coeff( 38)    *x22    *x41*x51
     3  +coeff( 39)*x12                
     4  +coeff( 40)        *x31*x41*x51
     5  +coeff( 41)                *x53
     6  +coeff( 42)    *x21    *x43    
     7  +coeff( 43)    *x22*x31*x41    
     8  +coeff( 44)*x11        *x42    
      y_r5p65_484816old_fp=y_r5p65_484816old_fp
     9  +coeff( 45)        *x31    *x53
     1  +coeff( 46)*x11*x22            
     2  +coeff( 47)    *x24            
     3  +coeff( 48)*x11*x21        *x51
     4  +coeff( 49)    *x23        *x51
     5  +coeff( 50)*x11            *x52
     6  +coeff( 51)                *x54
     7  +coeff( 52)*x11*x21    *x42    
     8  +coeff( 53)*x11*x23            
      y_r5p65_484816old_fp=y_r5p65_484816old_fp
     9  +coeff( 54)*x11*x21*x33*x41    
     1  +coeff( 55)*x11                
     2  +coeff( 56)    *x21*x32        
     3  +coeff( 57)*x11    *x31        
     4  +coeff( 58)    *x21*x31*x42    
     5  +coeff( 59)            *x43*x51
     6  +coeff( 60)    *x21*x31*x41*x51
     7  +coeff( 61)    *x21    *x42*x51
     8  +coeff( 62)            *x42*x52
      y_r5p65_484816old_fp=y_r5p65_484816old_fp
     9  +coeff( 63)    *x23*x31        
     1  +coeff( 64)    *x22*x31    *x51
     2  +coeff( 65)    *x21    *x41*x52
     3  +coeff( 66)        *x34*x41    
     4  +coeff( 67)*x11*x21*x31*x41    
     5  +coeff( 68)    *x21    *x42*x52
     6  +coeff( 69)*x12        *x41    
     7  +coeff( 70)    *x22    *x41*x52
     8  +coeff( 71)    *x22*x34        
      y_r5p65_484816old_fp=y_r5p65_484816old_fp
     9  +coeff( 72)*x12*x22            
     1  +coeff( 73)    *x23    *x43*x51
     2  +coeff( 74)        *x32    *x51
     3  +coeff( 75)    *x23    *x41    
     4  +coeff( 76)*x11    *x31    *x51
     5  +coeff( 77)    *x22    *x43    
     6  +coeff( 78)*x11*x21*x32        
     7  +coeff( 79)*x11        *x42*x51
     8  +coeff( 80)    *x22    *x42*x51
      y_r5p65_484816old_fp=y_r5p65_484816old_fp
     9  +coeff( 81)*x12    *x31        
     1  +coeff( 82)*x11*x22    *x41    
     2  +coeff( 83)*x11        *x41*x52
     3  +coeff( 84)        *x31    *x54
     4  +coeff( 85)*x12            *x51
     5  +coeff( 86)    *x24        *x51
     6  +coeff( 87)        *x33*x42*x51
     7  +coeff( 88)    *x22        *x53
     8  +coeff( 89)*x11    *x33*x41    
      y_r5p65_484816old_fp=y_r5p65_484816old_fp
     9  +coeff( 90)    *x23    *x42*x51
     1  +coeff( 91)    *x21*x32    *x53
     2  +coeff( 92)*x11*x23    *x41    
     3  +coeff( 93)*x11*x22    *x41*x51
     4  +coeff( 94)    *x22    *x41*x53
     5  +coeff( 95)    *x21    *x41*x54
c
      return
      end
      function p_r5p65_484816old_fp(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 91)
      data ncoeff/ 90/
      data avdat/ -0.6288547E-02/
      data xmin/
     1 -0.14915E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.47305E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26369E-01, 0.49936E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     + -0.31518494E-02, 0.38780193E-02, 0.71510957E-02,-0.26755314E-01,
     + -0.10748606E-01, 0.14945617E-01, 0.22713065E-02, 0.18856239E-01,
     + -0.35186263E-02, 0.31808806E-02,-0.19054338E-01,-0.14355226E-02,
     +  0.58702137E-02,-0.48129633E-02,-0.24902225E-02, 0.16003178E-01,
     + -0.42818794E-02, 0.15026580E-02, 0.36303175E-02, 0.73570793E-03,
     + -0.10352996E-03, 0.46900651E-03, 0.12672084E-04,-0.25441273E-03,
     + -0.70355061E-04,-0.88830537E-04, 0.10519365E-03,-0.78572356E-03,
     + -0.39373804E-02,-0.40203915E-02, 0.43992600E-02, 0.73268422E-03,
     +  0.20924774E-02,-0.24535341E-03,-0.16460743E-02,-0.22441933E-03,
     + -0.15825266E-03, 0.93817356E-03, 0.27268033E-02,-0.13647737E-02,
     + -0.39093518E-02, 0.12876472E-02,-0.10003098E-02,-0.22443675E-02,
     +  0.88311930E-03,-0.24795104E-02, 0.52807812E-03, 0.28770301E-03,
     +  0.31903499E-04,-0.66426245E-03,-0.44367515E-03, 0.19744823E-02,
     + -0.15720574E-02,-0.10089529E-02, 0.11875061E-02, 0.12048178E-02,
     +  0.12260701E-02, 0.23796172E-02, 0.21295631E-03,-0.16245955E-03,
     + -0.57291065E-03, 0.76568499E-03,-0.78386242E-04, 0.80666173E-03,
     + -0.49759692E-03, 0.19048566E-03, 0.18903641E-03,-0.20243842E-03,
     +  0.12529953E-03, 0.64436632E-03, 0.12212353E-02,-0.60037314E-03,
     +  0.30134394E-03, 0.89651812E-03, 0.55397791E-03, 0.15285376E-02,
     + -0.20147883E-04, 0.57551464E-04,-0.56558620E-04, 0.29094602E-03,
     +  0.68082569E-04,-0.23389935E-03, 0.15094195E-03,-0.18216310E-03,
     +  0.10448603E-03,-0.16735666E-03,-0.19286879E-03,-0.28118951E-03,
     +  0.59606280E-03, 0.26832908E-03,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x12 = x11*x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x34 = x33*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x44 = x43*x4
      x51 = x5
      x52 = x51*x5
      x53 = x52*x5
      x54 = x53*x5
c
c                  function
c
      p_r5p65_484816old_fp=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)    *x21            
     3  +coeff(  3)        *x31        
     4  +coeff(  4)            *x41    
     5  +coeff(  5)                *x51
     6  +coeff(  6)    *x22            
     7  +coeff(  7)    *x21*x31        
     8  +coeff(  8)    *x21    *x41    
      p_r5p65_484816old_fp=p_r5p65_484816old_fp
     9  +coeff(  9)        *x31*x41    
     1  +coeff( 10)    *x21        *x51
     2  +coeff( 11)            *x41*x51
     3  +coeff( 12)                *x52
     4  +coeff( 13)*x11*x21            
     5  +coeff( 14)    *x23            
     6  +coeff( 15)*x11        *x41    
     7  +coeff( 16)    *x22    *x41    
     8  +coeff( 17)    *x21    *x42    
      p_r5p65_484816old_fp=p_r5p65_484816old_fp
     9  +coeff( 18)            *x43    
     1  +coeff( 19)    *x22        *x51
     2  +coeff( 20)    *x22    *x42    
     3  +coeff( 21)            *x44    
     4  +coeff( 22)    *x22*x31    *x51
     5  +coeff( 23)        *x33    *x51
     6  +coeff( 24)        *x31    *x53
     7  +coeff( 25)    *x24*x31        
     8  +coeff( 26)            *x41*x54
      p_r5p65_484816old_fp=p_r5p65_484816old_fp
     9  +coeff( 27)*x11                
     1  +coeff( 28)        *x32        
     2  +coeff( 29)            *x42    
     3  +coeff( 30)        *x31    *x51
     4  +coeff( 31)    *x22*x31        
     5  +coeff( 32)*x12                
     6  +coeff( 33)*x11*x21    *x41    
     7  +coeff( 34)*x11    *x31        
     8  +coeff( 35)    *x21*x31*x41    
      p_r5p65_484816old_fp=p_r5p65_484816old_fp
     9  +coeff( 36)*x11            *x51
     1  +coeff( 37)        *x31*x41*x51
     2  +coeff( 38)        *x31    *x52
     3  +coeff( 39)            *x41*x52
     4  +coeff( 40)*x11*x22            
     5  +coeff( 41)    *x24            
     6  +coeff( 42)*x11*x21*x31        
     7  +coeff( 43)*x11        *x42    
     8  +coeff( 44)    *x21    *x43    
      p_r5p65_484816old_fp=p_r5p65_484816old_fp
     9  +coeff( 45)*x11*x21        *x51
     1  +coeff( 46)*x11*x23            
     2  +coeff( 47)*x12        *x41    
     3  +coeff( 48)        *x31*x42    
     4  +coeff( 49)            *x42*x51
     5  +coeff( 50)    *x23    *x41    
     6  +coeff( 51)*x11    *x31*x41    
     7  +coeff( 52)    *x22*x31*x41    
     8  +coeff( 53)    *x21*x31*x42    
      p_r5p65_484816old_fp=p_r5p65_484816old_fp
     9  +coeff( 54)            *x41*x53
     1  +coeff( 55)*x11*x22    *x41    
     2  +coeff( 56)*x11*x21*x31*x41    
     3  +coeff( 57)*x11*x21    *x42    
     4  +coeff( 58)    *x23    *x42    
     5  +coeff( 59)    *x21    *x43*x51
     6  +coeff( 60)    *x21        *x52
     7  +coeff( 61)    *x23*x31        
     8  +coeff( 62)    *x22*x32        
      p_r5p65_484816old_fp=p_r5p65_484816old_fp
     9  +coeff( 63)*x11    *x31    *x51
     1  +coeff( 64)    *x22    *x41*x51
     2  +coeff( 65)            *x43*x51
     3  +coeff( 66)    *x21    *x41*x52
     4  +coeff( 67)*x12    *x31        
     5  +coeff( 68)        *x34*x41    
     6  +coeff( 69)*x12            *x51
     7  +coeff( 70)*x11*x21    *x41*x51
     8  +coeff( 71)    *x22    *x42*x51
      p_r5p65_484816old_fp=p_r5p65_484816old_fp
     9  +coeff( 72)*x12*x22            
     1  +coeff( 73)*x12*x21    *x41    
     2  +coeff( 74)*x11*x22    *x42    
     3  +coeff( 75)*x11*x23*x32        
     4  +coeff( 76)    *x24    *x43    
     5  +coeff( 77)*x11*x21*x33    *x51
     6  +coeff( 78)    *x21*x32        
     7  +coeff( 79)        *x33        
     8  +coeff( 80)    *x21    *x41*x51
      p_r5p65_484816old_fp=p_r5p65_484816old_fp
     9  +coeff( 81)                *x53
     1  +coeff( 82)    *x21*x32*x41    
     2  +coeff( 83)*x11        *x41*x51
     3  +coeff( 84)        *x31*x42*x51
     4  +coeff( 85)*x11            *x52
     5  +coeff( 86)    *x22        *x52
     6  +coeff( 87)            *x42*x52
     7  +coeff( 88)                *x54
     8  +coeff( 89)    *x23*x31*x41    
      p_r5p65_484816old_fp=p_r5p65_484816old_fp
     9  +coeff( 90)*x11*x21*x31    *x51
c
      return
      end
      function sl_r5p65_484816old_fp(x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 30)
      data ncoeff/ 29/
      data avdat/ -0.1275002E-01/
      data xmin/
     1 -0.14915E-01,-0.48607E-01,-0.15984E-01,-0.26925E-01,-0.47305E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.14999E-01, 0.48111E-01, 0.15995E-01, 0.26369E-01, 0.49936E-01,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     +  0.13072569E-01,-0.26723340E+00,-0.33921193E-01, 0.39294906E-01,
     + -0.31206038E-01, 0.34223504E-01, 0.85062422E-01,-0.27024310E-01,
     + -0.26222715E-01, 0.15646990E-01,-0.57615442E-02, 0.53076907E-02,
     +  0.31272009E-01,-0.14963783E-01, 0.37749059E-03,-0.34623730E-02,
     +  0.33927332E-02, 0.19721748E-01, 0.61124498E-02,-0.35228565E-01,
     + -0.16141707E-01, 0.11401692E-02,-0.21876753E-02, 0.34269264E-02,
     +  0.56703375E-02,-0.15307915E-02,-0.18179208E-02,-0.89081591E-02,
     +  0.26579886E-02,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x31 = x3
      x32 = x31*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x51 = x5
      x52 = x51*x5
      x53 = x52*x5
c
c                  function
c
      sl_r5p65_484816old_fp=avdat
     1  +coeff(  1)                    
     2  +coeff(  2)    *x21            
     3  +coeff(  3)                *x51
     4  +coeff(  4)*x11                
     5  +coeff(  5)    *x22            
     6  +coeff(  6)    *x21*x31        
     7  +coeff(  7)    *x21    *x41    
     8  +coeff(  8)                *x52
      sl_r5p65_484816old_fp=sl_r5p65_484816old_fp
     9  +coeff(  9)    *x23            
     1  +coeff( 10)*x11        *x41    
     2  +coeff( 11)            *x42    
     3  +coeff( 12)*x11    *x31        
     4  +coeff( 13)    *x21    *x42    
     5  +coeff( 14)*x11*x22            
     6  +coeff( 15)    *x23*x31*x41    
     7  +coeff( 16)            *x41*x51
     8  +coeff( 17)*x11*x21            
      sl_r5p65_484816old_fp=sl_r5p65_484816old_fp
     9  +coeff( 18)    *x21*x31*x41    
     1  +coeff( 19)                *x53
     2  +coeff( 20)    *x23    *x41    
     3  +coeff( 21)*x11*x22    *x41    
     4  +coeff( 22)        *x31        
     5  +coeff( 23)    *x21        *x51
     6  +coeff( 24)    *x21*x32        
     7  +coeff( 25)    *x22    *x41    
     8  +coeff( 26)            *x43    
      sl_r5p65_484816old_fp=sl_r5p65_484816old_fp
     9  +coeff( 27)*x11            *x51
     1  +coeff( 28)    *x23*x31        
     2  +coeff( 29)*x11        *x42    
c
      return
      end
