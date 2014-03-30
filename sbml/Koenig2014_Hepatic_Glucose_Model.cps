<?xml version="1.0" encoding="UTF-8"?>
<!-- generated with COPASI 4.11 (Build 65) (http://www.copasi.org) at 2014-03-30 18:52:25 UTC -->
<?oxygen RNGSchema="http://www.copasi.org/static/schema/CopasiML.rng" type="xml"?>
<COPASI xmlns="http://www.copasi.org/static/schema" versionMajor="4" versionMinor="11" versionDevel="65" copasiSourcesModified="0">
  <ListOfFunctions>
    <Function key="Function_40" name="max" type="UserDefined" reversible="unspecified">
      <Expression>
        if(x gt y,x,y)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_264" name="x" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_262" name="y" order="1" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_42" name="Function for GLUT2 glucose transporter" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*GLUT2_Vmax/GLUT2_km*(glc_ext-glc/GLUT2_keq)/(1+glc_ext/GLUT2_km+glc/GLUT2_km)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_270" name="GLUT2_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_271" name="GLUT2_keq" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_272" name="GLUT2_km" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_273" name="glc" order="3" role="product"/>
        <ParameterDescription key="FunctionParameter_274" name="glc_ext" order="4" role="substrate"/>
        <ParameterDescription key="FunctionParameter_275" name="scale_gly" order="5" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_43" name="Function for Glucokinase" type="UserDefined" reversible="false">
      <Expression>
        scale_gly*GK_Vmax*GK_gc_free*atp/(GK_km_atp+atp)*glc^GK_n/(glc^GK_n+GK_km_glc^GK_n)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_285" name="GK_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_286" name="GK_gc_free" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_287" name="GK_km_atp" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_288" name="GK_km_glc" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_289" name="GK_n" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_290" name="atp" order="5" role="substrate"/>
        <ParameterDescription key="FunctionParameter_291" name="cyto" order="6" role="volume"/>
        <ParameterDescription key="FunctionParameter_292" name="glc" order="7" role="substrate"/>
        <ParameterDescription key="FunctionParameter_293" name="scale_gly" order="8" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_44" name="Function for D-Glucose-6-phosphate Phosphatase" type="UserDefined" reversible="false">
      <Expression>
        scale_gly*G6PASE_Vmax*glc6p/(G6PASE_km_glc6p+glc6p)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_283" name="G6PASE_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_269" name="G6PASE_km_glc6p" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_268" name="cyto" order="2" role="volume"/>
        <ParameterDescription key="FunctionParameter_267" name="glc6p" order="3" role="substrate"/>
        <ParameterDescription key="FunctionParameter_303" name="scale_gly" order="4" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_46" name="Function for Glucose 1-phosphate 1,6-phosphomutase" type="UserDefined" reversible="true">
      <Expression>
        scale_glyglc*G16PI_Vmax/G16PI_km_glc1p*(glc1p-glc6p/G16PI_keq)/(1+glc1p/G16PI_km_glc1p+glc6p/G16PI_km_glc6p)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_326" name="G16PI_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_327" name="G16PI_keq" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_328" name="G16PI_km_glc1p" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_329" name="G16PI_km_glc6p" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_330" name="cyto" order="4" role="volume"/>
        <ParameterDescription key="FunctionParameter_331" name="glc1p" order="5" role="substrate"/>
        <ParameterDescription key="FunctionParameter_332" name="glc6p" order="6" role="product"/>
        <ParameterDescription key="FunctionParameter_333" name="scale_glyglc" order="7" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_48" name="Function for Pyrophosphate phosphohydrolase" type="UserDefined" reversible="false">
      <Expression>
        scale_glyglc*PPASE_Vmax*pp/(pp+PPASE_km_pp)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_282" name="PPASE_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_343" name="PPASE_km_pp" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_344" name="cyto" order="2" role="volume"/>
        <ParameterDescription key="FunctionParameter_325" name="pp" order="3" role="substrate"/>
        <ParameterDescription key="FunctionParameter_342" name="scale_glyglc" order="4" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_49" name="Function for Glycogen synthase" type="UserDefined" reversible="false">
      <Expression>
        ((1-gamma)*GS_native+gamma*GS_phospho)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_309" name="GS_native" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_371" name="GS_phospho" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_372" name="cyto" order="2" role="volume"/>
        <ParameterDescription key="FunctionParameter_373" name="gamma" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_50" name="Function for Glycogen-Phosphorylase" type="UserDefined" reversible="true">
      <Expression>
        ((1-gamma)*GP_native+gamma*GP_phospho)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_378" name="GP_native" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_379" name="GP_phospho" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_380" name="cyto" order="2" role="volume"/>
        <ParameterDescription key="FunctionParameter_381" name="gamma" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_51" name="Function for Nucleoside-diphosphate kinase (ATP, GTP)" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*NDKGTP_Vmax/(NDKGTP_km_atp*NDKGTP_km_gdp)*(atp*gdp-adp*gtp/NDKGTP_keq)/((1+atp/NDKGTP_km_atp)*(1+gdp/NDKGTP_km_gdp)+(1+adp/NDKGTP_km_adp)*(1+gtp/NDKGTP_km_gtp)-1)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_394" name="NDKGTP_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_395" name="NDKGTP_keq" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_396" name="NDKGTP_km_adp" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_397" name="NDKGTP_km_atp" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_398" name="NDKGTP_km_gdp" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_399" name="NDKGTP_km_gtp" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_400" name="adp" order="6" role="product"/>
        <ParameterDescription key="FunctionParameter_401" name="atp" order="7" role="substrate"/>
        <ParameterDescription key="FunctionParameter_402" name="cyto" order="8" role="volume"/>
        <ParameterDescription key="FunctionParameter_403" name="gdp" order="9" role="substrate"/>
        <ParameterDescription key="FunctionParameter_404" name="gtp" order="10" role="product"/>
        <ParameterDescription key="FunctionParameter_405" name="scale_gly" order="11" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_52" name="Function for Nucleoside-diphosphate kinase (ATP, UTP)" type="UserDefined" reversible="true">
      <Expression>
        scale_glyglc*NDKUTP_Vmax/(NDKUTP_km_atp*NDKUTP_km_udp)*(atp*udp-adp*utp/NDKUTP_keq)/((1+atp/NDKUTP_km_atp)*(1+udp/NDKUTP_km_udp)+(1+adp/NDKUTP_km_adp)*(1+utp/NDKUTP_km_utp)-1)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_418" name="NDKUTP_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_419" name="NDKUTP_keq" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_420" name="NDKUTP_km_adp" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_421" name="NDKUTP_km_atp" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_422" name="NDKUTP_km_udp" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_423" name="NDKUTP_km_utp" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_424" name="adp" order="6" role="product"/>
        <ParameterDescription key="FunctionParameter_425" name="atp" order="7" role="substrate"/>
        <ParameterDescription key="FunctionParameter_426" name="cyto" order="8" role="volume"/>
        <ParameterDescription key="FunctionParameter_427" name="scale_glyglc" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_428" name="udp" order="10" role="substrate"/>
        <ParameterDescription key="FunctionParameter_429" name="utp" order="11" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_53" name="Function for ATP:AMP phosphotransferase (Adenylatkinase)" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*AK_Vmax/(AK_km_atp*AK_km_amp)*(atp*amp-adp*adp/AK_keq)/((1+atp/AK_km_atp)*(1+amp/AK_km_amp)+(1+adp/AK_km_adp)*(1+adp/AK_km_adp)-1)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_265" name="AK_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_389" name="AK_keq" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_442" name="AK_km_adp" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_443" name="AK_km_amp" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_444" name="AK_km_atp" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_445" name="adp" order="5" role="product"/>
        <ParameterDescription key="FunctionParameter_446" name="amp" order="6" role="substrate"/>
        <ParameterDescription key="FunctionParameter_447" name="atp" order="7" role="substrate"/>
        <ParameterDescription key="FunctionParameter_448" name="cyto" order="8" role="volume"/>
        <ParameterDescription key="FunctionParameter_449" name="scale_gly" order="9" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_54" name="Function for ATP:D-fructose-6-phosphate 2-phosphotransferase" type="UserDefined" reversible="false">
      <Expression>
        ((1-gamma)*PFK2_native+gamma*PFK2_phospho)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_390" name="PFK2_native" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_284" name="PFK2_phospho" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_258" name="cyto" order="2" role="volume"/>
        <ParameterDescription key="FunctionParameter_387" name="gamma" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_56" name="Function for ATP:D-fructose-6-phosphate 1-phosphotransferase" type="UserDefined" reversible="false">
      <Expression>
        scale_gly*PFK1_Vmax*(1-1/(1+fru26bp/PFK1_ka_fru26bp))*fru6p*atp/(PFK1_ki_fru6p*PFK1_km_atp+PFK1_km_fru6p*atp+PFK1_km_atp*fru6p+atp*fru6p)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_474" name="PFK1_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_475" name="PFK1_ka_fru26bp" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_476" name="PFK1_ki_fru6p" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_477" name="PFK1_km_atp" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_478" name="PFK1_km_fru6p" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_479" name="atp" order="5" role="substrate"/>
        <ParameterDescription key="FunctionParameter_480" name="cyto" order="6" role="volume"/>
        <ParameterDescription key="FunctionParameter_481" name="fru26bp" order="7" role="modifier"/>
        <ParameterDescription key="FunctionParameter_482" name="fru6p" order="8" role="substrate"/>
        <ParameterDescription key="FunctionParameter_483" name="scale_gly" order="9" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_58" name="Function for Aldolase" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*ALD_Vmax/ALD_km_fru16bp*(fru16bp-grap*dhap/ALD_keq)/(1+fru16bp/ALD_km_fru16bp+grap/ALD_ki1_grap+dhap*(grap+ALD_km_grap)/(ALD_km_dhap*ALD_ki1_grap)+fru16bp*grap/(ALD_km_fru16bp*ALD_ki2_grap))/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_508" name="ALD_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_509" name="ALD_keq" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_510" name="ALD_ki1_grap" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_511" name="ALD_ki2_grap" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_512" name="ALD_km_dhap" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_513" name="ALD_km_fru16bp" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_514" name="ALD_km_grap" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_515" name="cyto" order="7" role="volume"/>
        <ParameterDescription key="FunctionParameter_516" name="dhap" order="8" role="product"/>
        <ParameterDescription key="FunctionParameter_517" name="fru16bp" order="9" role="substrate"/>
        <ParameterDescription key="FunctionParameter_518" name="grap" order="10" role="product"/>
        <ParameterDescription key="FunctionParameter_519" name="scale_gly" order="11" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_59" name="Function for Triosephosphate Isomerase" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*TPI_Vmax/TPI_km_dhap*(dhap-grap/TPI_keq)/(1+dhap/TPI_km_dhap+grap/TPI_km_grap)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_506" name="TPI_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_503" name="TPI_keq" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_502" name="TPI_km_dhap" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_392" name="TPI_km_grap" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_532" name="cyto" order="4" role="volume"/>
        <ParameterDescription key="FunctionParameter_533" name="dhap" order="5" role="substrate"/>
        <ParameterDescription key="FunctionParameter_534" name="grap" order="6" role="product"/>
        <ParameterDescription key="FunctionParameter_535" name="scale_gly" order="7" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_61" name="Function for Phosphoglycerate Kinase" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*PGK_Vmax/(PGK_k_adp*PGK_k_bpg13)*(adp*bpg13-atp*pg3/PGK_keq)/((1+adp/PGK_k_adp)*(1+bpg13/PGK_k_bpg13)+(1+atp/PGK_k_atp)*(1+pg3/PGK_k_pg3)-1)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_507" name="PGK_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_575" name="PGK_k_adp" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_576" name="PGK_k_atp" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_577" name="PGK_k_bpg13" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_578" name="PGK_k_pg3" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_579" name="PGK_keq" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_580" name="adp" order="6" role="substrate"/>
        <ParameterDescription key="FunctionParameter_581" name="atp" order="7" role="product"/>
        <ParameterDescription key="FunctionParameter_582" name="bpg13" order="8" role="substrate"/>
        <ParameterDescription key="FunctionParameter_583" name="cyto" order="9" role="volume"/>
        <ParameterDescription key="FunctionParameter_584" name="pg3" order="10" role="product"/>
        <ParameterDescription key="FunctionParameter_585" name="scale_gly" order="11" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_62" name="Function for 2-Phospho-D-glycerate 2,3-phosphomutase" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*PGM_Vmax*(pg3-pg2/PGM_keq)/(pg3+PGM_k_pg3*(1+pg2/PGM_k_pg2))/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_472" name="PGM_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_468" name="PGM_k_pg2" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_545" name="PGM_k_pg3" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_473" name="PGM_keq" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_598" name="cyto" order="4" role="volume"/>
        <ParameterDescription key="FunctionParameter_599" name="pg2" order="5" role="product"/>
        <ParameterDescription key="FunctionParameter_600" name="pg3" order="6" role="substrate"/>
        <ParameterDescription key="FunctionParameter_601" name="scale_gly" order="7" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_63" name="Function for 2-Phospho-D-glucerate hydro-lyase (enolase)" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*EN_Vmax*(pg2-pep/EN_keq)/(pg2+EN_k_pg2*(1+pep/EN_k_pep))/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_610" name="EN_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_611" name="EN_k_pep" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_612" name="EN_k_pg2" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_613" name="EN_keq" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_614" name="cyto" order="4" role="volume"/>
        <ParameterDescription key="FunctionParameter_615" name="pep" order="5" role="product"/>
        <ParameterDescription key="FunctionParameter_616" name="pg2" order="6" role="substrate"/>
        <ParameterDescription key="FunctionParameter_617" name="scale_gly" order="7" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_64" name="Function for Pyruvatkinase" type="UserDefined" reversible="false">
      <Expression>
        ((1-gamma)*PK_native+gamma*PK_phospho)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_546" name="PK_native" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_504" name="PK_phospho" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_547" name="cyto" order="2" role="volume"/>
        <ParameterDescription key="FunctionParameter_548" name="gamma" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_65" name="Function for PEPCK cyto" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*PEPCK_Vmax/(PEPCK_k_oaa*PEPCK_k_gtp)*(oaa*gtp-pep*gdp*co2/PEPCK_keq)/((1+oaa/PEPCK_k_oaa)*(1+gtp/PEPCK_k_gtp)+(1+pep/PEPCK_k_pep)*(1+gdp/PEPCK_k_gdp)*(1+co2/PEPCK_k_co2)-1)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_640" name="PEPCK_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_641" name="PEPCK_k_co2" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_642" name="PEPCK_k_gdp" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_643" name="PEPCK_k_gtp" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_644" name="PEPCK_k_oaa" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_645" name="PEPCK_k_pep" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_646" name="PEPCK_keq" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_647" name="co2" order="7" role="product"/>
        <ParameterDescription key="FunctionParameter_648" name="cyto" order="8" role="volume"/>
        <ParameterDescription key="FunctionParameter_649" name="gdp" order="9" role="product"/>
        <ParameterDescription key="FunctionParameter_650" name="gtp" order="10" role="substrate"/>
        <ParameterDescription key="FunctionParameter_651" name="oaa" order="11" role="substrate"/>
        <ParameterDescription key="FunctionParameter_652" name="pep" order="12" role="product"/>
        <ParameterDescription key="FunctionParameter_653" name="scale_gly" order="13" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_66" name="Function for PEPCK mito" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*PEPCKM_Vmax/(PEPCK_k_oaa*PEPCK_k_gtp)*(oaa_mito*gtp_mito-pep_mito*gdp_mito*co2_mito/PEPCK_keq)/((1+oaa_mito/PEPCK_k_oaa)*(1+gtp_mito/PEPCK_k_gtp)+(1+pep_mito/PEPCK_k_pep)*(1+gdp_mito/PEPCK_k_gdp)*(1+co2_mito/PEPCK_k_co2)-1)/mito
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_668" name="PEPCKM_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_669" name="PEPCK_k_co2" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_670" name="PEPCK_k_gdp" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_671" name="PEPCK_k_gtp" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_672" name="PEPCK_k_oaa" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_673" name="PEPCK_k_pep" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_674" name="PEPCK_keq" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_675" name="co2_mito" order="7" role="product"/>
        <ParameterDescription key="FunctionParameter_676" name="gdp_mito" order="8" role="product"/>
        <ParameterDescription key="FunctionParameter_677" name="gtp_mito" order="9" role="substrate"/>
        <ParameterDescription key="FunctionParameter_678" name="mito" order="10" role="volume"/>
        <ParameterDescription key="FunctionParameter_679" name="oaa_mito" order="11" role="substrate"/>
        <ParameterDescription key="FunctionParameter_680" name="pep_mito" order="12" role="product"/>
        <ParameterDescription key="FunctionParameter_681" name="scale_gly" order="13" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_68" name="Function for Lactate Dehydrogenase" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*LDH_Vmax/(LDH_k_pyr*LDH_k_nadh)*(pyr*nadh-lac*nad/LDH_keq)/((1+nadh/LDH_k_nadh)*(1+pyr/LDH_k_pyr)+(1+lac/LDH_k_lac)*(1+nad/LDH_k_nad)-1)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_716" name="LDH_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_717" name="LDH_k_lac" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_718" name="LDH_k_nad" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_719" name="LDH_k_nadh" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_720" name="LDH_k_pyr" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_721" name="LDH_keq" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_722" name="cyto" order="6" role="volume"/>
        <ParameterDescription key="FunctionParameter_723" name="lac" order="7" role="product"/>
        <ParameterDescription key="FunctionParameter_724" name="nad" order="8" role="product"/>
        <ParameterDescription key="FunctionParameter_725" name="nadh" order="9" role="substrate"/>
        <ParameterDescription key="FunctionParameter_726" name="pyr" order="10" role="substrate"/>
        <ParameterDescription key="FunctionParameter_727" name="scale_gly" order="11" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_69" name="Function for Lactate transport (import)" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*LACT_Vmax/LACT_k_lac*(lac_ext-lac/LACT_keq)/(1+lac_ext/LACT_k_lac+lac/LACT_k_lac)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_469" name="LACT_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_636" name="LACT_k_lac" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_633" name="LACT_keq" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_634" name="lac" order="3" role="product"/>
        <ParameterDescription key="FunctionParameter_631" name="lac_ext" order="4" role="substrate"/>
        <ParameterDescription key="FunctionParameter_639" name="scale_gly" order="5" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_70" name="Function for Pyruvate transport (mito)" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*PYRTM_Vmax/PYRTM_k_pyr*(pyr-pyr_mito/PYRTM_keq)/(1+pyr/PYRTM_k_pyr+pyr_mito/PYRTM_k_pyr)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_746" name="PYRTM_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_747" name="PYRTM_k_pyr" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_748" name="PYRTM_keq" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_749" name="pyr" order="3" role="substrate"/>
        <ParameterDescription key="FunctionParameter_750" name="pyr_mito" order="4" role="product"/>
        <ParameterDescription key="FunctionParameter_751" name="scale_gly" order="5" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_71" name="Function for PEP Transport (export mito)" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*PEPTM_Vmax/PEPTM_k_pep*(pep_mito-pep/PEPTM_keq)/(1+pep/PEPTM_k_pep+pep_mito/PEPTM_k_pep)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_758" name="PEPTM_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_759" name="PEPTM_k_pep" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_760" name="PEPTM_keq" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_761" name="pep" order="3" role="product"/>
        <ParameterDescription key="FunctionParameter_762" name="pep_mito" order="4" role="substrate"/>
        <ParameterDescription key="FunctionParameter_763" name="scale_gly" order="5" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_72" name="Function for Pyruvate Dehydrogenase" type="UserDefined" reversible="false">
      <Expression>
        ((1-gamma)*PDH_nat+gamma*PDH_p)/mito
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_715" name="PDH_nat" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_630" name="PDH_p" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_770" name="gamma" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_771" name="mito" order="3" role="volume"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_73" name="Function for Citrate Synthase" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*CS_Vmax/(CS_k_oaa*CS_k_acoa)*(acoa_mito*oaa_mito-cit_mito*coa_mito/CS_keq)/((1+acoa_mito/CS_k_acoa)*(1+oaa_mito/CS_k_oaa)+(1+cit_mito/CS_k_cit)*(1+coa_mito/CS_k_coa)-1)/mito
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_784" name="CS_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_785" name="CS_k_acoa" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_786" name="CS_k_cit" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_787" name="CS_k_coa" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_788" name="CS_k_oaa" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_789" name="CS_keq" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_790" name="acoa_mito" order="6" role="substrate"/>
        <ParameterDescription key="FunctionParameter_791" name="cit_mito" order="7" role="product"/>
        <ParameterDescription key="FunctionParameter_792" name="coa_mito" order="8" role="product"/>
        <ParameterDescription key="FunctionParameter_793" name="mito" order="9" role="volume"/>
        <ParameterDescription key="FunctionParameter_794" name="oaa_mito" order="10" role="substrate"/>
        <ParameterDescription key="FunctionParameter_795" name="scale_gly" order="11" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_74" name="Function for Nucleoside-diphosphate kinase (ATP, GTP) mito" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*NDKGTPM_Vmax/(NDKGTPM_k_atp*NDKGTPM_k_gdp)*(atp_mito*gdp_mito-adp_mito*gtp_mito/NDKGTPM_keq)/((1+atp_mito/NDKGTPM_k_atp)*(1+gdp_mito/NDKGTPM_k_gdp)+(1+adp_mito/NDKGTPM_k_adp)*(1+gtp_mito/NDKGTPM_k_gtp)-1)/mito
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_808" name="NDKGTPM_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_809" name="NDKGTPM_k_adp" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_810" name="NDKGTPM_k_atp" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_811" name="NDKGTPM_k_gdp" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_812" name="NDKGTPM_k_gtp" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_813" name="NDKGTPM_keq" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_814" name="adp_mito" order="6" role="product"/>
        <ParameterDescription key="FunctionParameter_815" name="atp_mito" order="7" role="substrate"/>
        <ParameterDescription key="FunctionParameter_816" name="gdp_mito" order="8" role="substrate"/>
        <ParameterDescription key="FunctionParameter_817" name="gtp_mito" order="9" role="product"/>
        <ParameterDescription key="FunctionParameter_818" name="mito" order="10" role="volume"/>
        <ParameterDescription key="FunctionParameter_819" name="scale_gly" order="11" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_75" name="Function for oxalacetate influx" type="UserDefined" reversible="false">
      <Expression>
        scale_gly*OAAFLX_Vmax/mito
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_776" name="OAAFLX_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_778" name="mito" order="1" role="volume"/>
        <ParameterDescription key="FunctionParameter_780" name="scale_gly" order="2" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_76" name="Function for acetyl-coa efflux" type="UserDefined" reversible="false">
      <Expression>
        scale_gly*ACOAFLX_Vmax/mito
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_783" name="ACOAFLX_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_781" name="mito" order="1" role="volume"/>
        <ParameterDescription key="FunctionParameter_777" name="scale_gly" order="2" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_77" name="Function for citrate efflux" type="UserDefined" reversible="false">
      <Expression>
        scale_gly*CITFLX_Vmax/mito
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_835" name="CITFLX_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_836" name="mito" order="1" role="volume"/>
        <ParameterDescription key="FunctionParameter_837" name="scale_gly" order="2" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_78" name="Function for D-Glucose-6-phosphate Isomerase_1" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*GPI_Vmax/GPI_km_glc6p*(glc6p-fru6p/GPI_keq)/(1+glc6p/GPI_km_glc6p+fru6p/GPI_km_fru6p)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_806" name="GPI_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_804" name="GPI_keq" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_831" name="GPI_km_fru6p" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_829" name="GPI_km_glc6p" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_828" name="cyto" order="4" role="volume"/>
        <ParameterDescription key="FunctionParameter_773" name="fru6p" order="5" role="product"/>
        <ParameterDescription key="FunctionParameter_772" name="glc6p" order="6" role="substrate"/>
        <ParameterDescription key="FunctionParameter_769" name="scale_gly" order="7" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_79" name="Function for UTP:Glucose-1-phosphate uridylyltransferase_1" type="UserDefined" reversible="true">
      <Expression>
        scale_glyglc*UPGASE_Vmax/(UPGASE_km_utp*UPGASE_km_glc1p)*(utp*glc1p-udpglc*pp/UPGASE_keq)/((1+utp/UPGASE_km_utp)*(1+glc1p/UPGASE_km_glc1p)+(1+udpglc/UPGASE_km_udpglc)*(1+pp/UPGASE_km_pp)-1)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_803" name="UPGASE_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_820" name="UPGASE_keq" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_805" name="UPGASE_km_glc1p" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_838" name="UPGASE_km_pp" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_732" name="UPGASE_km_udpglc" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_731" name="UPGASE_km_utp" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_730" name="cyto" order="6" role="volume"/>
        <ParameterDescription key="FunctionParameter_729" name="glc1p" order="7" role="substrate"/>
        <ParameterDescription key="FunctionParameter_728" name="pp" order="8" role="product"/>
        <ParameterDescription key="FunctionParameter_714" name="scale_glyglc" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_713" name="udpglc" order="10" role="product"/>
        <ParameterDescription key="FunctionParameter_712" name="utp" order="11" role="substrate"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_80" name="Function for D-Fructose-2,6-bisphosphate 2-phosphohydrolase_1" type="UserDefined" reversible="unspecified">
      <Expression>
        ((1-gamma)*FBP2_native+gamma*FBP2_phospho)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_656" name="FBP2_native" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_657" name="FBP2_phospho" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_659" name="cyto" order="2" role="volume"/>
        <ParameterDescription key="FunctionParameter_663" name="gamma" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_81" name="Function for D-Fructose-1,6-bisphosphate 1-phosphohydrolase_1" type="UserDefined" reversible="unspecified">
      <Expression>
        scale_gly*FBP1_Vmax/(1+fru26bp/FBP1_ki_fru26bp)*fru16bp/(fru16bp+FBP1_km_fru16bp)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_571" name="FBP1_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_572" name="FBP1_ki_fru26bp" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_573" name="FBP1_km_fru16bp" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_660" name="cyto" order="3" role="volume"/>
        <ParameterDescription key="FunctionParameter_743" name="fru16bp" order="4" role="substrate"/>
        <ParameterDescription key="FunctionParameter_629" name="fru26bp" order="5" role="modifier"/>
        <ParameterDescription key="FunctionParameter_574" name="scale_gly" order="6" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_82" name="Function for D-Glyceraldehyde-3-phosphate:NAD+ oxidoreductase_1" type="UserDefined" reversible="unspecified">
      <Expression>
        scale_gly*GAPDH_Vmax/(GAPDH_k_nad*GAPDH_k_grap*GAPDH_k_p)*(nad*grap*phos-bpg13*nadh/GAPDH_keq)/((1+nad/GAPDH_k_nad)*(1+grap/GAPDH_k_grap)*(1+phos/GAPDH_k_p)+(1+nadh/GAPDH_k_nadh)*(1+bpg13/GAPDH_k_bpg13)-1)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_501" name="GAPDH_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_497" name="GAPDH_k_bpg13" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_464" name="GAPDH_k_grap" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_461" name="GAPDH_k_nad" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_460" name="GAPDH_k_nadh" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_388" name="GAPDH_k_p" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_393" name="GAPDH_keq" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_459" name="bpg13" order="7" role="product"/>
        <ParameterDescription key="FunctionParameter_458" name="cyto" order="8" role="volume"/>
        <ParameterDescription key="FunctionParameter_457" name="grap" order="9" role="substrate"/>
        <ParameterDescription key="FunctionParameter_456" name="nad" order="10" role="substrate"/>
        <ParameterDescription key="FunctionParameter_455" name="nadh" order="11" role="product"/>
        <ParameterDescription key="FunctionParameter_454" name="phos" order="12" role="substrate"/>
        <ParameterDescription key="FunctionParameter_453" name="scale_gly" order="13" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_83" name="Function for Pyruvate Carboxylase_1" type="UserDefined" reversible="unspecified">
      <Expression>
        scale_gly*PC_Vmax*atp_mito/(PC_k_atp+atp_mito)*pyr_mito/(PC_k_pyr+pyr_mito)*co2_mito/(PC_k_co2+co2_mito)*acoa_mito^PC_n/(acoa_mito^PC_n+PC_k_acoa^PC_n)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_414" name="PC_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_409" name="PC_k_acoa" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_324" name="PC_k_atp" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_339" name="PC_k_co2" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_337" name="PC_k_pyr" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_360" name="PC_n" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_338" name="acoa_mito" order="6" role="modifier"/>
        <ParameterDescription key="FunctionParameter_340" name="atp_mito" order="7" role="modifier"/>
        <ParameterDescription key="FunctionParameter_341" name="co2_mito" order="8" role="modifier"/>
        <ParameterDescription key="FunctionParameter_356" name="cyto" order="9" role="volume"/>
        <ParameterDescription key="FunctionParameter_357" name="pyr_mito" order="10" role="modifier"/>
        <ParameterDescription key="FunctionParameter_335" name="scale_gly" order="11" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
  </ListOfFunctions>
  <Model key="Model_0" name="Koenig2014_hepatic_glucose" simulationType="time" timeUnit="s" volumeUnit="l" areaUnit="m²" lengthUnit="m" quantityUnit="mmol" type="deterministic" avogadroConstant="6.02214179e+23">
    <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Model_0">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2014-03-30T20:21:48Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

    </MiriamAnnotation>
    <ListOfCompartments>
      <Compartment key="Compartment_3" name="extern" simulationType="fixed" dimensionality="3">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Compartment_3">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2014-03-30T20:22:05Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </Compartment>
      <Compartment key="Compartment_2" name="cyto" simulationType="fixed" dimensionality="3">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Compartment_2">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2014-03-30T20:22:03Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </Compartment>
      <Compartment key="Compartment_1" name="mito" simulationType="fixed" dimensionality="3">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Compartment_1">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2014-03-30T20:22:05Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </Compartment>
    </ListOfCompartments>
    <ListOfMetabolites>
      <Metabolite key="Metabolite_15" name="glc_ext" simulationType="fixed" compartment="Compartment_3">
      </Metabolite>
      <Metabolite key="Metabolite_14" name="lac_ext" simulationType="fixed" compartment="Compartment_3">
      </Metabolite>
      <Metabolite key="Metabolite_48" name="atp" simulationType="fixed" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_47" name="adp" simulationType="fixed" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_46" name="amp" simulationType="fixed" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_45" name="utp" simulationType="reactions" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_44" name="udp" simulationType="reactions" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_43" name="gtp" simulationType="reactions" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_42" name="gdp" simulationType="reactions" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_41" name="nad" simulationType="fixed" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_40" name="nadh" simulationType="fixed" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_39" name="phos" simulationType="fixed" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_38" name="pp" simulationType="reactions" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_37" name="co2" simulationType="fixed" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_36" name="h2o" simulationType="fixed" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_35" name="h" simulationType="fixed" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_34" name="glc1p" simulationType="reactions" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_33" name="udpglc" simulationType="reactions" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_30" name="glyglc" simulationType="reactions" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_29" name="glc" simulationType="reactions" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_28" name="glc6p" simulationType="reactions" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_27" name="fru6p" simulationType="reactions" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_26" name="fru16bp" simulationType="reactions" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_25" name="fru26bp" simulationType="reactions" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_24" name="grap" simulationType="reactions" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_23" name="dhap" simulationType="reactions" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_22" name="bpg13" simulationType="reactions" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_21" name="pg3" simulationType="reactions" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_20" name="pg2" simulationType="reactions" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_19" name="pep" simulationType="reactions" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_18" name="pyr" simulationType="reactions" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_17" name="oaa" simulationType="reactions" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_16" name="lac" simulationType="reactions" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_13" name="co2_mito" simulationType="fixed" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_12" name="phos_mito" simulationType="fixed" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_11" name="oaa_mito" simulationType="reactions" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_10" name="pep_mito" simulationType="reactions" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_9" name="acoa_mito" simulationType="fixed" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_8" name="pyr_mito" simulationType="reactions" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_7" name="cit_mito" simulationType="fixed" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_6" name="atp_mito" simulationType="fixed" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_5" name="adp_mito" simulationType="fixed" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_4" name="gtp_mito" simulationType="reactions" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_3" name="gdp_mito" simulationType="reactions" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_2" name="coa_mito" simulationType="fixed" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_1" name="nadh_mito" simulationType="fixed" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_0" name="nad_mito" simulationType="fixed" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_32" name="h2o_mito" simulationType="fixed" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_31" name="h_mito" simulationType="fixed" compartment="Compartment_1">
      </Metabolite>
    </ListOfMetabolites>
    <ListOfModelValues>
      <ModelValue key="ModelValue_242" name="nadh_tot" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[nadh],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[nad],Reference=Concentration&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_241" name="atp_tot" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[atp],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[adp],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[amp],Reference=Concentration&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_240" name="utp_tot" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[utp],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[udp],Reference=Concentration&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_239" name="gtp_tot" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[gtp],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[gdp],Reference=Concentration&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_238" name="nadh_mito_tot" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[nadh_mito],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[nad_mito],Reference=Concentration&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_237" name="atp_mito_tot" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[atp_mito],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[adp_mito],Reference=Concentration&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_236" name="gtp_mito_tot" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[gtp_mito],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[gdp_mito],Reference=Concentration&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_235" name="x_ins1" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_234" name="x_ins2" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_233" name="x_ins3" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_232" name="x_ins4" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_231" name="ins" simulationType="fixed">
        <InitialExpression>
          &quot;max&quot;(0,(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_ins1],Reference=InitialValue&gt;-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_ins2],Reference=InitialValue&gt;)*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[extern],Vector=Metabolites[glc_ext],Reference=InitialConcentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_ins4],Reference=InitialValue&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[extern],Vector=Metabolites[glc_ext],Reference=InitialConcentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_ins4],Reference=InitialValue&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_ins3],Reference=InitialValue&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_ins4],Reference=InitialValue&gt;))
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_230" name="x_glu1" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_229" name="x_glu2" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_228" name="x_glu3" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_227" name="x_glu4" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_226" name="glu" simulationType="fixed">
        <InitialExpression>
          &quot;max&quot;(0,(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_glu1],Reference=InitialValue&gt;-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_glu2],Reference=InitialValue&gt;)*(1-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[extern],Vector=Metabolites[glc_ext],Reference=InitialConcentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_glu4],Reference=InitialValue&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[extern],Vector=Metabolites[glc_ext],Reference=InitialConcentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_glu4],Reference=InitialValue&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_glu3],Reference=InitialValue&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_glu4],Reference=InitialValue&gt;)))
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_225" name="x_epi1" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_224" name="x_epi2" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_223" name="x_epi3" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_222" name="x_epi4" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_221" name="epi" simulationType="fixed">
        <InitialExpression>
          &quot;max&quot;(0,(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_epi1],Reference=InitialValue&gt;-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_epi2],Reference=InitialValue&gt;)*(1-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[extern],Vector=Metabolites[glc_ext],Reference=InitialConcentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_epi4],Reference=InitialValue&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[extern],Vector=Metabolites[glc_ext],Reference=InitialConcentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_epi4],Reference=InitialValue&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_epi3],Reference=InitialValue&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_glu4],Reference=InitialValue&gt;)))
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_220" name="K_val" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_219" name="epi_f" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_218" name="K_ins" simulationType="fixed">
        <InitialExpression>
          (&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_ins1],Reference=InitialValue&gt;-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_ins2],Reference=InitialValue&gt;)*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[K_val],Reference=InitialValue&gt;
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_217" name="K_glu" simulationType="fixed">
        <InitialExpression>
          (&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_glu1],Reference=InitialValue&gt;-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_glu2],Reference=InitialValue&gt;)*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[K_val],Reference=InitialValue&gt;
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_216" name="K_epi" simulationType="fixed">
        <InitialExpression>
          (&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_epi1],Reference=InitialValue&gt;-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_epi2],Reference=InitialValue&gt;)*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[K_val],Reference=InitialValue&gt;
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_215" name="gamma" simulationType="fixed">
        <InitialExpression>
          0.5*(1-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[ins],Reference=InitialValue&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[ins],Reference=InitialValue&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[K_ins],Reference=InitialValue&gt;)+&quot;max&quot;(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[glu],Reference=InitialValue&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[glu],Reference=InitialValue&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[K_glu],Reference=InitialValue&gt;),&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[epi_f],Reference=InitialValue&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[epi],Reference=InitialValue&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[epi],Reference=InitialValue&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[K_epi],Reference=InitialValue&gt;)))
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_214" name="scale_gly" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_213" name="scale_glyglc" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_212" name="GLUT2_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_211" name="GLUT2_km" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_210" name="GLUT2_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_209" name="GK_n_gkrp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_208" name="GK_km_glc1" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_207" name="GK_km_fru6p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_206" name="GK_b" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_205" name="GK_n" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_204" name="GK_km_glc" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_203" name="GK_km_atp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_202" name="GK_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_201" name="GK_gc_free" simulationType="fixed">
        <InitialExpression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glc],Reference=InitialConcentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GK_n_gkrp],Reference=InitialValue&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glc],Reference=InitialConcentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GK_n_gkrp],Reference=InitialValue&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GK_km_glc1],Reference=InitialValue&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GK_n_gkrp],Reference=InitialValue&gt;)*(1-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GK_b],Reference=InitialValue&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[fru6p],Reference=InitialConcentration&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[fru6p],Reference=InitialConcentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GK_km_fru6p],Reference=InitialValue&gt;))
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_200" name="G6PASE_km_glc6p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_199" name="G6PASE_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_198" name="GPI_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_197" name="GPI_km_glc6p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_196" name="GPI_km_fru6p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_195" name="GPI_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_194" name="G16PI_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_193" name="G16PI_km_glc6p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_192" name="G16PI_km_glc1p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_191" name="G16PI_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_190" name="UPGASE_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_189" name="UPGASE_km_utp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_188" name="UPGASE_km_glc1p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_187" name="UPGASE_km_udpglc" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_186" name="UPGASE_km_pp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_185" name="UPGASE_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_184" name="PPASE_km_pp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_183" name="PPASE_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_182" name="GS_C" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_181" name="GS_k1_max" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_180" name="GS_k1_nat" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_179" name="GS_k2_nat" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_178" name="GS_k1_phospho" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_177" name="GS_k2_phospho" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_176" name="GS_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_175" name="GS_storage_factor" simulationType="fixed">
        <InitialExpression>
          (1+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GS_k1_max],Reference=InitialValue&gt;)*(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GS_C],Reference=InitialValue&gt;-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glyglc],Reference=InitialConcentration&gt;)/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GS_C],Reference=InitialValue&gt;-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glyglc],Reference=InitialConcentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GS_k1_max],Reference=InitialValue&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GS_C],Reference=InitialValue&gt;)
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_174" name="GS_k_udpglc_native" simulationType="fixed">
        <InitialExpression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GS_k1_nat],Reference=InitialValue&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glc6p],Reference=InitialConcentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GS_k2_nat],Reference=InitialValue&gt;)
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_173" name="GS_k_udpglc_phospho" simulationType="fixed">
        <InitialExpression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GS_k1_phospho],Reference=InitialValue&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glc6p],Reference=InitialConcentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GS_k2_phospho],Reference=InitialValue&gt;)
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_172" name="GS_native" simulationType="fixed">
        <InitialExpression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[scale_glyglc],Reference=InitialValue&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GS_Vmax],Reference=InitialValue&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GS_storage_factor],Reference=InitialValue&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[udpglc],Reference=InitialConcentration&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GS_k_udpglc_native],Reference=InitialValue&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[udpglc],Reference=InitialConcentration&gt;)
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_171" name="GS_phospho" simulationType="fixed">
        <InitialExpression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[scale_glyglc],Reference=InitialValue&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GS_Vmax],Reference=InitialValue&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GS_storage_factor],Reference=InitialValue&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[udpglc],Reference=InitialConcentration&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GS_k_udpglc_phospho],Reference=InitialValue&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[udpglc],Reference=InitialConcentration&gt;)
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_170" name="GP_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_169" name="GP_k_glyc_native" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_168" name="GP_k_glyc_phospho" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_167" name="GP_k_glc1p_native" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_166" name="GP_k_glc1p_phospho" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_165" name="GP_k_p_native" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_164" name="GP_k_p_phospho" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_163" name="GP_ki_glc_phospho" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_162" name="GP_ka_amp_native" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_161" name="GP_base_amp_native" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_160" name="GP_max_amp_native" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_159" name="GP_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_158" name="GP_C" simulationType="fixed">
        <InitialExpression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GS_C],Reference=InitialValue&gt;
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_157" name="GP_k1_max" simulationType="fixed">
        <InitialExpression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GS_k1_max],Reference=InitialValue&gt;
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_156" name="GP_fmax" simulationType="fixed">
        <InitialExpression>
          (1+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_k1_max],Reference=InitialValue&gt;)*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glyglc],Reference=InitialConcentration&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glyglc],Reference=InitialConcentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_k1_max],Reference=InitialValue&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_C],Reference=InitialValue&gt;)
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_155" name="GP_vmax_native" simulationType="fixed">
        <InitialExpression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[scale_glyglc],Reference=InitialValue&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_Vmax],Reference=InitialValue&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_fmax],Reference=InitialValue&gt;*(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_base_amp_native],Reference=InitialValue&gt;+(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_max_amp_native],Reference=InitialValue&gt;-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_base_amp_native],Reference=InitialValue&gt;)*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[amp],Reference=InitialConcentration&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[amp],Reference=InitialConcentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_ka_amp_native],Reference=InitialValue&gt;))
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_154" name="GP_native" simulationType="fixed">
        <InitialExpression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_vmax_native],Reference=InitialValue&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_k_glyc_native],Reference=InitialValue&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_k_p_native],Reference=InitialValue&gt;)*(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glyglc],Reference=InitialConcentration&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[phos],Reference=InitialConcentration&gt;-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glc1p],Reference=InitialConcentration&gt;/&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_keq],Reference=InitialValue&gt;)/((1+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glyglc],Reference=InitialConcentration&gt;/&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_k_glyc_native],Reference=InitialValue&gt;)*(1+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[phos],Reference=InitialConcentration&gt;/&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_k_p_native],Reference=InitialValue&gt;)+1+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glc1p],Reference=InitialConcentration&gt;/&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_k_glc1p_native],Reference=InitialValue&gt;-1)
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_153" name="GP_vmax_phospho" simulationType="fixed">
        <InitialExpression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[scale_glyglc],Reference=InitialValue&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_Vmax],Reference=InitialValue&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_fmax],Reference=InitialValue&gt;*exp(-log(2)/&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_ki_glc_phospho],Reference=InitialValue&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glc],Reference=InitialConcentration&gt;)
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_152" name="GP_phospho" simulationType="fixed">
        <InitialExpression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_vmax_phospho],Reference=InitialValue&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_k_glyc_phospho],Reference=InitialValue&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_k_p_phospho],Reference=InitialValue&gt;)*(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glyglc],Reference=InitialConcentration&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[phos],Reference=InitialConcentration&gt;-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glc1p],Reference=InitialConcentration&gt;/&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_keq],Reference=InitialValue&gt;)/((1+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glyglc],Reference=InitialConcentration&gt;/&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_k_glyc_phospho],Reference=InitialValue&gt;)*(1+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[phos],Reference=InitialConcentration&gt;/&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_k_p_phospho],Reference=InitialValue&gt;)+1+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glc1p],Reference=InitialConcentration&gt;/&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_k_glc1p_phospho],Reference=InitialValue&gt;-1)
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_151" name="NDKGTP_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_150" name="NDKGTP_km_atp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_149" name="NDKGTP_km_adp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_148" name="NDKGTP_km_gtp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_147" name="NDKGTP_km_gdp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_146" name="NDKGTP_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_145" name="NDKUTP_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_144" name="NDKUTP_km_atp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_143" name="NDKUTP_km_adp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_142" name="NDKUTP_km_utp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_141" name="NDKUTP_km_udp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_140" name="NDKUTP_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_139" name="AK_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_138" name="AK_km_atp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_137" name="AK_km_amp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_136" name="AK_km_adp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_135" name="AK_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_134" name="PFK2_n_native" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_133" name="PFK2_n_phospho" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_132" name="PFK2_k_fru6p_native" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_131" name="PFK2_k_fru6p_phospho" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_130" name="PFK2_k_atp_native" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_129" name="PFK2_k_atp_phospho" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_128" name="PFK2_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_127" name="PFK2_native" simulationType="fixed">
        <InitialExpression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[scale_gly],Reference=InitialValue&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PFK2_Vmax],Reference=InitialValue&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[fru6p],Reference=InitialConcentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PFK2_n_native],Reference=InitialValue&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[fru6p],Reference=InitialConcentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PFK2_n_native],Reference=InitialValue&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PFK2_k_fru6p_native],Reference=InitialValue&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PFK2_n_native],Reference=InitialValue&gt;)*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[atp],Reference=InitialConcentration&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[atp],Reference=InitialConcentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PFK2_k_atp_native],Reference=InitialValue&gt;)
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_126" name="PFK2_phospho" simulationType="fixed">
        <InitialExpression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[scale_gly],Reference=InitialValue&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PFK2_Vmax],Reference=InitialValue&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[fru6p],Reference=InitialConcentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PFK2_n_phospho],Reference=InitialValue&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[fru6p],Reference=InitialConcentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PFK2_n_phospho],Reference=InitialValue&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PFK2_k_fru6p_phospho],Reference=InitialValue&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PFK2_n_phospho],Reference=InitialValue&gt;)*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[atp],Reference=InitialConcentration&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[atp],Reference=InitialConcentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PFK2_k_atp_phospho],Reference=InitialValue&gt;)
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_125" name="FBP2_km_fru26bp_native" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_124" name="FBP2_ki_fru6p_native" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_123" name="FBP2_km_fru26bp_phospho" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_122" name="FBP2_ki_fru6p_phospho" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_121" name="FBP2_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_120" name="FBP2_native" simulationType="fixed">
        <InitialExpression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[scale_gly],Reference=InitialValue&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[FBP2_Vmax],Reference=InitialValue&gt;/(1+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[fru6p],Reference=InitialConcentration&gt;/&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[FBP2_ki_fru6p_native],Reference=InitialValue&gt;)*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[fru26bp],Reference=InitialConcentration&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[FBP2_km_fru26bp_native],Reference=InitialValue&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[fru26bp],Reference=InitialConcentration&gt;)
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_119" name="FBP2_phospho" simulationType="fixed">
        <InitialExpression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[scale_gly],Reference=InitialValue&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[FBP2_Vmax],Reference=InitialValue&gt;/(1+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[fru6p],Reference=InitialConcentration&gt;/&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[FBP2_ki_fru6p_phospho],Reference=InitialValue&gt;)*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[fru26bp],Reference=InitialConcentration&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[FBP2_km_fru26bp_phospho],Reference=InitialValue&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[fru26bp],Reference=InitialConcentration&gt;)
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_118" name="PFK1_km_atp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_117" name="PFK1_km_fru6p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_116" name="PFK1_ki_fru6p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_115" name="PFK1_ka_fru26bp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_114" name="PFK1_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_113" name="FBP1_ki_fru26bp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_112" name="FBP1_km_fru16bp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_111" name="FBP1_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_110" name="ALD_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_109" name="ALD_km_fru16bp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_108" name="ALD_km_dhap" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_107" name="ALD_km_grap" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_106" name="ALD_ki1_grap" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_105" name="ALD_ki2_grap" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_104" name="ALD_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_103" name="TPI_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_102" name="TPI_km_dhap" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_101" name="TPI_km_grap" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_100" name="TPI_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_99" name="GAPDH_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_98" name="GAPDH_k_nad" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_97" name="GAPDH_k_grap" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_96" name="GAPDH_k_p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_95" name="GAPDH_k_nadh" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_94" name="GAPDH_k_bpg13" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_93" name="GAPDH_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_92" name="PGK_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_91" name="PGK_k_adp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_90" name="PGK_k_atp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_89" name="PGK_k_bpg13" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_88" name="PGK_k_pg3" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_87" name="PGK_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_86" name="PGM_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_85" name="PGM_k_pg3" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_84" name="PGM_k_pg2" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_83" name="PGM_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_82" name="EN_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_81" name="EN_k_pep" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_80" name="EN_k_pg2" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_79" name="EN_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_78" name="PK_n" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_77" name="PK_n_p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_76" name="PK_n_fbp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_75" name="PK_n_fbp_p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_74" name="PK_alpha" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_73" name="PK_alpha_p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_72" name="PK_alpha_end" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_71" name="PK_k_fbp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_70" name="PK_k_fbp_p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_69" name="PK_k_pep" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_68" name="PK_k_pep_p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_67" name="PK_k_pep_end" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_66" name="PK_k_adp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_65" name="PK_base_act" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_64" name="PK_base_act_p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_63" name="PK_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_62" name="PK_f" simulationType="fixed">
        <InitialExpression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[fru16bp],Reference=InitialConcentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_n_fbp],Reference=InitialValue&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_k_fbp],Reference=InitialValue&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_n_fbp],Reference=InitialValue&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[fru16bp],Reference=InitialConcentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_n_fbp],Reference=InitialValue&gt;)
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_61" name="PK_f_p" simulationType="fixed">
        <InitialExpression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[fru16bp],Reference=InitialConcentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_n_fbp_p],Reference=InitialValue&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_k_fbp_p],Reference=InitialValue&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_n_fbp_p],Reference=InitialValue&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[fru16bp],Reference=InitialConcentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_n_fbp_p],Reference=InitialValue&gt;)
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_60" name="PK_alpha_inp" simulationType="fixed">
        <InitialExpression>
          (1-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_f],Reference=InitialValue&gt;)*(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_alpha],Reference=InitialValue&gt;-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_alpha_end],Reference=InitialValue&gt;)+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_alpha_end],Reference=InitialValue&gt;
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_59" name="PK_alpha_p_inp" simulationType="fixed">
        <InitialExpression>
          (1-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_f_p],Reference=InitialValue&gt;)*(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_alpha_p],Reference=InitialValue&gt;-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_alpha_end],Reference=InitialValue&gt;)+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_alpha_end],Reference=InitialValue&gt;
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_58" name="PK_pep_inp" simulationType="fixed">
        <InitialExpression>
          (1-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_f],Reference=InitialValue&gt;)*(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_k_pep],Reference=InitialValue&gt;-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_k_pep_end],Reference=InitialValue&gt;)+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_k_pep_end],Reference=InitialValue&gt;
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_57" name="PK_pep_p_inp" simulationType="fixed">
        <InitialExpression>
          (1-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_f_p],Reference=InitialValue&gt;)*(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_k_pep_p],Reference=InitialValue&gt;-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_k_pep_end],Reference=InitialValue&gt;)+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_k_pep_end],Reference=InitialValue&gt;
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_56" name="PK_native" simulationType="fixed">
        <InitialExpression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[scale_gly],Reference=InitialValue&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_Vmax],Reference=InitialValue&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_alpha_inp],Reference=InitialValue&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[pep],Reference=InitialConcentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_n],Reference=InitialValue&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_pep_inp],Reference=InitialValue&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_n],Reference=InitialValue&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[pep],Reference=InitialConcentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_n],Reference=InitialValue&gt;)*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[adp],Reference=InitialConcentration&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[adp],Reference=InitialConcentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_k_adp],Reference=InitialValue&gt;)*(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_base_act],Reference=InitialValue&gt;+(1-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_base_act],Reference=InitialValue&gt;)*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_f],Reference=InitialValue&gt;)
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_55" name="PK_phospho" simulationType="fixed">
        <InitialExpression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[scale_gly],Reference=InitialValue&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_Vmax],Reference=InitialValue&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_alpha_p_inp],Reference=InitialValue&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[pep],Reference=InitialConcentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_n_p],Reference=InitialValue&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_pep_p_inp],Reference=InitialValue&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_n_p],Reference=InitialValue&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[pep],Reference=InitialConcentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_n_p],Reference=InitialValue&gt;)*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[adp],Reference=InitialConcentration&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[adp],Reference=InitialConcentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_k_adp],Reference=InitialValue&gt;)*(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_base_act_p],Reference=InitialValue&gt;+(1-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_base_act_p],Reference=InitialValue&gt;)*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_f_p],Reference=InitialValue&gt;)
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_54" name="PEPCK_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_53" name="PEPCK_k_pep" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_52" name="PEPCK_k_gdp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_51" name="PEPCK_k_co2" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_50" name="PEPCK_k_oaa" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_49" name="PEPCK_k_gtp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_48" name="PEPCK_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_47" name="PEPCKM_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_46" name="PC_k_atp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_45" name="PC_k_pyr" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_44" name="PC_k_co2" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_43" name="PC_k_acoa" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_42" name="PC_n" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_41" name="PC_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_40" name="LDH_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_39" name="LDH_k_pyr" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_38" name="LDH_k_lac" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_37" name="LDH_k_nad" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_36" name="LDH_k_nadh" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_35" name="LDH_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_34" name="LACT_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_33" name="LACT_k_lac" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_32" name="LACT_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_31" name="PYRTM_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_30" name="PYRTM_k_pyr" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_29" name="PYRTM_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_28" name="PEPTM_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_27" name="PEPTM_k_pep" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_26" name="PEPTM_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_25" name="PDH_k_pyr" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_24" name="PDH_k_coa" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_23" name="PDH_k_nad" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_22" name="PDH_ki_acoa" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_21" name="PDH_ki_nadh" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_20" name="PDH_alpha_nat" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_19" name="PDH_alpha_p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_18" name="PDH_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_17" name="PDH_base" simulationType="fixed">
        <InitialExpression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[scale_gly],Reference=InitialValue&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PDH_Vmax],Reference=InitialValue&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[pyr_mito],Reference=InitialConcentration&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[pyr_mito],Reference=InitialConcentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PDH_k_pyr],Reference=InitialValue&gt;)*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[nad_mito],Reference=InitialConcentration&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[nad_mito],Reference=InitialConcentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PDH_k_nad],Reference=InitialValue&gt;*(1+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[nadh_mito],Reference=InitialConcentration&gt;/&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PDH_ki_nadh],Reference=InitialValue&gt;))*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[coa_mito],Reference=InitialConcentration&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[coa_mito],Reference=InitialConcentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PDH_k_coa],Reference=InitialValue&gt;*(1+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[acoa_mito],Reference=InitialConcentration&gt;/&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PDH_ki_acoa],Reference=InitialValue&gt;))
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_16" name="PDH_nat" simulationType="fixed">
        <InitialExpression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PDH_base],Reference=InitialValue&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PDH_alpha_nat],Reference=InitialValue&gt;
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_15" name="PDH_p" simulationType="fixed">
        <InitialExpression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PDH_base],Reference=InitialValue&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PDH_alpha_p],Reference=InitialValue&gt;
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_14" name="CS_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_13" name="CS_k_oaa" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_12" name="CS_k_acoa" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_11" name="CS_k_cit" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_10" name="CS_k_coa" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_9" name="CS_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_8" name="NDKGTPM_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_7" name="NDKGTPM_k_atp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_6" name="NDKGTPM_k_adp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_5" name="NDKGTPM_k_gtp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_4" name="NDKGTPM_k_gdp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_3" name="NDKGTPM_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_2" name="OAAFLX_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_1" name="ACOAFLX_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_0" name="CITFLX_Vmax" simulationType="fixed">
      </ModelValue>
    </ListOfModelValues>
    <ListOfReactions>
      <Reaction key="Reaction_35" name="GLUT2 glucose transporter" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_15" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_29" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_391" name="GLUT2_Vmax" value="1"/>
          <Constant key="Parameter_390" name="GLUT2_keq" value="1"/>
          <Constant key="Parameter_389" name="GLUT2_km" value="1"/>
          <Constant key="Parameter_388" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_42">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_270">
              <SourceParameter reference="ModelValue_210"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_271">
              <SourceParameter reference="ModelValue_212"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_272">
              <SourceParameter reference="ModelValue_211"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_273">
              <SourceParameter reference="Metabolite_29"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_274">
              <SourceParameter reference="Metabolite_15"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_275">
              <SourceParameter reference="ModelValue_214"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_34" name="Glucokinase" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_29" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_48" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_28" stoichiometry="1"/>
          <Product metabolite="Metabolite_47" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_387" name="GK_Vmax" value="1"/>
          <Constant key="Parameter_386" name="GK_gc_free" value="1"/>
          <Constant key="Parameter_385" name="GK_km_atp" value="1"/>
          <Constant key="Parameter_384" name="GK_km_glc" value="1"/>
          <Constant key="Parameter_383" name="GK_n" value="1"/>
          <Constant key="Parameter_382" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_43">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_285">
              <SourceParameter reference="ModelValue_202"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_286">
              <SourceParameter reference="ModelValue_201"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_287">
              <SourceParameter reference="ModelValue_203"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_288">
              <SourceParameter reference="ModelValue_204"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_289">
              <SourceParameter reference="ModelValue_205"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_290">
              <SourceParameter reference="Metabolite_48"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_291">
              <SourceParameter reference="Compartment_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_292">
              <SourceParameter reference="Metabolite_29"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_293">
              <SourceParameter reference="ModelValue_214"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_33" name="D-Glucose-6-phosphate Phosphatase" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_28" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_36" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_29" stoichiometry="1"/>
          <Product metabolite="Metabolite_39" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_381" name="G6PASE_Vmax" value="1"/>
          <Constant key="Parameter_380" name="G6PASE_km_glc6p" value="1"/>
          <Constant key="Parameter_379" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_44">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_283">
              <SourceParameter reference="ModelValue_199"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_269">
              <SourceParameter reference="ModelValue_200"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_268">
              <SourceParameter reference="Compartment_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_267">
              <SourceParameter reference="Metabolite_28"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_303">
              <SourceParameter reference="ModelValue_214"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_32" name="D-Glucose-6-phosphate Isomerase" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_28" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_27" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_378" name="GPI_Vmax" value="1"/>
          <Constant key="Parameter_377" name="GPI_keq" value="1"/>
          <Constant key="Parameter_376" name="GPI_km_fru6p" value="1"/>
          <Constant key="Parameter_375" name="GPI_km_glc6p" value="1"/>
          <Constant key="Parameter_374" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_78">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_806">
              <SourceParameter reference="ModelValue_195"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_804">
              <SourceParameter reference="ModelValue_198"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_831">
              <SourceParameter reference="ModelValue_196"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_829">
              <SourceParameter reference="ModelValue_197"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_828">
              <SourceParameter reference="Compartment_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_773">
              <SourceParameter reference="Metabolite_27"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_772">
              <SourceParameter reference="Metabolite_28"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_769">
              <SourceParameter reference="ModelValue_214"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_31" name="Glucose 1-phosphate 1,6-phosphomutase" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_34" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_28" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_373" name="G16PI_Vmax" value="1"/>
          <Constant key="Parameter_372" name="G16PI_keq" value="1"/>
          <Constant key="Parameter_371" name="G16PI_km_glc1p" value="1"/>
          <Constant key="Parameter_370" name="G16PI_km_glc6p" value="1"/>
          <Constant key="Parameter_369" name="scale_glyglc" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_46">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_326">
              <SourceParameter reference="ModelValue_191"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_327">
              <SourceParameter reference="ModelValue_194"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_328">
              <SourceParameter reference="ModelValue_192"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_329">
              <SourceParameter reference="ModelValue_193"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_330">
              <SourceParameter reference="Compartment_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_331">
              <SourceParameter reference="Metabolite_34"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_332">
              <SourceParameter reference="Metabolite_28"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_333">
              <SourceParameter reference="ModelValue_213"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_30" name="UTP:Glucose-1-phosphate uridylyltransferase" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_45" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_34" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_33" stoichiometry="1"/>
          <Product metabolite="Metabolite_38" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_368" name="UPGASE_Vmax" value="1"/>
          <Constant key="Parameter_367" name="UPGASE_keq" value="1"/>
          <Constant key="Parameter_366" name="UPGASE_km_glc1p" value="1"/>
          <Constant key="Parameter_365" name="UPGASE_km_pp" value="1"/>
          <Constant key="Parameter_364" name="UPGASE_km_udpglc" value="1"/>
          <Constant key="Parameter_361" name="UPGASE_km_utp" value="1"/>
          <Constant key="Parameter_362" name="scale_glyglc" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_79">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_803">
              <SourceParameter reference="ModelValue_185"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_820">
              <SourceParameter reference="ModelValue_190"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_805">
              <SourceParameter reference="ModelValue_188"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_838">
              <SourceParameter reference="ModelValue_186"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_732">
              <SourceParameter reference="ModelValue_187"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_731">
              <SourceParameter reference="ModelValue_189"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_730">
              <SourceParameter reference="Compartment_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_729">
              <SourceParameter reference="Metabolite_34"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_728">
              <SourceParameter reference="Metabolite_38"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_714">
              <SourceParameter reference="ModelValue_213"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_713">
              <SourceParameter reference="Metabolite_33"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_712">
              <SourceParameter reference="Metabolite_45"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_29" name="Pyrophosphate phosphohydrolase" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_38" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_36" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_39" stoichiometry="2"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_360" name="PPASE_Vmax" value="1"/>
          <Constant key="Parameter_363" name="PPASE_km_pp" value="1"/>
          <Constant key="Parameter_359" name="scale_glyglc" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_48">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_282">
              <SourceParameter reference="ModelValue_183"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_343">
              <SourceParameter reference="ModelValue_184"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_344">
              <SourceParameter reference="Compartment_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_325">
              <SourceParameter reference="Metabolite_38"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_342">
              <SourceParameter reference="ModelValue_213"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_28" name="Glycogen synthase" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_33" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_44" stoichiometry="1"/>
          <Product metabolite="Metabolite_30" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_358" name="GS_native" value="1"/>
          <Constant key="Parameter_357" name="GS_phospho" value="1"/>
          <Constant key="Parameter_356" name="gamma" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_49">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_309">
              <SourceParameter reference="ModelValue_172"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_371">
              <SourceParameter reference="ModelValue_171"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_372">
              <SourceParameter reference="Compartment_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_373">
              <SourceParameter reference="ModelValue_215"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_27" name="Glycogen-Phosphorylase" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_30" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_39" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_34" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_355" name="GP_native" value="1"/>
          <Constant key="Parameter_354" name="GP_phospho" value="1"/>
          <Constant key="Parameter_353" name="gamma" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_50">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_378">
              <SourceParameter reference="ModelValue_154"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_379">
              <SourceParameter reference="ModelValue_152"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_380">
              <SourceParameter reference="Compartment_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_381">
              <SourceParameter reference="ModelValue_215"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_26" name="Nucleoside-diphosphate kinase (ATP, GTP)" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_48" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_42" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_47" stoichiometry="1"/>
          <Product metabolite="Metabolite_43" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_352" name="NDKGTP_Vmax" value="1"/>
          <Constant key="Parameter_351" name="NDKGTP_keq" value="1"/>
          <Constant key="Parameter_350" name="NDKGTP_km_adp" value="1"/>
          <Constant key="Parameter_349" name="NDKGTP_km_atp" value="1"/>
          <Constant key="Parameter_348" name="NDKGTP_km_gdp" value="1"/>
          <Constant key="Parameter_347" name="NDKGTP_km_gtp" value="1"/>
          <Constant key="Parameter_346" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_51">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_394">
              <SourceParameter reference="ModelValue_146"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_395">
              <SourceParameter reference="ModelValue_151"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_396">
              <SourceParameter reference="ModelValue_149"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_397">
              <SourceParameter reference="ModelValue_150"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_398">
              <SourceParameter reference="ModelValue_147"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_399">
              <SourceParameter reference="ModelValue_148"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_400">
              <SourceParameter reference="Metabolite_47"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_401">
              <SourceParameter reference="Metabolite_48"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_402">
              <SourceParameter reference="Compartment_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_403">
              <SourceParameter reference="Metabolite_42"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_404">
              <SourceParameter reference="Metabolite_43"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_405">
              <SourceParameter reference="ModelValue_214"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_25" name="Nucleoside-diphosphate kinase (ATP, UTP)" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_48" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_44" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_47" stoichiometry="1"/>
          <Product metabolite="Metabolite_45" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_345" name="NDKUTP_Vmax" value="1"/>
          <Constant key="Parameter_344" name="NDKUTP_keq" value="1"/>
          <Constant key="Parameter_339" name="NDKUTP_km_adp" value="1"/>
          <Constant key="Parameter_340" name="NDKUTP_km_atp" value="1"/>
          <Constant key="Parameter_341" name="NDKUTP_km_udp" value="1"/>
          <Constant key="Parameter_343" name="NDKUTP_km_utp" value="1"/>
          <Constant key="Parameter_342" name="scale_glyglc" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_52">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_418">
              <SourceParameter reference="ModelValue_140"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_419">
              <SourceParameter reference="ModelValue_145"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_420">
              <SourceParameter reference="ModelValue_143"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_421">
              <SourceParameter reference="ModelValue_144"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_422">
              <SourceParameter reference="ModelValue_141"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_423">
              <SourceParameter reference="ModelValue_142"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_424">
              <SourceParameter reference="Metabolite_47"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_425">
              <SourceParameter reference="Metabolite_48"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_426">
              <SourceParameter reference="Compartment_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_427">
              <SourceParameter reference="ModelValue_213"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_428">
              <SourceParameter reference="Metabolite_44"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_429">
              <SourceParameter reference="Metabolite_45"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_24" name="ATP:AMP phosphotransferase (Adenylatkinase)" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_48" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_46" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_47" stoichiometry="2"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_338" name="AK_Vmax" value="1"/>
          <Constant key="Parameter_337" name="AK_keq" value="1"/>
          <Constant key="Parameter_334" name="AK_km_adp" value="1"/>
          <Constant key="Parameter_335" name="AK_km_amp" value="1"/>
          <Constant key="Parameter_336" name="AK_km_atp" value="1"/>
          <Constant key="Parameter_333" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_53">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_265">
              <SourceParameter reference="ModelValue_135"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_389">
              <SourceParameter reference="ModelValue_139"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_442">
              <SourceParameter reference="ModelValue_136"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_443">
              <SourceParameter reference="ModelValue_137"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_444">
              <SourceParameter reference="ModelValue_138"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_445">
              <SourceParameter reference="Metabolite_47"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_446">
              <SourceParameter reference="Metabolite_46"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_447">
              <SourceParameter reference="Metabolite_48"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_448">
              <SourceParameter reference="Compartment_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_449">
              <SourceParameter reference="ModelValue_214"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_23" name="ATP:D-fructose-6-phosphate 2-phosphotransferase" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_27" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_48" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_25" stoichiometry="1"/>
          <Product metabolite="Metabolite_47" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_332" name="PFK2_native" value="1"/>
          <Constant key="Parameter_331" name="PFK2_phospho" value="1"/>
          <Constant key="Parameter_330" name="gamma" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_54">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_390">
              <SourceParameter reference="ModelValue_127"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_284">
              <SourceParameter reference="ModelValue_126"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_258">
              <SourceParameter reference="Compartment_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_387">
              <SourceParameter reference="ModelValue_215"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_22" name="D-Fructose-2,6-bisphosphate 2-phosphohydrolase" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_25" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_27" stoichiometry="1"/>
          <Product metabolite="Metabolite_39" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_329" name="FBP2_native" value="1"/>
          <Constant key="Parameter_328" name="FBP2_phospho" value="1"/>
          <Constant key="Parameter_327" name="gamma" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_80">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_656">
              <SourceParameter reference="ModelValue_120"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_657">
              <SourceParameter reference="ModelValue_119"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_659">
              <SourceParameter reference="Compartment_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_663">
              <SourceParameter reference="ModelValue_215"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_21" name="ATP:D-fructose-6-phosphate 1-phosphotransferase" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_27" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_48" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_26" stoichiometry="1"/>
          <Product metabolite="Metabolite_47" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_25" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_326" name="PFK1_Vmax" value="1"/>
          <Constant key="Parameter_325" name="PFK1_ka_fru26bp" value="1"/>
          <Constant key="Parameter_324" name="PFK1_ki_fru6p" value="1"/>
          <Constant key="Parameter_323" name="PFK1_km_atp" value="1"/>
          <Constant key="Parameter_322" name="PFK1_km_fru6p" value="1"/>
          <Constant key="Parameter_321" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_56">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_474">
              <SourceParameter reference="ModelValue_114"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_475">
              <SourceParameter reference="ModelValue_115"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_476">
              <SourceParameter reference="ModelValue_116"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_477">
              <SourceParameter reference="ModelValue_118"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_478">
              <SourceParameter reference="ModelValue_117"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_479">
              <SourceParameter reference="Metabolite_48"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_480">
              <SourceParameter reference="Compartment_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_481">
              <SourceParameter reference="Metabolite_25"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_482">
              <SourceParameter reference="Metabolite_27"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_483">
              <SourceParameter reference="ModelValue_214"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_20" name="D-Fructose-1,6-bisphosphate 1-phosphohydrolase" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_26" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_36" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_27" stoichiometry="1"/>
          <Product metabolite="Metabolite_39" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_25" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_320" name="FBP1_Vmax" value="1"/>
          <Constant key="Parameter_319" name="FBP1_ki_fru26bp" value="1"/>
          <Constant key="Parameter_318" name="FBP1_km_fru16bp" value="1"/>
          <Constant key="Parameter_317" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_81">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_571">
              <SourceParameter reference="ModelValue_111"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_572">
              <SourceParameter reference="ModelValue_113"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_573">
              <SourceParameter reference="ModelValue_112"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_660">
              <SourceParameter reference="Compartment_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_743">
              <SourceParameter reference="Metabolite_26"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_629">
              <SourceParameter reference="Metabolite_25"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_574">
              <SourceParameter reference="ModelValue_214"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_19" name="Aldolase" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_26" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_24" stoichiometry="1"/>
          <Product metabolite="Metabolite_23" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_316" name="ALD_Vmax" value="1"/>
          <Constant key="Parameter_315" name="ALD_keq" value="1"/>
          <Constant key="Parameter_314" name="ALD_ki1_grap" value="1"/>
          <Constant key="Parameter_313" name="ALD_ki2_grap" value="1"/>
          <Constant key="Parameter_312" name="ALD_km_dhap" value="1"/>
          <Constant key="Parameter_311" name="ALD_km_fru16bp" value="1"/>
          <Constant key="Parameter_310" name="ALD_km_grap" value="1"/>
          <Constant key="Parameter_309" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_58">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_508">
              <SourceParameter reference="ModelValue_104"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_509">
              <SourceParameter reference="ModelValue_110"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_510">
              <SourceParameter reference="ModelValue_106"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_511">
              <SourceParameter reference="ModelValue_105"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_512">
              <SourceParameter reference="ModelValue_108"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_513">
              <SourceParameter reference="ModelValue_109"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_514">
              <SourceParameter reference="ModelValue_107"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_515">
              <SourceParameter reference="Compartment_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_516">
              <SourceParameter reference="Metabolite_23"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_517">
              <SourceParameter reference="Metabolite_26"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_518">
              <SourceParameter reference="Metabolite_24"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_519">
              <SourceParameter reference="ModelValue_214"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_18" name="Triosephosphate Isomerase" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_23" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_24" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_308" name="TPI_Vmax" value="1"/>
          <Constant key="Parameter_307" name="TPI_keq" value="1"/>
          <Constant key="Parameter_306" name="TPI_km_dhap" value="1"/>
          <Constant key="Parameter_305" name="TPI_km_grap" value="1"/>
          <Constant key="Parameter_304" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_59">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_506">
              <SourceParameter reference="ModelValue_100"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_503">
              <SourceParameter reference="ModelValue_103"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_502">
              <SourceParameter reference="ModelValue_102"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_392">
              <SourceParameter reference="ModelValue_101"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_532">
              <SourceParameter reference="Compartment_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_533">
              <SourceParameter reference="Metabolite_23"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_534">
              <SourceParameter reference="Metabolite_24"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_535">
              <SourceParameter reference="ModelValue_214"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_17" name="D-Glyceraldehyde-3-phosphate:NAD+ oxidoreductase" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_24" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_39" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_41" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_22" stoichiometry="1"/>
          <Product metabolite="Metabolite_40" stoichiometry="1"/>
          <Product metabolite="Metabolite_35" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_392" name="GAPDH_Vmax" value="1"/>
          <Constant key="Parameter_393" name="GAPDH_k_bpg13" value="1"/>
          <Constant key="Parameter_394" name="GAPDH_k_grap" value="1"/>
          <Constant key="Parameter_395" name="GAPDH_k_nad" value="1"/>
          <Constant key="Parameter_396" name="GAPDH_k_nadh" value="1"/>
          <Constant key="Parameter_397" name="GAPDH_k_p" value="1"/>
          <Constant key="Parameter_398" name="GAPDH_keq" value="1"/>
          <Constant key="Parameter_399" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_82">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_501">
              <SourceParameter reference="ModelValue_93"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_497">
              <SourceParameter reference="ModelValue_94"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_464">
              <SourceParameter reference="ModelValue_97"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_461">
              <SourceParameter reference="ModelValue_98"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_460">
              <SourceParameter reference="ModelValue_95"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_388">
              <SourceParameter reference="ModelValue_96"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_393">
              <SourceParameter reference="ModelValue_99"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_459">
              <SourceParameter reference="Metabolite_22"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_458">
              <SourceParameter reference="Compartment_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_457">
              <SourceParameter reference="Metabolite_24"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_456">
              <SourceParameter reference="Metabolite_41"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_455">
              <SourceParameter reference="Metabolite_40"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_454">
              <SourceParameter reference="Metabolite_39"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_453">
              <SourceParameter reference="ModelValue_214"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_16" name="Phosphoglycerate Kinase" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_47" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_22" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_48" stoichiometry="1"/>
          <Product metabolite="Metabolite_21" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_400" name="PGK_Vmax" value="1"/>
          <Constant key="Parameter_401" name="PGK_k_adp" value="1"/>
          <Constant key="Parameter_303" name="PGK_k_atp" value="1"/>
          <Constant key="Parameter_302" name="PGK_k_bpg13" value="1"/>
          <Constant key="Parameter_301" name="PGK_k_pg3" value="1"/>
          <Constant key="Parameter_300" name="PGK_keq" value="1"/>
          <Constant key="Parameter_299" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_61">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_507">
              <SourceParameter reference="ModelValue_87"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_575">
              <SourceParameter reference="ModelValue_91"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_576">
              <SourceParameter reference="ModelValue_90"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_577">
              <SourceParameter reference="ModelValue_89"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_578">
              <SourceParameter reference="ModelValue_88"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_579">
              <SourceParameter reference="ModelValue_92"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_580">
              <SourceParameter reference="Metabolite_47"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_581">
              <SourceParameter reference="Metabolite_48"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_582">
              <SourceParameter reference="Metabolite_22"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_583">
              <SourceParameter reference="Compartment_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_584">
              <SourceParameter reference="Metabolite_21"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_585">
              <SourceParameter reference="ModelValue_214"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_15" name="2-Phospho-D-glycerate 2,3-phosphomutase" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_21" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_20" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_298" name="PGM_Vmax" value="1"/>
          <Constant key="Parameter_297" name="PGM_k_pg2" value="1"/>
          <Constant key="Parameter_296" name="PGM_k_pg3" value="1"/>
          <Constant key="Parameter_295" name="PGM_keq" value="1"/>
          <Constant key="Parameter_294" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_62">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_472">
              <SourceParameter reference="ModelValue_83"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_468">
              <SourceParameter reference="ModelValue_84"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_545">
              <SourceParameter reference="ModelValue_85"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_473">
              <SourceParameter reference="ModelValue_86"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_598">
              <SourceParameter reference="Compartment_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_599">
              <SourceParameter reference="Metabolite_20"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_600">
              <SourceParameter reference="Metabolite_21"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_601">
              <SourceParameter reference="ModelValue_214"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_14" name="2-Phospho-D-glucerate hydro-lyase (enolase)" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_20" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_19" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_293" name="EN_Vmax" value="1"/>
          <Constant key="Parameter_292" name="EN_k_pep" value="1"/>
          <Constant key="Parameter_291" name="EN_k_pg2" value="1"/>
          <Constant key="Parameter_290" name="EN_keq" value="1"/>
          <Constant key="Parameter_289" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_63">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_610">
              <SourceParameter reference="ModelValue_79"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_611">
              <SourceParameter reference="ModelValue_81"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_612">
              <SourceParameter reference="ModelValue_80"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_613">
              <SourceParameter reference="ModelValue_82"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_614">
              <SourceParameter reference="Compartment_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_615">
              <SourceParameter reference="Metabolite_19"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_616">
              <SourceParameter reference="Metabolite_20"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_617">
              <SourceParameter reference="ModelValue_214"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_13" name="Pyruvatkinase" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_19" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_47" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_18" stoichiometry="1"/>
          <Product metabolite="Metabolite_48" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_288" name="PK_native" value="1"/>
          <Constant key="Parameter_287" name="PK_phospho" value="1"/>
          <Constant key="Parameter_286" name="gamma" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_64">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_546">
              <SourceParameter reference="ModelValue_56"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_504">
              <SourceParameter reference="ModelValue_55"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_547">
              <SourceParameter reference="Compartment_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_548">
              <SourceParameter reference="ModelValue_215"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_12" name="PEPCK cyto" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_17" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_43" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_19" stoichiometry="1"/>
          <Product metabolite="Metabolite_42" stoichiometry="1"/>
          <Product metabolite="Metabolite_37" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_285" name="PEPCK_Vmax" value="1"/>
          <Constant key="Parameter_284" name="PEPCK_k_co2" value="1"/>
          <Constant key="Parameter_283" name="PEPCK_k_gdp" value="1"/>
          <Constant key="Parameter_282" name="PEPCK_k_gtp" value="1"/>
          <Constant key="Parameter_281" name="PEPCK_k_oaa" value="1"/>
          <Constant key="Parameter_280" name="PEPCK_k_pep" value="1"/>
          <Constant key="Parameter_279" name="PEPCK_keq" value="1"/>
          <Constant key="Parameter_278" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_65">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_640">
              <SourceParameter reference="ModelValue_48"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_641">
              <SourceParameter reference="ModelValue_51"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_642">
              <SourceParameter reference="ModelValue_52"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_643">
              <SourceParameter reference="ModelValue_49"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_644">
              <SourceParameter reference="ModelValue_50"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_645">
              <SourceParameter reference="ModelValue_53"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_646">
              <SourceParameter reference="ModelValue_54"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_647">
              <SourceParameter reference="Metabolite_37"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_648">
              <SourceParameter reference="Compartment_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_649">
              <SourceParameter reference="Metabolite_42"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_650">
              <SourceParameter reference="Metabolite_43"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_651">
              <SourceParameter reference="Metabolite_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_652">
              <SourceParameter reference="Metabolite_19"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_653">
              <SourceParameter reference="ModelValue_214"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_11" name="PEPCK mito" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_11" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_4" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_10" stoichiometry="1"/>
          <Product metabolite="Metabolite_3" stoichiometry="1"/>
          <Product metabolite="Metabolite_13" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_277" name="PEPCKM_Vmax" value="1"/>
          <Constant key="Parameter_276" name="PEPCK_k_co2" value="1"/>
          <Constant key="Parameter_275" name="PEPCK_k_gdp" value="1"/>
          <Constant key="Parameter_274" name="PEPCK_k_gtp" value="1"/>
          <Constant key="Parameter_273" name="PEPCK_k_oaa" value="1"/>
          <Constant key="Parameter_272" name="PEPCK_k_pep" value="1"/>
          <Constant key="Parameter_271" name="PEPCK_keq" value="1"/>
          <Constant key="Parameter_270" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_66">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_668">
              <SourceParameter reference="ModelValue_47"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_669">
              <SourceParameter reference="ModelValue_51"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_670">
              <SourceParameter reference="ModelValue_52"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_671">
              <SourceParameter reference="ModelValue_49"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_672">
              <SourceParameter reference="ModelValue_50"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_673">
              <SourceParameter reference="ModelValue_53"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_674">
              <SourceParameter reference="ModelValue_54"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_675">
              <SourceParameter reference="Metabolite_13"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_676">
              <SourceParameter reference="Metabolite_3"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_677">
              <SourceParameter reference="Metabolite_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_678">
              <SourceParameter reference="Compartment_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_679">
              <SourceParameter reference="Metabolite_11"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_680">
              <SourceParameter reference="Metabolite_10"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_681">
              <SourceParameter reference="ModelValue_214"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_10" name="Pyruvate Carboxylase" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_48" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_18" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_37" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_17" stoichiometry="1"/>
          <Product metabolite="Metabolite_47" stoichiometry="1"/>
          <Product metabolite="Metabolite_39" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_13" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_9" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_8" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_6" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_269" name="PC_Vmax" value="1"/>
          <Constant key="Parameter_268" name="PC_k_acoa" value="1"/>
          <Constant key="Parameter_267" name="PC_k_atp" value="1"/>
          <Constant key="Parameter_266" name="PC_k_co2" value="1"/>
          <Constant key="Parameter_265" name="PC_k_pyr" value="1"/>
          <Constant key="Parameter_264" name="PC_n" value="1"/>
          <Constant key="Parameter_263" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_83">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_414">
              <SourceParameter reference="ModelValue_41"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_409">
              <SourceParameter reference="ModelValue_43"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_324">
              <SourceParameter reference="ModelValue_46"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_339">
              <SourceParameter reference="ModelValue_44"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_337">
              <SourceParameter reference="ModelValue_45"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_360">
              <SourceParameter reference="ModelValue_42"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_338">
              <SourceParameter reference="Metabolite_9"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_340">
              <SourceParameter reference="Metabolite_6"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_341">
              <SourceParameter reference="Metabolite_13"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_356">
              <SourceParameter reference="Compartment_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_357">
              <SourceParameter reference="Metabolite_8"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_335">
              <SourceParameter reference="ModelValue_214"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_9" name="Lactate Dehydrogenase" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_18" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_40" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_16" stoichiometry="1"/>
          <Product metabolite="Metabolite_41" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_262" name="LDH_Vmax" value="1"/>
          <Constant key="Parameter_261" name="LDH_k_lac" value="1"/>
          <Constant key="Parameter_260" name="LDH_k_nad" value="1"/>
          <Constant key="Parameter_259" name="LDH_k_nadh" value="1"/>
          <Constant key="Parameter_258" name="LDH_k_pyr" value="1"/>
          <Constant key="Parameter_257" name="LDH_keq" value="1"/>
          <Constant key="Parameter_256" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_68">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_716">
              <SourceParameter reference="ModelValue_35"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_717">
              <SourceParameter reference="ModelValue_38"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_718">
              <SourceParameter reference="ModelValue_37"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_719">
              <SourceParameter reference="ModelValue_36"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_720">
              <SourceParameter reference="ModelValue_39"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_721">
              <SourceParameter reference="ModelValue_40"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_722">
              <SourceParameter reference="Compartment_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_723">
              <SourceParameter reference="Metabolite_16"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_724">
              <SourceParameter reference="Metabolite_41"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_725">
              <SourceParameter reference="Metabolite_40"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_726">
              <SourceParameter reference="Metabolite_18"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_727">
              <SourceParameter reference="ModelValue_214"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_8" name="Lactate transport (import)" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_14" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_16" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_255" name="LACT_Vmax" value="1"/>
          <Constant key="Parameter_254" name="LACT_k_lac" value="1"/>
          <Constant key="Parameter_253" name="LACT_keq" value="1"/>
          <Constant key="Parameter_252" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_69">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_469">
              <SourceParameter reference="ModelValue_32"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_636">
              <SourceParameter reference="ModelValue_33"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_633">
              <SourceParameter reference="ModelValue_34"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_634">
              <SourceParameter reference="Metabolite_16"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_631">
              <SourceParameter reference="Metabolite_14"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_639">
              <SourceParameter reference="ModelValue_214"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_7" name="Pyruvate transport (mito)" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_18" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_8" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_251" name="PYRTM_Vmax" value="1"/>
          <Constant key="Parameter_250" name="PYRTM_k_pyr" value="1"/>
          <Constant key="Parameter_249" name="PYRTM_keq" value="1"/>
          <Constant key="Parameter_248" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_70">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_746">
              <SourceParameter reference="ModelValue_29"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_747">
              <SourceParameter reference="ModelValue_30"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_748">
              <SourceParameter reference="ModelValue_31"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_749">
              <SourceParameter reference="Metabolite_18"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_750">
              <SourceParameter reference="Metabolite_8"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_751">
              <SourceParameter reference="ModelValue_214"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_6" name="PEP Transport (export mito)" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_10" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_19" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_247" name="PEPTM_Vmax" value="1"/>
          <Constant key="Parameter_246" name="PEPTM_k_pep" value="1"/>
          <Constant key="Parameter_245" name="PEPTM_keq" value="1"/>
          <Constant key="Parameter_244" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_71">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_758">
              <SourceParameter reference="ModelValue_26"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_759">
              <SourceParameter reference="ModelValue_27"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_760">
              <SourceParameter reference="ModelValue_28"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_761">
              <SourceParameter reference="Metabolite_19"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_762">
              <SourceParameter reference="Metabolite_10"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_763">
              <SourceParameter reference="ModelValue_214"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_5" name="Pyruvate Dehydrogenase" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_8" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_2" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_0" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_9" stoichiometry="1"/>
          <Product metabolite="Metabolite_13" stoichiometry="1"/>
          <Product metabolite="Metabolite_1" stoichiometry="1"/>
          <Product metabolite="Metabolite_31" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_243" name="PDH_nat" value="1"/>
          <Constant key="Parameter_242" name="PDH_p" value="1"/>
          <Constant key="Parameter_241" name="gamma" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_72">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_715">
              <SourceParameter reference="ModelValue_16"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_630">
              <SourceParameter reference="ModelValue_15"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_770">
              <SourceParameter reference="ModelValue_215"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_771">
              <SourceParameter reference="Compartment_1"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_4" name="Citrate Synthase" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_9" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_11" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_32" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_7" stoichiometry="1"/>
          <Product metabolite="Metabolite_2" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_240" name="CS_Vmax" value="1"/>
          <Constant key="Parameter_239" name="CS_k_acoa" value="1"/>
          <Constant key="Parameter_238" name="CS_k_cit" value="1"/>
          <Constant key="Parameter_237" name="CS_k_coa" value="1"/>
          <Constant key="Parameter_236" name="CS_k_oaa" value="1"/>
          <Constant key="Parameter_235" name="CS_keq" value="1"/>
          <Constant key="Parameter_234" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_73">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_784">
              <SourceParameter reference="ModelValue_9"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_785">
              <SourceParameter reference="ModelValue_12"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_786">
              <SourceParameter reference="ModelValue_11"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_787">
              <SourceParameter reference="ModelValue_10"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_788">
              <SourceParameter reference="ModelValue_13"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_789">
              <SourceParameter reference="ModelValue_14"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_790">
              <SourceParameter reference="Metabolite_9"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_791">
              <SourceParameter reference="Metabolite_7"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_792">
              <SourceParameter reference="Metabolite_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_793">
              <SourceParameter reference="Compartment_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_794">
              <SourceParameter reference="Metabolite_11"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_795">
              <SourceParameter reference="ModelValue_214"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_3" name="Nucleoside-diphosphate kinase (ATP, GTP) mito" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_6" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_3" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_5" stoichiometry="1"/>
          <Product metabolite="Metabolite_4" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_233" name="NDKGTPM_Vmax" value="1"/>
          <Constant key="Parameter_232" name="NDKGTPM_k_adp" value="1"/>
          <Constant key="Parameter_231" name="NDKGTPM_k_atp" value="1"/>
          <Constant key="Parameter_230" name="NDKGTPM_k_gdp" value="1"/>
          <Constant key="Parameter_229" name="NDKGTPM_k_gtp" value="1"/>
          <Constant key="Parameter_228" name="NDKGTPM_keq" value="1"/>
          <Constant key="Parameter_227" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_74">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_808">
              <SourceParameter reference="ModelValue_3"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_809">
              <SourceParameter reference="ModelValue_6"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_810">
              <SourceParameter reference="ModelValue_7"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_811">
              <SourceParameter reference="ModelValue_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_812">
              <SourceParameter reference="ModelValue_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_813">
              <SourceParameter reference="ModelValue_8"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_814">
              <SourceParameter reference="Metabolite_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_815">
              <SourceParameter reference="Metabolite_6"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_816">
              <SourceParameter reference="Metabolite_3"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_817">
              <SourceParameter reference="Metabolite_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_818">
              <SourceParameter reference="Compartment_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_819">
              <SourceParameter reference="ModelValue_214"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_2" name="oxalacetate influx" reversible="false">
        <ListOfProducts>
          <Product metabolite="Metabolite_11" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_226" name="OAAFLX_Vmax" value="1"/>
          <Constant key="Parameter_225" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_75">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_776">
              <SourceParameter reference="ModelValue_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_778">
              <SourceParameter reference="Compartment_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_780">
              <SourceParameter reference="ModelValue_214"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1" name="acetyl-coa efflux" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_9" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_224" name="ACOAFLX_Vmax" value="1"/>
          <Constant key="Parameter_223" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_76">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_783">
              <SourceParameter reference="ModelValue_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_781">
              <SourceParameter reference="Compartment_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_777">
              <SourceParameter reference="ModelValue_214"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_0" name="citrate efflux" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_7" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_222" name="CITFLX_Vmax" value="1"/>
          <Constant key="Parameter_221" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_77">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_835">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_836">
              <SourceParameter reference="Compartment_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_837">
              <SourceParameter reference="ModelValue_214"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
    </ListOfReactions>
    <StateTemplate>
      <StateTemplateVariable objectReference="Model_0"/>
      <StateTemplateVariable objectReference="Metabolite_27"/>
      <StateTemplateVariable objectReference="Metabolite_19"/>
      <StateTemplateVariable objectReference="Metabolite_28"/>
      <StateTemplateVariable objectReference="Metabolite_18"/>
      <StateTemplateVariable objectReference="Metabolite_24"/>
      <StateTemplateVariable objectReference="Metabolite_11"/>
      <StateTemplateVariable objectReference="Metabolite_34"/>
      <StateTemplateVariable objectReference="Metabolite_23"/>
      <StateTemplateVariable objectReference="Metabolite_21"/>
      <StateTemplateVariable objectReference="Metabolite_44"/>
      <StateTemplateVariable objectReference="Metabolite_29"/>
      <StateTemplateVariable objectReference="Metabolite_43"/>
      <StateTemplateVariable objectReference="Metabolite_16"/>
      <StateTemplateVariable objectReference="Metabolite_8"/>
      <StateTemplateVariable objectReference="Metabolite_4"/>
      <StateTemplateVariable objectReference="Metabolite_38"/>
      <StateTemplateVariable objectReference="Metabolite_26"/>
      <StateTemplateVariable objectReference="Metabolite_20"/>
      <StateTemplateVariable objectReference="Metabolite_30"/>
      <StateTemplateVariable objectReference="Metabolite_10"/>
      <StateTemplateVariable objectReference="Metabolite_22"/>
      <StateTemplateVariable objectReference="Metabolite_17"/>
      <StateTemplateVariable objectReference="Metabolite_25"/>
      <StateTemplateVariable objectReference="Metabolite_33"/>
      <StateTemplateVariable objectReference="Metabolite_42"/>
      <StateTemplateVariable objectReference="Metabolite_45"/>
      <StateTemplateVariable objectReference="Metabolite_3"/>
      <StateTemplateVariable objectReference="ModelValue_242"/>
      <StateTemplateVariable objectReference="ModelValue_241"/>
      <StateTemplateVariable objectReference="ModelValue_240"/>
      <StateTemplateVariable objectReference="ModelValue_239"/>
      <StateTemplateVariable objectReference="ModelValue_238"/>
      <StateTemplateVariable objectReference="ModelValue_237"/>
      <StateTemplateVariable objectReference="ModelValue_236"/>
      <StateTemplateVariable objectReference="Metabolite_15"/>
      <StateTemplateVariable objectReference="Metabolite_14"/>
      <StateTemplateVariable objectReference="Metabolite_48"/>
      <StateTemplateVariable objectReference="Metabolite_47"/>
      <StateTemplateVariable objectReference="Metabolite_46"/>
      <StateTemplateVariable objectReference="Metabolite_41"/>
      <StateTemplateVariable objectReference="Metabolite_40"/>
      <StateTemplateVariable objectReference="Metabolite_39"/>
      <StateTemplateVariable objectReference="Metabolite_37"/>
      <StateTemplateVariable objectReference="Metabolite_36"/>
      <StateTemplateVariable objectReference="Metabolite_35"/>
      <StateTemplateVariable objectReference="Metabolite_13"/>
      <StateTemplateVariable objectReference="Metabolite_12"/>
      <StateTemplateVariable objectReference="Metabolite_9"/>
      <StateTemplateVariable objectReference="Metabolite_7"/>
      <StateTemplateVariable objectReference="Metabolite_6"/>
      <StateTemplateVariable objectReference="Metabolite_5"/>
      <StateTemplateVariable objectReference="Metabolite_2"/>
      <StateTemplateVariable objectReference="Metabolite_1"/>
      <StateTemplateVariable objectReference="Metabolite_0"/>
      <StateTemplateVariable objectReference="Metabolite_32"/>
      <StateTemplateVariable objectReference="Metabolite_31"/>
      <StateTemplateVariable objectReference="Compartment_3"/>
      <StateTemplateVariable objectReference="Compartment_2"/>
      <StateTemplateVariable objectReference="Compartment_1"/>
      <StateTemplateVariable objectReference="ModelValue_235"/>
      <StateTemplateVariable objectReference="ModelValue_234"/>
      <StateTemplateVariable objectReference="ModelValue_233"/>
      <StateTemplateVariable objectReference="ModelValue_232"/>
      <StateTemplateVariable objectReference="ModelValue_231"/>
      <StateTemplateVariable objectReference="ModelValue_230"/>
      <StateTemplateVariable objectReference="ModelValue_229"/>
      <StateTemplateVariable objectReference="ModelValue_228"/>
      <StateTemplateVariable objectReference="ModelValue_227"/>
      <StateTemplateVariable objectReference="ModelValue_226"/>
      <StateTemplateVariable objectReference="ModelValue_225"/>
      <StateTemplateVariable objectReference="ModelValue_224"/>
      <StateTemplateVariable objectReference="ModelValue_223"/>
      <StateTemplateVariable objectReference="ModelValue_222"/>
      <StateTemplateVariable objectReference="ModelValue_221"/>
      <StateTemplateVariable objectReference="ModelValue_220"/>
      <StateTemplateVariable objectReference="ModelValue_219"/>
      <StateTemplateVariable objectReference="ModelValue_218"/>
      <StateTemplateVariable objectReference="ModelValue_217"/>
      <StateTemplateVariable objectReference="ModelValue_216"/>
      <StateTemplateVariable objectReference="ModelValue_215"/>
      <StateTemplateVariable objectReference="ModelValue_214"/>
      <StateTemplateVariable objectReference="ModelValue_213"/>
      <StateTemplateVariable objectReference="ModelValue_212"/>
      <StateTemplateVariable objectReference="ModelValue_211"/>
      <StateTemplateVariable objectReference="ModelValue_210"/>
      <StateTemplateVariable objectReference="ModelValue_209"/>
      <StateTemplateVariable objectReference="ModelValue_208"/>
      <StateTemplateVariable objectReference="ModelValue_207"/>
      <StateTemplateVariable objectReference="ModelValue_206"/>
      <StateTemplateVariable objectReference="ModelValue_205"/>
      <StateTemplateVariable objectReference="ModelValue_204"/>
      <StateTemplateVariable objectReference="ModelValue_203"/>
      <StateTemplateVariable objectReference="ModelValue_202"/>
      <StateTemplateVariable objectReference="ModelValue_201"/>
      <StateTemplateVariable objectReference="ModelValue_200"/>
      <StateTemplateVariable objectReference="ModelValue_199"/>
      <StateTemplateVariable objectReference="ModelValue_198"/>
      <StateTemplateVariable objectReference="ModelValue_197"/>
      <StateTemplateVariable objectReference="ModelValue_196"/>
      <StateTemplateVariable objectReference="ModelValue_195"/>
      <StateTemplateVariable objectReference="ModelValue_194"/>
      <StateTemplateVariable objectReference="ModelValue_193"/>
      <StateTemplateVariable objectReference="ModelValue_192"/>
      <StateTemplateVariable objectReference="ModelValue_191"/>
      <StateTemplateVariable objectReference="ModelValue_190"/>
      <StateTemplateVariable objectReference="ModelValue_189"/>
      <StateTemplateVariable objectReference="ModelValue_188"/>
      <StateTemplateVariable objectReference="ModelValue_187"/>
      <StateTemplateVariable objectReference="ModelValue_186"/>
      <StateTemplateVariable objectReference="ModelValue_185"/>
      <StateTemplateVariable objectReference="ModelValue_184"/>
      <StateTemplateVariable objectReference="ModelValue_183"/>
      <StateTemplateVariable objectReference="ModelValue_182"/>
      <StateTemplateVariable objectReference="ModelValue_181"/>
      <StateTemplateVariable objectReference="ModelValue_180"/>
      <StateTemplateVariable objectReference="ModelValue_179"/>
      <StateTemplateVariable objectReference="ModelValue_178"/>
      <StateTemplateVariable objectReference="ModelValue_177"/>
      <StateTemplateVariable objectReference="ModelValue_176"/>
      <StateTemplateVariable objectReference="ModelValue_175"/>
      <StateTemplateVariable objectReference="ModelValue_174"/>
      <StateTemplateVariable objectReference="ModelValue_173"/>
      <StateTemplateVariable objectReference="ModelValue_172"/>
      <StateTemplateVariable objectReference="ModelValue_171"/>
      <StateTemplateVariable objectReference="ModelValue_170"/>
      <StateTemplateVariable objectReference="ModelValue_169"/>
      <StateTemplateVariable objectReference="ModelValue_168"/>
      <StateTemplateVariable objectReference="ModelValue_167"/>
      <StateTemplateVariable objectReference="ModelValue_166"/>
      <StateTemplateVariable objectReference="ModelValue_165"/>
      <StateTemplateVariable objectReference="ModelValue_164"/>
      <StateTemplateVariable objectReference="ModelValue_163"/>
      <StateTemplateVariable objectReference="ModelValue_162"/>
      <StateTemplateVariable objectReference="ModelValue_161"/>
      <StateTemplateVariable objectReference="ModelValue_160"/>
      <StateTemplateVariable objectReference="ModelValue_159"/>
      <StateTemplateVariable objectReference="ModelValue_158"/>
      <StateTemplateVariable objectReference="ModelValue_157"/>
      <StateTemplateVariable objectReference="ModelValue_156"/>
      <StateTemplateVariable objectReference="ModelValue_155"/>
      <StateTemplateVariable objectReference="ModelValue_154"/>
      <StateTemplateVariable objectReference="ModelValue_153"/>
      <StateTemplateVariable objectReference="ModelValue_152"/>
      <StateTemplateVariable objectReference="ModelValue_151"/>
      <StateTemplateVariable objectReference="ModelValue_150"/>
      <StateTemplateVariable objectReference="ModelValue_149"/>
      <StateTemplateVariable objectReference="ModelValue_148"/>
      <StateTemplateVariable objectReference="ModelValue_147"/>
      <StateTemplateVariable objectReference="ModelValue_146"/>
      <StateTemplateVariable objectReference="ModelValue_145"/>
      <StateTemplateVariable objectReference="ModelValue_144"/>
      <StateTemplateVariable objectReference="ModelValue_143"/>
      <StateTemplateVariable objectReference="ModelValue_142"/>
      <StateTemplateVariable objectReference="ModelValue_141"/>
      <StateTemplateVariable objectReference="ModelValue_140"/>
      <StateTemplateVariable objectReference="ModelValue_139"/>
      <StateTemplateVariable objectReference="ModelValue_138"/>
      <StateTemplateVariable objectReference="ModelValue_137"/>
      <StateTemplateVariable objectReference="ModelValue_136"/>
      <StateTemplateVariable objectReference="ModelValue_135"/>
      <StateTemplateVariable objectReference="ModelValue_134"/>
      <StateTemplateVariable objectReference="ModelValue_133"/>
      <StateTemplateVariable objectReference="ModelValue_132"/>
      <StateTemplateVariable objectReference="ModelValue_131"/>
      <StateTemplateVariable objectReference="ModelValue_130"/>
      <StateTemplateVariable objectReference="ModelValue_129"/>
      <StateTemplateVariable objectReference="ModelValue_128"/>
      <StateTemplateVariable objectReference="ModelValue_127"/>
      <StateTemplateVariable objectReference="ModelValue_126"/>
      <StateTemplateVariable objectReference="ModelValue_125"/>
      <StateTemplateVariable objectReference="ModelValue_124"/>
      <StateTemplateVariable objectReference="ModelValue_123"/>
      <StateTemplateVariable objectReference="ModelValue_122"/>
      <StateTemplateVariable objectReference="ModelValue_121"/>
      <StateTemplateVariable objectReference="ModelValue_120"/>
      <StateTemplateVariable objectReference="ModelValue_119"/>
      <StateTemplateVariable objectReference="ModelValue_118"/>
      <StateTemplateVariable objectReference="ModelValue_117"/>
      <StateTemplateVariable objectReference="ModelValue_116"/>
      <StateTemplateVariable objectReference="ModelValue_115"/>
      <StateTemplateVariable objectReference="ModelValue_114"/>
      <StateTemplateVariable objectReference="ModelValue_113"/>
      <StateTemplateVariable objectReference="ModelValue_112"/>
      <StateTemplateVariable objectReference="ModelValue_111"/>
      <StateTemplateVariable objectReference="ModelValue_110"/>
      <StateTemplateVariable objectReference="ModelValue_109"/>
      <StateTemplateVariable objectReference="ModelValue_108"/>
      <StateTemplateVariable objectReference="ModelValue_107"/>
      <StateTemplateVariable objectReference="ModelValue_106"/>
      <StateTemplateVariable objectReference="ModelValue_105"/>
      <StateTemplateVariable objectReference="ModelValue_104"/>
      <StateTemplateVariable objectReference="ModelValue_103"/>
      <StateTemplateVariable objectReference="ModelValue_102"/>
      <StateTemplateVariable objectReference="ModelValue_101"/>
      <StateTemplateVariable objectReference="ModelValue_100"/>
      <StateTemplateVariable objectReference="ModelValue_99"/>
      <StateTemplateVariable objectReference="ModelValue_98"/>
      <StateTemplateVariable objectReference="ModelValue_97"/>
      <StateTemplateVariable objectReference="ModelValue_96"/>
      <StateTemplateVariable objectReference="ModelValue_95"/>
      <StateTemplateVariable objectReference="ModelValue_94"/>
      <StateTemplateVariable objectReference="ModelValue_93"/>
      <StateTemplateVariable objectReference="ModelValue_92"/>
      <StateTemplateVariable objectReference="ModelValue_91"/>
      <StateTemplateVariable objectReference="ModelValue_90"/>
      <StateTemplateVariable objectReference="ModelValue_89"/>
      <StateTemplateVariable objectReference="ModelValue_88"/>
      <StateTemplateVariable objectReference="ModelValue_87"/>
      <StateTemplateVariable objectReference="ModelValue_86"/>
      <StateTemplateVariable objectReference="ModelValue_85"/>
      <StateTemplateVariable objectReference="ModelValue_84"/>
      <StateTemplateVariable objectReference="ModelValue_83"/>
      <StateTemplateVariable objectReference="ModelValue_82"/>
      <StateTemplateVariable objectReference="ModelValue_81"/>
      <StateTemplateVariable objectReference="ModelValue_80"/>
      <StateTemplateVariable objectReference="ModelValue_79"/>
      <StateTemplateVariable objectReference="ModelValue_78"/>
      <StateTemplateVariable objectReference="ModelValue_77"/>
      <StateTemplateVariable objectReference="ModelValue_76"/>
      <StateTemplateVariable objectReference="ModelValue_75"/>
      <StateTemplateVariable objectReference="ModelValue_74"/>
      <StateTemplateVariable objectReference="ModelValue_73"/>
      <StateTemplateVariable objectReference="ModelValue_72"/>
      <StateTemplateVariable objectReference="ModelValue_71"/>
      <StateTemplateVariable objectReference="ModelValue_70"/>
      <StateTemplateVariable objectReference="ModelValue_69"/>
      <StateTemplateVariable objectReference="ModelValue_68"/>
      <StateTemplateVariable objectReference="ModelValue_67"/>
      <StateTemplateVariable objectReference="ModelValue_66"/>
      <StateTemplateVariable objectReference="ModelValue_65"/>
      <StateTemplateVariable objectReference="ModelValue_64"/>
      <StateTemplateVariable objectReference="ModelValue_63"/>
      <StateTemplateVariable objectReference="ModelValue_62"/>
      <StateTemplateVariable objectReference="ModelValue_61"/>
      <StateTemplateVariable objectReference="ModelValue_60"/>
      <StateTemplateVariable objectReference="ModelValue_59"/>
      <StateTemplateVariable objectReference="ModelValue_58"/>
      <StateTemplateVariable objectReference="ModelValue_57"/>
      <StateTemplateVariable objectReference="ModelValue_56"/>
      <StateTemplateVariable objectReference="ModelValue_55"/>
      <StateTemplateVariable objectReference="ModelValue_54"/>
      <StateTemplateVariable objectReference="ModelValue_53"/>
      <StateTemplateVariable objectReference="ModelValue_52"/>
      <StateTemplateVariable objectReference="ModelValue_51"/>
      <StateTemplateVariable objectReference="ModelValue_50"/>
      <StateTemplateVariable objectReference="ModelValue_49"/>
      <StateTemplateVariable objectReference="ModelValue_48"/>
      <StateTemplateVariable objectReference="ModelValue_47"/>
      <StateTemplateVariable objectReference="ModelValue_46"/>
      <StateTemplateVariable objectReference="ModelValue_45"/>
      <StateTemplateVariable objectReference="ModelValue_44"/>
      <StateTemplateVariable objectReference="ModelValue_43"/>
      <StateTemplateVariable objectReference="ModelValue_42"/>
      <StateTemplateVariable objectReference="ModelValue_41"/>
      <StateTemplateVariable objectReference="ModelValue_40"/>
      <StateTemplateVariable objectReference="ModelValue_39"/>
      <StateTemplateVariable objectReference="ModelValue_38"/>
      <StateTemplateVariable objectReference="ModelValue_37"/>
      <StateTemplateVariable objectReference="ModelValue_36"/>
      <StateTemplateVariable objectReference="ModelValue_35"/>
      <StateTemplateVariable objectReference="ModelValue_34"/>
      <StateTemplateVariable objectReference="ModelValue_33"/>
      <StateTemplateVariable objectReference="ModelValue_32"/>
      <StateTemplateVariable objectReference="ModelValue_31"/>
      <StateTemplateVariable objectReference="ModelValue_30"/>
      <StateTemplateVariable objectReference="ModelValue_29"/>
      <StateTemplateVariable objectReference="ModelValue_28"/>
      <StateTemplateVariable objectReference="ModelValue_27"/>
      <StateTemplateVariable objectReference="ModelValue_26"/>
      <StateTemplateVariable objectReference="ModelValue_25"/>
      <StateTemplateVariable objectReference="ModelValue_24"/>
      <StateTemplateVariable objectReference="ModelValue_23"/>
      <StateTemplateVariable objectReference="ModelValue_22"/>
      <StateTemplateVariable objectReference="ModelValue_21"/>
      <StateTemplateVariable objectReference="ModelValue_20"/>
      <StateTemplateVariable objectReference="ModelValue_19"/>
      <StateTemplateVariable objectReference="ModelValue_18"/>
      <StateTemplateVariable objectReference="ModelValue_17"/>
      <StateTemplateVariable objectReference="ModelValue_16"/>
      <StateTemplateVariable objectReference="ModelValue_15"/>
      <StateTemplateVariable objectReference="ModelValue_14"/>
      <StateTemplateVariable objectReference="ModelValue_13"/>
      <StateTemplateVariable objectReference="ModelValue_12"/>
      <StateTemplateVariable objectReference="ModelValue_11"/>
      <StateTemplateVariable objectReference="ModelValue_10"/>
      <StateTemplateVariable objectReference="ModelValue_9"/>
      <StateTemplateVariable objectReference="ModelValue_8"/>
      <StateTemplateVariable objectReference="ModelValue_7"/>
      <StateTemplateVariable objectReference="ModelValue_6"/>
      <StateTemplateVariable objectReference="ModelValue_5"/>
      <StateTemplateVariable objectReference="ModelValue_4"/>
      <StateTemplateVariable objectReference="ModelValue_3"/>
      <StateTemplateVariable objectReference="ModelValue_2"/>
      <StateTemplateVariable objectReference="ModelValue_1"/>
      <StateTemplateVariable objectReference="ModelValue_0"/>
    </StateTemplate>
    <InitialState type="initialState">
      0 3.011070895000001e+19 9.033212685000003e+19 7.226570148e+19 6.022141790000001e+19 6.022141790000001e+19 3.011070895000001e+19 7.226570148000001e+18 1.806642537e+19 1.6259782833e+20 5.419927611000001e+19 3.011070895e+21 1.7464211191e+20 3.011070895e+20 3.011070895e+20 8.732105595500001e+20 4.817713432000005e+18 1.204428358e+19 1.806642537e+19 1.5055354475e+23 4.516606342500001e+20 1.806642537000001e+20 6.022141790000001e+18 2.408856716000003e+18 2.2884138802e+20 6.022141790000001e+19 1.6259782833e+20 3.011070895e+20 1.22056 3.76 0.36 0.39 1.22 3.600000000000001 0.39 1.806642537e+22 7.226570148000002e+21 1.6861997012e+21 4.817713432000001e+20 9.635426864000002e+19 7.347012983800001e+20 3.3723994024e+17 3.011070895e+21 3.011070895e+21 0 0 1.5055354475e+22 1.5055354475e+22 1.204428358e+20 9.635426864000002e+20 8.430998506000003e+21 2.408856716e+21 1.65608899225e+20 7.226570148000002e+20 2.9508494771e+21 0 0 10 1 5 818.9 0 8.6 4.2 9.706621497248314 190 37.9 3.01 6.4 76.8598203860621 6090 100 3.1 8.4 722.0071198073252 0.1 0.8 81.89 15.21 599 0.8644139472762336 12.5 12.5 1 42 420 2 15 0.01 0.7 1.6 7.5 0.26 25.2 0.04166666666666668 2 18.9 0.517060817492925 0.182 0.07099999999999999 420 15.7175540821514 0.67 0.045 100 0.312237619153088 0.5629999999999999 0.172 0.049 0.166 80 0.005 2.4 500 0.2 0.224 0.1504 3.003 0.09029 13.2 0.8571428571428571 0.8284023668639054 14.28027961386657 44.47430642024707 3.665882135837569 0.211826505793075 4.8 2.7 120 2 300 5 5 1 0.03 0.3 6.8 500 0.2 0.8571428571428571 4.899014778325122 0.07879506390833188 36.42857142857142 18.0182790350807 1 1.33 0.042 0.15 0.031 0 1 1.33 0.042 16 0.19 2940 0.247390074904985 0.09 0.08 0.11 0 1.3 2.1 0.016 0.05 0.28 0.65 0.0042 0.03888644026320259 0.02130434782608696 0.01 0.0035 0.0005 0.01 0.126 0.02943925233644861 0.2333333333333334 0.111 0.077 0.012 0.001 7.182 0.001 0.0013 4.326 9.76298897362969e-05 0.0071 0.0364 0.0071 0.0572 0.176 420 0.054476985386756 0.59 0.42 420 0.086779866194594 0.05 0.005 3.9 0.0083 0.0035 420 6.95864405248854 0.35 0.48 0.002 1.2 420 0.181375378837397 5 1 420 0.054476985386756 1 1 35.994 3.5 3.5 1.8 1.8 1 1.1 1 0.00016 0.00035 0.58 1.1 0.08 2.3 0.08 0.04 46.2 0.9998319304726325 0.9993126627543607 1 1.000068733724564 0.08008403476368374 0.08070108399055208 134.0979784647951 133.6752045043317 336.956521586429 0.237 0.0921 25.5 0.0055 0.0222 0 546 0.22 0.22 3.2 0.015 2.5 168 0.000278321076004752 0.495 31.98 0.984 0.027 12.6 1 0.8 5.418 1 0.1 42 1 0.1 33.6 0.025 0.013 0.05 0.035 0.036 5 1 13.44 64.12923025040047 320.6461512520024 64.12923025040047 266599.030842759 0.002 0.016 0.42 0.07000000000000001 4.2 1 1.33 0.042 0.15 0.031 420 0 0 0 
    </InitialState>
  </Model>
  <ListOfTasks>
    <Task key="Task_13" name="Steady-State" type="steadyState" scheduled="false" updateModel="false">
      <Report reference="Report_0" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="JacobianRequested" type="bool" value="1"/>
        <Parameter name="StabilityAnalysisRequested" type="bool" value="1"/>
      </Problem>
      <Method name="Enhanced Newton" type="EnhancedNewton">
        <Parameter name="Resolution" type="unsignedFloat" value="1e-09"/>
        <Parameter name="Derivation Factor" type="unsignedFloat" value="0.001"/>
        <Parameter name="Use Newton" type="bool" value="1"/>
        <Parameter name="Use Integration" type="bool" value="1"/>
        <Parameter name="Use Back Integration" type="bool" value="1"/>
        <Parameter name="Accept Negative Concentrations" type="bool" value="0"/>
        <Parameter name="Iteration Limit" type="unsignedInteger" value="50"/>
        <Parameter name="Maximum duration for forward integration" type="unsignedFloat" value="1000000000"/>
        <Parameter name="Maximum duration for backward integration" type="unsignedFloat" value="1000000"/>
      </Method>
    </Task>
    <Task key="Task_1" name="Time-Course" type="timeCourse" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="StepNumber" type="unsignedInteger" value="20000"/>
        <Parameter name="StepSize" type="float" value="0.1"/>
        <Parameter name="Duration" type="float" value="2000"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
        <Parameter name="Output Event" type="bool" value="0"/>
      </Problem>
      <Method name="Deterministic (LSODA)" type="Deterministic(LSODA)">
        <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="1e-10"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="1e-12"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="10000"/>
      </Method>
    </Task>
    <Task key="Task_2" name="Scan" type="scan" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="Subtask" type="unsignedInteger" value="1"/>
        <ParameterGroup name="ScanItems">
        </ParameterGroup>
        <Parameter name="Output in subtask" type="bool" value="1"/>
        <Parameter name="Adjust initial conditions" type="bool" value="0"/>
      </Problem>
      <Method name="Scan Framework" type="ScanFramework">
      </Method>
    </Task>
    <Task key="Task_3" name="Elementary Flux Modes" type="fluxMode" scheduled="false" updateModel="false">
      <Report reference="Report_1" target="" append="1" confirmOverwrite="1"/>
      <Problem>
      </Problem>
      <Method name="EFM Algorithm" type="EFMAlgorithm">
      </Method>
    </Task>
    <Task key="Task_4" name="Optimization" type="optimization" scheduled="false" updateModel="false">
      <Report reference="Report_2" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Subtask" type="cn" value="CN=Root,Vector=TaskList[Steady-State]"/>
        <ParameterText name="ObjectiveExpression" type="expression">
          
        </ParameterText>
        <Parameter name="Maximize" type="bool" value="0"/>
        <Parameter name="Randomize Start Values" type="bool" value="0"/>
        <Parameter name="Calculate Statistics" type="bool" value="1"/>
        <ParameterGroup name="OptimizationItemList">
        </ParameterGroup>
        <ParameterGroup name="OptimizationConstraintList">
        </ParameterGroup>
      </Problem>
      <Method name="Random Search" type="RandomSearch">
        <Parameter name="Number of Iterations" type="unsignedInteger" value="100000"/>
        <Parameter name="Random Number Generator" type="unsignedInteger" value="1"/>
        <Parameter name="Seed" type="unsignedInteger" value="0"/>
      </Method>
    </Task>
    <Task key="Task_5" name="Parameter Estimation" type="parameterFitting" scheduled="false" updateModel="false">
      <Report reference="Report_3" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Maximize" type="bool" value="0"/>
        <Parameter name="Randomize Start Values" type="bool" value="0"/>
        <Parameter name="Calculate Statistics" type="bool" value="1"/>
        <ParameterGroup name="OptimizationItemList">
        </ParameterGroup>
        <ParameterGroup name="OptimizationConstraintList">
        </ParameterGroup>
        <Parameter name="Steady-State" type="cn" value="CN=Root,Vector=TaskList[Steady-State]"/>
        <Parameter name="Time-Course" type="cn" value="CN=Root,Vector=TaskList[Time-Course]"/>
        <ParameterGroup name="Experiment Set">
        </ParameterGroup>
        <ParameterGroup name="Validation Set">
          <Parameter name="Weight" type="unsignedFloat" value="1"/>
          <Parameter name="Threshold" type="unsignedInteger" value="5"/>
        </ParameterGroup>
      </Problem>
      <Method name="Evolutionary Programming" type="EvolutionaryProgram">
        <Parameter name="Number of Generations" type="unsignedInteger" value="200"/>
        <Parameter name="Population Size" type="unsignedInteger" value="20"/>
        <Parameter name="Random Number Generator" type="unsignedInteger" value="1"/>
        <Parameter name="Seed" type="unsignedInteger" value="0"/>
      </Method>
    </Task>
    <Task key="Task_6" name="Metabolic Control Analysis" type="metabolicControlAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_4" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value="Task_13"/>
      </Problem>
      <Method name="MCA Method (Reder)" type="MCAMethod(Reder)">
        <Parameter name="Modulation Factor" type="unsignedFloat" value="1e-09"/>
      </Method>
    </Task>
    <Task key="Task_7" name="Lyapunov Exponents" type="lyapunovExponents" scheduled="false" updateModel="false">
      <Report reference="Report_5" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="ExponentNumber" type="unsignedInteger" value="3"/>
        <Parameter name="DivergenceRequested" type="bool" value="1"/>
        <Parameter name="TransientTime" type="float" value="0"/>
      </Problem>
      <Method name="Wolf Method" type="WolfMethod">
        <Parameter name="Orthonormalization Interval" type="unsignedFloat" value="1"/>
        <Parameter name="Overall time" type="unsignedFloat" value="1000"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="1e-06"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="1e-12"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="10000"/>
      </Method>
    </Task>
    <Task key="Task_8" name="Time Scale Separation Analysis" type="timeScaleSeparationAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_6" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
      </Problem>
      <Method name="ILDM (LSODA,Deuflhard)" type="TimeScaleSeparation(ILDM,Deuflhard)">
        <Parameter name="Deuflhard Tolerance" type="unsignedFloat" value="1e-06"/>
      </Method>
    </Task>
    <Task key="Task_9" name="Sensitivities" type="sensitivities" scheduled="false" updateModel="false">
      <Report reference="Report_7" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="SubtaskType" type="unsignedInteger" value="1"/>
        <ParameterGroup name="TargetFunctions">
          <Parameter name="SingleObject" type="cn" value=""/>
          <Parameter name="ObjectListType" type="unsignedInteger" value="7"/>
        </ParameterGroup>
        <ParameterGroup name="ListOfVariables">
          <ParameterGroup name="Variables">
            <Parameter name="SingleObject" type="cn" value=""/>
            <Parameter name="ObjectListType" type="unsignedInteger" value="41"/>
          </ParameterGroup>
        </ParameterGroup>
      </Problem>
      <Method name="Sensitivities Method" type="SensitivitiesMethod">
        <Parameter name="Delta factor" type="unsignedFloat" value="0.001"/>
        <Parameter name="Delta minimum" type="unsignedFloat" value="1e-12"/>
      </Method>
    </Task>
    <Task key="Task_10" name="Moieties" type="moieties" scheduled="false" updateModel="false">
      <Problem>
      </Problem>
      <Method name="Householder Reduction" type="Householder">
      </Method>
    </Task>
    <Task key="Task_11" name="Cross Section" type="crosssection" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
        <Parameter name="Output Event" type="bool" value="0"/>
        <Parameter name="LimitCrossings" type="bool" value="0"/>
        <Parameter name="NumCrossingsLimit" type="unsignedInteger" value="0"/>
        <Parameter name="LimitOutTime" type="bool" value="0"/>
        <Parameter name="LimitOutCrossings" type="bool" value="0"/>
        <Parameter name="PositiveDirection" type="bool" value="1"/>
        <Parameter name="NumOutCrossingsLimit" type="unsignedInteger" value="0"/>
        <Parameter name="LimitUntilConvergence" type="bool" value="0"/>
        <Parameter name="ConvergenceTolerance" type="float" value="1e-06"/>
        <Parameter name="Threshold" type="float" value="0"/>
        <Parameter name="DelayOutputUntilConvergence" type="bool" value="0"/>
        <Parameter name="OutputConvergenceTolerance" type="float" value="1e-06"/>
        <ParameterText name="TriggerExpression" type="expression">
          
        </ParameterText>
        <Parameter name="SingleVariable" type="cn" value=""/>
      </Problem>
      <Method name="Deterministic (LSODA)" type="Deterministic(LSODA)">
        <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="1e-06"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="1e-12"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="10000"/>
      </Method>
    </Task>
    <Task key="Task_0" name="Linear Noise Approximation" type="linearNoiseApproximation" scheduled="false" updateModel="false">
      <Report reference="Report_8" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value="Task_13"/>
      </Problem>
      <Method name="Linear Noise Approximation" type="LinearNoiseApproximation">
      </Method>
    </Task>
  </ListOfTasks>
  <ListOfReports>
    <Report key="Report_0" name="Steady-State" taskType="steadyState" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Steady-State]"/>
      </Footer>
    </Report>
    <Report key="Report_1" name="Elementary Flux Modes" taskType="fluxMode" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Elementary Flux Modes],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_2" name="Optimization" taskType="optimization" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Object=Description"/>
        <Object cn="String=\[Function Evaluations\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Value\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Parameters\]"/>
      </Header>
      <Body>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Function Evaluations"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Best Value"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Best Parameters"/>
      </Body>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_3" name="Parameter Estimation" taskType="parameterFitting" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Object=Description"/>
        <Object cn="String=\[Function Evaluations\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Value\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Parameters\]"/>
      </Header>
      <Body>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Function Evaluations"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Best Value"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Best Parameters"/>
      </Body>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_4" name="Metabolic Control Analysis" taskType="metabolicControlAnalysis" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Metabolic Control Analysis],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Metabolic Control Analysis],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_5" name="Lyapunov Exponents" taskType="lyapunovExponents" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Lyapunov Exponents],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Lyapunov Exponents],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_6" name="Time Scale Separation Analysis" taskType="timeScaleSeparationAnalysis" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Time Scale Separation Analysis],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Time Scale Separation Analysis],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_7" name="Sensitivities" taskType="sensitivities" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Sensitivities],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Sensitivities],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_8" name="Linear Noise Approximation" taskType="linearNoiseApproximation" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Linear Noise Approximation],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Linear Noise Approximation],Object=Result"/>
      </Footer>
    </Report>
  </ListOfReports>
  <GUI>
  </GUI>
  <SBMLReference file="Koenig2014_hepatic_glucose_win.xml">
    <SBMLMap SBMLid="ACOAFLX" COPASIkey="Reaction_1"/>
    <SBMLMap SBMLid="ACOAFLX_Vmax" COPASIkey="ModelValue_1"/>
    <SBMLMap SBMLid="AK" COPASIkey="Reaction_24"/>
    <SBMLMap SBMLid="AK_Vmax" COPASIkey="ModelValue_135"/>
    <SBMLMap SBMLid="AK_keq" COPASIkey="ModelValue_139"/>
    <SBMLMap SBMLid="AK_km_adp" COPASIkey="ModelValue_136"/>
    <SBMLMap SBMLid="AK_km_amp" COPASIkey="ModelValue_137"/>
    <SBMLMap SBMLid="AK_km_atp" COPASIkey="ModelValue_138"/>
    <SBMLMap SBMLid="ALD" COPASIkey="Reaction_19"/>
    <SBMLMap SBMLid="ALD_Vmax" COPASIkey="ModelValue_104"/>
    <SBMLMap SBMLid="ALD_keq" COPASIkey="ModelValue_110"/>
    <SBMLMap SBMLid="ALD_ki1_grap" COPASIkey="ModelValue_106"/>
    <SBMLMap SBMLid="ALD_ki2_grap" COPASIkey="ModelValue_105"/>
    <SBMLMap SBMLid="ALD_km_dhap" COPASIkey="ModelValue_108"/>
    <SBMLMap SBMLid="ALD_km_fru16bp" COPASIkey="ModelValue_109"/>
    <SBMLMap SBMLid="ALD_km_grap" COPASIkey="ModelValue_107"/>
    <SBMLMap SBMLid="CITFLX" COPASIkey="Reaction_0"/>
    <SBMLMap SBMLid="CITFLX_Vmax" COPASIkey="ModelValue_0"/>
    <SBMLMap SBMLid="CS" COPASIkey="Reaction_4"/>
    <SBMLMap SBMLid="CS_Vmax" COPASIkey="ModelValue_9"/>
    <SBMLMap SBMLid="CS_k_acoa" COPASIkey="ModelValue_12"/>
    <SBMLMap SBMLid="CS_k_cit" COPASIkey="ModelValue_11"/>
    <SBMLMap SBMLid="CS_k_coa" COPASIkey="ModelValue_10"/>
    <SBMLMap SBMLid="CS_k_oaa" COPASIkey="ModelValue_13"/>
    <SBMLMap SBMLid="CS_keq" COPASIkey="ModelValue_14"/>
    <SBMLMap SBMLid="EN" COPASIkey="Reaction_14"/>
    <SBMLMap SBMLid="EN_Vmax" COPASIkey="ModelValue_79"/>
    <SBMLMap SBMLid="EN_k_pep" COPASIkey="ModelValue_81"/>
    <SBMLMap SBMLid="EN_k_pg2" COPASIkey="ModelValue_80"/>
    <SBMLMap SBMLid="EN_keq" COPASIkey="ModelValue_82"/>
    <SBMLMap SBMLid="FBP1" COPASIkey="Reaction_20"/>
    <SBMLMap SBMLid="FBP1_Vmax" COPASIkey="ModelValue_111"/>
    <SBMLMap SBMLid="FBP1_ki_fru26bp" COPASIkey="ModelValue_113"/>
    <SBMLMap SBMLid="FBP1_km_fru16bp" COPASIkey="ModelValue_112"/>
    <SBMLMap SBMLid="FBP2" COPASIkey="Reaction_22"/>
    <SBMLMap SBMLid="FBP2_Vmax" COPASIkey="ModelValue_121"/>
    <SBMLMap SBMLid="FBP2_ki_fru6p_native" COPASIkey="ModelValue_124"/>
    <SBMLMap SBMLid="FBP2_ki_fru6p_phospho" COPASIkey="ModelValue_122"/>
    <SBMLMap SBMLid="FBP2_km_fru26bp_native" COPASIkey="ModelValue_125"/>
    <SBMLMap SBMLid="FBP2_km_fru26bp_phospho" COPASIkey="ModelValue_123"/>
    <SBMLMap SBMLid="FBP2_native" COPASIkey="ModelValue_120"/>
    <SBMLMap SBMLid="FBP2_phospho" COPASIkey="ModelValue_119"/>
    <SBMLMap SBMLid="G16PI" COPASIkey="Reaction_31"/>
    <SBMLMap SBMLid="G16PI_Vmax" COPASIkey="ModelValue_191"/>
    <SBMLMap SBMLid="G16PI_keq" COPASIkey="ModelValue_194"/>
    <SBMLMap SBMLid="G16PI_km_glc1p" COPASIkey="ModelValue_192"/>
    <SBMLMap SBMLid="G16PI_km_glc6p" COPASIkey="ModelValue_193"/>
    <SBMLMap SBMLid="G6PASE" COPASIkey="Reaction_33"/>
    <SBMLMap SBMLid="G6PASE_Vmax" COPASIkey="ModelValue_199"/>
    <SBMLMap SBMLid="G6PASE_km_glc6p" COPASIkey="ModelValue_200"/>
    <SBMLMap SBMLid="GAPDH" COPASIkey="Reaction_17"/>
    <SBMLMap SBMLid="GAPDH_Vmax" COPASIkey="ModelValue_93"/>
    <SBMLMap SBMLid="GAPDH_k_bpg13" COPASIkey="ModelValue_94"/>
    <SBMLMap SBMLid="GAPDH_k_grap" COPASIkey="ModelValue_97"/>
    <SBMLMap SBMLid="GAPDH_k_nad" COPASIkey="ModelValue_98"/>
    <SBMLMap SBMLid="GAPDH_k_nadh" COPASIkey="ModelValue_95"/>
    <SBMLMap SBMLid="GAPDH_k_p" COPASIkey="ModelValue_96"/>
    <SBMLMap SBMLid="GAPDH_keq" COPASIkey="ModelValue_99"/>
    <SBMLMap SBMLid="GK" COPASIkey="Reaction_34"/>
    <SBMLMap SBMLid="GK_Vmax" COPASIkey="ModelValue_202"/>
    <SBMLMap SBMLid="GK_b" COPASIkey="ModelValue_206"/>
    <SBMLMap SBMLid="GK_gc_free" COPASIkey="ModelValue_201"/>
    <SBMLMap SBMLid="GK_km_atp" COPASIkey="ModelValue_203"/>
    <SBMLMap SBMLid="GK_km_fru6p" COPASIkey="ModelValue_207"/>
    <SBMLMap SBMLid="GK_km_glc" COPASIkey="ModelValue_204"/>
    <SBMLMap SBMLid="GK_km_glc1" COPASIkey="ModelValue_208"/>
    <SBMLMap SBMLid="GK_n" COPASIkey="ModelValue_205"/>
    <SBMLMap SBMLid="GK_n_gkrp" COPASIkey="ModelValue_209"/>
    <SBMLMap SBMLid="GLUT2" COPASIkey="Reaction_35"/>
    <SBMLMap SBMLid="GLUT2_Vmax" COPASIkey="ModelValue_210"/>
    <SBMLMap SBMLid="GLUT2_keq" COPASIkey="ModelValue_212"/>
    <SBMLMap SBMLid="GLUT2_km" COPASIkey="ModelValue_211"/>
    <SBMLMap SBMLid="GP" COPASIkey="Reaction_27"/>
    <SBMLMap SBMLid="GPI" COPASIkey="Reaction_32"/>
    <SBMLMap SBMLid="GPI_Vmax" COPASIkey="ModelValue_195"/>
    <SBMLMap SBMLid="GPI_keq" COPASIkey="ModelValue_198"/>
    <SBMLMap SBMLid="GPI_km_fru6p" COPASIkey="ModelValue_196"/>
    <SBMLMap SBMLid="GPI_km_glc6p" COPASIkey="ModelValue_197"/>
    <SBMLMap SBMLid="GP_C" COPASIkey="ModelValue_158"/>
    <SBMLMap SBMLid="GP_Vmax" COPASIkey="ModelValue_159"/>
    <SBMLMap SBMLid="GP_base_amp_native" COPASIkey="ModelValue_161"/>
    <SBMLMap SBMLid="GP_fmax" COPASIkey="ModelValue_156"/>
    <SBMLMap SBMLid="GP_k1_max" COPASIkey="ModelValue_157"/>
    <SBMLMap SBMLid="GP_k_glc1p_native" COPASIkey="ModelValue_167"/>
    <SBMLMap SBMLid="GP_k_glc1p_phospho" COPASIkey="ModelValue_166"/>
    <SBMLMap SBMLid="GP_k_glyc_native" COPASIkey="ModelValue_169"/>
    <SBMLMap SBMLid="GP_k_glyc_phospho" COPASIkey="ModelValue_168"/>
    <SBMLMap SBMLid="GP_k_p_native" COPASIkey="ModelValue_165"/>
    <SBMLMap SBMLid="GP_k_p_phospho" COPASIkey="ModelValue_164"/>
    <SBMLMap SBMLid="GP_ka_amp_native" COPASIkey="ModelValue_162"/>
    <SBMLMap SBMLid="GP_keq" COPASIkey="ModelValue_170"/>
    <SBMLMap SBMLid="GP_ki_glc_phospho" COPASIkey="ModelValue_163"/>
    <SBMLMap SBMLid="GP_max_amp_native" COPASIkey="ModelValue_160"/>
    <SBMLMap SBMLid="GP_native" COPASIkey="ModelValue_154"/>
    <SBMLMap SBMLid="GP_phospho" COPASIkey="ModelValue_152"/>
    <SBMLMap SBMLid="GP_vmax_native" COPASIkey="ModelValue_155"/>
    <SBMLMap SBMLid="GP_vmax_phospho" COPASIkey="ModelValue_153"/>
    <SBMLMap SBMLid="GS" COPASIkey="Reaction_28"/>
    <SBMLMap SBMLid="GS_C" COPASIkey="ModelValue_182"/>
    <SBMLMap SBMLid="GS_Vmax" COPASIkey="ModelValue_176"/>
    <SBMLMap SBMLid="GS_k1_max" COPASIkey="ModelValue_181"/>
    <SBMLMap SBMLid="GS_k1_nat" COPASIkey="ModelValue_180"/>
    <SBMLMap SBMLid="GS_k1_phospho" COPASIkey="ModelValue_178"/>
    <SBMLMap SBMLid="GS_k2_nat" COPASIkey="ModelValue_179"/>
    <SBMLMap SBMLid="GS_k2_phospho" COPASIkey="ModelValue_177"/>
    <SBMLMap SBMLid="GS_k_udpglc_native" COPASIkey="ModelValue_174"/>
    <SBMLMap SBMLid="GS_k_udpglc_phospho" COPASIkey="ModelValue_173"/>
    <SBMLMap SBMLid="GS_native" COPASIkey="ModelValue_172"/>
    <SBMLMap SBMLid="GS_phospho" COPASIkey="ModelValue_171"/>
    <SBMLMap SBMLid="GS_storage_factor" COPASIkey="ModelValue_175"/>
    <SBMLMap SBMLid="K_epi" COPASIkey="ModelValue_216"/>
    <SBMLMap SBMLid="K_glu" COPASIkey="ModelValue_217"/>
    <SBMLMap SBMLid="K_ins" COPASIkey="ModelValue_218"/>
    <SBMLMap SBMLid="K_val" COPASIkey="ModelValue_220"/>
    <SBMLMap SBMLid="LACT" COPASIkey="Reaction_8"/>
    <SBMLMap SBMLid="LACT_Vmax" COPASIkey="ModelValue_32"/>
    <SBMLMap SBMLid="LACT_k_lac" COPASIkey="ModelValue_33"/>
    <SBMLMap SBMLid="LACT_keq" COPASIkey="ModelValue_34"/>
    <SBMLMap SBMLid="LDH" COPASIkey="Reaction_9"/>
    <SBMLMap SBMLid="LDH_Vmax" COPASIkey="ModelValue_35"/>
    <SBMLMap SBMLid="LDH_k_lac" COPASIkey="ModelValue_38"/>
    <SBMLMap SBMLid="LDH_k_nad" COPASIkey="ModelValue_37"/>
    <SBMLMap SBMLid="LDH_k_nadh" COPASIkey="ModelValue_36"/>
    <SBMLMap SBMLid="LDH_k_pyr" COPASIkey="ModelValue_39"/>
    <SBMLMap SBMLid="LDH_keq" COPASIkey="ModelValue_40"/>
    <SBMLMap SBMLid="NDKGTP" COPASIkey="Reaction_26"/>
    <SBMLMap SBMLid="NDKGTPM" COPASIkey="Reaction_3"/>
    <SBMLMap SBMLid="NDKGTPM_Vmax" COPASIkey="ModelValue_3"/>
    <SBMLMap SBMLid="NDKGTPM_k_adp" COPASIkey="ModelValue_6"/>
    <SBMLMap SBMLid="NDKGTPM_k_atp" COPASIkey="ModelValue_7"/>
    <SBMLMap SBMLid="NDKGTPM_k_gdp" COPASIkey="ModelValue_4"/>
    <SBMLMap SBMLid="NDKGTPM_k_gtp" COPASIkey="ModelValue_5"/>
    <SBMLMap SBMLid="NDKGTPM_keq" COPASIkey="ModelValue_8"/>
    <SBMLMap SBMLid="NDKGTP_Vmax" COPASIkey="ModelValue_146"/>
    <SBMLMap SBMLid="NDKGTP_keq" COPASIkey="ModelValue_151"/>
    <SBMLMap SBMLid="NDKGTP_km_adp" COPASIkey="ModelValue_149"/>
    <SBMLMap SBMLid="NDKGTP_km_atp" COPASIkey="ModelValue_150"/>
    <SBMLMap SBMLid="NDKGTP_km_gdp" COPASIkey="ModelValue_147"/>
    <SBMLMap SBMLid="NDKGTP_km_gtp" COPASIkey="ModelValue_148"/>
    <SBMLMap SBMLid="NDKUTP" COPASIkey="Reaction_25"/>
    <SBMLMap SBMLid="NDKUTP_Vmax" COPASIkey="ModelValue_140"/>
    <SBMLMap SBMLid="NDKUTP_keq" COPASIkey="ModelValue_145"/>
    <SBMLMap SBMLid="NDKUTP_km_adp" COPASIkey="ModelValue_143"/>
    <SBMLMap SBMLid="NDKUTP_km_atp" COPASIkey="ModelValue_144"/>
    <SBMLMap SBMLid="NDKUTP_km_udp" COPASIkey="ModelValue_141"/>
    <SBMLMap SBMLid="NDKUTP_km_utp" COPASIkey="ModelValue_142"/>
    <SBMLMap SBMLid="OAAFLX" COPASIkey="Reaction_2"/>
    <SBMLMap SBMLid="OAAFLX_Vmax" COPASIkey="ModelValue_2"/>
    <SBMLMap SBMLid="PC" COPASIkey="Reaction_10"/>
    <SBMLMap SBMLid="PC_Vmax" COPASIkey="ModelValue_41"/>
    <SBMLMap SBMLid="PC_k_acoa" COPASIkey="ModelValue_43"/>
    <SBMLMap SBMLid="PC_k_atp" COPASIkey="ModelValue_46"/>
    <SBMLMap SBMLid="PC_k_co2" COPASIkey="ModelValue_44"/>
    <SBMLMap SBMLid="PC_k_pyr" COPASIkey="ModelValue_45"/>
    <SBMLMap SBMLid="PC_n" COPASIkey="ModelValue_42"/>
    <SBMLMap SBMLid="PDH" COPASIkey="Reaction_5"/>
    <SBMLMap SBMLid="PDH_Vmax" COPASIkey="ModelValue_18"/>
    <SBMLMap SBMLid="PDH_alpha_nat" COPASIkey="ModelValue_20"/>
    <SBMLMap SBMLid="PDH_alpha_p" COPASIkey="ModelValue_19"/>
    <SBMLMap SBMLid="PDH_base" COPASIkey="ModelValue_17"/>
    <SBMLMap SBMLid="PDH_k_coa" COPASIkey="ModelValue_24"/>
    <SBMLMap SBMLid="PDH_k_nad" COPASIkey="ModelValue_23"/>
    <SBMLMap SBMLid="PDH_k_pyr" COPASIkey="ModelValue_25"/>
    <SBMLMap SBMLid="PDH_ki_acoa" COPASIkey="ModelValue_22"/>
    <SBMLMap SBMLid="PDH_ki_nadh" COPASIkey="ModelValue_21"/>
    <SBMLMap SBMLid="PDH_nat" COPASIkey="ModelValue_16"/>
    <SBMLMap SBMLid="PDH_p" COPASIkey="ModelValue_15"/>
    <SBMLMap SBMLid="PEPCK" COPASIkey="Reaction_12"/>
    <SBMLMap SBMLid="PEPCKM" COPASIkey="Reaction_11"/>
    <SBMLMap SBMLid="PEPCKM_Vmax" COPASIkey="ModelValue_47"/>
    <SBMLMap SBMLid="PEPCK_Vmax" COPASIkey="ModelValue_48"/>
    <SBMLMap SBMLid="PEPCK_k_co2" COPASIkey="ModelValue_51"/>
    <SBMLMap SBMLid="PEPCK_k_gdp" COPASIkey="ModelValue_52"/>
    <SBMLMap SBMLid="PEPCK_k_gtp" COPASIkey="ModelValue_49"/>
    <SBMLMap SBMLid="PEPCK_k_oaa" COPASIkey="ModelValue_50"/>
    <SBMLMap SBMLid="PEPCK_k_pep" COPASIkey="ModelValue_53"/>
    <SBMLMap SBMLid="PEPCK_keq" COPASIkey="ModelValue_54"/>
    <SBMLMap SBMLid="PEPTM" COPASIkey="Reaction_6"/>
    <SBMLMap SBMLid="PEPTM_Vmax" COPASIkey="ModelValue_26"/>
    <SBMLMap SBMLid="PEPTM_k_pep" COPASIkey="ModelValue_27"/>
    <SBMLMap SBMLid="PEPTM_keq" COPASIkey="ModelValue_28"/>
    <SBMLMap SBMLid="PFK1" COPASIkey="Reaction_21"/>
    <SBMLMap SBMLid="PFK1_Vmax" COPASIkey="ModelValue_114"/>
    <SBMLMap SBMLid="PFK1_ka_fru26bp" COPASIkey="ModelValue_115"/>
    <SBMLMap SBMLid="PFK1_ki_fru6p" COPASIkey="ModelValue_116"/>
    <SBMLMap SBMLid="PFK1_km_atp" COPASIkey="ModelValue_118"/>
    <SBMLMap SBMLid="PFK1_km_fru6p" COPASIkey="ModelValue_117"/>
    <SBMLMap SBMLid="PFK2" COPASIkey="Reaction_23"/>
    <SBMLMap SBMLid="PFK2_Vmax" COPASIkey="ModelValue_128"/>
    <SBMLMap SBMLid="PFK2_k_atp_native" COPASIkey="ModelValue_130"/>
    <SBMLMap SBMLid="PFK2_k_atp_phospho" COPASIkey="ModelValue_129"/>
    <SBMLMap SBMLid="PFK2_k_fru6p_native" COPASIkey="ModelValue_132"/>
    <SBMLMap SBMLid="PFK2_k_fru6p_phospho" COPASIkey="ModelValue_131"/>
    <SBMLMap SBMLid="PFK2_n_native" COPASIkey="ModelValue_134"/>
    <SBMLMap SBMLid="PFK2_n_phospho" COPASIkey="ModelValue_133"/>
    <SBMLMap SBMLid="PFK2_native" COPASIkey="ModelValue_127"/>
    <SBMLMap SBMLid="PFK2_phospho" COPASIkey="ModelValue_126"/>
    <SBMLMap SBMLid="PGK" COPASIkey="Reaction_16"/>
    <SBMLMap SBMLid="PGK_Vmax" COPASIkey="ModelValue_87"/>
    <SBMLMap SBMLid="PGK_k_adp" COPASIkey="ModelValue_91"/>
    <SBMLMap SBMLid="PGK_k_atp" COPASIkey="ModelValue_90"/>
    <SBMLMap SBMLid="PGK_k_bpg13" COPASIkey="ModelValue_89"/>
    <SBMLMap SBMLid="PGK_k_pg3" COPASIkey="ModelValue_88"/>
    <SBMLMap SBMLid="PGK_keq" COPASIkey="ModelValue_92"/>
    <SBMLMap SBMLid="PGM" COPASIkey="Reaction_15"/>
    <SBMLMap SBMLid="PGM_Vmax" COPASIkey="ModelValue_83"/>
    <SBMLMap SBMLid="PGM_k_pg2" COPASIkey="ModelValue_84"/>
    <SBMLMap SBMLid="PGM_k_pg3" COPASIkey="ModelValue_85"/>
    <SBMLMap SBMLid="PGM_keq" COPASIkey="ModelValue_86"/>
    <SBMLMap SBMLid="PK" COPASIkey="Reaction_13"/>
    <SBMLMap SBMLid="PK_Vmax" COPASIkey="ModelValue_63"/>
    <SBMLMap SBMLid="PK_alpha" COPASIkey="ModelValue_74"/>
    <SBMLMap SBMLid="PK_alpha_end" COPASIkey="ModelValue_72"/>
    <SBMLMap SBMLid="PK_alpha_inp" COPASIkey="ModelValue_60"/>
    <SBMLMap SBMLid="PK_alpha_p" COPASIkey="ModelValue_73"/>
    <SBMLMap SBMLid="PK_alpha_p_inp" COPASIkey="ModelValue_59"/>
    <SBMLMap SBMLid="PK_base_act" COPASIkey="ModelValue_65"/>
    <SBMLMap SBMLid="PK_base_act_p" COPASIkey="ModelValue_64"/>
    <SBMLMap SBMLid="PK_f" COPASIkey="ModelValue_62"/>
    <SBMLMap SBMLid="PK_f_p" COPASIkey="ModelValue_61"/>
    <SBMLMap SBMLid="PK_k_adp" COPASIkey="ModelValue_66"/>
    <SBMLMap SBMLid="PK_k_fbp" COPASIkey="ModelValue_71"/>
    <SBMLMap SBMLid="PK_k_fbp_p" COPASIkey="ModelValue_70"/>
    <SBMLMap SBMLid="PK_k_pep" COPASIkey="ModelValue_69"/>
    <SBMLMap SBMLid="PK_k_pep_end" COPASIkey="ModelValue_67"/>
    <SBMLMap SBMLid="PK_k_pep_p" COPASIkey="ModelValue_68"/>
    <SBMLMap SBMLid="PK_n" COPASIkey="ModelValue_78"/>
    <SBMLMap SBMLid="PK_n_fbp" COPASIkey="ModelValue_76"/>
    <SBMLMap SBMLid="PK_n_fbp_p" COPASIkey="ModelValue_75"/>
    <SBMLMap SBMLid="PK_n_p" COPASIkey="ModelValue_77"/>
    <SBMLMap SBMLid="PK_native" COPASIkey="ModelValue_56"/>
    <SBMLMap SBMLid="PK_pep_inp" COPASIkey="ModelValue_58"/>
    <SBMLMap SBMLid="PK_pep_p_inp" COPASIkey="ModelValue_57"/>
    <SBMLMap SBMLid="PK_phospho" COPASIkey="ModelValue_55"/>
    <SBMLMap SBMLid="PPASE" COPASIkey="Reaction_29"/>
    <SBMLMap SBMLid="PPASE_Vmax" COPASIkey="ModelValue_183"/>
    <SBMLMap SBMLid="PPASE_km_pp" COPASIkey="ModelValue_184"/>
    <SBMLMap SBMLid="PYRTM" COPASIkey="Reaction_7"/>
    <SBMLMap SBMLid="PYRTM_Vmax" COPASIkey="ModelValue_29"/>
    <SBMLMap SBMLid="PYRTM_k_pyr" COPASIkey="ModelValue_30"/>
    <SBMLMap SBMLid="PYRTM_keq" COPASIkey="ModelValue_31"/>
    <SBMLMap SBMLid="TPI" COPASIkey="Reaction_18"/>
    <SBMLMap SBMLid="TPI_Vmax" COPASIkey="ModelValue_100"/>
    <SBMLMap SBMLid="TPI_keq" COPASIkey="ModelValue_103"/>
    <SBMLMap SBMLid="TPI_km_dhap" COPASIkey="ModelValue_102"/>
    <SBMLMap SBMLid="TPI_km_grap" COPASIkey="ModelValue_101"/>
    <SBMLMap SBMLid="UPGASE" COPASIkey="Reaction_30"/>
    <SBMLMap SBMLid="UPGASE_Vmax" COPASIkey="ModelValue_185"/>
    <SBMLMap SBMLid="UPGASE_keq" COPASIkey="ModelValue_190"/>
    <SBMLMap SBMLid="UPGASE_km_glc1p" COPASIkey="ModelValue_188"/>
    <SBMLMap SBMLid="UPGASE_km_pp" COPASIkey="ModelValue_186"/>
    <SBMLMap SBMLid="UPGASE_km_udpglc" COPASIkey="ModelValue_187"/>
    <SBMLMap SBMLid="UPGASE_km_utp" COPASIkey="ModelValue_189"/>
    <SBMLMap SBMLid="acoa_mito" COPASIkey="Metabolite_9"/>
    <SBMLMap SBMLid="adp" COPASIkey="Metabolite_47"/>
    <SBMLMap SBMLid="adp_mito" COPASIkey="Metabolite_5"/>
    <SBMLMap SBMLid="amp" COPASIkey="Metabolite_46"/>
    <SBMLMap SBMLid="atp" COPASIkey="Metabolite_48"/>
    <SBMLMap SBMLid="atp_mito" COPASIkey="Metabolite_6"/>
    <SBMLMap SBMLid="atp_mito_tot" COPASIkey="ModelValue_237"/>
    <SBMLMap SBMLid="atp_tot" COPASIkey="ModelValue_241"/>
    <SBMLMap SBMLid="bpg13" COPASIkey="Metabolite_22"/>
    <SBMLMap SBMLid="cit_mito" COPASIkey="Metabolite_7"/>
    <SBMLMap SBMLid="co2" COPASIkey="Metabolite_37"/>
    <SBMLMap SBMLid="co2_mito" COPASIkey="Metabolite_13"/>
    <SBMLMap SBMLid="coa_mito" COPASIkey="Metabolite_2"/>
    <SBMLMap SBMLid="cyto" COPASIkey="Compartment_2"/>
    <SBMLMap SBMLid="dhap" COPASIkey="Metabolite_23"/>
    <SBMLMap SBMLid="epi" COPASIkey="ModelValue_221"/>
    <SBMLMap SBMLid="epi_f" COPASIkey="ModelValue_219"/>
    <SBMLMap SBMLid="extern" COPASIkey="Compartment_3"/>
    <SBMLMap SBMLid="fru16bp" COPASIkey="Metabolite_26"/>
    <SBMLMap SBMLid="fru26bp" COPASIkey="Metabolite_25"/>
    <SBMLMap SBMLid="fru6p" COPASIkey="Metabolite_27"/>
    <SBMLMap SBMLid="gamma" COPASIkey="ModelValue_215"/>
    <SBMLMap SBMLid="gdp" COPASIkey="Metabolite_42"/>
    <SBMLMap SBMLid="gdp_mito" COPASIkey="Metabolite_3"/>
    <SBMLMap SBMLid="glc" COPASIkey="Metabolite_29"/>
    <SBMLMap SBMLid="glc1p" COPASIkey="Metabolite_34"/>
    <SBMLMap SBMLid="glc6p" COPASIkey="Metabolite_28"/>
    <SBMLMap SBMLid="glc_ext" COPASIkey="Metabolite_15"/>
    <SBMLMap SBMLid="glu" COPASIkey="ModelValue_226"/>
    <SBMLMap SBMLid="glyglc" COPASIkey="Metabolite_30"/>
    <SBMLMap SBMLid="grap" COPASIkey="Metabolite_24"/>
    <SBMLMap SBMLid="gtp" COPASIkey="Metabolite_43"/>
    <SBMLMap SBMLid="gtp_mito" COPASIkey="Metabolite_4"/>
    <SBMLMap SBMLid="gtp_mito_tot" COPASIkey="ModelValue_236"/>
    <SBMLMap SBMLid="gtp_tot" COPASIkey="ModelValue_239"/>
    <SBMLMap SBMLid="h" COPASIkey="Metabolite_35"/>
    <SBMLMap SBMLid="h2o" COPASIkey="Metabolite_36"/>
    <SBMLMap SBMLid="h2o_mito" COPASIkey="Metabolite_32"/>
    <SBMLMap SBMLid="h_mito" COPASIkey="Metabolite_31"/>
    <SBMLMap SBMLid="ins" COPASIkey="ModelValue_231"/>
    <SBMLMap SBMLid="lac" COPASIkey="Metabolite_16"/>
    <SBMLMap SBMLid="lac_ext" COPASIkey="Metabolite_14"/>
    <SBMLMap SBMLid="mito" COPASIkey="Compartment_1"/>
    <SBMLMap SBMLid="nad" COPASIkey="Metabolite_41"/>
    <SBMLMap SBMLid="nad_mito" COPASIkey="Metabolite_0"/>
    <SBMLMap SBMLid="nadh" COPASIkey="Metabolite_40"/>
    <SBMLMap SBMLid="nadh_mito" COPASIkey="Metabolite_1"/>
    <SBMLMap SBMLid="nadh_mito_tot" COPASIkey="ModelValue_238"/>
    <SBMLMap SBMLid="nadh_tot" COPASIkey="ModelValue_242"/>
    <SBMLMap SBMLid="oaa" COPASIkey="Metabolite_17"/>
    <SBMLMap SBMLid="oaa_mito" COPASIkey="Metabolite_11"/>
    <SBMLMap SBMLid="pep" COPASIkey="Metabolite_19"/>
    <SBMLMap SBMLid="pep_mito" COPASIkey="Metabolite_10"/>
    <SBMLMap SBMLid="pg2" COPASIkey="Metabolite_20"/>
    <SBMLMap SBMLid="pg3" COPASIkey="Metabolite_21"/>
    <SBMLMap SBMLid="phos" COPASIkey="Metabolite_39"/>
    <SBMLMap SBMLid="phos_mito" COPASIkey="Metabolite_12"/>
    <SBMLMap SBMLid="pp" COPASIkey="Metabolite_38"/>
    <SBMLMap SBMLid="pyr" COPASIkey="Metabolite_18"/>
    <SBMLMap SBMLid="pyr_mito" COPASIkey="Metabolite_8"/>
    <SBMLMap SBMLid="scale_gly" COPASIkey="ModelValue_214"/>
    <SBMLMap SBMLid="scale_glyglc" COPASIkey="ModelValue_213"/>
    <SBMLMap SBMLid="udp" COPASIkey="Metabolite_44"/>
    <SBMLMap SBMLid="udpglc" COPASIkey="Metabolite_33"/>
    <SBMLMap SBMLid="utp" COPASIkey="Metabolite_45"/>
    <SBMLMap SBMLid="utp_tot" COPASIkey="ModelValue_240"/>
    <SBMLMap SBMLid="x_epi1" COPASIkey="ModelValue_225"/>
    <SBMLMap SBMLid="x_epi2" COPASIkey="ModelValue_224"/>
    <SBMLMap SBMLid="x_epi3" COPASIkey="ModelValue_223"/>
    <SBMLMap SBMLid="x_epi4" COPASIkey="ModelValue_222"/>
    <SBMLMap SBMLid="x_glu1" COPASIkey="ModelValue_230"/>
    <SBMLMap SBMLid="x_glu2" COPASIkey="ModelValue_229"/>
    <SBMLMap SBMLid="x_glu3" COPASIkey="ModelValue_228"/>
    <SBMLMap SBMLid="x_glu4" COPASIkey="ModelValue_227"/>
    <SBMLMap SBMLid="x_ins1" COPASIkey="ModelValue_235"/>
    <SBMLMap SBMLid="x_ins2" COPASIkey="ModelValue_234"/>
    <SBMLMap SBMLid="x_ins3" COPASIkey="ModelValue_233"/>
    <SBMLMap SBMLid="x_ins4" COPASIkey="ModelValue_232"/>
  </SBMLReference>
</COPASI>
