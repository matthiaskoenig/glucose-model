* ---------------------------------------------------------------------
* FSOL Integrates the given metablic network
* Integration is performed with simple Euler method in T = [0,DT] in
* steps of DTC. T is time within the integration method.
* Integration in multi-scale model via coupling of system time DT (TDT)
* in model of porous media and concentrations.
*
*       NC : number of concentrations
*       NV : number of reactions
*       SMT : stoichiometric matrix
*       CINIT: concentrations at beginning of integration (T = 0)
*
* TODO:
* - fix the dt, bug -> exact end time overlap of internal and external
*   time
*
* Model v4 : simplified model of glycolysis and gluconeogenesis
* ---------------------------------------------------------------------
      PROGRAM MV4
        IMPLICIT NONE
        INCLUDE 'HEP.h'
        INTEGER NC, NV
        PARAMETER (NC=5, NV=4)
        REAL CINIT(NC), F(NC), STM(NC, NV)

* DTC should be DTC <= 1 for sufficient Euler integration
        DT = 1200
        DTC = 1

        DATA CINIT / 9.0, 3.0, 250.0, 2.0, 5.0/
*                  c1   c2  c3  c4  ! matrix transformed due to DATA !
        DATA STM / -1,   1,  0,  0,  0,
     $              0,   0,  0,  1, -1,
     $              0,   1,  0, -2,  0,
     $              0,  -1,  1,  0,  0
     $           /

        CALL  FSNKI(F, CINIT, STM, NC, NV)

      END

* ---------------------------------------------------------------------
* FSNKI Integration of ODE System based on Euler method
*       DXDT  : vector of derivatives
*       DT    : end time of integration (given by outer program)
*       TDTC  : current time in integration
*       DTC   : stepsize
*       CINIT : initial concentration
*       CDATA : concentrations at current timepoint
*       FDCT  : change in concentrations at current time point
*       VF    : Volume factor to adapt to 1l Volume
*
*       Calculates changes in concentrations F due to hepatocyte
*       metabolism.
*       F(i) > 0 : concentration c(i) increases in timestep DT
*       F(i) < 0 : concentration c(i) decreases in timestep DT
*
*       [F] = mM/l/l/s : change in concentration in timestep DT in
*                        reference volume of 1l
*
*     Side effects: None
* ---------------------------------------------------------------------
      SUBROUTINE FSNKI(F, CINIT, STM, NC, NV)
      IMPLICIT NONE
      INCLUDE 'HEP.h'
      INTEGER IC, KC, NLOOP, NC, NV
      REAL VF, TDTC
      REAL FDTC(NC), CDATA(NC), F(NC), CINIT(NC), STM(NC, NV)
      PARAMETER(VF = 1.0)

* Copy CINIT to CDATA
      DO 50, IC =1, NC
        CDATA(IC) = CINIT(IC)
50    CONTINUE

* Calculate the stepwise fluxes in TDCT in [0, DT]
* TODO: Problems end time, better implementation necessary
        NLOOP = INT(DT/DTC)
        TDTC = 0.0
        DO 100, IC = 1, NLOOP
            CALL FSNK(FDTC, CDATA, STM, NC, NV)
            DO 150, KC = 1, NC
                CDATA(KC) = CDATA(KC) + VF * FDTC(KC)
150         CONTINUE
            TDTC = TDTC + DTC

*           IF (n.eq.240) THEN
              WRITE (UNIT=*, FMT=*) TDTC, CDATA(1), CDATA(2), CDATA(3),
     $                  CDATA(4), CDATA(5), FDTC(1), FDTC(2), FDTC(3),
     $                  FDTC(4), FDTC(5)
*            ENDIF
100     CONTINUE

* Calculate changes in concentration during DT
        DO 200, IC = 1, NC
            F(IC) = CDATA(IC) - CINIT(IC)
200     CONTINUE
      END


* ---------------------------------------------------------------------
* FSNK Calculate change in concentrations FDTC
*       FDTC : change in c(i)'s during time step DTC
*       CVEC : vector of current concentrations
*       DXDT : derivates
*       DTC  : step size
*
*       Side Effects: None
* ---------------------------------------------------------------------
      SUBROUTINE FSNK(FDTC, CVEC, STM, NC, NV)
        IMPLICIT NONE
        INCLUDE 'HEP.h'
        INTEGER IC, KC, NC, NV
        REAL FDTC(NC), CVEC(NC), STM(NC, NV), DXDT(NV)

* Calculate changes DXDT for current concentrations
       CALL FDXDT(DXDT, CVEC)

* Calculate change in concentration (flux) using the stoichiometric
* matrix
        DO 100, IC=1, NC
            FDTC(IC) = 0.0
            DO 150, KC=1, NV
                FDTC(IC) = FDTC(IC) + DTC * STM(IC, KC) * DXDT(KC)
150         CONTINUE
100     CONTINUE
      END


* ---------------------------------------------------------------------
* FDXDT ODE System
*       DXDT : derivatives (v, components of dc(i)/dt)
*       CVEC : vector of current concentrations
*
*       Side effects: None
* ---------------------------------------------------------------------
      SUBROUTINE FDXDT(DXDT, CVEC, NC, NV)
        IMPLICIT NONE
        INCLUDE 'HEP.h'
        INTEGER NC, NV
        REAL DXDT(NV), CVEC(NC), CA(10), CB(10), VGLY, VGLYS

* Definition of the parameters
        REAL P_LE, P_N, P_GY, P_C, X, Y
        PARAMETER (P_LE = 0.1, P_N = 2.0, P_GY = 5, P_C = 500.0)

* Coefficient matrix
        DATA CA / -0.013260401508103,
     $            -0.000078240970095,
     $             0.478235644004833,
     $             0.000002861605817,
     $             0.000932752106971,
     $            -2.492569641130055,
     $             0.000000166945924,
     $            -0.000125285017396,
     $             0.015354944655784,
     $            -4.975026288067225 /

        DATA CB / 0.015298362033754,
     $           -0.000289250010776,
     $           -0.547536679729713,
     $           -0.000005684726209,
     $            0.010350112006466,
     $            6.232845830004314,
     $           -0.000000348461291,
     $            0.000282613503037,
     $           -0.115405862243966,
     $          -13.439952615163973 /

        X = CVEC(1)
        Y = CVEC(3)

        VGLY = 90E-3/60 * ( CA(1)*X**3 + CA(2)*X**2*Y + CA(3)*X**2
     $                        + CA(4)*X*Y**2 + CA(5)*X*Y + CA(6)*X
     $                        + CA(7)*Y**3 + CA(8)*Y**2 + CA(9)*Y
     $                        + CA(10) )

        VGLYS = 90E-3/60 * ( CB(1)*X**3 + CB(2)*X**2*Y + CB(3)*X**2
     $                      + CB(4)*X*Y**2 + CB(5)*X*Y + CB(6)*X
     $                 + CB(7)*Y**3 + CB(8)*Y**2 + CB(9)*Y + CB(10))
* Adaption gluconeogenesis for low lactate
        IF (VGLY .LT. 0.0) THEN
            VGLY = CVEC(5)**P_N/(CVEC(5)**P_N + P_LE**P_N) * VGLY
        END IF
* Adaption glycogenolysis for low glycogen
        IF (VGLYS .GT. 0.0) THEN
            VGLYS = CVEC(3)**P_N/(CVEC(3)**P_N + P_GY**P_N) * VGLYS
* Adaption glycogen synthesis for high glycogen
        ELSE
            VGLYS = (P_C-CVEC(3))**P_N /
     $                 ((P_C-CVEC(3))**P_N + P_GY**P_N) * VGLYS
        END IF

* v1 : Glucose transporter
        DXDT(1) = VGLY + VGLYS
* v2 : Lactate transporter
        DXDT(2) = -2.0 * VGLY
* v3 : Gluconeogenesis
        DXDT(3) = - VGLY
* v4 : Glycogen synthesis
        DXDT(4) = VGLYS

      END
