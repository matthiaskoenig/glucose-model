function [data] = sim_cherrington1976_data(sim)

% Definition of the Cherrington1976 time courses depending on the
% simulation
if nargin ~=1
    error('Simulation has to be given')
end
switch sim
    case 'saline'
        offset = 0;
    case 'somatostatin'
        offset = 1;
    case 'insulin_replacement'
        offset = 2;
    case 'glucagon_replacement'
        offset = 3;
    case 'somatostatin_replacement'
        offset = 4;
    otherwise
        error('No valid simulation in Cherrington1976')
end


gp_gu = [
% Figure 1 – saline infusion					Figure 2 – somatostatin infusion					Figure 3 – insulin replacement					Figure 4 – glucagon replacement					Figure 5 – insulin & glucagon replacement				
%time	GP	GP SEM	GU	GU SEM	GP – GU	GP	GP SEM	GU	GU SEM	GP – GU	GP	GP SEM	GU	GU SEM	GP – GU	GP	GP SEM	GU	GU SEM	GP – GU	GP	GP SEM	GU	GU SEM	GP – GU
%[min]	[µmol/kg/min]	[µmol/kg/min]	[µmol/kg/min]	[µmol/kg/min]	[µmol/kg/min]	[µmol/kg/min]	[µmol/kg/min]	[µmol/kg/min]	[µmol/kg/min]	[µmol/kg/min]	[µmol/kg/min]	[µmol/kg/min]	[µmol/kg/min]	[µmol/kg/min]	[µmol/kg/min]	[µmol/kg/min]	[µmol/kg/min]	[µmol/kg/min]	[µmol/kg/min]	[µmol/kg/min]	[µmol/kg/min]	[µmol/kg/min]	[µmol/kg/min]	[µmol/kg/min]	[µmol/kg/min]
100.00	15.00	0.38	16.37	1.03	-1.36	15.45	0.47	15.39	0.66	0.06	16.93	1.45	16.73	1.16	0.19	16.94	1.44	17.41	1.73	-0.48	16.81	2.07	18.27	1.49	-1.47
110.00	17.09	1.23	18.10	1.40	-1.00	16.50	1.23	17.09	1.97	-0.59	16.94	1.26	16.94	1.35	0.00	16.71	1.34	17.60	1.42	-0.88	15.24	0.69	16.80	1.29	-1.56
120.00	15.99	1.32	17.36	1.29	-1.37	16.42	0.66	16.26	1.22	0.16	15.88	1.64	16.08	1.26	-0.19	15.25	1.85	16.46	1.52	-1.21	16.43	1.48	16.71	1.29	-0.27
140.00	14.42	1.51	15.78	1.18	-1.36	9.24	1.23	15.15	0.94	-5.91	12.52	1.26	16.77	0.39	-4.25	20.77	2.68	17.33	1.32	3.43	14.67	1.98	17.32	1.29	-2.65
150.00	16.13	1.89	16.46	1.55	-0.33	10.10	0.66	14.13	0.66	-4.03	10.02	1.64	14.37	0.97	-4.35	23.42	2.37	16.80	1.83	6.62	15.77	2.17	16.93	1.59	-1.16
160.00	16.06	2.92	15.72	2.49	0.34	8.88	1.04	12.26	1.22	-3.38	10.80	0.68	13.99	0.77	-3.19	24.53	2.98	17.29	1.42	7.24	14.69	2.37	15.26	1.59	-0.56
170.00	14.48	1.41	15.46	1.63	-0.98	9.55	0.85	12.27	1.41	-2.72	10.33	0.87	15.35	2.80	-5.03	24.00	2.88	17.88	1.93	6.12	14.51	1.38	14.67	0.69	-0.17
180.00	15.06	1.88	15.29	1.43	-0.22	10.42	0.66	11.91	0.56	-1.49	10.04	2.03	12.27	1.06	-2.22	23.56	1.96	18.37	2.33	5.20	14.91	2.17	15.28	0.99	-0.37
190.00	14.52	2.45	15.21	1.80	-0.69	10.52	0.95	10.79	0.75	-0.27	11.31	1.93	12.57	0.77	-1.26	23.55	1.44	19.06	2.33	4.49	15.32	1.78	14.69	1.49	0.63
210.00	17.19	2.07	15.82	1.11	1.37	33.89	1.94	13.06	1.41	20.83	21.28	2.70	11.62	0.97	9.66	15.38	2.26	17.19	1.11	-1.82	25.11	2.27	16.00	1.98	9.11
220.00	14.29	1.88	15.08	1.39	-0.79	30.56	1.11	16.35	2.81	14.20	22.55	2.80	13.85	0.97	8.70	13.09	2.37	18.59	0.91	-5.50	22.75	1.58	17.70	1.59	5.06
];

ins_glu = [
%	Figure 1 – saline infusion				Figure 2 – somatostatin infusion				Figure 3 – insulin replacement				Figure 4 – glucagon replacement				Figure 5 – insulin & glucagon replacement			
%time	insulin	insulin+-SEM	glucagon	glucagon+SEM	insulin	insulin+-SEM	glucagon	glucagon+SEM	insulin	insulin+-SEM	glucagon	glucagon+SEM	insulin	insulin+-SEM	glucagon	glucagon+SEM	insulin	insulin+-SEM	glucagon	glucagon+SEM
%[min]	[pmol/l]]	[pmol/l]]	[pmol/l]]	[pmol/l]]	[pmol/l]]	[pmol/l]]	[pmol/l]]	[pmol/l]]	[pmol/l]]	[pmol/l]]	[pmol/l]]	[pmol/l]]	[pmol/l]]	[pmol/l]]	[pmol/l]]	[pmol/l]]	[pmol/l]]	[pmol/l]]	[pmol/l]]	[pmol/l]]
95.00	137.54	9.47	36.41	3.91	175.17	16.55	43.23	9.93	124.64	14.49	39.25	5.08	112.68	23.17	36.23	9.79	146.51	25.81	35.37	4.33
105.00	131.87	16.55	34.01	5.62	175.29	16.56	38.17	3.15	118.72	21.75	36.23	9.39	96.97	28.31	31.21	7.14	122.06	22.13	33.11	6.11
115.00	117.92	14.20	33.82	5.37	161.22	15.37	39.89	3.15	100.72	15.70	35.49	6.10	96.73	28.26	31.21	7.67	120.95	34.41	27.53	4.59
125.00	111.07	15.37	36.07	5.86	167.25	22.46	41.37	5.57	105.67	14.49	33.49	4.83	90.05	21.86	32.00	8.20	133.37	33.19	32.65	5.86
135.00	106.61	10.64	33.67	6.11	77.53	10.64	20.56	2.91	94.92	14.49	17.00	3.55	48.65	10.27	37.55	10.05	115.05	36.87	35.98	4.58
145.00	99.73	17.72	33.96	5.86	43.37	16.56	15.26	1.70	95.04	4.84	10.94	3.30	34.27	10.32	30.68	6.08	107.80	29.50	35.75	4.84
165.00	99.02	9.46	36.75	8.06	41.24	14.18	11.43	1.69	92.87	6.03	9.21	2.28	38.89	7.72	33.06	6.61	121.56	29.50	30.46	2.80
185.00	99.50	15.35	37.10	6.84	36.75	15.37	11.72	1.94	94.31	6.04	7.99	2.79	29.38	5.13	31.47	5.55	126.72	19.67	34.58	2.80
195.00	98.56	15.37	41.54	8.06	41.60	14.19	13.68	2.66	87.18	6.04	8.01	2.54	30.40	7.72	31.21	4.50	134.22	22.11	34.86	3.06
205.00	112.97	21.26	36.71	7.57	106.74	23.64	34.29	8.24	81.27	10.86	23.27	5.33	81.59	17.99	30.68	7.14	108.53	35.64	43.04	14.26
215.00	100.23	15.37	40.17	7.57	169.51	36.64	47.88	8.72	80.18	14.49	27.36	3.81	94.20	6.45	31.47	7.28	120.94	31.96	43.19	12.74
225.00	92.18	15.35	42.91	10.26	169.63	22.46	49.84	7.02	88.75	12.08	23.58	5.33	73.36	14.15	32.26	7.41	133.35	28.27	43.34	11.21
];   

glc = [
%	Figure 1 – saline infusion		Figure 2 – somatostatin infusion		Figure 3 – insulin replacement		Figure 4 – glucagon replacement		Figure 5 – insulin & glucagon replacement	
%time	glucose	glucose+SEM	glucose	glucose+SEM	glucose	glucose+SEM	glucose	glucose+SEM	glucose	glucose+SEM
%[min]	[mM]	[mM]	[mM]	[mM]	[mM]	[mM]	[mM]	[mM]	[mM]	[mM]
90.00	5.93	0.19	6.50	0.46	6.03	0.15	5.76	0.25	7.19	0.39
100.00	5.83	0.15	6.43	0.19	5.96	0.23	5.84	0.29	7.20	0.46
110.00	5.83	0.15	6.47	0.19	6.00	0.19	5.76	0.21	7.01	0.50
120.00	5.80	0.19	6.47	0.19	6.00	0.23	5.68	0.16	6.93	0.46
130.00	5.62	0.19	6.36	0.27	6.01	0.23	5.56	0.25	6.98	0.39
140.00	5.59	0.15	5.95	0.46	5.63	0.19	5.80	0.21	6.90	0.39
150.00	5.56	0.23	5.61	0.30	5.36	0.19	6.05	0.25	6.83	0.35
160.00	5.53	0.27	5.35	0.42	5.09	0.27	6.50	0.33	6.79	0.50
170.00	5.57	0.19	5.16	0.42	4.94	0.23	7.04	0.45	6.80	0.62
180.00	5.62	0.27	5.01	0.42	4.68	0.31	7.41	0.53	6.80	0.62
190.00	5.51	0.26	4.98	0.42	4.68	0.35	7.94	0.70	6.81	0.70
200.00	5.45	0.23	5.17	0.46	4.64	0.35	8.27	0.70	6.77	0.70
210.00	5.64	0.30	6.58	0.46	5.19	0.54	8.02	0.70	7.24	0.70
220.00	5.69	0.30	7.69	0.46	5.93	0.27	7.74	0.58	7.78	0.54
230.00	5.62	0.34	8.07	0.38	6.39	0.35	7.20	0.41	7.83	0.54
];

data.gp_t = gp_gu(:,1);
data.gu_t = gp_gu(:,1);
data.ins_t = ins_glu(:,1);
data.glu_t = ins_glu(:,1);
data.glc_t = glc(:,1);
    
data.gp_data     = gp_gu(:,2 + offset*5);
data.gp_sem = gp_gu(:,3 + offset*5);
data.gu_data     = gp_gu(:,4 + offset*5);
data.gu_sem = gp_gu(:,5 + offset*5);

data.ins_data       = ins_glu(:,2 + offset*4);
data.ins_sem   = ins_glu(:,3 + offset*4);
data.glu_data       = ins_glu(:,4 + offset*4);
data.glu_sem   = ins_glu(:,5 + offset*4);

data.glc_data       = glc(:, 2 + offset*2);
data.glc_sem   = glc(:, 3 + offset*2);
