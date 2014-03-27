function [c_init] = m_glycolysis_pars_init(modus)
%% M_MODULE_PARS_INIT Returns inital metabolite concentrations for given
%% modus.
%   
% Returns:
%   c_init:    vector of initial substrate concentrations
%
%   author: Matthias Koenig 
%   date:   110211

if nargin == 0
    modus = 'mean';
end

lb = 1E-8;  % small nonzero lower bound for concentrations

% Experimental data has to be updated (NADH has to be changed)
Sdata = [
															
%	lower	upper           overnight	short						
%	bound	bound	mean    fasted      fast	refed	fed     ss			
	1.5     4   	2.8     2.8         2.8       3       3       0         %	S1	atp [Vech1973, Rawat1986, Bartel1990, Eriksson1980, Faupel1972, Hue1982]
	0.1 	3       0.8     1.3         1.3     0.89	0.89	0           %	S2	adp [Vech1973, Bartel1990, Eriksson1980, Hue1982, Jackson1977]
	lb      2       0.16    0.28        0.28	0.24	0.24	0           %	S3	amp [Eriksson1980, Bartel1990, Hue1982]
	lb	    2       0.27    0.27        0.27	0.27	0.27	1           %	S4	utp [Jackson1977, Eriksson1980]
	lb  	2       0.09    0.11        0.11	0.11	0.11	1           %	S5	udp [Jackson1977, Eriksson1980]
	lb  	2       0.29    0.27        0.27	0.27	0.27	1           %	S6	gtp [Jackson1977, Bartel1990]
	lb  	2       0.10    0.11        0.11	0.11	0.11	1           %	S7	gdp [Jackson1977, Bartel1990]
    
	0.5     1.22	1.22   0.967       0.967	0.967	0.967	0           %	S8	nad  [Vech1973, Chalhoub2007b]
	lb      1.22	0.56E-3    0.24        0.24    0.24	0.24	0           %	S9	nadh [Vech1973, Chalhoub2007b]
    
	5       5       5       5           5       5       5       0           %	S10	p   [Veech1973, Chalhoub2007a]
	lb      0.08   0.008   0.002       0.003	0.005	0.005	1           %	S11	pp  [Guynn1974, Albe1990]
	0       0     55000       0           0       0       0       0           %	S12	h2o
	0.1     5       5       5           5       5       5       0           %	S13	co2 [Schmidt2007]
	0       0      5E-8       0           0       0       0       0           %	S14	h  
    
	lb  	2       0.012   0.008       0.012   0.016   0.16    1           %	S15	glc1p   [Faupel1972, Albe1990, Guynn1974]
	lb      3       0.38    0.34        0.34    0.44    0.44    1           %	S16	udpglc  [Faupel1972, Albe1990, Guynn1974]
	lb      500     250     220         10      220     10      0           %	S17	glyglc  [Rothman1991]
	lb      20      5       5           5       5       6.85	1           %	S18	glc     [Gerich1993, Rawat1986, Albe1990]
	lb      2       0.12    0.08        0.08    0.2     0.2     1           %	S19	glc6p   [Faupel1972, Hue1982, Rawat1986, Vech1973, Guynn1974]
	lb      2       0.05    0.05        0.05	0.1	    0.1     1           %	S20	fru6p   [Faupel1972, Rawat1986, Albe1990, Chalhoub2007b]
	lb      2       0.02    0.02        0.02	0.02	0.02	1           %	S21	fru16bp [Faupel1972, Rawat1986, Albe1990]
	lb*1E-6 0.05    0.004   0.002       0.002   0.014   0.014   1           %	S22	fru26bp [Hue1982]
	lb      5       0.1     0.09        0.09	0.09	0.11	1           %	S23	grap    [Vech1973, Faupel1972]
	lb      5       0.03    0.023       0.023	0.04	0.04	1           %	S24	dhap    [Faupel1972, Rawat1986, Vech1973, Albe1990]
	lb      5       0.3     0.3         0.3     0.3	    0.3     1           %	S25	bpg13   []
	0.01	1.5     0.27    0.26        0.26	0.26	0.3     1           %	S26	pg3     [Vech1973, Albe1990]
	lb      5       0.03    0.03        0.03    0.03	0.04	1           %	S27	pg2     [Vech1973, Albe1990]
	lb  	2   	0.15    0.15        0.15	0.15	0.15	1           %	S28	pep     [Faupel1972, Hue1982, Vech1973]
	lb      5       0.1     0.06        0.06	0.16	0.27	1           %	S29	pyr     [Faupel1972, Rawat1986, Vech1973, Hue1982, Albe1990]
	lb      0.2     0.01    0.01        0.01	0.01	0.04	1           %	S30	oaa     [Rawat1986, Vech1973, Albe1990, Faupel1972]
	lb*1E-6 2       0.5     0.15	    0.15	1.0     1.0     1           %	S31	lac     [Faupel1972, Rawat1986, Vech1973, Hue1982]
    
	2       25     5        3.5         3       8     8         0           %	S32	glc_ext  [Gerich1993]
	lb      10    1.2       1.2         1.2     1.2   1.2       0           %	S33	lac_ext  [Chalhoub2007a, Chalhoub2007b]
	
    0.1     5      5        5           5       5       5       0           %	S34	co2_mito    [Schmidt2007]
	5       5      5        5           5       5       5       0           %	S35	p_mito      [Veech1973, Chalhoub2007a]
	lb  	0.2    0.01     0.01        0.01	0.01	0.04	1           %	S36	oaa_mito    [Rawat1986, Vech1973, Albe1990, Faupel1972]
	lb  	5      0.15     0.15        0.15	0.15	0.15	1           %	S37	pep_mito    [Faupel1972, Hue1982, Vech1973]
	lb  	5      0.04     0.04        0.04    0.04    0.04	0           %	S38	acoa_mito   [Faupel1972, Rawat1986, Veech1973]
	lb  	5      0.1      0.06        0.06 	0.16	0.27	1           %	S39	pyr_mito    [Faupel1972, Rawat1986, Veech1973, Hue1982, Albe1990]
	lb  	5      0.32     0.32        0.32	0.32	0.3     0           %	S40	cit_mito    [Veech1973, Faupel1972, Hue1982, Rawat1986]
	2       4       2.8     2.8         2.8     3       3       0           %	S41	atp_mito    [Veech1973, Rawat1986, Bartel1990, Chalhoub2007a, Chalhoub2007b]
	0.1     3       0.8     1.3         1.3     0.89	0.89	0           %	S42	adp_mito    [Vech1973, Bartel1990, Eriksson1980, Hue1982, Jackson1977]
	lb  	2       0.29    0.27        0.27	0.27	0.27	1           %	S43	gtp_mito    [Jackson1977, Bartel1990]
	lb      2       0.10    0.11        0.11	0.11	0.11	1           %	S44	gdp_mito    [Jackson1977, Bartel1990]
    
	lb      1       0.055   0.055       0.055   0.055   0.055   0           %	S45	coa_mito    [Vech1973]
	lb  	1.22	0.24    0.24        0.24	0.24	0.25	0           %	S46	nadh_mito   [Albe1990, Chalhoub2007a]
	lb  	1.22	0.98    0.98        0.98	0.98	0.97	0           %	S47	nad_mito    [Albe1990, Chalhoub2007a]
	0       0       1E-8       0           0   	0   	0       0           %	S48	h_mito  
	0       0       55000       0           0       0       0       0           %	S49	h2o_mito
];

switch modus
    case 'lb'
        c_init = Sdata(:,1);
    case 'ub'
        c_init = Sdata(:,2);
    case 'mean'
        c_init = Sdata(:,3);
    case {'overnight_fast', 'simple_overnight_fast'}
        c_init = Sdata(:,4);
    case {'short_fast', 'simple_short_fast'}
        c_init = Sdata(:,5);
    case {'refed', 'simple_refed'}
        c_init = Sdata(:,6);
    case {'fed', 'simple_fed'}
        c_init = Sdata(:,7);
end
