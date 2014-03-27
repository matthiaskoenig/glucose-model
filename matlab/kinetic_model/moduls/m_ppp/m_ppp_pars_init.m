function [c_init] = m_ppp_pars_init()
%% Inital metabolite concentrations 
%   
% Returns:
%   c_init: vector of initial substrate concentrations
%   author: Matthias Koenig 
%   date:   110523

c_init = [
    2.8	%	atp
    0.8	%	adp
    0.1	%	nadp
    0.1	%	nadph
    5	%	p
    55000	%	h2o
    5	%	co2
    5.00E-008	%	h
    5	%	glc
    0.12	%	glc6p
    0.05	%	fru6p
    0.02	%	fru16bp
    0.004	%	fru26bp
    0.1	%	grap
    0.03	%	dhap
    0.1	%	pgl6
    0.1	%	pg6
    0.1	%	ru5p
    0.1	%	x5p
    0.1	%	r5p
    1.0	%	s7p
    0.1	%	e4p
    5	%	glc_ext
    0.16	%	amp
    0.1	%	prpp
    0.1	%	gdp
];