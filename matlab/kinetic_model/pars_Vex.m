function [Vex, opt] = pars_Vex(modus)
%% PARS_VEX Returns experimental flux values for the model
%
% Experimental flux data for the glycogen model
% Fluxes are in [µmol/(min kg)]
%
% different experimental data for the fit
% overnight fasted: 10-14h fast
% short fast: 40 - 60h
% fed (glucose load and glycogen stores half filled)
% opt: selection of which experimental fluxes should be used for the fit
%
%   author: Matthias Koenig 
%   date:   110211

lb_min = 0;
ub_max = 1000;
Vdata = [
%									simple		simple		simple		simple				
%	overnight fast	opt1	short fast	opt2	refed	op3	long fed	opt4	overnight fast	opt5	short fast	opt6	refed	opt7	fed	opt8		flux	name
	0	0	0	0	0	0	0	0	-2	1	-1	1	0.5	1	0.5	1	%	v1	GLUT2
	0	0	0	0	0	0	0	0	0.5	1	0.25	1	0.75	1	0.75	1	%	v2	GK
	0	0	0	0	0	0	0	0	2.5	1	-1.25	1	0.25	1	0.25	1	%	v3	G6Pase
	0	0	0	0	0	0	0	0	-1.25	1	0	0	-1.25	1	0.5	1	%	v4	GPI
	0	0	0	0	0	0	0	0	1.25	1	0	0	-1.5	0	0	0	%	v5	G16PI
	0	0	0	0	0	0	0	0	0.5	1	0	0	2	0	0	0	%	v6	UPGase
	0	0	0	0	0	0	0	0	0.5	1	0	0	2	0	0	0	%	v7	Ppase
	0	0	0	0	0	0	0	0	0.5	1	0	0	2	0	0	0	%	v8	GS
	0	0	0	0	0	0	0	0	1.75	1	0	0	0.5	0	0	0	%	v9	GP 
	0	0	0	0	0	0	0	0	0	1	0	1	0	1	0	1	%	v10	NDK (GTP)
	0	0	0	0	0	0	0	0	0.5	1	0	0	2	1	0	0	%	v11	NDK (UTP)
	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	%	v12	AK
	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	%	v13	PFK2
	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	%	v14	FBP2
	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	%	v15	PFK1
	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	%	v16	FBP1
	0	0	0	0	0	0	0	0	-1.25	1	-1.25	1	-1.25	1	0.5	1	%	v17	ALD
	0	0	0	0	0	0	0	0	-1.25	1	-1.25	1	-1.25	1	0.5	1	%	v18	TPI
	0	0	0	0	0	0	0	0	-2.5	1	-2.5	1	-2.5	1	1	1	%	v19	GAPDH
	0	0	0	0	0	0	0	0	-2.5	1	-2.5	1	-2.5	1	1	1	%	v20	PGK
	0	0	0	0	0	0	0	0	-2.5	1	-2.5	1	-2.5	1	1	1	%	v21	PGM
	0	0	0	0	0	0	0	0	-2.5	1	-2.5	1	-2.5	1	1	1	%	v22	EN
	0	0	0	0	0	0	0	0	0.5	1	0.5	1	0.5	1	1.2	1	%	v23	PK
	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	%	v24	PEPCK 
	0	0	0	0	0	0	0	0	3	1	3	1	3	1	0.2	1	%	v25	PEPCK_mito
	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	%	v26	PC
	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	%	v27	LDH
	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	%	v28	LacT
	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	%	v29	PyrT
	0	0	0	0	0	0	0	0	3	1	3	1	3	1	0.2	1	%	v30	PepT
	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	%	v31	PDH
	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	%	v32	CS
	0	0	0	0	0	0	0	0	3	1	3	1	3	1	0.2	1	%	v33	NDK _mito (GDP)
	0	0	0	0	0	0	0	0	0	1	0	1	0	1	0	1	%	v34	OAA flux
	0	0	0	0	0	0	0	0	0	1	0	1	0	1	0	1	%	v35	ACOA flux
	0	0	0	0	0	0	0	0	0	1	0	1	0	1	0	1	%	v36	CIT flux
      
];

switch modus
    %experimental data
    case 'overnight_fast'
        Vex = Vdata(:,1);
        opt = Vdata(:,2);
    case 'short_fast'
        Vex = Vdata(:,3);
        opt = Vdata(:,4);
    case 'refed'
        Vex = Vdata(:,5);
        opt = Vdata(:,6);
    case 'fed'
        Vex = Vdata(:,7);
        opt = Vdata(:,8);
    % simplified data
    case 'simple_overnight_fast'
        Vex = Vdata(:,9);
        opt = Vdata(:,10);
    case 'simple_short_fast'
        Vex = Vdata(:,11);
        opt = Vdata(:,12);
    case 'simple_refed'
        Vex = Vdata(:,13);
        opt = Vdata(:,14);
    case 'simple_fed'
        Vex = Vdata(:,15);
        opt = Vdata(:,16);
end
