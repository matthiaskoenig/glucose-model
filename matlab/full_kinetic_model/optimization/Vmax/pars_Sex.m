function [Sex] = pars_Sex(modus)
%% PARS_SEX Inital metabolite concentrations
%  Returns the concentration vector for the given modus. 
%   
% Returns:
%   Sex:    vector of substrate concentrations for given modus
%
%   author: Matthias Koenig 
%   date:   110211


% Experimental data has to be updated (NADH has to be changed)
Sdata = [
															
%	lower	upper	overnight	short						
%	bound	bound	fasted	fast	refed	fed	ss			
	2.5	4	3	3	3	3	0                                               %	S1	atp 
	0.1	3	1.3	1.3	0.89	0.89	0                                       %	S2	adp
	1.00E-008	2	0.28	0.28	0.24	0.24	0                       %	S3	amp
	1.00E-008	2	0.27	0.27	0.27	0.27	1                       %	S4	utp
	1.00E-008	2	0.11	0.11	0.11	0.11	1                       %	S5	udp
	1.00E-008	2	0.27	0.27	0.27	0.27	1                       %	S6	gtp
	1.00E-008	2	0.11	0.11	0.11	0.11	1                       %	S7	gdp
	0.5	1.22	1.22	1.22	1.22	1.22	0                           %	S8	nad
	1.00E-008	1.22	7.97E-004	7.97E-004	3.26E-004	3.26E-004	0	%	S9	nadh
	5	5	5	5	5	5	0                                               %	S10	p
	1.00E-008	0.2	0.05	0.05	0.05	0.05	1                       %	S11	pp
	0	0	0	0	0	0	0                                               %	S12	h2o
	0.01	5	0.1	0.1	0.1	0.1	0                                           %	S13	co2
	0	0	0	0	0	0	0                                               %	S14	h 
	1.00E-008	3	0.2	0.2	0.2	0.2	1                                       %	S15	glc1p
	1.00E-008	3	0.5	0.5	0.5	0.5	1                                       %	S16	udpglc
	1.00E-008	500	220	10	220	10	0                                       %	S17	glyglc
	1.00E-008	20	5	5	5	6.85	1                                   %	S18	glc
	1.00E-008	5	0.1	0.1	0.1	0.2	1                                       %	S19	glc6p
	1.00E-008	5	0.05	0.05	0.05	0.1	1                           %	S20	fru6p
	1.00E-008	5	0.02	0.02	0.02	0.02	1                       %	S21	fru16bp
	1.00E-008	5	0	0	0	0.1	1                                       %	S22	fru26bp
	1.00E-008	5	0.09	0.09	0.09	0.11	1                       %	S23	grap
	1.00E-008	5	0.02	0.02	0.02	0.03	1                       %	S24	dhap
	1.00E-008	5	0.05	0.05	0.05	0.05	1                       %	S25	bpg13
	0.01	1.5	0.26	0.26	0.26	0.3	1                               %	S26	pg3
	1.00E-008	5	0.03	0.03	0.03	0.04	1                       %	S27	pg2
	1.00E-008	5	0.09	0.09	0.09	0.12	1                       %	S28	pep
	1.00E-008	5	0.02	0.02	0.02	0.27	1                       %	S29	pyr
	1.00E-008	0.2	0.01	0.01	0.01	0.04	1                       %	S30	oaa
	1.00E-0014	0.4	7.70E-01	7.70E-01	7.70E-01	7.70E-01	1       %	S31	lac
	2	25	3.5	3	8	8	0                                               %	S32	glc_ext
	1.00E-008	10	0.8	1.2	0.8	0.8	0                                       %	S33	lac_ext
	0.01	5	0.1	0.1	0.1	0.1	0                                           %	S34	co2_mito
	5	5	5	5	5	5	0                                               %	S35	p_mito
	1.00E-008	0.2	0.01	0.01	0.01	0.04	1                       %	S36	oaa_mito
	1.00E-008	5	0.09	0.09	0.09	0.12	1                       %	S37	pep_mito
	1.00E-008	5	0.1	0.1	0.1	0.04	0                                   %	S38	acoa_mito
	1.00E-008	5	0.02	0.02	0.02	0.27	1                       %	S39	pyr_mito
	1.00E-008	5	0.32	0.32	0.32	0.3	0                           %	S40	cit_mito
	2.5	4	3	3	3	3	0                                               %	S41	atp_mito
	0.1	3	1.3	1.3	1.3	0.89	0                                           %	S42	adp_mito
	1.00E-008	2	0.27	0.27	0.27	0.27	1                       %	S43	gtp_mito
	1.00E-008	2	0.11	0.11	0.11	0.11	1                       %	S44	gdp_mito
	1.00E-008	1	0.1	0.1	0.1	0.1	0                                       %	S45	coa_mito
	1.00E-008	1.22	0.24	0.24	0.24	0.25	0                   %	S46	nadh_mito
	1.00E-008	1.22	0.98	0.98	0.98	0.97	0                   %	S47	nad_mito
	0	0	0	0	0	0	0                                               %	S48	h_mito
	0	0	0	0	0	0	0                                               %	S49	h2o_mito
];

switch modus
    case 'lb'
        Sex = Sdata(:,1);
    case 'ub'
        Sex = Sdata(:,2);
    case {'overnight_fast', 'simple_overnight_fast'}
        Sex = Sdata(:,3);
    case {'short_fast', 'simple_short_fast'}
        Sex = Sdata(:,4);
    case {'refed', 'simple_refed'}
        Sex = Sdata(:,5);
    case {'fed', 'simple_fed'}
        Sex = Sdata(:,5);
end



% Sdata = [
%         % overnight  short             
%         % fasted     fasting    fed     lb      ub     ss
%         3.0         3.0         3.0     2.5     4       1       % S(1)      ATP  
%         1.3         1.3         0.885   0.1     3       1       % S(2)      ADP
%         0.283       0.283       0.237   0       2       1       % S(3)      AMP
%         0.28        0.28        0.28    0       2       1       % S(4)      UTP
%         0.1         0.1         0.1     0       2       1       % S(5)      UDP                
%         0.28        0.28        0.28    0       2       1       % S(6)      GTP
%         0.1         0.1         0.1     0       2       1       % S(7)      GDP
%         1.2192      1.2192    1.2197    0.5     1.22    1       % S(8)      NAD
%         0.797E-3  0.797E-3    0.3261E-3 0       1.22    1       % S(9)      NADH
%         5           5            5      5       5       1       % S(10)     P (constant value)
%         0.05        0.05        0.05    0       0.2     1       % S(11)     PP Pyrophosphate is conversed to P very fast
%         -1          -1          -1      -1      -1      0       % S(12)     H20 (constant value) [55000 mM]
%         0.1         0.1         0.1     0.01    5       1       % S(13)     CO2
%         -1          -1          -1      -1      -1      0       % S(14)     H    [1E-7 mM]
%         0.2         0.2         0.2     0       3       1       % S(15)     glc1P
%         0.5         0.5         0.5     0       3       1       % S(16)     UDP_glucose
%         220.0       30.0        450     0      500      0       % S(17)     glycogen 
%         5.0         5.0         6.85    0       20      1       % S(18)     glucose
%         0.1         0.1         0.2     0       5       1       % S(19)     glucose_6P % PMID:11879177 intracellular glucose-6-p concentration 0.05 - 1 mM
%         0.046       0.046       0.1     0       5       1       % S(20)     fructose_6P
%         0.016       0.016       0.02    0.001   1       1       % S(21)     fru16bp
%         0.0001      0.0001      0.01    0       1       1       % S(22)     fru26bp        
%         0.09        0.09        0.111   0       1       1       % S(23)     grap
%         0.023       0.023       0.029   0       1       1       % S(24)     dhap
%         0.047       0.047       0.054   0       1       1       % S(25)     bpg13
%         0.261       0.261       0.298   0.05    1.5     1       % S(26)     pg3
%         0.030       0.030       0.035   0       1       1       % S(27)     pg2
%         0.092       0.092       0.123   0       1       1       % S(28)     pep
%         0.024       0.024       0.271   0       1       1       % S(29)     pyr
%         0.008       0.008       0.036   0       0.2     1       % S(30)     oaa
%         0.8         0.8         0.8     0       4       1       % S(31)     lactate
%         3.5         3.0         8       2       25      0       % S(32)     glucose extern
%         0.8         0.8         0.8     0       10      0       % S(33)     lac_ext
%         0.1         0.1         0.1     0.01     5      1       % S(34)     co2_mito
%          5           5           5       5       5      1       % S(35)     p_mito
%         0.008       0.008       0.036   0       0.2     1       % S(36)     oaa_mito
%         0.092       0.092       0.123   0       1       1       % S(37)     pep_mito
%         0.100       0.100       0.040   0       0       1       % S(38)     acoa_mito
%         0.024       0.024       0.271   0       1       1       % S(39)     pyr_mito
%         0.315       0.315       0.301   0       1       1       % S(40)     cit_mito
%         3.0         3.0         3.0     2.5     4       1       % S(41)     atp_mito
%         1.3         1.3         0.885   0.1     3       1       % S(42)     adp_mito
%         0.28        0.28        0.28    0       2       1       % S(43)     gtp_mito
%         0.1         0.1         0.1     0       2       1       % S(44)     gdp_mito
%         0.1         0.1         0.1     0       1       1       % S(45)     coa_mito
%         0.25        0.25        0.97    0      1.22     1       % S(46)     nadh_mito
%         0.24        0.24        0.98    0      1.22     1       % S(47)     nad_mito
%         -1          -1          -1      -1      -1      0       % S(48)     h_mito       [1E-7 mM]
%         -1          -1          -1      -1      -1      0       % S(49)     h2o_mito     [55000 mM] 
%     ];