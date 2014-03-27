%FIG_DOSE_RESPONSE_GAMMA
% Creates Figure 2: insulin, glucagon and epinephrine dose-response curves
% with the experimental data and the resulting gamma curves.

%insulin curven
%insulin datenpunkte 3x
%insulin fitcurven
close all;
clear all;
% Plot the hormone dose response curves

x_name = 'glucose [mM]';
glc_min  = 2;
glc_max  = 20;
glc_step = 0.01;

glc = glc_min:glc_step:glc_max;
%load data
%insulin
		data_i_normal = [
		    data_insulin_normal_OGGT_Ferrannini1988
		    data_insulin_normal_OGGT_Fery1993
		    data_insulin_normal_Lerche2009
		    data_insulin_normal_OGGT_Gerich1993
		    data_insulin_normal_OGGT_Basu2009
		    data_insulin_normal_OGGT_Henkel2005
		    data_insulin_normal_OGGT_Butler1991
		    data_insulin_normal_OGGT_Knop2007
		    data_insulin_normal_OGGT_Cobelli2010
		    data_insulin_normal_OGGT_Mitrakou1992];
		data_i_T2DM = [
		    data_insulin_T2DM_OGGT_Fery1993
		    data_insulin_T2DM_OGGT_Basu2009	 
		    data_insulin_T2DM_OGGT_Gerich1993
		    data_insulin_T2DM_OGGT_Butler1991	 
		    data_insulin_T2DM_OGGT_Henkel2005
		    data_insulin_T2DM_OGGT_Ferrannini1988
		    data_insulin_T2DM_OGGT_Knop2007];
		%glucagon
		insulin_suppression = 5;
		data_g_normal = [
		    
		    % Glucagon data of hyperinsulemic, hypoglycemic clamp has to be adapted
		    % due to inhibitory effect of insulin on glucagon secretion
		    %correct_hormone_data(data_glucagon_normal_Mitrakou1991,
		    %insulin_suppression)
		    correct_hormone_data(data_glucagon_normal_Degn2004, insulin_suppression)
		    correct_hormone_data(data_glucagon_normal_Lerche2009, insulin_suppression)        
		    correct_hormone_data(data_glucagon_normal_Levy1998, insulin_suppression)
		    correct_hormone_data(data_glucagon_normal_Israelian2006, insulin_suppression)
		    
		    correct_hormone_data(data_glucagon_normal_Degn2004, insulin_suppression)
		    correct_hormone_data(data_glucagon_normal_Lerche2009, insulin_suppression)        
		    correct_hormone_data(data_glucagon_normal_Levy1998, insulin_suppression)
		    correct_hormone_data(data_glucagon_normal_Israelian2006, insulin_suppression)
		    correct_hormone_data(data_glucagon_normal_Segel2002, insulin_suppression)
		    
		    
		    data_glucagon_normal_OGGT_Butler1991
		    data_glucagon_normal_OGGT_Cobelli2010
		    data_glucagon_normal_OGGT_Fery1993
		    
		    data_glucagon_normal_OGGT_Gerich1993
		    data_glucagon_normal_OGGT_Henkel2005
		    data_glucagon_normal_Mitrakou1991    
		    %data_glucagon_normal_OGGT_Knop2007
		    data_glucagon_normal_OGGT_Basu2009
		    data_glucagon_normal_OGGT_Mitrakou1992
		    data_glucagon_normal_OGGT_Basu2009];

         no_suppression = 1;
         data_g_normal_uncorrected = [
		    
		    % Glucagon data of hyperinsulemic, hypoglycemic clamp has to be adapted
		    % due to inhibitory effect of insulin on glucagon secretion
		    %correct_hormone_data(data_glucagon_normal_Mitrakou1991,
		    %insulin_suppression)
		    correct_hormone_data(data_glucagon_normal_Degn2004, no_suppression)
		    correct_hormone_data(data_glucagon_normal_Lerche2009, no_suppression)        
		    correct_hormone_data(data_glucagon_normal_Levy1998, no_suppression)
		    correct_hormone_data(data_glucagon_normal_Israelian2006, no_suppression)
		    
		    correct_hormone_data(data_glucagon_normal_Degn2004, no_suppression)
		    correct_hormone_data(data_glucagon_normal_Lerche2009, no_suppression)        
		    correct_hormone_data(data_glucagon_normal_Levy1998, no_suppression)
		    correct_hormone_data(data_glucagon_normal_Israelian2006, no_suppression)
		    correct_hormone_data(data_glucagon_normal_Segel2002, no_suppression)
		 ]   
		 data_g_normal_oggt = [   
		    data_glucagon_normal_OGGT_Butler1991
		    data_glucagon_normal_OGGT_Cobelli2010
		    data_glucagon_normal_OGGT_Fery1993
		    
		    data_glucagon_normal_OGGT_Gerich1993
		    data_glucagon_normal_OGGT_Henkel2005
            sdata_glucagon_normal_Mitrakou1991    
		    %data_glucagon_normal_OGGT_Knop2007
		    data_glucagon_normal_OGGT_Basu2009
		    data_glucagon_normal_OGGT_Mitrakou1992
            data_glucagon_normal_OGGT_Basu2009];
        
        data_g_normal_tn2001 = data_glucagon_normal_ToftNielsen2001;
        
		data_g_T2DM = [
		    data_glucagon_T2DM_OGGT_Gerich1993
		    data_glucagon_T2DM_OGGT_Basu2009    
		    data_glucagon_T2DM_OGGT_Henkel2005
		    data_glucagon_T2DM_OGGT_Butler1991  
		    %data_glucagon_T2DM_OGGT_Knop2007
		    data_glucagon_T2DM_OGGT_Fery1993    
		    data_glucagon_T2DM_OGGT_Mitrakou1992
		    
		    %correct_hormone_data(data_glucagon_T2DM_Segel2002, insulin_suppression)
		    correct_hormone_data(data_glucagon_T2DM_Israelian2006, insulin_suppression)
		    correct_hormone_data(data_glucagon_T2DM_Levy1998, insulin_suppression)
		    correct_hormone_data(data_glucagon_T2DM_Israelian2006, insulin_suppression)
		    correct_hormone_data(data_glucagon_T2DM_Levy1998, insulin_suppression)   ];
		data_e_normal = [
		    data_epinephrine_normal_Degn2004
		    data_epinephrine_normal_Lerche2009
		    data_epinephrine_normal_Mitrakou1991
		    data_epinephrine_normal_Levy1998
		    data_epinephrine_normal_Israelian2006
		    data_epinephrine_normal_Jones1998
		    data_epinephrine_normal_Segel2002];
		data_g_ext = [
		    data_glucagon_T2DM_OGGT_Gerich1993
		    data_glucagon_T2DM_OGGT_Basu2009    
		    data_glucagon_T2DM_OGGT_Henkel2005
		    data_glucagon_T2DM_OGGT_Butler1991  
		    %data_glucagon_T2DM_OGGT_Knop2007
		    data_glucagon_T2DM_OGGT_Fery1993    
		    data_glucagon_T2DM_OGGT_Mitrakou1992
		    
		    correct_hormone_data(data_glucagon_T2DM_Segel2002, insulin_suppression)];
		    %correct_hormone_data(data_glucagon_T2DM_Israelian2006, insulin_suppression)
		    %correct_hormone_data(data_glucagon_T2DM_Levy1998, insulin_suppression)
		    %correct_hormone_data(data_glucagon_T2DM_Israelian2006, insulin_suppression)
		    %correct_hormone_data(data_glucagon_T2DM_Levy1998, insulin_suppression)   

		data_e_T2DM= [data_epinephrine_T2DM_Levy1998
			data_epinephrine_T2DM_Israelian2006
			data_epinephrine_T2DM_Segel2002];
		data_e_sleep = [
			data_epinephrine_normal_sleep_Jones1998];		
		
		
%hormones    = {'insulin', 'glucagon', 'epinephrine'};
%conditions  = {'normal', 'T2DM', 'extreme T2DM','sleep' };
% 10 functions 3 normal 3 T2DM 3 extrem T2DM 1 epi sleep
functions = {
	%@insulin_f_normal
	hormone_f('insulin', 'normal');
	hormone_f('glucagon', 'normal');
	hormone_f('epinephrine', 'normal');
	
	hormone_f('insulin', 'T2DM');
	hormone_f('glucagon', 'T2DM');
	hormone_f('epinephrine', 'T2DM');
	
	hormone_f('insulin', 'extreme_T2DM');
	hormone_f('glucagon', 'extreme_T2DM');
	hormone_f('epinephrine', 'extreme_T2DM');

	hormone_f('epinephrine', 'sleep');};
h_axis = {  [glc_min glc_max 0 800] 
            [glc_min glc_max 0 200] 
            [glc_min 8 0 7000]
			[glc_min glc_max 0 1]};

        
fmat = figure('Name', 'Insulin GHR normal')
		hep1=plot(data_i_normal(:,1), data_i_normal(:,2),'.k');
		hold on
		he1=errorbar(data_i_normal(:,1), data_i_normal(:,2), data_i_normal(:,3),'.k');
		h_f_1 = functions{1};
		h_abs = h_f_1(glc);
		hp1=plot(glc, h_abs,'-k');
        %title('GHR insulin normal', 'FontWeight', 'bold');
		lx1=xlabel(x_name, 'FontWeight', 'bold');
		lx2=ylabel('insulin [pmol/l]','FontWeight', 'bold');

	
		axis(h_axis{1});
		axis square
		grid on
		set(gca, 'XTick',[2 5 8 11 14 17 20]);
	
		set(hp1,'LineWidth',2.0);
		set(he1,'MarkerSize',2.0);
		set(he1,'Color',[0.5 0.5 0.5]);
	    
fmat2 = figure('Name', 'Glucagon GHR normal')
    subplot(1,2,1)
    
        hep1g1=plot(data_g_normal_oggt(:,1), data_g_normal_oggt(:,2),'.k');
		hold on
		%he1g1=errorbar(data_g_normal_oggt(:,1), data_g_normal_oggt(:,2), data_g_normal_oggt(:,3),'.k');
        
        hep1g2=plot(data_g_normal_uncorrected(:,1), data_g_normal_uncorrected(:,2),'.k');
		%he1g2=errorbar(data_g_normal_uncorrected(:,1), data_g_normal_uncorrected(:,2), data_g_normal_uncorrected(:,3),'.k');
		%title('Glucagon GHR uncorrected', 'FontWeight', 'bold')
		lx1g=xlabel(x_name, 'FontWeight', 'bold');
		lx2g=ylabel('glucagon [pmol/l]', 'FontWeight', 'bold');
		
		
		axis(h_axis{2});
		axis square
		grid on
		set(gca, 'XTick',[2 4 6 8 10])
        
        set(gca, 'Xlim',[2 11])
		%set(he1g1,'MarkerSize',2.0);
        %set(he1g1,'Color',[0.5 0.5 0.5]);
        set(hep1g2,'Color',[0 0 1]);
		%set(he1g2,'MarkerSize',2.0);
		%set(he1g2,'Color',[0.5 0.5 0.5]);

    subplot(1,2,2)
        hep1g=plot(data_g_normal(:,1), data_g_normal(:,2),'.k');
		hold on
		he1g=errorbar(data_g_normal(:,1), data_g_normal(:,2), data_g_normal(:,3),'.k');
		
        heptn = plot(data_g_normal_tn2001(:,1), data_g_normal_tn2001(:,2), '.b');
        he1tn=errorbar(data_g_normal_tn2001(:,1), data_g_normal_tn2001(:,2), data_g_normal_tn2001(:,3),'.b');
		
        h_f_2_g = functions{2};
		h_abs = h_f_2_g(glc);
		hp1g=plot(glc, h_abs,'-k');
        %title({'Glucagon GHR corrected for', 'insulin suppression'}, 'FontWeight', 'bold')
        lx1g=xlabel(x_name, 'FontWeight', 'bold');
		lx2g=ylabel('glucagon [pmol/l]', 'FontWeight', 'bold');
		
		
		axis(h_axis{2});
		axis square
		grid on
		set(gca, 'XTick',[2 4 6 8 10])
        set(gca, 'Xlim',[2 11])
		set(hp1g,'LineWidth',2.0);
		set(he1g,'MarkerSize',1.0);
		set(he1g,'Color',[0.5 0.5 0.5]);



fh=figure('Name', 'Stuff');

	sph_i=subplot(2,2,3);
		
		hep1=plot(data_i_normal(:,1), data_i_normal(:,2),'.k');
		hold on
		he1=errorbar(data_i_normal(:,1), data_i_normal(:,2), data_i_normal(:,3),'.k');
		%hep2=plot(data_i_T2DM(:,1), data_i_T2DM(:,2),'.b');
		%he2=errorbar(data_i_T2DM(:,1), data_i_T2DM(:,2), data_i_T2DM(:,3),'.b');

		h_f_1 = functions{1};
		h_abs = h_f_1(glc);
		hp1=plot(glc, h_abs,'-k');
		lx1=xlabel(x_name);
		lx2=ylabel('insulin [pmol/l]');

		
		h_f_4 = functions{4};
		h_abs = h_f_4(glc);
		%hp2=plot(glc, h_abs,'-b');
		
		
		h_f_7 = functions{7};
		h_abs = h_f_7(glc);
		%hp3=plot(glc, h_abs,'-r');
		
		axis(h_axis{1});
		axis square
		grid on
		set(sph_i, 'XTick',[2 5 8 11 14 17 20]);
		set(sph_i, 'yTick',[200 400 600 800]);
		

		set(hp1,'LineWidth',2.0);
		%set(hp2,'LineWidth',2.0);
		%set(hp3,'LineWidth',2.0);
		set(he1,'MarkerSize',1.0);
		%set(he2,'MarkerSize',1.0);
		set(he1,'Color',[0.5 0.5 0.5]);
		%set(he2,'Color',[0.5 0.5 1.0]);
		
	sph_g=subplot(2,2,1);
		
		hep1g=plot(data_g_normal(:,1), data_g_normal(:,2),'.k');
		hold on
		he1g=errorbar(data_g_normal(:,1), data_g_normal(:,2), data_g_normal(:,3),'.k');
		%hep2g=plot(data_g_T2DM(:,1), data_g_T2DM(:,2),'.b');
		%he2g=errorbar(data_g_T2DM(:,1), data_g_T2DM(:,2), data_g_T2DM(:,3),'.b');
		%hep3g=plot(data_g_ext(:,1), data_g_ext(:,2),'.r');
		%he3g=errorbar(data_g_ext(:,1), data_g_ext(:,2), data_g_ext(:,3),'.r');

		h_f_2_g = functions{2};
		h_abs = h_f_2_g(glc);
		hp1g=plot(glc, h_abs,'-k');
		lx1g=xlabel(x_name);
		lx2g=ylabel('glucagon [pmol/l]');
		
		h_f_5_g = functions{5};
		h_abs = h_f_5_g(glc);
		%hp2g=plot(glc, h_abs,'-b');
		
		
		h_f_8_g = functions{8};
		h_abs = h_f_8_g(glc);
		%hp3g=plot(glc, h_abs,'-r');
		
		axis(h_axis{2});
		axis square
		grid on
		set(sph_g, 'XTick',[2 5 8 11 14 17 20])
        set(sph_g, 'yTick',[50 100 150 200])

		set(hp1g,'LineWidth',2.0);
		%set(hp2g,'LineWidth',2.0);
		%set(hp3g,'LineWidth',2.0);
		set(he1g,'MarkerSize',1.0);
		%set(he2g,'MarkerSize',1.0);
		%set(he3g,'MarkerSize',1.0);
		%set(he3g,'Color',[1.0 0.5 0.5]);
		set(he1g,'Color',[0.5 0.5 0.5]);
		%set(he2g,'Color',[0.5 0.5 1.0]);
		
	sph_e=subplot(2,2,2);
			hep1e=plot(data_e_normal(:,1), data_e_normal(:,2),'.k');
			hold on
			he1e=errorbar(data_e_normal(:,1), data_e_normal(:,2), data_e_normal(:,3),'.k');
			%hep2e=plot(data_e_T2DM(:,1), data_e_T2DM(:,2),'.b');
			%he2e=errorbar(data_e_T2DM(:,1), data_e_T2DM(:,2), data_e_T2DM(:,3),'.b');
%			hep3e=plot(data_e_sleep(:,1), data_e_sleep(:,2),'.g');
%			he3e=errorbar(data_e_sleep(:,1), data_e_sleep(:,2), data_e_sleep(:,3),'.g');

			h_f_3_e = functions{3};
			h_abs = h_f_3_e(glc);
			hp1e=plot(glc, h_abs,'-k');
			lx1e=xlabel(x_name);
			lx2e=ylabel('epinephrine [pmol/l]');
			
			h_f_6_e = functions{6};
			h_abs = h_f_6_e(glc);
			%hp2e=plot(glc, h_abs,'-b');
			
			
			h_f_9_e = functions{9};
			h_abs = h_f_9_e(glc);
			%hp3e=plot(glc, h_abs,'-r');
			
%			h_f_10_e = functions{10};
%			h_abs = h_f_10_e(glc);
%			hp4e=plot(glc, h_abs,'-g');
			
			axis(h_axis{3});
			axis square
			grid on
			set(sph_e, 'XTick',[2 3 4 5 6 7 8])
            set(sph_e, 'yTick',[1500 3000 4500 6000])

			set(hp1e,'LineWidth',2.0);
			%set(hp2e,'LineWidth',2.0);
			%set(hp3e,'LineWidth',0.5);
%			set(hp4e,'LineWidth',2.0);
			set(he1e,'MarkerSize',1.0);
			%set(he2e,'MarkerSize',1.0);
%			set(he3e,'MarkerSize',1.0);
%			set(he3e,'Color',[0.5 0.7 0.5]);
			set(he1e,'Color',[0.5 0.5 0.5]);
			%set(he2e,'Color',[0.5 0.5 1.0]);
%			set(hp4e,'Color',[0 0.7 0]);
			
	sph_gamma1 = subplot(2,2,4);
		gamma_normal = gamma_f(h_f_1(glc), h_f_2_g(glc),h_f_3_e(glc));
		gamma_T2DM = gamma_f(h_f_4(glc), h_f_5_g(glc),h_f_6_e(glc));
		gamma_ext = gamma_f(h_f_7(glc), h_f_8_g(glc),h_f_9_e(glc));
%		gamma_ext_sleep = gamma_f(h_f_7(glc), h_f_8_g(glc),h_f_10_e(glc));
		
		hold on
		%hp2c=plot(glc, gamma_T2DM, '-b');
		%hp3c=plot(glc, gamma_ext, '-r');
%		hp4c=plot(glc, gamma_ext_sleep, '-g');
		hp1c=plot(glc, gamma_normal, '-k');
		xlabel(x_name)
		ylabel('gamma')
		axis square
		axis([glc_min glc_max 0 1])
		grid on
		set(hp1c,'LineWidth',2.0);
%		set(hp4c,'Color',[0 0.7 0]);
		%set(hp2c,'LineWidth',2.0);
		%set(hp3c,'LineWidth',2.0);
%		set(hp4c,'LineWidth',2.0);
		set(sph_gamma1, 'XTick',[2 5 8 11 14 17 20])
		set(sph_gamma1, 'yTick',[0.2 0.4 0.6 0.8 1])
        
    %{    
	sph_treatment=subplot(3,2,5);
		% [1] constant addition treatment
		% additional insulin [pmol/l]
		% 1 : untreated; 2-5 : treatments
		h_f_1_t = functions{1};%insulin normal
		h_abs_n = h_f_1(glc);
		h_f_4 = functions{4};%t2dm geeinigt mit matthias
		h_abs_t2 = h_f_4(glc);
		
		hp2_5=plot(glc, h_abs_t2,'-b');
		hold on;
		lx1=xlabel(x_name);
		lx2=ylabel('insulin [pmol/l]');
		
		%ins_c = linspace(0,  450, 5);
		t1c=h_abs_t2+150;
		t2c=h_abs_t2+300;
		t3c=h_abs_t2+450;
		t4c=h_abs_t2+600;
		%ins_m = linspace(0, 1000/8, 5);
		t1a=h_abs_t2+1*1000/64*glc;
		t2a=h_abs_t2+2*1000/64*glc;
		t3a=h_abs_t2+3*1000/64*glc;
		t4a=h_abs_t2+4*1000/64*glc;
		hp1c_5=plot(glc,t1c,'-y');
		hp2c_5=plot(glc,t2c,'-y');
		hp3c_5=plot(glc,t3c,'-y');
		hp4c_5=plot(glc,t4c,'-y');
		hp1a_5=plot(glc,t1a,'-g');
		hp2a_5=plot(glc,t2a,'-g');
		hp3a_5=plot(glc,t3a,'-g');
		hp4a_5=plot(glc,t4a,'-g');
		hp1_5=plot(glc, h_abs_n,'-k');
		
		axis square
		axis([glc_min glc_max 0 1500])
		grid on
		set(hp1_5,'LineWidth',2.0);
		set(hp1_5,'Color',[0 0 0]);
		set(hp2_5,'LineWidth',2.0);
		set(hp2_5,'Color',[0 0 1]);

		set(hp1c_5,'LineWidth',2);
		set(hp1c_5,'Color',[0.5 0 0.5]);
        %set(hp1c_5,'Color',[0.6 0 0]);
		set(hp2c_5,'LineWidth',2);
		set(hp2c_5,'Color',[0.6 0 0.6]);
        %set(hp2c_5,'Color',[0.75 0.1 0]);
		set(hp3c_5,'LineWidth',2);
		set(hp3c_5,'Color',[0.7 0 0.7]);
        %set(hp3c_5,'Color',[0.9 0.15 0]);
		set(hp4c_5,'LineWidth',2);
		set(hp4c_5,'Color',[0.8 0 0.8]);
        %set(hp4c_5,'Color',[1 0.2 0]);
        
        
		set(hp1a_5,'LineWidth',2.0);
		set(hp1a_5,'Color',[0 0.4 0]);
		set(hp2a_5,'LineWidth',2.0);
		set(hp2a_5,'Color',[0 0.53 0]);
		set(hp3a_5,'LineWidth',2.0);
		set(hp3a_5,'Color',[0 0.66 0]);
		set(hp4a_5,'LineWidth',2.0);
		set(hp4a_5,'Color',[0 0.8 0]);
        
        set(sph_treatment, 'XTick',[2 5 8 11 14 17 20])
		set(sph_treatment, 'yTick',[0 250 500 750 1000 1250 1500])
        
	sph_gamma_treatment=subplot(3,2,6);
		
		gamma_normal_6 = gamma_f(h_f_1(glc), h_f_2_g(glc),h_f_3_e(glc));
		gamma_T2DM_6 = gamma_f(h_f_4(glc), h_f_5_g(glc),h_f_6_e(glc));

		gamma_t1c = gamma_f((t1c), h_f_5_g(glc),h_f_6_e(glc));
		gamma_t2c = gamma_f((t2c), h_f_5_g(glc),h_f_6_e(glc));
		gamma_t3c = gamma_f((t3c), h_f_5_g(glc),h_f_6_e(glc));
		gamma_t4c = gamma_f((t4c), h_f_5_g(glc),h_f_6_e(glc));

		gamma_t1a = gamma_f((t1a), h_f_5_g(glc),h_f_6_e(glc));
		gamma_t2a = gamma_f((t2a), h_f_5_g(glc),h_f_6_e(glc));
		gamma_t3a = gamma_f((t3a), h_f_5_g(glc),h_f_6_e(glc));
		gamma_t4a = gamma_f((t4a), h_f_5_g(glc),h_f_6_e(glc));
        
        gamma_insr = gamma_f(h_f_1(glc), h_f_5_g(glc),h_f_6_e(glc));
        gamma_glur = gamma_f(h_f_4(glc), h_f_2_g(glc),h_f_6_e(glc));
		
		h_abs_xtr = h_f_7(glc);
		t_xtr=h_abs_xtr+600;
%		gamma_xtrem=gamma_f((t_xtr), h_f_8_g(glc),h_f_10_e(glc));%max const treartment+epi sleep
		
		hold on
		hp2c_6=plot(glc, gamma_T2DM_6, '-b');
		hp1c_6=plot(glc, gamma_normal_6, '-k');

		hp_t1c_6=plot(glc, gamma_t1c, '-');
		hp_t2c_6=plot(glc, gamma_t2c, '-');
		hp_t3c_6=plot(glc, gamma_t3c, '-');
		hp_t4c_6=plot(glc, gamma_t4c, '-');

		hp_t1a_6=plot(glc, gamma_t1a, '-');
		hp_t2a_6=plot(glc, gamma_t2a, '-');
		hp_t3a_6=plot(glc, gamma_t3a, '-');
		hp_t4a_6=plot(glc, gamma_t4a, '-');
        
        hp_insr_6=plot(glc, gamma_insr, '-r');
        hp_glur_6=plot(glc, gamma_glur, '--r');

%		hp_tex_6=plot(glc,gamma_xtrem,'-g');
		xlabel(x_name)
		ylabel('gamma')
		axis square
		axis([glc_min glc_max 0 1])
		grid on
		set(hp1c_6,'LineWidth',2.0);
		set(hp2c_6,'LineWidth',2.0);

		set(hp_t1c_6,'LineWidth',2.0);
		set(hp_t1c_6,'Color',[0.5 0 0.5]);
		set(hp_t2c_6,'LineWidth',2.0);
		set(hp_t2c_6,'Color',[0.6 0 0.6]);
		set(hp_t3c_6,'LineWidth',2.0);
		set(hp_t3c_6,'Color',[0.7 0 0.7]);
		set(hp_t4c_6,'LineWidth',2.0);
		set(hp_t4c_6,'Color',[0.8 0 0.8]);

		set(hp_t1a_6,'LineWidth',2.0);
		set(hp_t1a_6,'Color',[0 0.4 0]);
		set(hp_t2a_6,'LineWidth',2.0);
		set(hp_t2a_6,'Color',[0 0.53 0]);
		set(hp_t3a_6,'LineWidth',2.0);
		set(hp_t3a_6,'Color',[0 0.66 0]);
		set(hp_t4a_6,'LineWidth',2.0);
		set(hp_t4a_6,'Color',[0 0.8 0]);
        
        
        set(hp_insr_6,'LineWidth',2.0);
		%set(hp_insr_6,'Color',[1 0.4 0]);
        set(hp_glur_6,'LineWidth',2.0);
		%set(hp_glur_6,'Color',[1.0 0.4 0]);
        
        %set(hp_insr_6,'LineWidth',2.0);
		%set(hp_insr_6,'Color',[0.5 0.5 0.5]);
        %set(hp_glur_6,'LineWidth',2.0);
		%set(hp_glur_6,'Color',[0.5 0.5 0.5]);
        
%		set(hp_tex_6,'LineWidth',2.0);
		set(sph_gamma_treatment, 'XTick',[2 5 8 11 14 17 20])
		set(sph_gamma_treatment, 'yTick',[0 0.2 0.4 0.6 0.8 1])
        %}
