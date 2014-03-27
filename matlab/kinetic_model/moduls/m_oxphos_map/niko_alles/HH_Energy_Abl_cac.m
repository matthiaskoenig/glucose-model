%HH_Energy_Abl_mod.m

function Abl = HH_Energy_Abl_mod(t,x,z);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% Oxi_mito (oxidative phosphorylierung, mitochondriale  electrophysiologie, respiratory chain) %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[ V_ion_in_oxi,...          %1-5
  V_vol_zelle_oxi,...       %12
  V_ATP_oxi,...             %13-14
  v_P_in_oxi,...            %24
  V_elec_mito_oxi,...       %55-61
  V_NAD_mito_oxi,...        %62-63    %soll identisch 94-95 werden
  V_ATP_mito_oxi,...        %64-65
  H_buff_oxi,...            %66
  V_P_mito_oxi,...          %67
  V_resp_oxi,...            %68-75
] = HH_Energy_oxi_mito(t,x,z);
  
%{}
  % switch off oxidative phosphorylation
  V_ion_in_oxi(:,:) = 0;          %1-5
  V_vol_zelle_oxi(:,:) = 0;       %12
  V_ATP_oxi(:,:) = 0;            %13-14
  v_P_in_oxi(:,:) = 0;           %24
  V_elec_mito_oxi(:,:) = 0;      %55-61
  V_NAD_mito_oxi(:,:) = 0;       %62-63    %soll identisch 94-95 werden
  V_ATP_mito_oxi(:,:) = 0;       %64-65
  H_buff_oxi(:,:) = 0;           %66
  V_P_mito_oxi(:,:) = 0;         %67
  V_resp_oxi(:,:) = 0;           %68-75
%{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% CAC (ciric acid cycle, lipolyse, liponeogenese, shuttle systems )%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[V_Cit_Lys,...              %76-78
    V_omni,...              %79-82
    V_CAC,...               %83-92
    v_Pyr_in,...            %93
    V_NAD_mito_cac,...      %94-95
    V_Rest,...              %96-116
    V_beta,...              %117-144
    V_Car_shuttle,...       %145-150
    V_keto,...              %151-53
    v_dummy1...             %154
] = HH_Energy_CAC(t,x,z);

%{
    % TCA
    V_Cit_Lys(:,:) = 0;             %76-78
    V_omni(:,:) = 0;             %79-82
    V_CAC(:,:) = 0;              %83-92
    v_Pyr_in(:,:) = 0;            %93
    V_NAD_mito_cac(:,:) = 0;      %94-95
    V_Rest(:,:) = 0;             %96-116
    V_beta(:,:) = 0;             %117-144
    V_Car_shuttle(:,:) = 0;      %145-150
    V_keto(:,:) = 0;             %151-53
    v_dummy1(:,:) = 0;            %154
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%% Gesamtableitung %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

V = [
     %V_ion_in_oxi           %1-5
     zeros(5,1)
     
     zeros(6,1)             %6-11
     
     V_vol_zelle_oxi        %12

     V_ATP_oxi              %13-14    

     zeros(9,1)             %15-23
     
     v_P_in_oxi             %24
    
     zeros(30,1)            %25-54
     
     V_elec_mito_oxi        %55-61
     
     %V_NAD_mito_oxi        %62-63    %soll identisch 94-95 werden
     zeros(2,1)             %62-63 
     
     
     V_ATP_mito_oxi         %64-65    %soll identisch 109-110 werden   
     H_buff_oxi             %66
     V_P_mito_oxi           %67
     V_resp_oxi             %68-75
   
     V_Cit_Lys              %76-78
     V_omni                 %79-82
     V_CAC                  %83-92
     
     v_Pyr_in               %93
     V_NAD_mito_cac + V_NAD_mito_oxi        %94-95
     
     V_Rest                 %96-116
     
     V_beta                 %117-144
     V_Car_shuttle          %145-150
     V_keto                 %151-53
     v_dummy1               %154           
    ];


Abl=V;