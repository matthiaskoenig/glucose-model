<?xml version="1.0" encoding="UTF-8"?>
<!-- generated with COPASI 4.11 (Build 65) (http://www.copasi.org) at 2014-04-03 14:34:40 UTC -->
<?oxygen RNGSchema="http://www.copasi.org/static/schema/CopasiML.rng" type="xml"?>
<COPASI xmlns="http://www.copasi.org/static/schema" versionMajor="4" versionMinor="11" versionDevel="65" copasiSourcesModified="0">
  <ListOfFunctions>
    <Function key="Function_41" name="maximum" type="UserDefined" reversible="unspecified">
      <Expression>
        if(x gt y,x,y)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_254" name="x" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_246" name="y" order="1" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_42" name="Function for GLUT2 glucose transporter" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*GLUT2_Vmax/GLUT2_km*(glc_ext-glc/GLUT2_keq)/(1+glc_ext/GLUT2_km+glc/GLUT2_km)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_275" name="GLUT2_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_274" name="GLUT2_keq" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_273" name="GLUT2_km" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_272" name="glc" order="3" role="product"/>
        <ParameterDescription key="FunctionParameter_271" name="glc_ext" order="4" role="substrate"/>
        <ParameterDescription key="FunctionParameter_270" name="scale_gly" order="5" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_43" name="Function for Glucokinase" type="UserDefined" reversible="false">
      <Expression>
        scale_gly*GK_Vmax*GK_gc_free*atp/(GK_km_atp+atp)*glc^GK_n/(glc^GK_n+GK_km_glc^GK_n)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_293" name="GK_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_292" name="GK_gc_free" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_291" name="GK_km_atp" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_290" name="GK_km_glc" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_289" name="GK_n" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_288" name="atp" order="5" role="substrate"/>
        <ParameterDescription key="FunctionParameter_287" name="cyto" order="6" role="volume"/>
        <ParameterDescription key="FunctionParameter_286" name="glc" order="7" role="substrate"/>
        <ParameterDescription key="FunctionParameter_285" name="scale_gly" order="8" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_44" name="Function for D-Glucose-6-phosphate Phosphatase" type="UserDefined" reversible="false">
      <Expression>
        scale_gly*G6PASE_Vmax*glc6p/(G6PASE_km_glc6p+glc6p)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_303" name="G6PASE_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_267" name="G6PASE_km_glc6p" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_268" name="cyto" order="2" role="volume"/>
        <ParameterDescription key="FunctionParameter_269" name="glc6p" order="3" role="substrate"/>
        <ParameterDescription key="FunctionParameter_283" name="scale_gly" order="4" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_45" name="Function for D-Glucose-6-phosphate Isomerase" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*GPI_Vmax/GPI_km_glc6p*(glc6p-fru6p/GPI_keq)/(1+glc6p/GPI_km_glc6p+fru6p/GPI_km_fru6p)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_319" name="GPI_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_318" name="GPI_keq" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_317" name="GPI_km_fru6p" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_316" name="GPI_km_glc6p" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_315" name="cyto" order="4" role="volume"/>
        <ParameterDescription key="FunctionParameter_314" name="fru6p" order="5" role="product"/>
        <ParameterDescription key="FunctionParameter_313" name="glc6p" order="6" role="substrate"/>
        <ParameterDescription key="FunctionParameter_312" name="scale_gly" order="7" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_46" name="Function for Glucose 1-phosphate 1,6-phosphomutase" type="UserDefined" reversible="true">
      <Expression>
        scale_glyglc*G16PI_Vmax/G16PI_km_glc1p*(glc1p-glc6p/G16PI_keq)/(1+glc1p/G16PI_km_glc1p+glc6p/G16PI_km_glc6p)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_335" name="G16PI_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_334" name="G16PI_keq" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_333" name="G16PI_km_glc1p" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_332" name="G16PI_km_glc6p" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_331" name="cyto" order="4" role="volume"/>
        <ParameterDescription key="FunctionParameter_330" name="glc1p" order="5" role="substrate"/>
        <ParameterDescription key="FunctionParameter_329" name="glc6p" order="6" role="product"/>
        <ParameterDescription key="FunctionParameter_328" name="scale_glyglc" order="7" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_47" name="Function for UTP:Glucose-1-phosphate uridylyltransferase" type="UserDefined" reversible="true">
      <Expression>
        scale_glyglc*UPGASE_Vmax/(UPGASE_km_utp*UPGASE_km_glc1p)*(utp*glc1p-udpglc*pp/UPGASE_keq)/((1+utp/UPGASE_km_utp)*(1+glc1p/UPGASE_km_glc1p)+(1+udpglc/UPGASE_km_udpglc)*(1+pp/UPGASE_km_pp)-1)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_359" name="UPGASE_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_358" name="UPGASE_keq" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_357" name="UPGASE_km_glc1p" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_356" name="UPGASE_km_pp" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_355" name="UPGASE_km_udpglc" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_354" name="UPGASE_km_utp" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_353" name="cyto" order="6" role="volume"/>
        <ParameterDescription key="FunctionParameter_352" name="glc1p" order="7" role="substrate"/>
        <ParameterDescription key="FunctionParameter_351" name="pp" order="8" role="product"/>
        <ParameterDescription key="FunctionParameter_350" name="scale_glyglc" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_349" name="udpglc" order="10" role="product"/>
        <ParameterDescription key="FunctionParameter_348" name="utp" order="11" role="substrate"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_48" name="Function for Pyrophosphate phosphohydrolase" type="UserDefined" reversible="false">
      <Expression>
        scale_glyglc*PPASE_Vmax*pp/(pp+PPASE_km_pp)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_284" name="PPASE_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_346" name="PPASE_km_pp" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_345" name="cyto" order="2" role="volume"/>
        <ParameterDescription key="FunctionParameter_311" name="pp" order="3" role="substrate"/>
        <ParameterDescription key="FunctionParameter_347" name="scale_glyglc" order="4" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_49" name="Function for Glycogen synthase" type="UserDefined" reversible="false">
      <Expression>
        ((1-gamma)*GS_native+gamma*GS_phospho)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_377" name="GS_native" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_376" name="GS_phospho" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_375" name="cyto" order="2" role="volume"/>
        <ParameterDescription key="FunctionParameter_310" name="gamma" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_50" name="Function for Glycogen-Phosphorylase" type="UserDefined" reversible="true">
      <Expression>
        ((1-gamma)*GP_native+gamma*GP_phospho)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_385" name="GP_native" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_384" name="GP_phospho" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_383" name="cyto" order="2" role="volume"/>
        <ParameterDescription key="FunctionParameter_382" name="gamma" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_51" name="Function for Nucleoside-diphosphate kinase (ATP, GTP)" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*NDKGTP_Vmax/(NDKGTP_km_atp*NDKGTP_km_gdp)*(atp*gdp-adp*gtp/NDKGTP_keq)/((1+atp/NDKGTP_km_atp)*(1+gdp/NDKGTP_km_gdp)+(1+adp/NDKGTP_km_adp)*(1+gtp/NDKGTP_km_gtp)-1)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_409" name="NDKGTP_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_408" name="NDKGTP_keq" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_407" name="NDKGTP_km_adp" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_406" name="NDKGTP_km_atp" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_405" name="NDKGTP_km_gdp" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_404" name="NDKGTP_km_gtp" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_403" name="adp" order="6" role="product"/>
        <ParameterDescription key="FunctionParameter_402" name="atp" order="7" role="substrate"/>
        <ParameterDescription key="FunctionParameter_401" name="cyto" order="8" role="volume"/>
        <ParameterDescription key="FunctionParameter_400" name="gdp" order="9" role="substrate"/>
        <ParameterDescription key="FunctionParameter_399" name="gtp" order="10" role="product"/>
        <ParameterDescription key="FunctionParameter_398" name="scale_gly" order="11" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_52" name="Function for Nucleoside-diphosphate kinase (ATP, UTP)" type="UserDefined" reversible="true">
      <Expression>
        scale_glyglc*NDKUTP_Vmax/(NDKUTP_km_atp*NDKUTP_km_udp)*(atp*udp-adp*utp/NDKUTP_keq)/((1+atp/NDKUTP_km_atp)*(1+udp/NDKUTP_km_udp)+(1+adp/NDKUTP_km_adp)*(1+utp/NDKUTP_km_utp)-1)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_433" name="NDKUTP_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_432" name="NDKUTP_keq" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_431" name="NDKUTP_km_adp" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_430" name="NDKUTP_km_atp" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_429" name="NDKUTP_km_udp" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_428" name="NDKUTP_km_utp" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_427" name="adp" order="6" role="product"/>
        <ParameterDescription key="FunctionParameter_426" name="atp" order="7" role="substrate"/>
        <ParameterDescription key="FunctionParameter_425" name="cyto" order="8" role="volume"/>
        <ParameterDescription key="FunctionParameter_424" name="scale_glyglc" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_423" name="udp" order="10" role="substrate"/>
        <ParameterDescription key="FunctionParameter_422" name="utp" order="11" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_53" name="Function for ATP:AMP phosphotransferase (Adenylatkinase)" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*AK_Vmax/(AK_km_atp*AK_km_amp)*(atp*amp-adp*adp/AK_keq)/((1+atp/AK_km_atp)*(1+amp/AK_km_amp)+(1+adp/AK_km_adp)*(1+adp/AK_km_adp)-1)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_453" name="AK_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_452" name="AK_keq" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_451" name="AK_km_adp" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_450" name="AK_km_amp" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_449" name="AK_km_atp" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_448" name="adp" order="5" role="product"/>
        <ParameterDescription key="FunctionParameter_447" name="amp" order="6" role="substrate"/>
        <ParameterDescription key="FunctionParameter_446" name="atp" order="7" role="substrate"/>
        <ParameterDescription key="FunctionParameter_393" name="cyto" order="8" role="volume"/>
        <ParameterDescription key="FunctionParameter_265" name="scale_gly" order="9" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_54" name="Function for ATP:D-fructose-6-phosphate 2-phosphotransferase" type="UserDefined" reversible="false">
      <Expression>
        ((1-gamma)*PFK2_native+gamma*PFK2_phospho)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_391" name="PFK2_native" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_258" name="PFK2_phospho" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_309" name="cyto" order="2" role="volume"/>
        <ParameterDescription key="FunctionParameter_394" name="gamma" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_55" name="Function for D-Fructose-2,6-bisphosphate 2-phosphohydrolase" type="UserDefined" reversible="false">
      <Expression>
        ((1-gamma)*FBP2_native+gamma*FBP2_phospho)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_469" name="FBP2_native" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_468" name="FBP2_phospho" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_467" name="cyto" order="2" role="volume"/>
        <ParameterDescription key="FunctionParameter_466" name="gamma" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_56" name="Function for ATP:D-fructose-6-phosphate 1-phosphotransferase" type="UserDefined" reversible="false">
      <Expression>
        scale_gly*PFK1_Vmax*(1-1/(1+fru26bp/PFK1_ka_fru26bp))*fru6p*atp/(PFK1_ki_fru6p*PFK1_km_atp+PFK1_km_fru6p*atp+PFK1_km_atp*fru6p+atp*fru6p)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_489" name="PFK1_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_488" name="PFK1_ka_fru26bp" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_487" name="PFK1_ki_fru6p" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_486" name="PFK1_km_atp" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_485" name="PFK1_km_fru6p" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_484" name="atp" order="5" role="substrate"/>
        <ParameterDescription key="FunctionParameter_483" name="cyto" order="6" role="volume"/>
        <ParameterDescription key="FunctionParameter_482" name="fru26bp" order="7" role="modifier"/>
        <ParameterDescription key="FunctionParameter_481" name="fru6p" order="8" role="substrate"/>
        <ParameterDescription key="FunctionParameter_480" name="scale_gly" order="9" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_57" name="Function for D-Fructose-1,6-bisphosphate 1-phosphohydrolase" type="UserDefined" reversible="false">
      <Expression>
        scale_gly*FBP1_Vmax/(1+fru26bp/FBP1_ki_fru26bp)*fru16bp/(fru16bp+FBP1_km_fru16bp)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_503" name="FBP1_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_502" name="FBP1_ki_fru26bp" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_501" name="FBP1_km_fru16bp" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_500" name="cyto" order="3" role="volume"/>
        <ParameterDescription key="FunctionParameter_395" name="fru16bp" order="4" role="substrate"/>
        <ParameterDescription key="FunctionParameter_396" name="fru26bp" order="5" role="modifier"/>
        <ParameterDescription key="FunctionParameter_476" name="scale_gly" order="6" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_58" name="Function for Aldolase" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*ALD_Vmax/ALD_km_fru16bp*(fru16bp-grap*dhap/ALD_keq)/(1+fru16bp/ALD_km_fru16bp+grap/ALD_ki1_grap+dhap*(grap+ALD_km_grap)/(ALD_km_dhap*ALD_ki1_grap)+fru16bp*grap/(ALD_km_fru16bp*ALD_ki2_grap))/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_527" name="ALD_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_526" name="ALD_keq" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_525" name="ALD_ki1_grap" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_524" name="ALD_ki2_grap" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_523" name="ALD_km_dhap" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_522" name="ALD_km_fru16bp" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_521" name="ALD_km_grap" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_520" name="cyto" order="7" role="volume"/>
        <ParameterDescription key="FunctionParameter_519" name="dhap" order="8" role="product"/>
        <ParameterDescription key="FunctionParameter_518" name="fru16bp" order="9" role="substrate"/>
        <ParameterDescription key="FunctionParameter_517" name="grap" order="10" role="product"/>
        <ParameterDescription key="FunctionParameter_516" name="scale_gly" order="11" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_59" name="Function for Triosephosphate Isomerase" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*TPI_Vmax/TPI_km_dhap*(dhap-grap/TPI_keq)/(1+dhap/TPI_km_dhap+grap/TPI_km_grap)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_543" name="TPI_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_542" name="TPI_keq" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_541" name="TPI_km_dhap" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_540" name="TPI_km_grap" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_390" name="cyto" order="4" role="volume"/>
        <ParameterDescription key="FunctionParameter_474" name="dhap" order="5" role="substrate"/>
        <ParameterDescription key="FunctionParameter_511" name="grap" order="6" role="product"/>
        <ParameterDescription key="FunctionParameter_514" name="scale_gly" order="7" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_60" name="Function for D-Glyceraldehyde-3-phosphate:NAD+ oxidoreductase" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*GAPDH_Vmax/(GAPDH_k_nad*GAPDH_k_grap*GAPDH_k_p)*(nad*grap*phos-bpg13*nadh/GAPDH_keq)/((1+nad/GAPDH_k_nad)*(1+grap/GAPDH_k_grap)*(1+phos/GAPDH_k_p)+(1+nadh/GAPDH_k_nadh)*(1+bpg13/GAPDH_k_bpg13)-1)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_571" name="GAPDH_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_570" name="GAPDH_k_bpg13" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_569" name="GAPDH_k_grap" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_568" name="GAPDH_k_nad" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_567" name="GAPDH_k_nadh" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_566" name="GAPDH_k_p" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_565" name="GAPDH_keq" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_564" name="bpg13" order="7" role="product"/>
        <ParameterDescription key="FunctionParameter_563" name="cyto" order="8" role="volume"/>
        <ParameterDescription key="FunctionParameter_562" name="grap" order="9" role="substrate"/>
        <ParameterDescription key="FunctionParameter_561" name="nad" order="10" role="substrate"/>
        <ParameterDescription key="FunctionParameter_560" name="nadh" order="11" role="product"/>
        <ParameterDescription key="FunctionParameter_559" name="phos" order="12" role="substrate"/>
        <ParameterDescription key="FunctionParameter_558" name="scale_gly" order="13" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_61" name="Function for Phosphoglycerate Kinase" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*PGK_Vmax/(PGK_k_adp*PGK_k_bpg13)*(adp*bpg13-atp*pg3/PGK_keq)/((1+adp/PGK_k_adp)*(1+bpg13/PGK_k_bpg13)+(1+atp/PGK_k_atp)*(1+pg3/PGK_k_pg3)-1)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_595" name="PGK_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_594" name="PGK_k_adp" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_593" name="PGK_k_atp" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_592" name="PGK_k_bpg13" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_591" name="PGK_k_pg3" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_590" name="PGK_keq" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_589" name="adp" order="6" role="substrate"/>
        <ParameterDescription key="FunctionParameter_588" name="atp" order="7" role="product"/>
        <ParameterDescription key="FunctionParameter_587" name="bpg13" order="8" role="substrate"/>
        <ParameterDescription key="FunctionParameter_586" name="cyto" order="9" role="volume"/>
        <ParameterDescription key="FunctionParameter_515" name="pg3" order="10" role="product"/>
        <ParameterDescription key="FunctionParameter_556" name="scale_gly" order="11" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_62" name="Function for 2-Phospho-D-glycerate 2,3-phosphomutase" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*PGM_Vmax*(pg3-pg2/PGM_keq)/(pg3+PGM_k_pg3*(1+pg2/PGM_k_pg2))/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_611" name="PGM_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_610" name="PGM_k_pg2" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_609" name="PGM_k_pg3" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_608" name="PGM_keq" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_478" name="cyto" order="4" role="volume"/>
        <ParameterDescription key="FunctionParameter_553" name="pg2" order="5" role="product"/>
        <ParameterDescription key="FunctionParameter_555" name="pg3" order="6" role="substrate"/>
        <ParameterDescription key="FunctionParameter_477" name="scale_gly" order="7" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_63" name="Function for 2-Phospho-D-glucerate hydro-lyase (enolase)" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*EN_Vmax*(pg2-pep/EN_keq)/(pg2+EN_k_pg2*(1+pep/EN_k_pep))/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_627" name="EN_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_626" name="EN_k_pep" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_625" name="EN_k_pg2" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_624" name="EN_keq" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_623" name="cyto" order="4" role="volume"/>
        <ParameterDescription key="FunctionParameter_622" name="pep" order="5" role="product"/>
        <ParameterDescription key="FunctionParameter_621" name="pg2" order="6" role="substrate"/>
        <ParameterDescription key="FunctionParameter_620" name="scale_gly" order="7" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_64" name="Function for Pyruvatkinase" type="UserDefined" reversible="false">
      <Expression>
        ((1-gamma)*PK_native+gamma*PK_phospho)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_513" name="PK_native" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_475" name="PK_phospho" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_512" name="cyto" order="2" role="volume"/>
        <ParameterDescription key="FunctionParameter_552" name="gamma" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_65" name="Function for PEPCK cyto" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*PEPCK_Vmax/(PEPCK_k_oaa*PEPCK_k_gtp)*(oaa*gtp-pep*gdp*co2/PEPCK_keq)/((1+oaa/PEPCK_k_oaa)*(1+gtp/PEPCK_k_gtp)+(1+pep/PEPCK_k_pep)*(1+gdp/PEPCK_k_gdp)*(1+co2/PEPCK_k_co2)-1)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_663" name="PEPCK_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_662" name="PEPCK_k_co2" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_661" name="PEPCK_k_gdp" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_660" name="PEPCK_k_gtp" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_659" name="PEPCK_k_oaa" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_658" name="PEPCK_k_pep" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_657" name="PEPCK_keq" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_656" name="co2" order="7" role="product"/>
        <ParameterDescription key="FunctionParameter_655" name="cyto" order="8" role="volume"/>
        <ParameterDescription key="FunctionParameter_654" name="gdp" order="9" role="product"/>
        <ParameterDescription key="FunctionParameter_653" name="gtp" order="10" role="substrate"/>
        <ParameterDescription key="FunctionParameter_652" name="oaa" order="11" role="substrate"/>
        <ParameterDescription key="FunctionParameter_651" name="pep" order="12" role="product"/>
        <ParameterDescription key="FunctionParameter_650" name="scale_gly" order="13" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_66" name="Function for PEPCK mito" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*PEPCKM_Vmax/(PEPCK_k_oaa*PEPCK_k_gtp)*(oaa_mito*gtp_mito-pep_mito*gdp_mito*co2_mito/PEPCK_keq)/((1+oaa_mito/PEPCK_k_oaa)*(1+gtp_mito/PEPCK_k_gtp)+(1+pep_mito/PEPCK_k_pep)*(1+gdp_mito/PEPCK_k_gdp)*(1+co2_mito/PEPCK_k_co2)-1)/mito
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_691" name="PEPCKM_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_690" name="PEPCK_k_co2" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_689" name="PEPCK_k_gdp" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_688" name="PEPCK_k_gtp" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_687" name="PEPCK_k_oaa" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_686" name="PEPCK_k_pep" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_685" name="PEPCK_keq" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_684" name="co2_mito" order="7" role="product"/>
        <ParameterDescription key="FunctionParameter_683" name="gdp_mito" order="8" role="product"/>
        <ParameterDescription key="FunctionParameter_682" name="gtp_mito" order="9" role="substrate"/>
        <ParameterDescription key="FunctionParameter_681" name="mito" order="10" role="volume"/>
        <ParameterDescription key="FunctionParameter_680" name="oaa_mito" order="11" role="substrate"/>
        <ParameterDescription key="FunctionParameter_679" name="pep_mito" order="12" role="product"/>
        <ParameterDescription key="FunctionParameter_678" name="scale_gly" order="13" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_67" name="Function for Pyruvate Carboxylase" type="UserDefined" reversible="false">
      <Expression>
        scale_gly*PC_Vmax*atp_mito/(PC_k_atp+atp_mito)*pyr_mito/(PC_k_pyr+pyr_mito)*co2_mito/(PC_k_co2+co2_mito)*acoa_mito^PC_n/(acoa_mito^PC_n+PC_k_acoa^PC_n)/mito
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_715" name="PC_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_714" name="PC_k_acoa" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_713" name="PC_k_atp" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_712" name="PC_k_co2" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_711" name="PC_k_pyr" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_710" name="PC_n" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_709" name="acoa_mito" order="6" role="modifier"/>
        <ParameterDescription key="FunctionParameter_708" name="atp_mito" order="7" role="substrate"/>
        <ParameterDescription key="FunctionParameter_707" name="co2_mito" order="8" role="substrate"/>
        <ParameterDescription key="FunctionParameter_706" name="mito" order="9" role="volume"/>
        <ParameterDescription key="FunctionParameter_642" name="pyr_mito" order="10" role="substrate"/>
        <ParameterDescription key="FunctionParameter_648" name="scale_gly" order="11" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_68" name="Function for Lactate Dehydrogenase" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*LDH_Vmax/(LDH_k_pyr*LDH_k_nadh)*(pyr*nadh-lac*nad/LDH_keq)/((1+nadh/LDH_k_nadh)*(1+pyr/LDH_k_pyr)+(1+lac/LDH_k_lac)*(1+nad/LDH_k_nad)-1)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_739" name="LDH_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_738" name="LDH_k_lac" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_737" name="LDH_k_nad" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_736" name="LDH_k_nadh" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_735" name="LDH_k_pyr" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_734" name="LDH_keq" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_733" name="cyto" order="6" role="volume"/>
        <ParameterDescription key="FunctionParameter_732" name="lac" order="7" role="product"/>
        <ParameterDescription key="FunctionParameter_731" name="nad" order="8" role="product"/>
        <ParameterDescription key="FunctionParameter_730" name="nadh" order="9" role="substrate"/>
        <ParameterDescription key="FunctionParameter_729" name="pyr" order="10" role="substrate"/>
        <ParameterDescription key="FunctionParameter_728" name="scale_gly" order="11" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_69" name="Function for Lactate transport (import)" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*LACT_Vmax/LACT_k_lac*(lac_ext-lac/LACT_keq)/(1+lac_ext/LACT_k_lac+lac/LACT_k_lac)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_649" name="LACT_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_554" name="LACT_k_lac" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_641" name="LACT_keq" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_646" name="lac" order="3" role="product"/>
        <ParameterDescription key="FunctionParameter_647" name="lac_ext" order="4" role="substrate"/>
        <ParameterDescription key="FunctionParameter_479" name="scale_gly" order="5" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_70" name="Function for Pyruvate transport (mito)" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*PYRTM_Vmax/PYRTM_k_pyr*(pyr-pyr_mito/PYRTM_keq)/(1+pyr/PYRTM_k_pyr+pyr_mito/PYRTM_k_pyr)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_763" name="PYRTM_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_762" name="PYRTM_k_pyr" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_761" name="PYRTM_keq" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_760" name="pyr" order="3" role="substrate"/>
        <ParameterDescription key="FunctionParameter_759" name="pyr_mito" order="4" role="product"/>
        <ParameterDescription key="FunctionParameter_758" name="scale_gly" order="5" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_71" name="Function for PEP Transport (export mito)" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*PEPTM_Vmax/PEPTM_k_pep*(pep_mito-pep/PEPTM_keq)/(1+pep/PEPTM_k_pep+pep_mito/PEPTM_k_pep)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_775" name="PEPTM_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_774" name="PEPTM_k_pep" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_773" name="PEPTM_keq" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_772" name="pep" order="3" role="product"/>
        <ParameterDescription key="FunctionParameter_771" name="pep_mito" order="4" role="substrate"/>
        <ParameterDescription key="FunctionParameter_770" name="scale_gly" order="5" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_72" name="Function for Pyruvate Dehydrogenase" type="UserDefined" reversible="false">
      <Expression>
        ((1-gamma)*PDH_nat+gamma*PDH_p)/mito
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_783" name="PDH_nat" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_782" name="PDH_p" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_557" name="gamma" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_644" name="mito" order="3" role="volume"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_73" name="Function for Citrate Synthase" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*CS_Vmax/(CS_k_oaa*CS_k_acoa)*(acoa_mito*oaa_mito-cit_mito*coa_mito/CS_keq)/((1+acoa_mito/CS_k_acoa)*(1+oaa_mito/CS_k_oaa)+(1+cit_mito/CS_k_cit)*(1+coa_mito/CS_k_coa)-1)/mito
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_807" name="CS_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_806" name="CS_k_acoa" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_805" name="CS_k_cit" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_804" name="CS_k_coa" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_803" name="CS_k_oaa" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_802" name="CS_keq" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_801" name="acoa_mito" order="6" role="substrate"/>
        <ParameterDescription key="FunctionParameter_800" name="cit_mito" order="7" role="product"/>
        <ParameterDescription key="FunctionParameter_799" name="coa_mito" order="8" role="product"/>
        <ParameterDescription key="FunctionParameter_798" name="mito" order="9" role="volume"/>
        <ParameterDescription key="FunctionParameter_797" name="oaa_mito" order="10" role="substrate"/>
        <ParameterDescription key="FunctionParameter_796" name="scale_gly" order="11" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_74" name="Function for Nucleoside-diphosphate kinase (ATP, GTP) mito" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*NDKGTPM_Vmax/(NDKGTPM_k_atp*NDKGTPM_k_gdp)*(atp_mito*gdp_mito-adp_mito*gtp_mito/NDKGTPM_keq)/((1+atp_mito/NDKGTPM_k_atp)*(1+gdp_mito/NDKGTPM_k_gdp)+(1+adp_mito/NDKGTPM_k_adp)*(1+gtp_mito/NDKGTPM_k_gtp)-1)/mito
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_831" name="NDKGTPM_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_830" name="NDKGTPM_k_adp" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_829" name="NDKGTPM_k_atp" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_828" name="NDKGTPM_k_gdp" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_827" name="NDKGTPM_k_gtp" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_826" name="NDKGTPM_keq" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_825" name="adp_mito" order="6" role="product"/>
        <ParameterDescription key="FunctionParameter_824" name="atp_mito" order="7" role="substrate"/>
        <ParameterDescription key="FunctionParameter_823" name="gdp_mito" order="8" role="substrate"/>
        <ParameterDescription key="FunctionParameter_822" name="gtp_mito" order="9" role="product"/>
        <ParameterDescription key="FunctionParameter_821" name="mito" order="10" role="volume"/>
        <ParameterDescription key="FunctionParameter_820" name="scale_gly" order="11" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_75" name="Function for oxalacetate influx" type="UserDefined" reversible="false">
      <Expression>
        scale_gly*OAAFLX_Vmax/mito
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_792" name="OAAFLX_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_790" name="mito" order="1" role="volume"/>
        <ParameterDescription key="FunctionParameter_788" name="scale_gly" order="2" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_76" name="Function for acetyl-coa efflux" type="UserDefined" reversible="false">
      <Expression>
        scale_gly*ACOAFLX_Vmax/mito
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_789" name="ACOAFLX_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_793" name="mito" order="1" role="volume"/>
        <ParameterDescription key="FunctionParameter_795" name="scale_gly" order="2" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_77" name="Function for citrate efflux" type="UserDefined" reversible="false">
      <Expression>
        scale_gly*CITFLX_Vmax/mito
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_849" name="CITFLX_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_848" name="mito" order="1" role="volume"/>
        <ParameterDescription key="FunctionParameter_847" name="scale_gly" order="2" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
  </ListOfFunctions>
  <Model key="Model_1" name="Koenig2014_Hepatic_Glucose_Model" simulationType="time" timeUnit="s" volumeUnit="l" areaUnit="m²" lengthUnit="m" quantityUnit="mmol" type="deterministic" avogadroConstant="6.02214179e+23">
    <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Model_1">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2014-04-03T16:25:43Z</dcterms:W3CDTF>
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
        <dcterms:W3CDTF>2014-04-03T16:29:17Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <InitialExpression>
          10*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[Vcyto],Reference=InitialValue&gt;
        </InitialExpression>
      </Compartment>
      <Compartment key="Compartment_4" name="cyto" simulationType="fixed" dimensionality="3">
        <InitialExpression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[Vcyto],Reference=InitialValue&gt;
        </InitialExpression>
      </Compartment>
      <Compartment key="Compartment_5" name="mito" simulationType="fixed" dimensionality="3">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Compartment_5">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2014-04-03T16:29:19Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <InitialExpression>
          0.2*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[Vcyto],Reference=InitialValue&gt;
        </InitialExpression>
      </Compartment>
    </ListOfCompartments>
    <ListOfMetabolites>
      <Metabolite key="Metabolite_80" name="glc_ext" simulationType="fixed" compartment="Compartment_3">
      </Metabolite>
      <Metabolite key="Metabolite_81" name="lac_ext" simulationType="fixed" compartment="Compartment_3">
      </Metabolite>
      <Metabolite key="Metabolite_49" name="atp" simulationType="fixed" compartment="Compartment_4">
      </Metabolite>
      <Metabolite key="Metabolite_50" name="adp" simulationType="fixed" compartment="Compartment_4">
      </Metabolite>
      <Metabolite key="Metabolite_51" name="amp" simulationType="fixed" compartment="Compartment_4">
      </Metabolite>
      <Metabolite key="Metabolite_52" name="utp" simulationType="reactions" compartment="Compartment_4">
      </Metabolite>
      <Metabolite key="Metabolite_53" name="udp" simulationType="reactions" compartment="Compartment_4">
      </Metabolite>
      <Metabolite key="Metabolite_54" name="gtp" simulationType="reactions" compartment="Compartment_4">
      </Metabolite>
      <Metabolite key="Metabolite_55" name="gdp" simulationType="reactions" compartment="Compartment_4">
      </Metabolite>
      <Metabolite key="Metabolite_56" name="nad" simulationType="fixed" compartment="Compartment_4">
      </Metabolite>
      <Metabolite key="Metabolite_57" name="nadh" simulationType="fixed" compartment="Compartment_4">
      </Metabolite>
      <Metabolite key="Metabolite_58" name="phos" simulationType="fixed" compartment="Compartment_4">
      </Metabolite>
      <Metabolite key="Metabolite_59" name="pp" simulationType="reactions" compartment="Compartment_4">
      </Metabolite>
      <Metabolite key="Metabolite_60" name="co2" simulationType="fixed" compartment="Compartment_4">
      </Metabolite>
      <Metabolite key="Metabolite_61" name="h2o" simulationType="fixed" compartment="Compartment_4">
      </Metabolite>
      <Metabolite key="Metabolite_62" name="h" simulationType="fixed" compartment="Compartment_4">
      </Metabolite>
      <Metabolite key="Metabolite_63" name="glc1p" simulationType="reactions" compartment="Compartment_4">
      </Metabolite>
      <Metabolite key="Metabolite_64" name="udpglc" simulationType="reactions" compartment="Compartment_4">
      </Metabolite>
      <Metabolite key="Metabolite_65" name="glyglc" simulationType="fixed" compartment="Compartment_4">
      </Metabolite>
      <Metabolite key="Metabolite_66" name="glc" simulationType="reactions" compartment="Compartment_4">
      </Metabolite>
      <Metabolite key="Metabolite_67" name="glc6p" simulationType="reactions" compartment="Compartment_4">
      </Metabolite>
      <Metabolite key="Metabolite_68" name="fru6p" simulationType="reactions" compartment="Compartment_4">
      </Metabolite>
      <Metabolite key="Metabolite_69" name="fru16bp" simulationType="reactions" compartment="Compartment_4">
      </Metabolite>
      <Metabolite key="Metabolite_70" name="fru26bp" simulationType="reactions" compartment="Compartment_4">
      </Metabolite>
      <Metabolite key="Metabolite_71" name="grap" simulationType="reactions" compartment="Compartment_4">
      </Metabolite>
      <Metabolite key="Metabolite_72" name="dhap" simulationType="reactions" compartment="Compartment_4">
      </Metabolite>
      <Metabolite key="Metabolite_73" name="bpg13" simulationType="reactions" compartment="Compartment_4">
      </Metabolite>
      <Metabolite key="Metabolite_74" name="pg3" simulationType="reactions" compartment="Compartment_4">
      </Metabolite>
      <Metabolite key="Metabolite_75" name="pg2" simulationType="reactions" compartment="Compartment_4">
      </Metabolite>
      <Metabolite key="Metabolite_76" name="pep" simulationType="reactions" compartment="Compartment_4">
      </Metabolite>
      <Metabolite key="Metabolite_77" name="pyr" simulationType="reactions" compartment="Compartment_4">
      </Metabolite>
      <Metabolite key="Metabolite_78" name="oaa" simulationType="reactions" compartment="Compartment_4">
      </Metabolite>
      <Metabolite key="Metabolite_79" name="lac" simulationType="reactions" compartment="Compartment_4">
      </Metabolite>
      <Metabolite key="Metabolite_82" name="co2_mito" simulationType="fixed" compartment="Compartment_5">
      </Metabolite>
      <Metabolite key="Metabolite_83" name="phos_mito" simulationType="fixed" compartment="Compartment_5">
      </Metabolite>
      <Metabolite key="Metabolite_84" name="oaa_mito" simulationType="reactions" compartment="Compartment_5">
      </Metabolite>
      <Metabolite key="Metabolite_85" name="pep_mito" simulationType="reactions" compartment="Compartment_5">
      </Metabolite>
      <Metabolite key="Metabolite_86" name="acoa_mito" simulationType="fixed" compartment="Compartment_5">
      </Metabolite>
      <Metabolite key="Metabolite_87" name="pyr_mito" simulationType="reactions" compartment="Compartment_5">
      </Metabolite>
      <Metabolite key="Metabolite_88" name="cit_mito" simulationType="fixed" compartment="Compartment_5">
      </Metabolite>
      <Metabolite key="Metabolite_89" name="atp_mito" simulationType="fixed" compartment="Compartment_5">
      </Metabolite>
      <Metabolite key="Metabolite_90" name="adp_mito" simulationType="fixed" compartment="Compartment_5">
      </Metabolite>
      <Metabolite key="Metabolite_91" name="gtp_mito" simulationType="reactions" compartment="Compartment_5">
      </Metabolite>
      <Metabolite key="Metabolite_92" name="gdp_mito" simulationType="reactions" compartment="Compartment_5">
      </Metabolite>
      <Metabolite key="Metabolite_93" name="coa_mito" simulationType="fixed" compartment="Compartment_5">
      </Metabolite>
      <Metabolite key="Metabolite_94" name="nadh_mito" simulationType="fixed" compartment="Compartment_5">
      </Metabolite>
      <Metabolite key="Metabolite_95" name="nad_mito" simulationType="fixed" compartment="Compartment_5">
      </Metabolite>
      <Metabolite key="Metabolite_96" name="h2o_mito" simulationType="fixed" compartment="Compartment_5">
      </Metabolite>
      <Metabolite key="Metabolite_97" name="h_mito" simulationType="fixed" compartment="Compartment_5">
      </Metabolite>
    </ListOfMetabolites>
    <ListOfModelValues>
      <ModelValue key="ModelValue_258" name="Vcyto" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_259" name="Vliver" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_260" name="fliver" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_261" name="bodyweight" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_262" name="sec_per_min" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_263" name="conversion_factor" simulationType="fixed">
        <InitialExpression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[fliver],Reference=InitialValue&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[Vliver],Reference=InitialValue&gt;/&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[Vcyto],Reference=InitialValue&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[sec_per_min],Reference=InitialValue&gt;*1000/&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[bodyweight],Reference=InitialValue&gt;
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_264" name="nadh_tot" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[nadh],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[nad],Reference=Concentration&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_265" name="atp_tot" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[atp],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[adp],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[amp],Reference=Concentration&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_266" name="utp_tot" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[utp],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[udp],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[udpglc],Reference=Concentration&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_267" name="gtp_tot" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[gtp],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[gdp],Reference=Concentration&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_268" name="nadh_mito_tot" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[mito],Vector=Metabolites[nadh_mito],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[mito],Vector=Metabolites[nad_mito],Reference=Concentration&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_269" name="atp_mito_tot" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[mito],Vector=Metabolites[atp_mito],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[mito],Vector=Metabolites[adp_mito],Reference=Concentration&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_270" name="gtp_mito_tot" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[mito],Vector=Metabolites[gtp_mito],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[mito],Vector=Metabolites[gdp_mito],Reference=Concentration&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_271" name="x_ins1" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_272" name="x_ins2" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_273" name="x_ins3" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_274" name="x_ins4" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_275" name="ins" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[x_ins2],Reference=Value&gt;+(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[x_ins1],Reference=Value&gt;-&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[x_ins2],Reference=Value&gt;)*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[extern],Vector=Metabolites[glc_ext],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[x_ins4],Reference=Value&gt;/(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[extern],Vector=Metabolites[glc_ext],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[x_ins4],Reference=Value&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[x_ins3],Reference=Value&gt;^&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[x_ins4],Reference=Value&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_276" name="ins_norm" simulationType="assignment">
        <Expression>
          maximum(0,&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[ins],Reference=Value&gt;-&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[x_ins2],Reference=Value&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_277" name="x_glu1" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_278" name="x_glu2" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_279" name="x_glu3" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_280" name="x_glu4" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_281" name="glu" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[x_glu2],Reference=Value&gt;+(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[x_glu1],Reference=Value&gt;-&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[x_glu2],Reference=Value&gt;)*(1-&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[extern],Vector=Metabolites[glc_ext],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[x_glu4],Reference=Value&gt;/(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[extern],Vector=Metabolites[glc_ext],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[x_glu4],Reference=Value&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[x_glu3],Reference=Value&gt;^&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[x_glu4],Reference=Value&gt;))
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_282" name="glu_norm" simulationType="assignment">
        <Expression>
          maximum(0,&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[glu],Reference=Value&gt;-&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[x_glu2],Reference=Value&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_283" name="x_epi1" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_284" name="x_epi2" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_285" name="x_epi3" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_286" name="x_epi4" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_287" name="epi" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[x_epi2],Reference=Value&gt;+(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[x_epi1],Reference=Value&gt;-&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[x_epi2],Reference=Value&gt;)*(1-&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[extern],Vector=Metabolites[glc_ext],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[x_epi4],Reference=Value&gt;/(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[extern],Vector=Metabolites[glc_ext],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[x_epi4],Reference=Value&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[x_epi3],Reference=Value&gt;^&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[x_epi4],Reference=Value&gt;))
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_288" name="epi_norm" simulationType="assignment">
        <Expression>
          maximum(0,&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[epi],Reference=Value&gt;-&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[x_epi2],Reference=Value&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_289" name="K_val" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_290" name="epi_f" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_291" name="K_ins" simulationType="fixed">
        <InitialExpression>
          (&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[x_ins1],Reference=InitialValue&gt;-&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[x_ins2],Reference=InitialValue&gt;)*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[K_val],Reference=InitialValue&gt;
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_292" name="K_glu" simulationType="fixed">
        <InitialExpression>
          (&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[x_glu1],Reference=InitialValue&gt;-&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[x_glu2],Reference=InitialValue&gt;)*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[K_val],Reference=InitialValue&gt;
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_293" name="K_epi" simulationType="fixed">
        <InitialExpression>
          (&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[x_epi1],Reference=InitialValue&gt;-&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[x_epi2],Reference=InitialValue&gt;)*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[K_val],Reference=InitialValue&gt;
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_294" name="gamma" simulationType="assignment">
        <Expression>
          0.5*(1-&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[ins_norm],Reference=Value&gt;/(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[ins_norm],Reference=Value&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[K_ins],Reference=Value&gt;)+maximum(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[glu_norm],Reference=Value&gt;/(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[glu_norm],Reference=Value&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[K_glu],Reference=Value&gt;),&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[epi_f],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[epi_norm],Reference=Value&gt;/(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[epi_norm],Reference=Value&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[K_epi],Reference=Value&gt;)))
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_295" name="scale" simulationType="fixed">
        <InitialExpression>
          1/60
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_296" name="scale_gly" simulationType="fixed">
        <InitialExpression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[scale],Reference=InitialValue&gt;
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_297" name="scale_glyglc" simulationType="fixed">
        <InitialExpression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[scale],Reference=InitialValue&gt;
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_298" name="GLUT2_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_299" name="GLUT2_km" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_300" name="GLUT2_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_301" name="GK_n_gkrp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_302" name="GK_km_glc1" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_303" name="GK_km_fru6p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_304" name="GK_b" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_305" name="GK_n" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_306" name="GK_km_glc" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_307" name="GK_km_atp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_308" name="GK_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_309" name="GK_gc_free" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[glc],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GK_n_gkrp],Reference=Value&gt;/(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[glc],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GK_n_gkrp],Reference=Value&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GK_km_glc1],Reference=Value&gt;^&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GK_n_gkrp],Reference=Value&gt;)*(1-&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GK_b],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[fru6p],Reference=Concentration&gt;/(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[fru6p],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GK_km_fru6p],Reference=Value&gt;))
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_310" name="G6PASE_km_glc6p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_311" name="G6PASE_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_312" name="GPI_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_313" name="GPI_km_glc6p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_314" name="GPI_km_fru6p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_315" name="GPI_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_316" name="G16PI_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_317" name="G16PI_km_glc6p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_318" name="G16PI_km_glc1p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_319" name="G16PI_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_320" name="UPGASE_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_321" name="UPGASE_km_utp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_322" name="UPGASE_km_glc1p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_323" name="UPGASE_km_udpglc" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_324" name="UPGASE_km_pp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_325" name="UPGASE_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_326" name="PPASE_km_pp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_327" name="PPASE_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_328" name="GS_C" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_329" name="GS_k1_max" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_330" name="GS_k1_nat" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_331" name="GS_k2_nat" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_332" name="GS_k1_phospho" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_333" name="GS_k2_phospho" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_334" name="GS_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_335" name="GS_storage_factor" simulationType="assignment">
        <Expression>
          (1+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GS_k1_max],Reference=Value&gt;)*(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GS_C],Reference=Value&gt;-&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[glyglc],Reference=Concentration&gt;)/(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GS_C],Reference=Value&gt;-&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[glyglc],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GS_k1_max],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GS_C],Reference=Value&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_336" name="GS_k_udpglc_native" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GS_k1_nat],Reference=Value&gt;/(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[glc6p],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GS_k2_nat],Reference=Value&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_337" name="GS_k_udpglc_phospho" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GS_k1_phospho],Reference=Value&gt;/(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[glc6p],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GS_k2_phospho],Reference=Value&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_338" name="GS_native" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[scale_glyglc],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GS_Vmax],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GS_storage_factor],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[udpglc],Reference=Concentration&gt;/(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GS_k_udpglc_native],Reference=Value&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[udpglc],Reference=Concentration&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_339" name="GS_phospho" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[scale_glyglc],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GS_Vmax],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GS_storage_factor],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[udpglc],Reference=Concentration&gt;/(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GS_k_udpglc_phospho],Reference=Value&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[udpglc],Reference=Concentration&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_340" name="GP_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_341" name="GP_k_glyc_native" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_342" name="GP_k_glyc_phospho" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_343" name="GP_k_glc1p_native" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_344" name="GP_k_glc1p_phospho" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_345" name="GP_k_p_native" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_346" name="GP_k_p_phospho" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_347" name="GP_ki_glc_phospho" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_348" name="GP_ka_amp_native" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_349" name="GP_base_amp_native" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_350" name="GP_max_amp_native" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_351" name="GP_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_352" name="GP_C" simulationType="fixed">
        <InitialExpression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GS_C],Reference=InitialValue&gt;
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_353" name="GP_k1_max" simulationType="fixed">
        <InitialExpression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GS_k1_max],Reference=InitialValue&gt;
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_354" name="GP_fmax" simulationType="assignment">
        <Expression>
          (1+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GP_k1_max],Reference=Value&gt;)*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[glyglc],Reference=Concentration&gt;/(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[glyglc],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GP_k1_max],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GP_C],Reference=Value&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_355" name="GP_vmax_native" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[scale_glyglc],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GP_Vmax],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GP_fmax],Reference=Value&gt;*(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GP_base_amp_native],Reference=Value&gt;+(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GP_max_amp_native],Reference=Value&gt;-&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GP_base_amp_native],Reference=Value&gt;)*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[amp],Reference=Concentration&gt;/(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[amp],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GP_ka_amp_native],Reference=Value&gt;))
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_356" name="GP_native" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GP_vmax_native],Reference=Value&gt;/(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GP_k_glyc_native],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GP_k_p_native],Reference=Value&gt;)*(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[glyglc],Reference=Concentration&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[phos],Reference=Concentration&gt;-&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[glc1p],Reference=Concentration&gt;/&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GP_keq],Reference=Value&gt;)/((1+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[glyglc],Reference=Concentration&gt;/&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GP_k_glyc_native],Reference=Value&gt;)*(1+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[phos],Reference=Concentration&gt;/&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GP_k_p_native],Reference=Value&gt;)+1+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[glc1p],Reference=Concentration&gt;/&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GP_k_glc1p_native],Reference=Value&gt;-1)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_357" name="GP_vmax_phospho" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[scale_glyglc],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GP_Vmax],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GP_fmax],Reference=Value&gt;*exp(-log(2)/&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GP_ki_glc_phospho],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[glc],Reference=Concentration&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_358" name="GP_phospho" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GP_vmax_phospho],Reference=Value&gt;/(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GP_k_glyc_phospho],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GP_k_p_phospho],Reference=Value&gt;)*(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[glyglc],Reference=Concentration&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[phos],Reference=Concentration&gt;-&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[glc1p],Reference=Concentration&gt;/&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GP_keq],Reference=Value&gt;)/((1+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[glyglc],Reference=Concentration&gt;/&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GP_k_glyc_phospho],Reference=Value&gt;)*(1+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[phos],Reference=Concentration&gt;/&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GP_k_p_phospho],Reference=Value&gt;)+1+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[glc1p],Reference=Concentration&gt;/&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GP_k_glc1p_phospho],Reference=Value&gt;-1)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_359" name="NDKGTP_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_360" name="NDKGTP_km_atp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_361" name="NDKGTP_km_adp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_362" name="NDKGTP_km_gtp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_363" name="NDKGTP_km_gdp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_364" name="NDKGTP_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_365" name="NDKUTP_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_366" name="NDKUTP_km_atp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_367" name="NDKUTP_km_adp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_368" name="NDKUTP_km_utp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_369" name="NDKUTP_km_udp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_370" name="NDKUTP_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_371" name="AK_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_372" name="AK_km_atp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_373" name="AK_km_amp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_374" name="AK_km_adp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_375" name="AK_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_376" name="PFK2_n_native" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_377" name="PFK2_n_phospho" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_378" name="PFK2_k_fru6p_native" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_379" name="PFK2_k_fru6p_phospho" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_380" name="PFK2_k_atp_native" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_381" name="PFK2_k_atp_phospho" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_382" name="PFK2_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_383" name="PFK2_native" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[scale_gly],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PFK2_Vmax],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[fru6p],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PFK2_n_native],Reference=Value&gt;/(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[fru6p],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PFK2_n_native],Reference=Value&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PFK2_k_fru6p_native],Reference=Value&gt;^&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PFK2_n_native],Reference=Value&gt;)*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[atp],Reference=Concentration&gt;/(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[atp],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PFK2_k_atp_native],Reference=Value&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_384" name="PFK2_phospho" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[scale_gly],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PFK2_Vmax],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[fru6p],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PFK2_n_phospho],Reference=Value&gt;/(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[fru6p],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PFK2_n_phospho],Reference=Value&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PFK2_k_fru6p_phospho],Reference=Value&gt;^&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PFK2_n_phospho],Reference=Value&gt;)*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[atp],Reference=Concentration&gt;/(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[atp],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PFK2_k_atp_phospho],Reference=Value&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_385" name="FBP2_km_fru26bp_native" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_386" name="FBP2_ki_fru6p_native" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_387" name="FBP2_km_fru26bp_phospho" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_388" name="FBP2_ki_fru6p_phospho" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_389" name="FBP2_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_390" name="FBP2_native" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[scale_gly],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[FBP2_Vmax],Reference=Value&gt;/(1+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[fru6p],Reference=Concentration&gt;/&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[FBP2_ki_fru6p_native],Reference=Value&gt;)*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[fru26bp],Reference=Concentration&gt;/(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[FBP2_km_fru26bp_native],Reference=Value&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[fru26bp],Reference=Concentration&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_391" name="FBP2_phospho" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[scale_gly],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[FBP2_Vmax],Reference=Value&gt;/(1+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[fru6p],Reference=Concentration&gt;/&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[FBP2_ki_fru6p_phospho],Reference=Value&gt;)*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[fru26bp],Reference=Concentration&gt;/(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[FBP2_km_fru26bp_phospho],Reference=Value&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[fru26bp],Reference=Concentration&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_392" name="PFK1_km_atp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_393" name="PFK1_km_fru6p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_394" name="PFK1_ki_fru6p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_395" name="PFK1_ka_fru26bp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_396" name="PFK1_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_397" name="FBP1_ki_fru26bp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_398" name="FBP1_km_fru16bp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_399" name="FBP1_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_400" name="ALD_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_401" name="ALD_km_fru16bp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_402" name="ALD_km_dhap" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_403" name="ALD_km_grap" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_404" name="ALD_ki1_grap" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_405" name="ALD_ki2_grap" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_406" name="ALD_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_407" name="TPI_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_408" name="TPI_km_dhap" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_409" name="TPI_km_grap" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_410" name="TPI_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_411" name="GAPDH_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_412" name="GAPDH_k_nad" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_413" name="GAPDH_k_grap" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_414" name="GAPDH_k_p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_415" name="GAPDH_k_nadh" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_416" name="GAPDH_k_bpg13" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_417" name="GAPDH_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_418" name="PGK_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_419" name="PGK_k_adp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_420" name="PGK_k_atp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_421" name="PGK_k_bpg13" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_422" name="PGK_k_pg3" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_423" name="PGK_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_424" name="PGM_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_425" name="PGM_k_pg3" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_426" name="PGM_k_pg2" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_427" name="PGM_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_428" name="EN_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_429" name="EN_k_pep" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_430" name="EN_k_pg2" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_431" name="EN_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_432" name="PK_n" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_433" name="PK_n_p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_434" name="PK_n_fbp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_435" name="PK_n_fbp_p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_436" name="PK_alpha" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_437" name="PK_alpha_p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_438" name="PK_alpha_end" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_439" name="PK_k_fbp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_440" name="PK_k_fbp_p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_441" name="PK_k_pep" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_442" name="PK_k_pep_p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_443" name="PK_k_pep_end" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_444" name="PK_k_adp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_445" name="PK_base_act" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_446" name="PK_base_act_p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_447" name="PK_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_448" name="PK_f" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[fru16bp],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_n_fbp],Reference=Value&gt;/(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_k_fbp],Reference=Value&gt;^&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_n_fbp],Reference=Value&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[fru16bp],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_n_fbp],Reference=Value&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_449" name="PK_f_p" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[fru16bp],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_n_fbp_p],Reference=Value&gt;/(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_k_fbp_p],Reference=Value&gt;^&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_n_fbp_p],Reference=Value&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[fru16bp],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_n_fbp_p],Reference=Value&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_450" name="PK_alpha_inp" simulationType="assignment">
        <Expression>
          (1-&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_f],Reference=Value&gt;)*(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_alpha],Reference=Value&gt;-&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_alpha_end],Reference=Value&gt;)+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_alpha_end],Reference=Value&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_451" name="PK_alpha_p_inp" simulationType="assignment">
        <Expression>
          (1-&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_f_p],Reference=Value&gt;)*(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_alpha_p],Reference=Value&gt;-&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_alpha_end],Reference=Value&gt;)+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_alpha_end],Reference=Value&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_452" name="PK_pep_inp" simulationType="assignment">
        <Expression>
          (1-&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_f],Reference=Value&gt;)*(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_k_pep],Reference=Value&gt;-&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_k_pep_end],Reference=Value&gt;)+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_k_pep_end],Reference=Value&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_453" name="PK_pep_p_inp" simulationType="assignment">
        <Expression>
          (1-&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_f_p],Reference=Value&gt;)*(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_k_pep_p],Reference=Value&gt;-&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_k_pep_end],Reference=Value&gt;)+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_k_pep_end],Reference=Value&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_454" name="PK_native" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[scale_gly],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_Vmax],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_alpha_inp],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[pep],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_n],Reference=Value&gt;/(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_pep_inp],Reference=Value&gt;^&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_n],Reference=Value&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[pep],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_n],Reference=Value&gt;)*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[adp],Reference=Concentration&gt;/(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[adp],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_k_adp],Reference=Value&gt;)*(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_base_act],Reference=Value&gt;+(1-&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_base_act],Reference=Value&gt;)*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_f],Reference=Value&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_455" name="PK_phospho" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[scale_gly],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_Vmax],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_alpha_p_inp],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[pep],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_n_p],Reference=Value&gt;/(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_pep_p_inp],Reference=Value&gt;^&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_n_p],Reference=Value&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[pep],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_n_p],Reference=Value&gt;)*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[adp],Reference=Concentration&gt;/(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[cyto],Vector=Metabolites[adp],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_k_adp],Reference=Value&gt;)*(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_base_act_p],Reference=Value&gt;+(1-&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_base_act_p],Reference=Value&gt;)*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PK_f_p],Reference=Value&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_456" name="PEPCK_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_457" name="PEPCK_k_pep" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_458" name="PEPCK_k_gdp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_459" name="PEPCK_k_co2" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_460" name="PEPCK_k_oaa" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_461" name="PEPCK_k_gtp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_462" name="PEPCK_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_463" name="PEPCKM_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_464" name="PC_k_atp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_465" name="PC_k_pyr" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_466" name="PC_k_co2" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_467" name="PC_k_acoa" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_468" name="PC_n" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_469" name="PC_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_470" name="LDH_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_471" name="LDH_k_pyr" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_472" name="LDH_k_lac" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_473" name="LDH_k_nad" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_474" name="LDH_k_nadh" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_475" name="LDH_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_476" name="LACT_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_477" name="LACT_k_lac" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_478" name="LACT_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_479" name="PYRTM_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_480" name="PYRTM_k_pyr" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_481" name="PYRTM_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_482" name="PEPTM_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_483" name="PEPTM_k_pep" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_484" name="PEPTM_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_485" name="PDH_k_pyr" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_486" name="PDH_k_coa" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_487" name="PDH_k_nad" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_488" name="PDH_ki_acoa" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_489" name="PDH_ki_nadh" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_490" name="PDH_alpha_nat" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_491" name="PDH_alpha_p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_492" name="PDH_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_493" name="PDH_base" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[scale_gly],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PDH_Vmax],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[mito],Vector=Metabolites[pyr_mito],Reference=Concentration&gt;/(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[mito],Vector=Metabolites[pyr_mito],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PDH_k_pyr],Reference=Value&gt;)*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[mito],Vector=Metabolites[nad_mito],Reference=Concentration&gt;/(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[mito],Vector=Metabolites[nad_mito],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PDH_k_nad],Reference=Value&gt;*(1+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[mito],Vector=Metabolites[nadh_mito],Reference=Concentration&gt;/&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PDH_ki_nadh],Reference=Value&gt;))*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[mito],Vector=Metabolites[coa_mito],Reference=Concentration&gt;/(&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[mito],Vector=Metabolites[coa_mito],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PDH_k_coa],Reference=Value&gt;*(1+&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[mito],Vector=Metabolites[acoa_mito],Reference=Concentration&gt;/&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PDH_ki_acoa],Reference=Value&gt;))
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_494" name="PDH_nat" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PDH_base],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PDH_alpha_nat],Reference=Value&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_495" name="PDH_p" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PDH_base],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[PDH_alpha_p],Reference=Value&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_496" name="CS_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_497" name="CS_k_oaa" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_498" name="CS_k_acoa" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_499" name="CS_k_cit" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_500" name="CS_k_coa" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_501" name="CS_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_502" name="NDKGTPM_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_503" name="NDKGTPM_k_atp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_504" name="NDKGTPM_k_adp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_505" name="NDKGTPM_k_gtp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_506" name="NDKGTPM_k_gdp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_507" name="NDKGTPM_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_508" name="OAAFLX_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_509" name="ACOAFLX_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_510" name="CITFLX_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_511" name="HGP" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Reactions[GLUT2 glucose transporter],Reference=Flux&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[conversion_factor],Reference=Value&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_512" name="GNG" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Reactions[D-Glucose-6-phosphate Isomerase],Reference=Flux&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[conversion_factor],Reference=Value&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_513" name="GLY" simulationType="assignment">
        <Expression>
          -&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Reactions[Glucose 1-phosphate 1\,6-phosphomutase],Reference=Flux&gt;*&lt;CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[conversion_factor],Reference=Value&gt;
        </Expression>
      </ModelValue>
    </ListOfModelValues>
    <ListOfReactions>
      <Reaction key="Reaction_36" name="GLUT2 glucose transporter" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_80" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_66" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_450" name="GLUT2_Vmax" value="1"/>
          <Constant key="Parameter_467" name="GLUT2_keq" value="1"/>
          <Constant key="Parameter_466" name="GLUT2_km" value="1"/>
          <Constant key="Parameter_465" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_42">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_275">
              <SourceParameter reference="ModelValue_300"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_274">
              <SourceParameter reference="ModelValue_298"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_273">
              <SourceParameter reference="ModelValue_299"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_272">
              <SourceParameter reference="Metabolite_66"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_271">
              <SourceParameter reference="Metabolite_80"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_270">
              <SourceParameter reference="ModelValue_296"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_37" name="Glucokinase" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_66" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_49" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_67" stoichiometry="1"/>
          <Product metabolite="Metabolite_50" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_464" name="GK_Vmax" value="1"/>
          <Constant key="Parameter_463" name="GK_gc_free" value="1"/>
          <Constant key="Parameter_462" name="GK_km_atp" value="1"/>
          <Constant key="Parameter_479" name="GK_km_glc" value="1"/>
          <Constant key="Parameter_478" name="GK_n" value="1"/>
          <Constant key="Parameter_477" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_43">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_293">
              <SourceParameter reference="ModelValue_308"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_292">
              <SourceParameter reference="ModelValue_309"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_291">
              <SourceParameter reference="ModelValue_307"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_290">
              <SourceParameter reference="ModelValue_306"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_289">
              <SourceParameter reference="ModelValue_305"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_288">
              <SourceParameter reference="Metabolite_49"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_287">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_286">
              <SourceParameter reference="Metabolite_66"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_285">
              <SourceParameter reference="ModelValue_296"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_38" name="D-Glucose-6-phosphate Phosphatase" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_67" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_61" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_66" stoichiometry="1"/>
          <Product metabolite="Metabolite_58" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_476" name="G6PASE_Vmax" value="1"/>
          <Constant key="Parameter_475" name="G6PASE_km_glc6p" value="1"/>
          <Constant key="Parameter_474" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_44">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_303">
              <SourceParameter reference="ModelValue_311"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_267">
              <SourceParameter reference="ModelValue_310"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_268">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_269">
              <SourceParameter reference="Metabolite_67"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_283">
              <SourceParameter reference="ModelValue_296"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_39" name="D-Glucose-6-phosphate Isomerase" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_67" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_68" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_491" name="GPI_Vmax" value="1"/>
          <Constant key="Parameter_490" name="GPI_keq" value="1"/>
          <Constant key="Parameter_489" name="GPI_km_fru6p" value="1"/>
          <Constant key="Parameter_488" name="GPI_km_glc6p" value="1"/>
          <Constant key="Parameter_487" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_45">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_319">
              <SourceParameter reference="ModelValue_315"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_318">
              <SourceParameter reference="ModelValue_312"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_317">
              <SourceParameter reference="ModelValue_314"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_316">
              <SourceParameter reference="ModelValue_313"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_315">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_314">
              <SourceParameter reference="Metabolite_68"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_313">
              <SourceParameter reference="Metabolite_67"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_312">
              <SourceParameter reference="ModelValue_296"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_40" name="Glucose 1-phosphate 1,6-phosphomutase" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_63" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_67" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_486" name="G16PI_Vmax" value="1"/>
          <Constant key="Parameter_503" name="G16PI_keq" value="1"/>
          <Constant key="Parameter_502" name="G16PI_km_glc1p" value="1"/>
          <Constant key="Parameter_501" name="G16PI_km_glc6p" value="1"/>
          <Constant key="Parameter_500" name="scale_glyglc" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_46">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_335">
              <SourceParameter reference="ModelValue_319"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_334">
              <SourceParameter reference="ModelValue_316"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_333">
              <SourceParameter reference="ModelValue_318"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_332">
              <SourceParameter reference="ModelValue_317"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_331">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_330">
              <SourceParameter reference="Metabolite_63"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_329">
              <SourceParameter reference="Metabolite_67"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_328">
              <SourceParameter reference="ModelValue_297"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_41" name="UTP:Glucose-1-phosphate uridylyltransferase" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_52" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_63" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_64" stoichiometry="1"/>
          <Product metabolite="Metabolite_59" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_499" name="UPGASE_Vmax" value="1"/>
          <Constant key="Parameter_498" name="UPGASE_keq" value="1"/>
          <Constant key="Parameter_515" name="UPGASE_km_glc1p" value="1"/>
          <Constant key="Parameter_514" name="UPGASE_km_pp" value="1"/>
          <Constant key="Parameter_513" name="UPGASE_km_udpglc" value="1"/>
          <Constant key="Parameter_512" name="UPGASE_km_utp" value="1"/>
          <Constant key="Parameter_511" name="scale_glyglc" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_47">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_359">
              <SourceParameter reference="ModelValue_325"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_358">
              <SourceParameter reference="ModelValue_320"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_357">
              <SourceParameter reference="ModelValue_322"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_356">
              <SourceParameter reference="ModelValue_324"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_355">
              <SourceParameter reference="ModelValue_323"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_354">
              <SourceParameter reference="ModelValue_321"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_353">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_352">
              <SourceParameter reference="Metabolite_63"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_351">
              <SourceParameter reference="Metabolite_59"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_350">
              <SourceParameter reference="ModelValue_297"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_349">
              <SourceParameter reference="Metabolite_64"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_348">
              <SourceParameter reference="Metabolite_52"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_42" name="Pyrophosphate phosphohydrolase" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_59" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_61" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_58" stoichiometry="2"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_510" name="PPASE_Vmax" value="1"/>
          <Constant key="Parameter_527" name="PPASE_km_pp" value="1"/>
          <Constant key="Parameter_526" name="scale_glyglc" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_48">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_284">
              <SourceParameter reference="ModelValue_327"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_346">
              <SourceParameter reference="ModelValue_326"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_345">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_311">
              <SourceParameter reference="Metabolite_59"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_347">
              <SourceParameter reference="ModelValue_297"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_43" name="Glycogen synthase" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_64" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_53" stoichiometry="1"/>
          <Product metabolite="Metabolite_65" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_525" name="GS_native" value="1"/>
          <Constant key="Parameter_524" name="GS_phospho" value="1"/>
          <Constant key="Parameter_523" name="gamma" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_49">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_377">
              <SourceParameter reference="ModelValue_338"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_376">
              <SourceParameter reference="ModelValue_339"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_375">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_310">
              <SourceParameter reference="ModelValue_294"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_44" name="Glycogen-Phosphorylase" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_65" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_58" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_63" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_522" name="GP_native" value="1"/>
          <Constant key="Parameter_539" name="GP_phospho" value="1"/>
          <Constant key="Parameter_538" name="gamma" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_50">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_385">
              <SourceParameter reference="ModelValue_356"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_384">
              <SourceParameter reference="ModelValue_358"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_383">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_382">
              <SourceParameter reference="ModelValue_294"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_45" name="Nucleoside-diphosphate kinase (ATP, GTP)" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_49" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_55" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_50" stoichiometry="1"/>
          <Product metabolite="Metabolite_54" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_537" name="NDKGTP_Vmax" value="1"/>
          <Constant key="Parameter_536" name="NDKGTP_keq" value="1"/>
          <Constant key="Parameter_535" name="NDKGTP_km_adp" value="1"/>
          <Constant key="Parameter_534" name="NDKGTP_km_atp" value="1"/>
          <Constant key="Parameter_551" name="NDKGTP_km_gdp" value="1"/>
          <Constant key="Parameter_550" name="NDKGTP_km_gtp" value="1"/>
          <Constant key="Parameter_549" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_51">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_409">
              <SourceParameter reference="ModelValue_364"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_408">
              <SourceParameter reference="ModelValue_359"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_407">
              <SourceParameter reference="ModelValue_361"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_406">
              <SourceParameter reference="ModelValue_360"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_405">
              <SourceParameter reference="ModelValue_363"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_404">
              <SourceParameter reference="ModelValue_362"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_403">
              <SourceParameter reference="Metabolite_50"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_402">
              <SourceParameter reference="Metabolite_49"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_401">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_400">
              <SourceParameter reference="Metabolite_55"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_399">
              <SourceParameter reference="Metabolite_54"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_398">
              <SourceParameter reference="ModelValue_296"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_46" name="Nucleoside-diphosphate kinase (ATP, UTP)" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_49" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_53" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_50" stoichiometry="1"/>
          <Product metabolite="Metabolite_52" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_548" name="NDKUTP_Vmax" value="1"/>
          <Constant key="Parameter_547" name="NDKUTP_keq" value="1"/>
          <Constant key="Parameter_546" name="NDKUTP_km_adp" value="1"/>
          <Constant key="Parameter_563" name="NDKUTP_km_atp" value="1"/>
          <Constant key="Parameter_562" name="NDKUTP_km_udp" value="1"/>
          <Constant key="Parameter_561" name="NDKUTP_km_utp" value="1"/>
          <Constant key="Parameter_560" name="scale_glyglc" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_52">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_433">
              <SourceParameter reference="ModelValue_370"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_432">
              <SourceParameter reference="ModelValue_365"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_431">
              <SourceParameter reference="ModelValue_367"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_430">
              <SourceParameter reference="ModelValue_366"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_429">
              <SourceParameter reference="ModelValue_369"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_428">
              <SourceParameter reference="ModelValue_368"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_427">
              <SourceParameter reference="Metabolite_50"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_426">
              <SourceParameter reference="Metabolite_49"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_425">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_424">
              <SourceParameter reference="ModelValue_297"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_423">
              <SourceParameter reference="Metabolite_53"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_422">
              <SourceParameter reference="Metabolite_52"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_47" name="ATP:AMP phosphotransferase (Adenylatkinase)" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_49" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_51" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_50" stoichiometry="2"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_559" name="AK_Vmax" value="1"/>
          <Constant key="Parameter_558" name="AK_keq" value="1"/>
          <Constant key="Parameter_575" name="AK_km_adp" value="1"/>
          <Constant key="Parameter_574" name="AK_km_amp" value="1"/>
          <Constant key="Parameter_573" name="AK_km_atp" value="1"/>
          <Constant key="Parameter_572" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_53">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_453">
              <SourceParameter reference="ModelValue_375"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_452">
              <SourceParameter reference="ModelValue_371"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_451">
              <SourceParameter reference="ModelValue_374"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_450">
              <SourceParameter reference="ModelValue_373"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_449">
              <SourceParameter reference="ModelValue_372"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_448">
              <SourceParameter reference="Metabolite_50"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_447">
              <SourceParameter reference="Metabolite_51"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_446">
              <SourceParameter reference="Metabolite_49"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_393">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_265">
              <SourceParameter reference="ModelValue_296"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_48" name="ATP:D-fructose-6-phosphate 2-phosphotransferase" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_68" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_49" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_70" stoichiometry="1"/>
          <Product metabolite="Metabolite_50" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_571" name="PFK2_native" value="1"/>
          <Constant key="Parameter_570" name="PFK2_phospho" value="1"/>
          <Constant key="Parameter_587" name="gamma" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_54">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_391">
              <SourceParameter reference="ModelValue_383"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_258">
              <SourceParameter reference="ModelValue_384"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_309">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_394">
              <SourceParameter reference="ModelValue_294"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_49" name="D-Fructose-2,6-bisphosphate 2-phosphohydrolase" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_70" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_68" stoichiometry="1"/>
          <Product metabolite="Metabolite_58" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_586" name="FBP2_native" value="1"/>
          <Constant key="Parameter_585" name="FBP2_phospho" value="1"/>
          <Constant key="Parameter_584" name="gamma" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_55">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_469">
              <SourceParameter reference="ModelValue_390"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_468">
              <SourceParameter reference="ModelValue_391"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_467">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_466">
              <SourceParameter reference="ModelValue_294"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_50" name="ATP:D-fructose-6-phosphate 1-phosphotransferase" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_68" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_49" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_69" stoichiometry="1"/>
          <Product metabolite="Metabolite_50" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_70" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_583" name="PFK1_Vmax" value="1"/>
          <Constant key="Parameter_582" name="PFK1_ka_fru26bp" value="1"/>
          <Constant key="Parameter_599" name="PFK1_ki_fru6p" value="1"/>
          <Constant key="Parameter_598" name="PFK1_km_atp" value="1"/>
          <Constant key="Parameter_597" name="PFK1_km_fru6p" value="1"/>
          <Constant key="Parameter_596" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_56">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_489">
              <SourceParameter reference="ModelValue_396"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_488">
              <SourceParameter reference="ModelValue_395"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_487">
              <SourceParameter reference="ModelValue_394"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_486">
              <SourceParameter reference="ModelValue_392"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_485">
              <SourceParameter reference="ModelValue_393"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_484">
              <SourceParameter reference="Metabolite_49"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_483">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_482">
              <SourceParameter reference="Metabolite_70"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_481">
              <SourceParameter reference="Metabolite_68"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_480">
              <SourceParameter reference="ModelValue_296"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_51" name="D-Fructose-1,6-bisphosphate 1-phosphohydrolase" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_69" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_61" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_68" stoichiometry="1"/>
          <Product metabolite="Metabolite_58" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_70" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_595" name="FBP1_Vmax" value="1"/>
          <Constant key="Parameter_594" name="FBP1_ki_fru26bp" value="1"/>
          <Constant key="Parameter_611" name="FBP1_km_fru16bp" value="1"/>
          <Constant key="Parameter_610" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_57">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_503">
              <SourceParameter reference="ModelValue_399"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_502">
              <SourceParameter reference="ModelValue_397"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_501">
              <SourceParameter reference="ModelValue_398"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_500">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_395">
              <SourceParameter reference="Metabolite_69"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_396">
              <SourceParameter reference="Metabolite_70"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_476">
              <SourceParameter reference="ModelValue_296"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_52" name="Aldolase" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_69" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_71" stoichiometry="1"/>
          <Product metabolite="Metabolite_72" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_609" name="ALD_Vmax" value="1"/>
          <Constant key="Parameter_608" name="ALD_keq" value="1"/>
          <Constant key="Parameter_607" name="ALD_ki1_grap" value="1"/>
          <Constant key="Parameter_606" name="ALD_ki2_grap" value="1"/>
          <Constant key="Parameter_623" name="ALD_km_dhap" value="1"/>
          <Constant key="Parameter_622" name="ALD_km_fru16bp" value="1"/>
          <Constant key="Parameter_621" name="ALD_km_grap" value="1"/>
          <Constant key="Parameter_620" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_58">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_527">
              <SourceParameter reference="ModelValue_406"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_526">
              <SourceParameter reference="ModelValue_400"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_525">
              <SourceParameter reference="ModelValue_404"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_524">
              <SourceParameter reference="ModelValue_405"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_523">
              <SourceParameter reference="ModelValue_402"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_522">
              <SourceParameter reference="ModelValue_401"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_521">
              <SourceParameter reference="ModelValue_403"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_520">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_519">
              <SourceParameter reference="Metabolite_72"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_518">
              <SourceParameter reference="Metabolite_69"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_517">
              <SourceParameter reference="Metabolite_71"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_516">
              <SourceParameter reference="ModelValue_296"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_53" name="Triosephosphate Isomerase" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_72" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_71" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_619" name="TPI_Vmax" value="1"/>
          <Constant key="Parameter_618" name="TPI_keq" value="1"/>
          <Constant key="Parameter_635" name="TPI_km_dhap" value="1"/>
          <Constant key="Parameter_634" name="TPI_km_grap" value="1"/>
          <Constant key="Parameter_633" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_59">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_543">
              <SourceParameter reference="ModelValue_410"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_542">
              <SourceParameter reference="ModelValue_407"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_541">
              <SourceParameter reference="ModelValue_408"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_540">
              <SourceParameter reference="ModelValue_409"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_390">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_474">
              <SourceParameter reference="Metabolite_72"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_511">
              <SourceParameter reference="Metabolite_71"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_514">
              <SourceParameter reference="ModelValue_296"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_54" name="D-Glyceraldehyde-3-phosphate:NAD+ oxidoreductase" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_71" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_58" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_56" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_73" stoichiometry="1"/>
          <Product metabolite="Metabolite_57" stoichiometry="1"/>
          <Product metabolite="Metabolite_62" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_632" name="GAPDH_Vmax" value="1"/>
          <Constant key="Parameter_631" name="GAPDH_k_bpg13" value="1"/>
          <Constant key="Parameter_630" name="GAPDH_k_grap" value="1"/>
          <Constant key="Parameter_647" name="GAPDH_k_nad" value="1"/>
          <Constant key="Parameter_646" name="GAPDH_k_nadh" value="1"/>
          <Constant key="Parameter_645" name="GAPDH_k_p" value="1"/>
          <Constant key="Parameter_644" name="GAPDH_keq" value="1"/>
          <Constant key="Parameter_643" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_60">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_571">
              <SourceParameter reference="ModelValue_417"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_570">
              <SourceParameter reference="ModelValue_416"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_569">
              <SourceParameter reference="ModelValue_413"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_568">
              <SourceParameter reference="ModelValue_412"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_567">
              <SourceParameter reference="ModelValue_415"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_566">
              <SourceParameter reference="ModelValue_414"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_565">
              <SourceParameter reference="ModelValue_411"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_564">
              <SourceParameter reference="Metabolite_73"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_563">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_562">
              <SourceParameter reference="Metabolite_71"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_561">
              <SourceParameter reference="Metabolite_56"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_560">
              <SourceParameter reference="Metabolite_57"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_559">
              <SourceParameter reference="Metabolite_58"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_558">
              <SourceParameter reference="ModelValue_296"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_55" name="Phosphoglycerate Kinase" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_50" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_73" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_49" stoichiometry="1"/>
          <Product metabolite="Metabolite_74" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_642" name="PGK_Vmax" value="1"/>
          <Constant key="Parameter_659" name="PGK_k_adp" value="1"/>
          <Constant key="Parameter_658" name="PGK_k_atp" value="1"/>
          <Constant key="Parameter_657" name="PGK_k_bpg13" value="1"/>
          <Constant key="Parameter_656" name="PGK_k_pg3" value="1"/>
          <Constant key="Parameter_655" name="PGK_keq" value="1"/>
          <Constant key="Parameter_654" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_61">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_595">
              <SourceParameter reference="ModelValue_423"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_594">
              <SourceParameter reference="ModelValue_419"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_593">
              <SourceParameter reference="ModelValue_420"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_592">
              <SourceParameter reference="ModelValue_421"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_591">
              <SourceParameter reference="ModelValue_422"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_590">
              <SourceParameter reference="ModelValue_418"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_589">
              <SourceParameter reference="Metabolite_50"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_588">
              <SourceParameter reference="Metabolite_49"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_587">
              <SourceParameter reference="Metabolite_73"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_586">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_515">
              <SourceParameter reference="Metabolite_74"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_556">
              <SourceParameter reference="ModelValue_296"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_56" name="2-Phospho-D-glycerate 2,3-phosphomutase" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_74" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_75" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_671" name="PGM_Vmax" value="1"/>
          <Constant key="Parameter_670" name="PGM_k_pg2" value="1"/>
          <Constant key="Parameter_669" name="PGM_k_pg3" value="1"/>
          <Constant key="Parameter_668" name="PGM_keq" value="1"/>
          <Constant key="Parameter_667" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_62">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_611">
              <SourceParameter reference="ModelValue_427"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_610">
              <SourceParameter reference="ModelValue_426"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_609">
              <SourceParameter reference="ModelValue_425"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_608">
              <SourceParameter reference="ModelValue_424"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_478">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_553">
              <SourceParameter reference="Metabolite_75"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_555">
              <SourceParameter reference="Metabolite_74"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_477">
              <SourceParameter reference="ModelValue_296"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_57" name="2-Phospho-D-glucerate hydro-lyase (enolase)" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_75" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_76" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_666" name="EN_Vmax" value="1"/>
          <Constant key="Parameter_683" name="EN_k_pep" value="1"/>
          <Constant key="Parameter_682" name="EN_k_pg2" value="1"/>
          <Constant key="Parameter_681" name="EN_keq" value="1"/>
          <Constant key="Parameter_680" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_63">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_627">
              <SourceParameter reference="ModelValue_431"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_626">
              <SourceParameter reference="ModelValue_429"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_625">
              <SourceParameter reference="ModelValue_430"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_624">
              <SourceParameter reference="ModelValue_428"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_623">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_622">
              <SourceParameter reference="Metabolite_76"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_621">
              <SourceParameter reference="Metabolite_75"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_620">
              <SourceParameter reference="ModelValue_296"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_58" name="Pyruvatkinase" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_76" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_50" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_77" stoichiometry="1"/>
          <Product metabolite="Metabolite_49" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_679" name="PK_native" value="1"/>
          <Constant key="Parameter_678" name="PK_phospho" value="1"/>
          <Constant key="Parameter_695" name="gamma" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_64">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_513">
              <SourceParameter reference="ModelValue_454"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_475">
              <SourceParameter reference="ModelValue_455"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_512">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_552">
              <SourceParameter reference="ModelValue_294"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_59" name="PEPCK cyto" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_78" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_54" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_76" stoichiometry="1"/>
          <Product metabolite="Metabolite_55" stoichiometry="1"/>
          <Product metabolite="Metabolite_60" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_694" name="PEPCK_Vmax" value="1"/>
          <Constant key="Parameter_693" name="PEPCK_k_co2" value="1"/>
          <Constant key="Parameter_692" name="PEPCK_k_gdp" value="1"/>
          <Constant key="Parameter_691" name="PEPCK_k_gtp" value="1"/>
          <Constant key="Parameter_690" name="PEPCK_k_oaa" value="1"/>
          <Constant key="Parameter_707" name="PEPCK_k_pep" value="1"/>
          <Constant key="Parameter_706" name="PEPCK_keq" value="1"/>
          <Constant key="Parameter_705" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_65">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_663">
              <SourceParameter reference="ModelValue_462"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_662">
              <SourceParameter reference="ModelValue_459"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_661">
              <SourceParameter reference="ModelValue_458"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_660">
              <SourceParameter reference="ModelValue_461"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_659">
              <SourceParameter reference="ModelValue_460"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_658">
              <SourceParameter reference="ModelValue_457"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_657">
              <SourceParameter reference="ModelValue_456"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_656">
              <SourceParameter reference="Metabolite_60"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_655">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_654">
              <SourceParameter reference="Metabolite_55"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_653">
              <SourceParameter reference="Metabolite_54"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_652">
              <SourceParameter reference="Metabolite_78"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_651">
              <SourceParameter reference="Metabolite_76"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_650">
              <SourceParameter reference="ModelValue_296"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_60" name="PEPCK mito" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_84" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_91" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_85" stoichiometry="1"/>
          <Product metabolite="Metabolite_92" stoichiometry="1"/>
          <Product metabolite="Metabolite_82" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_704" name="PEPCKM_Vmax" value="1"/>
          <Constant key="Parameter_703" name="PEPCK_k_co2" value="1"/>
          <Constant key="Parameter_702" name="PEPCK_k_gdp" value="1"/>
          <Constant key="Parameter_719" name="PEPCK_k_gtp" value="1"/>
          <Constant key="Parameter_718" name="PEPCK_k_oaa" value="1"/>
          <Constant key="Parameter_717" name="PEPCK_k_pep" value="1"/>
          <Constant key="Parameter_716" name="PEPCK_keq" value="1"/>
          <Constant key="Parameter_715" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_66">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_691">
              <SourceParameter reference="ModelValue_463"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_690">
              <SourceParameter reference="ModelValue_459"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_689">
              <SourceParameter reference="ModelValue_458"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_688">
              <SourceParameter reference="ModelValue_461"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_687">
              <SourceParameter reference="ModelValue_460"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_686">
              <SourceParameter reference="ModelValue_457"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_685">
              <SourceParameter reference="ModelValue_456"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_684">
              <SourceParameter reference="Metabolite_82"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_683">
              <SourceParameter reference="Metabolite_92"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_682">
              <SourceParameter reference="Metabolite_91"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_681">
              <SourceParameter reference="Compartment_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_680">
              <SourceParameter reference="Metabolite_84"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_679">
              <SourceParameter reference="Metabolite_85"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_678">
              <SourceParameter reference="ModelValue_296"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_61" name="Pyruvate Carboxylase" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_89" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_87" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_82" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_84" stoichiometry="1"/>
          <Product metabolite="Metabolite_90" stoichiometry="1"/>
          <Product metabolite="Metabolite_83" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_86" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_714" name="PC_Vmax" value="1"/>
          <Constant key="Parameter_731" name="PC_k_acoa" value="1"/>
          <Constant key="Parameter_730" name="PC_k_atp" value="1"/>
          <Constant key="Parameter_729" name="PC_k_co2" value="1"/>
          <Constant key="Parameter_728" name="PC_k_pyr" value="1"/>
          <Constant key="Parameter_727" name="PC_n" value="1"/>
          <Constant key="Parameter_726" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_67">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_715">
              <SourceParameter reference="ModelValue_469"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_714">
              <SourceParameter reference="ModelValue_467"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_713">
              <SourceParameter reference="ModelValue_464"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_712">
              <SourceParameter reference="ModelValue_466"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_711">
              <SourceParameter reference="ModelValue_465"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_710">
              <SourceParameter reference="ModelValue_468"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_709">
              <SourceParameter reference="Metabolite_86"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_708">
              <SourceParameter reference="Metabolite_89"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_707">
              <SourceParameter reference="Metabolite_82"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_706">
              <SourceParameter reference="Compartment_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_642">
              <SourceParameter reference="Metabolite_87"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_648">
              <SourceParameter reference="ModelValue_296"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_62" name="Lactate Dehydrogenase" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_77" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_57" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_79" stoichiometry="1"/>
          <Product metabolite="Metabolite_56" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_743" name="LDH_Vmax" value="1"/>
          <Constant key="Parameter_742" name="LDH_k_lac" value="1"/>
          <Constant key="Parameter_741" name="LDH_k_nad" value="1"/>
          <Constant key="Parameter_740" name="LDH_k_nadh" value="1"/>
          <Constant key="Parameter_739" name="LDH_k_pyr" value="1"/>
          <Constant key="Parameter_738" name="LDH_keq" value="1"/>
          <Constant key="Parameter_755" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_68">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_739">
              <SourceParameter reference="ModelValue_475"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_738">
              <SourceParameter reference="ModelValue_472"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_737">
              <SourceParameter reference="ModelValue_473"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_736">
              <SourceParameter reference="ModelValue_474"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_735">
              <SourceParameter reference="ModelValue_471"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_734">
              <SourceParameter reference="ModelValue_470"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_733">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_732">
              <SourceParameter reference="Metabolite_79"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_731">
              <SourceParameter reference="Metabolite_56"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_730">
              <SourceParameter reference="Metabolite_57"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_729">
              <SourceParameter reference="Metabolite_77"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_728">
              <SourceParameter reference="ModelValue_296"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_63" name="Lactate transport (import)" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_81" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_79" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_754" name="LACT_Vmax" value="1"/>
          <Constant key="Parameter_753" name="LACT_k_lac" value="1"/>
          <Constant key="Parameter_752" name="LACT_keq" value="1"/>
          <Constant key="Parameter_751" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_69">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_649">
              <SourceParameter reference="ModelValue_478"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_554">
              <SourceParameter reference="ModelValue_477"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_641">
              <SourceParameter reference="ModelValue_476"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_646">
              <SourceParameter reference="Metabolite_79"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_647">
              <SourceParameter reference="Metabolite_81"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_479">
              <SourceParameter reference="ModelValue_296"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_64" name="Pyruvate transport (mito)" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_77" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_87" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_750" name="PYRTM_Vmax" value="1"/>
          <Constant key="Parameter_767" name="PYRTM_k_pyr" value="1"/>
          <Constant key="Parameter_766" name="PYRTM_keq" value="1"/>
          <Constant key="Parameter_765" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_70">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_763">
              <SourceParameter reference="ModelValue_481"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_762">
              <SourceParameter reference="ModelValue_480"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_761">
              <SourceParameter reference="ModelValue_479"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_760">
              <SourceParameter reference="Metabolite_77"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_759">
              <SourceParameter reference="Metabolite_87"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_758">
              <SourceParameter reference="ModelValue_296"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_65" name="PEP Transport (export mito)" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_85" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_76" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_764" name="PEPTM_Vmax" value="1"/>
          <Constant key="Parameter_763" name="PEPTM_k_pep" value="1"/>
          <Constant key="Parameter_762" name="PEPTM_keq" value="1"/>
          <Constant key="Parameter_779" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_71">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_775">
              <SourceParameter reference="ModelValue_484"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_774">
              <SourceParameter reference="ModelValue_483"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_773">
              <SourceParameter reference="ModelValue_482"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_772">
              <SourceParameter reference="Metabolite_76"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_771">
              <SourceParameter reference="Metabolite_85"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_770">
              <SourceParameter reference="ModelValue_296"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_66" name="Pyruvate Dehydrogenase" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_87" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_93" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_95" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_86" stoichiometry="1"/>
          <Product metabolite="Metabolite_82" stoichiometry="1"/>
          <Product metabolite="Metabolite_94" stoichiometry="1"/>
          <Product metabolite="Metabolite_97" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_778" name="PDH_nat" value="1"/>
          <Constant key="Parameter_777" name="PDH_p" value="1"/>
          <Constant key="Parameter_776" name="gamma" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_72">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_783">
              <SourceParameter reference="ModelValue_494"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_782">
              <SourceParameter reference="ModelValue_495"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_557">
              <SourceParameter reference="ModelValue_294"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_644">
              <SourceParameter reference="Compartment_5"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_67" name="Citrate Synthase" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_86" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_84" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_96" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_88" stoichiometry="1"/>
          <Product metabolite="Metabolite_93" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_775" name="CS_Vmax" value="1"/>
          <Constant key="Parameter_774" name="CS_k_acoa" value="1"/>
          <Constant key="Parameter_791" name="CS_k_cit" value="1"/>
          <Constant key="Parameter_790" name="CS_k_coa" value="1"/>
          <Constant key="Parameter_789" name="CS_k_oaa" value="1"/>
          <Constant key="Parameter_788" name="CS_keq" value="1"/>
          <Constant key="Parameter_787" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_73">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_807">
              <SourceParameter reference="ModelValue_501"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_806">
              <SourceParameter reference="ModelValue_498"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_805">
              <SourceParameter reference="ModelValue_499"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_804">
              <SourceParameter reference="ModelValue_500"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_803">
              <SourceParameter reference="ModelValue_497"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_802">
              <SourceParameter reference="ModelValue_496"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_801">
              <SourceParameter reference="Metabolite_86"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_800">
              <SourceParameter reference="Metabolite_88"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_799">
              <SourceParameter reference="Metabolite_93"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_798">
              <SourceParameter reference="Compartment_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_797">
              <SourceParameter reference="Metabolite_84"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_796">
              <SourceParameter reference="ModelValue_296"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_68" name="Nucleoside-diphosphate kinase (ATP, GTP) mito" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_89" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_92" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_90" stoichiometry="1"/>
          <Product metabolite="Metabolite_91" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_786" name="NDKGTPM_Vmax" value="1"/>
          <Constant key="Parameter_803" name="NDKGTPM_k_adp" value="1"/>
          <Constant key="Parameter_802" name="NDKGTPM_k_atp" value="1"/>
          <Constant key="Parameter_801" name="NDKGTPM_k_gdp" value="1"/>
          <Constant key="Parameter_800" name="NDKGTPM_k_gtp" value="1"/>
          <Constant key="Parameter_799" name="NDKGTPM_keq" value="1"/>
          <Constant key="Parameter_798" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_74">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_831">
              <SourceParameter reference="ModelValue_507"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_830">
              <SourceParameter reference="ModelValue_504"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_829">
              <SourceParameter reference="ModelValue_503"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_828">
              <SourceParameter reference="ModelValue_506"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_827">
              <SourceParameter reference="ModelValue_505"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_826">
              <SourceParameter reference="ModelValue_502"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_825">
              <SourceParameter reference="Metabolite_90"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_824">
              <SourceParameter reference="Metabolite_89"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_823">
              <SourceParameter reference="Metabolite_92"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_822">
              <SourceParameter reference="Metabolite_91"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_821">
              <SourceParameter reference="Compartment_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_820">
              <SourceParameter reference="ModelValue_296"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_69" name="oxalacetate influx" reversible="false">
        <ListOfProducts>
          <Product metabolite="Metabolite_84" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_815" name="OAAFLX_Vmax" value="1"/>
          <Constant key="Parameter_814" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_75">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_792">
              <SourceParameter reference="ModelValue_508"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_790">
              <SourceParameter reference="Compartment_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_788">
              <SourceParameter reference="ModelValue_296"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_70" name="acetyl-coa efflux" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_86" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_813" name="ACOAFLX_Vmax" value="1"/>
          <Constant key="Parameter_812" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_76">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_789">
              <SourceParameter reference="ModelValue_509"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_793">
              <SourceParameter reference="Compartment_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_795">
              <SourceParameter reference="ModelValue_296"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_71" name="citrate efflux" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_88" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_811" name="CITFLX_Vmax" value="1"/>
          <Constant key="Parameter_810" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_77">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_849">
              <SourceParameter reference="ModelValue_510"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_848">
              <SourceParameter reference="Compartment_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_847">
              <SourceParameter reference="ModelValue_296"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
    </ListOfReactions>
    <StateTemplate>
      <StateTemplateVariable objectReference="Model_1"/>
      <StateTemplateVariable objectReference="Metabolite_68"/>
      <StateTemplateVariable objectReference="Metabolite_76"/>
      <StateTemplateVariable objectReference="Metabolite_84"/>
      <StateTemplateVariable objectReference="Metabolite_67"/>
      <StateTemplateVariable objectReference="Metabolite_71"/>
      <StateTemplateVariable objectReference="Metabolite_77"/>
      <StateTemplateVariable objectReference="Metabolite_63"/>
      <StateTemplateVariable objectReference="Metabolite_87"/>
      <StateTemplateVariable objectReference="Metabolite_72"/>
      <StateTemplateVariable objectReference="Metabolite_74"/>
      <StateTemplateVariable objectReference="Metabolite_53"/>
      <StateTemplateVariable objectReference="Metabolite_66"/>
      <StateTemplateVariable objectReference="Metabolite_55"/>
      <StateTemplateVariable objectReference="Metabolite_91"/>
      <StateTemplateVariable objectReference="Metabolite_59"/>
      <StateTemplateVariable objectReference="Metabolite_79"/>
      <StateTemplateVariable objectReference="Metabolite_69"/>
      <StateTemplateVariable objectReference="Metabolite_75"/>
      <StateTemplateVariable objectReference="Metabolite_85"/>
      <StateTemplateVariable objectReference="Metabolite_52"/>
      <StateTemplateVariable objectReference="Metabolite_73"/>
      <StateTemplateVariable objectReference="Metabolite_70"/>
      <StateTemplateVariable objectReference="Metabolite_78"/>
      <StateTemplateVariable objectReference="Metabolite_54"/>
      <StateTemplateVariable objectReference="Metabolite_64"/>
      <StateTemplateVariable objectReference="Metabolite_92"/>
      <StateTemplateVariable objectReference="ModelValue_275"/>
      <StateTemplateVariable objectReference="ModelValue_276"/>
      <StateTemplateVariable objectReference="ModelValue_281"/>
      <StateTemplateVariable objectReference="ModelValue_282"/>
      <StateTemplateVariable objectReference="ModelValue_287"/>
      <StateTemplateVariable objectReference="ModelValue_288"/>
      <StateTemplateVariable objectReference="ModelValue_294"/>
      <StateTemplateVariable objectReference="ModelValue_309"/>
      <StateTemplateVariable objectReference="ModelValue_335"/>
      <StateTemplateVariable objectReference="ModelValue_336"/>
      <StateTemplateVariable objectReference="ModelValue_337"/>
      <StateTemplateVariable objectReference="ModelValue_338"/>
      <StateTemplateVariable objectReference="ModelValue_339"/>
      <StateTemplateVariable objectReference="ModelValue_354"/>
      <StateTemplateVariable objectReference="ModelValue_355"/>
      <StateTemplateVariable objectReference="ModelValue_356"/>
      <StateTemplateVariable objectReference="ModelValue_357"/>
      <StateTemplateVariable objectReference="ModelValue_358"/>
      <StateTemplateVariable objectReference="ModelValue_383"/>
      <StateTemplateVariable objectReference="ModelValue_384"/>
      <StateTemplateVariable objectReference="ModelValue_390"/>
      <StateTemplateVariable objectReference="ModelValue_391"/>
      <StateTemplateVariable objectReference="ModelValue_448"/>
      <StateTemplateVariable objectReference="ModelValue_449"/>
      <StateTemplateVariable objectReference="ModelValue_450"/>
      <StateTemplateVariable objectReference="ModelValue_451"/>
      <StateTemplateVariable objectReference="ModelValue_452"/>
      <StateTemplateVariable objectReference="ModelValue_453"/>
      <StateTemplateVariable objectReference="ModelValue_454"/>
      <StateTemplateVariable objectReference="ModelValue_455"/>
      <StateTemplateVariable objectReference="ModelValue_493"/>
      <StateTemplateVariable objectReference="ModelValue_494"/>
      <StateTemplateVariable objectReference="ModelValue_495"/>
      <StateTemplateVariable objectReference="ModelValue_264"/>
      <StateTemplateVariable objectReference="ModelValue_265"/>
      <StateTemplateVariable objectReference="ModelValue_266"/>
      <StateTemplateVariable objectReference="ModelValue_267"/>
      <StateTemplateVariable objectReference="ModelValue_268"/>
      <StateTemplateVariable objectReference="ModelValue_269"/>
      <StateTemplateVariable objectReference="ModelValue_270"/>
      <StateTemplateVariable objectReference="ModelValue_511"/>
      <StateTemplateVariable objectReference="ModelValue_512"/>
      <StateTemplateVariable objectReference="ModelValue_513"/>
      <StateTemplateVariable objectReference="Metabolite_80"/>
      <StateTemplateVariable objectReference="Metabolite_81"/>
      <StateTemplateVariable objectReference="Metabolite_49"/>
      <StateTemplateVariable objectReference="Metabolite_50"/>
      <StateTemplateVariable objectReference="Metabolite_51"/>
      <StateTemplateVariable objectReference="Metabolite_56"/>
      <StateTemplateVariable objectReference="Metabolite_57"/>
      <StateTemplateVariable objectReference="Metabolite_58"/>
      <StateTemplateVariable objectReference="Metabolite_60"/>
      <StateTemplateVariable objectReference="Metabolite_61"/>
      <StateTemplateVariable objectReference="Metabolite_62"/>
      <StateTemplateVariable objectReference="Metabolite_65"/>
      <StateTemplateVariable objectReference="Metabolite_82"/>
      <StateTemplateVariable objectReference="Metabolite_83"/>
      <StateTemplateVariable objectReference="Metabolite_86"/>
      <StateTemplateVariable objectReference="Metabolite_88"/>
      <StateTemplateVariable objectReference="Metabolite_89"/>
      <StateTemplateVariable objectReference="Metabolite_90"/>
      <StateTemplateVariable objectReference="Metabolite_93"/>
      <StateTemplateVariable objectReference="Metabolite_94"/>
      <StateTemplateVariable objectReference="Metabolite_95"/>
      <StateTemplateVariable objectReference="Metabolite_96"/>
      <StateTemplateVariable objectReference="Metabolite_97"/>
      <StateTemplateVariable objectReference="Compartment_3"/>
      <StateTemplateVariable objectReference="Compartment_4"/>
      <StateTemplateVariable objectReference="Compartment_5"/>
      <StateTemplateVariable objectReference="ModelValue_258"/>
      <StateTemplateVariable objectReference="ModelValue_259"/>
      <StateTemplateVariable objectReference="ModelValue_260"/>
      <StateTemplateVariable objectReference="ModelValue_261"/>
      <StateTemplateVariable objectReference="ModelValue_262"/>
      <StateTemplateVariable objectReference="ModelValue_263"/>
      <StateTemplateVariable objectReference="ModelValue_271"/>
      <StateTemplateVariable objectReference="ModelValue_272"/>
      <StateTemplateVariable objectReference="ModelValue_273"/>
      <StateTemplateVariable objectReference="ModelValue_274"/>
      <StateTemplateVariable objectReference="ModelValue_277"/>
      <StateTemplateVariable objectReference="ModelValue_278"/>
      <StateTemplateVariable objectReference="ModelValue_279"/>
      <StateTemplateVariable objectReference="ModelValue_280"/>
      <StateTemplateVariable objectReference="ModelValue_283"/>
      <StateTemplateVariable objectReference="ModelValue_284"/>
      <StateTemplateVariable objectReference="ModelValue_285"/>
      <StateTemplateVariable objectReference="ModelValue_286"/>
      <StateTemplateVariable objectReference="ModelValue_289"/>
      <StateTemplateVariable objectReference="ModelValue_290"/>
      <StateTemplateVariable objectReference="ModelValue_291"/>
      <StateTemplateVariable objectReference="ModelValue_292"/>
      <StateTemplateVariable objectReference="ModelValue_293"/>
      <StateTemplateVariable objectReference="ModelValue_295"/>
      <StateTemplateVariable objectReference="ModelValue_296"/>
      <StateTemplateVariable objectReference="ModelValue_297"/>
      <StateTemplateVariable objectReference="ModelValue_298"/>
      <StateTemplateVariable objectReference="ModelValue_299"/>
      <StateTemplateVariable objectReference="ModelValue_300"/>
      <StateTemplateVariable objectReference="ModelValue_301"/>
      <StateTemplateVariable objectReference="ModelValue_302"/>
      <StateTemplateVariable objectReference="ModelValue_303"/>
      <StateTemplateVariable objectReference="ModelValue_304"/>
      <StateTemplateVariable objectReference="ModelValue_305"/>
      <StateTemplateVariable objectReference="ModelValue_306"/>
      <StateTemplateVariable objectReference="ModelValue_307"/>
      <StateTemplateVariable objectReference="ModelValue_308"/>
      <StateTemplateVariable objectReference="ModelValue_310"/>
      <StateTemplateVariable objectReference="ModelValue_311"/>
      <StateTemplateVariable objectReference="ModelValue_312"/>
      <StateTemplateVariable objectReference="ModelValue_313"/>
      <StateTemplateVariable objectReference="ModelValue_314"/>
      <StateTemplateVariable objectReference="ModelValue_315"/>
      <StateTemplateVariable objectReference="ModelValue_316"/>
      <StateTemplateVariable objectReference="ModelValue_317"/>
      <StateTemplateVariable objectReference="ModelValue_318"/>
      <StateTemplateVariable objectReference="ModelValue_319"/>
      <StateTemplateVariable objectReference="ModelValue_320"/>
      <StateTemplateVariable objectReference="ModelValue_321"/>
      <StateTemplateVariable objectReference="ModelValue_322"/>
      <StateTemplateVariable objectReference="ModelValue_323"/>
      <StateTemplateVariable objectReference="ModelValue_324"/>
      <StateTemplateVariable objectReference="ModelValue_325"/>
      <StateTemplateVariable objectReference="ModelValue_326"/>
      <StateTemplateVariable objectReference="ModelValue_327"/>
      <StateTemplateVariable objectReference="ModelValue_328"/>
      <StateTemplateVariable objectReference="ModelValue_329"/>
      <StateTemplateVariable objectReference="ModelValue_330"/>
      <StateTemplateVariable objectReference="ModelValue_331"/>
      <StateTemplateVariable objectReference="ModelValue_332"/>
      <StateTemplateVariable objectReference="ModelValue_333"/>
      <StateTemplateVariable objectReference="ModelValue_334"/>
      <StateTemplateVariable objectReference="ModelValue_340"/>
      <StateTemplateVariable objectReference="ModelValue_341"/>
      <StateTemplateVariable objectReference="ModelValue_342"/>
      <StateTemplateVariable objectReference="ModelValue_343"/>
      <StateTemplateVariable objectReference="ModelValue_344"/>
      <StateTemplateVariable objectReference="ModelValue_345"/>
      <StateTemplateVariable objectReference="ModelValue_346"/>
      <StateTemplateVariable objectReference="ModelValue_347"/>
      <StateTemplateVariable objectReference="ModelValue_348"/>
      <StateTemplateVariable objectReference="ModelValue_349"/>
      <StateTemplateVariable objectReference="ModelValue_350"/>
      <StateTemplateVariable objectReference="ModelValue_351"/>
      <StateTemplateVariable objectReference="ModelValue_352"/>
      <StateTemplateVariable objectReference="ModelValue_353"/>
      <StateTemplateVariable objectReference="ModelValue_359"/>
      <StateTemplateVariable objectReference="ModelValue_360"/>
      <StateTemplateVariable objectReference="ModelValue_361"/>
      <StateTemplateVariable objectReference="ModelValue_362"/>
      <StateTemplateVariable objectReference="ModelValue_363"/>
      <StateTemplateVariable objectReference="ModelValue_364"/>
      <StateTemplateVariable objectReference="ModelValue_365"/>
      <StateTemplateVariable objectReference="ModelValue_366"/>
      <StateTemplateVariable objectReference="ModelValue_367"/>
      <StateTemplateVariable objectReference="ModelValue_368"/>
      <StateTemplateVariable objectReference="ModelValue_369"/>
      <StateTemplateVariable objectReference="ModelValue_370"/>
      <StateTemplateVariable objectReference="ModelValue_371"/>
      <StateTemplateVariable objectReference="ModelValue_372"/>
      <StateTemplateVariable objectReference="ModelValue_373"/>
      <StateTemplateVariable objectReference="ModelValue_374"/>
      <StateTemplateVariable objectReference="ModelValue_375"/>
      <StateTemplateVariable objectReference="ModelValue_376"/>
      <StateTemplateVariable objectReference="ModelValue_377"/>
      <StateTemplateVariable objectReference="ModelValue_378"/>
      <StateTemplateVariable objectReference="ModelValue_379"/>
      <StateTemplateVariable objectReference="ModelValue_380"/>
      <StateTemplateVariable objectReference="ModelValue_381"/>
      <StateTemplateVariable objectReference="ModelValue_382"/>
      <StateTemplateVariable objectReference="ModelValue_385"/>
      <StateTemplateVariable objectReference="ModelValue_386"/>
      <StateTemplateVariable objectReference="ModelValue_387"/>
      <StateTemplateVariable objectReference="ModelValue_388"/>
      <StateTemplateVariable objectReference="ModelValue_389"/>
      <StateTemplateVariable objectReference="ModelValue_392"/>
      <StateTemplateVariable objectReference="ModelValue_393"/>
      <StateTemplateVariable objectReference="ModelValue_394"/>
      <StateTemplateVariable objectReference="ModelValue_395"/>
      <StateTemplateVariable objectReference="ModelValue_396"/>
      <StateTemplateVariable objectReference="ModelValue_397"/>
      <StateTemplateVariable objectReference="ModelValue_398"/>
      <StateTemplateVariable objectReference="ModelValue_399"/>
      <StateTemplateVariable objectReference="ModelValue_400"/>
      <StateTemplateVariable objectReference="ModelValue_401"/>
      <StateTemplateVariable objectReference="ModelValue_402"/>
      <StateTemplateVariable objectReference="ModelValue_403"/>
      <StateTemplateVariable objectReference="ModelValue_404"/>
      <StateTemplateVariable objectReference="ModelValue_405"/>
      <StateTemplateVariable objectReference="ModelValue_406"/>
      <StateTemplateVariable objectReference="ModelValue_407"/>
      <StateTemplateVariable objectReference="ModelValue_408"/>
      <StateTemplateVariable objectReference="ModelValue_409"/>
      <StateTemplateVariable objectReference="ModelValue_410"/>
      <StateTemplateVariable objectReference="ModelValue_411"/>
      <StateTemplateVariable objectReference="ModelValue_412"/>
      <StateTemplateVariable objectReference="ModelValue_413"/>
      <StateTemplateVariable objectReference="ModelValue_414"/>
      <StateTemplateVariable objectReference="ModelValue_415"/>
      <StateTemplateVariable objectReference="ModelValue_416"/>
      <StateTemplateVariable objectReference="ModelValue_417"/>
      <StateTemplateVariable objectReference="ModelValue_418"/>
      <StateTemplateVariable objectReference="ModelValue_419"/>
      <StateTemplateVariable objectReference="ModelValue_420"/>
      <StateTemplateVariable objectReference="ModelValue_421"/>
      <StateTemplateVariable objectReference="ModelValue_422"/>
      <StateTemplateVariable objectReference="ModelValue_423"/>
      <StateTemplateVariable objectReference="ModelValue_424"/>
      <StateTemplateVariable objectReference="ModelValue_425"/>
      <StateTemplateVariable objectReference="ModelValue_426"/>
      <StateTemplateVariable objectReference="ModelValue_427"/>
      <StateTemplateVariable objectReference="ModelValue_428"/>
      <StateTemplateVariable objectReference="ModelValue_429"/>
      <StateTemplateVariable objectReference="ModelValue_430"/>
      <StateTemplateVariable objectReference="ModelValue_431"/>
      <StateTemplateVariable objectReference="ModelValue_432"/>
      <StateTemplateVariable objectReference="ModelValue_433"/>
      <StateTemplateVariable objectReference="ModelValue_434"/>
      <StateTemplateVariable objectReference="ModelValue_435"/>
      <StateTemplateVariable objectReference="ModelValue_436"/>
      <StateTemplateVariable objectReference="ModelValue_437"/>
      <StateTemplateVariable objectReference="ModelValue_438"/>
      <StateTemplateVariable objectReference="ModelValue_439"/>
      <StateTemplateVariable objectReference="ModelValue_440"/>
      <StateTemplateVariable objectReference="ModelValue_441"/>
      <StateTemplateVariable objectReference="ModelValue_442"/>
      <StateTemplateVariable objectReference="ModelValue_443"/>
      <StateTemplateVariable objectReference="ModelValue_444"/>
      <StateTemplateVariable objectReference="ModelValue_445"/>
      <StateTemplateVariable objectReference="ModelValue_446"/>
      <StateTemplateVariable objectReference="ModelValue_447"/>
      <StateTemplateVariable objectReference="ModelValue_456"/>
      <StateTemplateVariable objectReference="ModelValue_457"/>
      <StateTemplateVariable objectReference="ModelValue_458"/>
      <StateTemplateVariable objectReference="ModelValue_459"/>
      <StateTemplateVariable objectReference="ModelValue_460"/>
      <StateTemplateVariable objectReference="ModelValue_461"/>
      <StateTemplateVariable objectReference="ModelValue_462"/>
      <StateTemplateVariable objectReference="ModelValue_463"/>
      <StateTemplateVariable objectReference="ModelValue_464"/>
      <StateTemplateVariable objectReference="ModelValue_465"/>
      <StateTemplateVariable objectReference="ModelValue_466"/>
      <StateTemplateVariable objectReference="ModelValue_467"/>
      <StateTemplateVariable objectReference="ModelValue_468"/>
      <StateTemplateVariable objectReference="ModelValue_469"/>
      <StateTemplateVariable objectReference="ModelValue_470"/>
      <StateTemplateVariable objectReference="ModelValue_471"/>
      <StateTemplateVariable objectReference="ModelValue_472"/>
      <StateTemplateVariable objectReference="ModelValue_473"/>
      <StateTemplateVariable objectReference="ModelValue_474"/>
      <StateTemplateVariable objectReference="ModelValue_475"/>
      <StateTemplateVariable objectReference="ModelValue_476"/>
      <StateTemplateVariable objectReference="ModelValue_477"/>
      <StateTemplateVariable objectReference="ModelValue_478"/>
      <StateTemplateVariable objectReference="ModelValue_479"/>
      <StateTemplateVariable objectReference="ModelValue_480"/>
      <StateTemplateVariable objectReference="ModelValue_481"/>
      <StateTemplateVariable objectReference="ModelValue_482"/>
      <StateTemplateVariable objectReference="ModelValue_483"/>
      <StateTemplateVariable objectReference="ModelValue_484"/>
      <StateTemplateVariable objectReference="ModelValue_485"/>
      <StateTemplateVariable objectReference="ModelValue_486"/>
      <StateTemplateVariable objectReference="ModelValue_487"/>
      <StateTemplateVariable objectReference="ModelValue_488"/>
      <StateTemplateVariable objectReference="ModelValue_489"/>
      <StateTemplateVariable objectReference="ModelValue_490"/>
      <StateTemplateVariable objectReference="ModelValue_491"/>
      <StateTemplateVariable objectReference="ModelValue_492"/>
      <StateTemplateVariable objectReference="ModelValue_496"/>
      <StateTemplateVariable objectReference="ModelValue_497"/>
      <StateTemplateVariable objectReference="ModelValue_498"/>
      <StateTemplateVariable objectReference="ModelValue_499"/>
      <StateTemplateVariable objectReference="ModelValue_500"/>
      <StateTemplateVariable objectReference="ModelValue_501"/>
      <StateTemplateVariable objectReference="ModelValue_502"/>
      <StateTemplateVariable objectReference="ModelValue_503"/>
      <StateTemplateVariable objectReference="ModelValue_504"/>
      <StateTemplateVariable objectReference="ModelValue_505"/>
      <StateTemplateVariable objectReference="ModelValue_506"/>
      <StateTemplateVariable objectReference="ModelValue_507"/>
      <StateTemplateVariable objectReference="ModelValue_508"/>
      <StateTemplateVariable objectReference="ModelValue_509"/>
      <StateTemplateVariable objectReference="ModelValue_510"/>
    </StateTemplate>
    <InitialState type="initialState">
      0 3.011070895000001e+19 9.033212685000003e+19 1.204428358e+18 7.226570148e+19 6.022141790000001e+19 6.022141790000001e+19 7.226570148000001e+18 1.204428358e+19 1.806642537e+19 1.6259782833e+20 5.419927611000001e+19 3.011070895e+21 6.022141790000001e+19 3.4928422382e+19 4.817713432000005e+18 3.011070895e+20 1.204428358e+19 1.806642537e+19 1.806642537e+19 1.6259782833e+20 1.806642537000001e+20 2.408856716000003e+18 6.022141790000001e+18 1.7464211191e+20 2.2884138802e+20 1.204428358e+19 9.706621497248314 9.706621497248314 114.7598203860621 76.8598203860621 3504.875214827858 3404.875214827858 0.8644139472762336 0.04166666666666668 0.8571428571428571 0.8284023668639054 14.28027961386657 0.05929907522699607 0.004887842847783424 0.8571428571428571 0.006532019704433496 0.0001050600852111092 0.04857142857142856 0.02402437204677426 5.184858701760345e-05 2.840579710144927e-05 3.925233644859814e-05 0.0003111111111111111 0.9998319304726325 0.9993126627543607 1 1.000068733724564 0.08008403476368374 0.08070108399055208 0.1787973046197269 0.1782336060057756 0.08550564033386732 0.4275282016693366 0.08550564033386732 1.22056 3.76 0.74 0.39 1.22 3.6 0.39 20.42037700287336 12.65474016259248 7.765636840282007 1.806642537e+22 7.226570148000002e+21 1.6861997012e+21 4.817713432000001e+20 9.635426864000002e+19 7.347012983800001e+20 3.3723994024e+17 3.011070895e+21 3.011070895e+21 0 0 1.5055354475e+23 6.022141790000001e+20 6.022141790000001e+20 4.817713432000001e+18 3.854170745600001e+19 3.3723994024e+20 9.635426864000003e+19 6.624355969000003e+18 2.8906280592e+19 1.180339790840001e+20 0 0 10 1 0.2 1 1.5 0.583333333333334 70 60 750.0000000000009 818.9 0 8.6 4.2 190 37.9 3.01 6.4 6090 100 3.1 8.4 0.1 0.8 81.89 15.21 599 0.01666666666666667 0.01666666666666667 0.01666666666666667 1 42 420 2 15 0.01 0.7 1.6 7.5 0.26 25.2 2 18.9 0.517060817492925 0.182 0.07099999999999999 420 15.7175540821514 0.67 0.045 100 0.312237619153088 0.5629999999999999 0.172 0.049 0.166 80 0.005 2.4 500 0.2 0.224 0.1504 3.003 0.09029 13.2 0.211826505793075 4.8 2.7 120 2 300 5 5 1 0.03 0.3 6.8 500 0.2 1 1.33 0.042 0.15 0.031 0 1 1.33 0.042 16 0.19 2940 0.247390074904985 0.09 0.08 0.11 0 1.3 2.1 0.016 0.05 0.28 0.65 0.0042 0.01 0.0035 0.0005 0.01 0.126 0.111 0.077 0.012 0.001 7.182 0.001 0.0013 4.326 9.76298897362969e-05 0.0071 0.0364 0.0071 0.0572 0.176 420 0.054476985386756 0.59 0.42 420 0.086779866194594 0.05 0.005 3.9 0.0083 0.0035 420 6.95864405248854 0.35 0.48 0.002 1.2 420 0.181375378837397 5 1 420 0.054476985386756 1 1 35.994 3.5 3.5 1.8 1.8 1 1.1 1 0.00016 0.00035 0.58 1.1 0.08 2.3 0.08 0.04 46.2 336.956521586429 0.237 0.0921 25.5 0.0055 0.0222 0 546 0.22 0.22 3.2 0.015 2.5 168 0.000278321076004752 0.495 31.98 0.984 0.027 12.6 1 0.8 5.418 1 0.1 42 1 0.1 33.6 0.025 0.013 0.05 0.035 0.036 5 1 13.44 266599.030842759 0.002 0.016 0.42 0.07000000000000001 4.2 1 1.33 0.042 0.15 0.031 420 0 0 0 
    </InitialState>
  </Model>
  <ListOfTasks>
    <Task key="Task_26" name="Steady-State" type="steadyState" scheduled="false" updateModel="false">
      <Report reference="Report_17" target="" append="1" confirmOverwrite="1"/>
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
    <Task key="Task_25" name="Time-Course" type="timeCourse" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="120"/>
        <Parameter name="Duration" type="float" value="12000"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="2000"/>
        <Parameter name="Output Event" type="bool" value="0"/>
      </Problem>
      <Method name="Deterministic (LSODA)" type="Deterministic(LSODA)">
        <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="1e-06"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="1e-12"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="10000"/>
      </Method>
    </Task>
    <Task key="Task_24" name="Scan" type="scan" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="Subtask" type="unsignedInteger" value="1"/>
        <ParameterGroup name="ScanItems">
          <ParameterGroup name="ScanItem">
            <Parameter name="Number of steps" type="unsignedInteger" value="10"/>
            <Parameter name="Type" type="unsignedInteger" value="1"/>
            <Parameter name="Object" type="cn" value="CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[extern],Vector=Metabolites[glc_ext],Reference=InitialConcentration"/>
            <Parameter name="Minimum" type="float" value="1.5"/>
            <Parameter name="Maximum" type="float" value="12"/>
            <Parameter name="log" type="bool" value="0"/>
          </ParameterGroup>
        </ParameterGroup>
        <Parameter name="Output in subtask" type="bool" value="1"/>
        <Parameter name="Adjust initial conditions" type="bool" value="0"/>
      </Problem>
      <Method name="Scan Framework" type="ScanFramework">
      </Method>
    </Task>
    <Task key="Task_23" name="Elementary Flux Modes" type="fluxMode" scheduled="false" updateModel="false">
      <Report reference="Report_16" target="" append="1" confirmOverwrite="1"/>
      <Problem>
      </Problem>
      <Method name="EFM Algorithm" type="EFMAlgorithm">
      </Method>
    </Task>
    <Task key="Task_22" name="Optimization" type="optimization" scheduled="false" updateModel="false">
      <Report reference="Report_15" target="" append="1" confirmOverwrite="1"/>
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
    <Task key="Task_21" name="Parameter Estimation" type="parameterFitting" scheduled="false" updateModel="false">
      <Report reference="Report_14" target="" append="1" confirmOverwrite="1"/>
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
    <Task key="Task_20" name="Metabolic Control Analysis" type="metabolicControlAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_13" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value="Task_26"/>
      </Problem>
      <Method name="MCA Method (Reder)" type="MCAMethod(Reder)">
        <Parameter name="Modulation Factor" type="unsignedFloat" value="1e-09"/>
      </Method>
    </Task>
    <Task key="Task_19" name="Lyapunov Exponents" type="lyapunovExponents" scheduled="false" updateModel="false">
      <Report reference="Report_12" target="" append="1" confirmOverwrite="1"/>
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
    <Task key="Task_18" name="Time Scale Separation Analysis" type="timeScaleSeparationAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_11" target="" append="1" confirmOverwrite="1"/>
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
    <Task key="Task_17" name="Sensitivities" type="sensitivities" scheduled="false" updateModel="false">
      <Report reference="Report_10" target="" append="1" confirmOverwrite="1"/>
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
    <Task key="Task_16" name="Moieties" type="moieties" scheduled="false" updateModel="false">
      <Problem>
      </Problem>
      <Method name="Householder Reduction" type="Householder">
      </Method>
    </Task>
    <Task key="Task_15" name="Cross Section" type="crosssection" scheduled="false" updateModel="false">
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
    <Task key="Task_27" name="Linear Noise Approximation" type="linearNoiseApproximation" scheduled="false" updateModel="false">
      <Report reference="Report_9" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value="Task_26"/>
      </Problem>
      <Method name="Linear Noise Approximation" type="LinearNoiseApproximation">
      </Method>
    </Task>
  </ListOfTasks>
  <ListOfReports>
    <Report key="Report_17" name="Steady-State" taskType="steadyState" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Steady-State]"/>
      </Footer>
    </Report>
    <Report key="Report_16" name="Elementary Flux Modes" taskType="fluxMode" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Elementary Flux Modes],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_15" name="Optimization" taskType="optimization" separator="&#x09;" precision="6">
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
    <Report key="Report_14" name="Parameter Estimation" taskType="parameterFitting" separator="&#x09;" precision="6">
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
    <Report key="Report_13" name="Metabolic Control Analysis" taskType="metabolicControlAnalysis" separator="&#x09;" precision="6">
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
    <Report key="Report_12" name="Lyapunov Exponents" taskType="lyapunovExponents" separator="&#x09;" precision="6">
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
    <Report key="Report_11" name="Time Scale Separation Analysis" taskType="timeScaleSeparationAnalysis" separator="&#x09;" precision="6">
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
    <Report key="Report_10" name="Sensitivities" taskType="sensitivities" separator="&#x09;" precision="6">
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
    <Report key="Report_9" name="Linear Noise Approximation" taskType="linearNoiseApproximation" separator="&#x09;" precision="6">
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
  <ListOfPlots>
    <PlotSpecification name="HGP, GNG and GLY" type="Plot2D" active="1">
      <Parameter name="log X" type="bool" value="0"/>
      <Parameter name="log Y" type="bool" value="0"/>
      <ListOfPlotItems>
        <PlotItem name="Values[GLY]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="1"/>
          <Parameter name="Line type" type="unsignedInteger" value="3"/>
          <Parameter name="Line width" type="unsignedFloat" value="2"/>
          <Parameter name="Recording Activity" type="string" value="during&amp;after"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GLY],Reference=Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="Values[GNG]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GNG],Reference=Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="Values[HGP]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[HGP],Reference=Value"/>
          </ListOfChannels>
        </PlotItem>
      </ListOfPlotItems>
    </PlotSpecification>
    <PlotSpecification name="HGP versus glc_ext" type="Plot2D" active="1">
      <Parameter name="log X" type="bool" value="0"/>
      <Parameter name="log Y" type="bool" value="0"/>
      <ListOfPlotItems>
        <PlotItem name="Values[GLY]|[glc_ext]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="1"/>
          <Parameter name="Line type" type="unsignedInteger" value="3"/>
          <Parameter name="Line width" type="unsignedFloat" value="2"/>
          <Parameter name="Recording Activity" type="string" value="during&amp;after"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[extern],Vector=Metabolites[glc_ext],Reference=Concentration"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GLY],Reference=Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="Values[GNG]|[glc_ext]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="3"/>
          <Parameter name="Line width" type="unsignedFloat" value="2"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[extern],Vector=Metabolites[glc_ext],Reference=Concentration"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[GNG],Reference=Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="Values[HGP]|[glc_ext]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="3"/>
          <Parameter name="Line width" type="unsignedFloat" value="2"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Compartments[extern],Vector=Metabolites[glc_ext],Reference=Concentration"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_Hepatic_Glucose_Model,Vector=Values[HGP],Reference=Value"/>
          </ListOfChannels>
        </PlotItem>
      </ListOfPlotItems>
    </PlotSpecification>
  </ListOfPlots>
  <GUI>
  </GUI>
  <SBMLReference file="Koenig2014_Hepatic_Glucose_Model.xml">
    <SBMLMap SBMLid="ACOAFLX" COPASIkey="Reaction_70"/>
    <SBMLMap SBMLid="ACOAFLX_Vmax" COPASIkey="ModelValue_509"/>
    <SBMLMap SBMLid="AK" COPASIkey="Reaction_47"/>
    <SBMLMap SBMLid="AK_Vmax" COPASIkey="ModelValue_375"/>
    <SBMLMap SBMLid="AK_keq" COPASIkey="ModelValue_371"/>
    <SBMLMap SBMLid="AK_km_adp" COPASIkey="ModelValue_374"/>
    <SBMLMap SBMLid="AK_km_amp" COPASIkey="ModelValue_373"/>
    <SBMLMap SBMLid="AK_km_atp" COPASIkey="ModelValue_372"/>
    <SBMLMap SBMLid="ALD" COPASIkey="Reaction_52"/>
    <SBMLMap SBMLid="ALD_Vmax" COPASIkey="ModelValue_406"/>
    <SBMLMap SBMLid="ALD_keq" COPASIkey="ModelValue_400"/>
    <SBMLMap SBMLid="ALD_ki1_grap" COPASIkey="ModelValue_404"/>
    <SBMLMap SBMLid="ALD_ki2_grap" COPASIkey="ModelValue_405"/>
    <SBMLMap SBMLid="ALD_km_dhap" COPASIkey="ModelValue_402"/>
    <SBMLMap SBMLid="ALD_km_fru16bp" COPASIkey="ModelValue_401"/>
    <SBMLMap SBMLid="ALD_km_grap" COPASIkey="ModelValue_403"/>
    <SBMLMap SBMLid="CITFLX" COPASIkey="Reaction_71"/>
    <SBMLMap SBMLid="CITFLX_Vmax" COPASIkey="ModelValue_510"/>
    <SBMLMap SBMLid="CS" COPASIkey="Reaction_67"/>
    <SBMLMap SBMLid="CS_Vmax" COPASIkey="ModelValue_501"/>
    <SBMLMap SBMLid="CS_k_acoa" COPASIkey="ModelValue_498"/>
    <SBMLMap SBMLid="CS_k_cit" COPASIkey="ModelValue_499"/>
    <SBMLMap SBMLid="CS_k_coa" COPASIkey="ModelValue_500"/>
    <SBMLMap SBMLid="CS_k_oaa" COPASIkey="ModelValue_497"/>
    <SBMLMap SBMLid="CS_keq" COPASIkey="ModelValue_496"/>
    <SBMLMap SBMLid="EN" COPASIkey="Reaction_57"/>
    <SBMLMap SBMLid="EN_Vmax" COPASIkey="ModelValue_431"/>
    <SBMLMap SBMLid="EN_k_pep" COPASIkey="ModelValue_429"/>
    <SBMLMap SBMLid="EN_k_pg2" COPASIkey="ModelValue_430"/>
    <SBMLMap SBMLid="EN_keq" COPASIkey="ModelValue_428"/>
    <SBMLMap SBMLid="FBP1" COPASIkey="Reaction_51"/>
    <SBMLMap SBMLid="FBP1_Vmax" COPASIkey="ModelValue_399"/>
    <SBMLMap SBMLid="FBP1_ki_fru26bp" COPASIkey="ModelValue_397"/>
    <SBMLMap SBMLid="FBP1_km_fru16bp" COPASIkey="ModelValue_398"/>
    <SBMLMap SBMLid="FBP2" COPASIkey="Reaction_49"/>
    <SBMLMap SBMLid="FBP2_Vmax" COPASIkey="ModelValue_389"/>
    <SBMLMap SBMLid="FBP2_ki_fru6p_native" COPASIkey="ModelValue_386"/>
    <SBMLMap SBMLid="FBP2_ki_fru6p_phospho" COPASIkey="ModelValue_388"/>
    <SBMLMap SBMLid="FBP2_km_fru26bp_native" COPASIkey="ModelValue_385"/>
    <SBMLMap SBMLid="FBP2_km_fru26bp_phospho" COPASIkey="ModelValue_387"/>
    <SBMLMap SBMLid="FBP2_native" COPASIkey="ModelValue_390"/>
    <SBMLMap SBMLid="FBP2_phospho" COPASIkey="ModelValue_391"/>
    <SBMLMap SBMLid="G16PI" COPASIkey="Reaction_40"/>
    <SBMLMap SBMLid="G16PI_Vmax" COPASIkey="ModelValue_319"/>
    <SBMLMap SBMLid="G16PI_keq" COPASIkey="ModelValue_316"/>
    <SBMLMap SBMLid="G16PI_km_glc1p" COPASIkey="ModelValue_318"/>
    <SBMLMap SBMLid="G16PI_km_glc6p" COPASIkey="ModelValue_317"/>
    <SBMLMap SBMLid="G6PASE" COPASIkey="Reaction_38"/>
    <SBMLMap SBMLid="G6PASE_Vmax" COPASIkey="ModelValue_311"/>
    <SBMLMap SBMLid="G6PASE_km_glc6p" COPASIkey="ModelValue_310"/>
    <SBMLMap SBMLid="GAPDH" COPASIkey="Reaction_54"/>
    <SBMLMap SBMLid="GAPDH_Vmax" COPASIkey="ModelValue_417"/>
    <SBMLMap SBMLid="GAPDH_k_bpg13" COPASIkey="ModelValue_416"/>
    <SBMLMap SBMLid="GAPDH_k_grap" COPASIkey="ModelValue_413"/>
    <SBMLMap SBMLid="GAPDH_k_nad" COPASIkey="ModelValue_412"/>
    <SBMLMap SBMLid="GAPDH_k_nadh" COPASIkey="ModelValue_415"/>
    <SBMLMap SBMLid="GAPDH_k_p" COPASIkey="ModelValue_414"/>
    <SBMLMap SBMLid="GAPDH_keq" COPASIkey="ModelValue_411"/>
    <SBMLMap SBMLid="GK" COPASIkey="Reaction_37"/>
    <SBMLMap SBMLid="GK_Vmax" COPASIkey="ModelValue_308"/>
    <SBMLMap SBMLid="GK_b" COPASIkey="ModelValue_304"/>
    <SBMLMap SBMLid="GK_gc_free" COPASIkey="ModelValue_309"/>
    <SBMLMap SBMLid="GK_km_atp" COPASIkey="ModelValue_307"/>
    <SBMLMap SBMLid="GK_km_fru6p" COPASIkey="ModelValue_303"/>
    <SBMLMap SBMLid="GK_km_glc" COPASIkey="ModelValue_306"/>
    <SBMLMap SBMLid="GK_km_glc1" COPASIkey="ModelValue_302"/>
    <SBMLMap SBMLid="GK_n" COPASIkey="ModelValue_305"/>
    <SBMLMap SBMLid="GK_n_gkrp" COPASIkey="ModelValue_301"/>
    <SBMLMap SBMLid="GLUT2" COPASIkey="Reaction_36"/>
    <SBMLMap SBMLid="GLUT2_Vmax" COPASIkey="ModelValue_300"/>
    <SBMLMap SBMLid="GLUT2_keq" COPASIkey="ModelValue_298"/>
    <SBMLMap SBMLid="GLUT2_km" COPASIkey="ModelValue_299"/>
    <SBMLMap SBMLid="GLY" COPASIkey="ModelValue_513"/>
    <SBMLMap SBMLid="GNG" COPASIkey="ModelValue_512"/>
    <SBMLMap SBMLid="GP" COPASIkey="Reaction_44"/>
    <SBMLMap SBMLid="GPI" COPASIkey="Reaction_39"/>
    <SBMLMap SBMLid="GPI_Vmax" COPASIkey="ModelValue_315"/>
    <SBMLMap SBMLid="GPI_keq" COPASIkey="ModelValue_312"/>
    <SBMLMap SBMLid="GPI_km_fru6p" COPASIkey="ModelValue_314"/>
    <SBMLMap SBMLid="GPI_km_glc6p" COPASIkey="ModelValue_313"/>
    <SBMLMap SBMLid="GP_C" COPASIkey="ModelValue_352"/>
    <SBMLMap SBMLid="GP_Vmax" COPASIkey="ModelValue_351"/>
    <SBMLMap SBMLid="GP_base_amp_native" COPASIkey="ModelValue_349"/>
    <SBMLMap SBMLid="GP_fmax" COPASIkey="ModelValue_354"/>
    <SBMLMap SBMLid="GP_k1_max" COPASIkey="ModelValue_353"/>
    <SBMLMap SBMLid="GP_k_glc1p_native" COPASIkey="ModelValue_343"/>
    <SBMLMap SBMLid="GP_k_glc1p_phospho" COPASIkey="ModelValue_344"/>
    <SBMLMap SBMLid="GP_k_glyc_native" COPASIkey="ModelValue_341"/>
    <SBMLMap SBMLid="GP_k_glyc_phospho" COPASIkey="ModelValue_342"/>
    <SBMLMap SBMLid="GP_k_p_native" COPASIkey="ModelValue_345"/>
    <SBMLMap SBMLid="GP_k_p_phospho" COPASIkey="ModelValue_346"/>
    <SBMLMap SBMLid="GP_ka_amp_native" COPASIkey="ModelValue_348"/>
    <SBMLMap SBMLid="GP_keq" COPASIkey="ModelValue_340"/>
    <SBMLMap SBMLid="GP_ki_glc_phospho" COPASIkey="ModelValue_347"/>
    <SBMLMap SBMLid="GP_max_amp_native" COPASIkey="ModelValue_350"/>
    <SBMLMap SBMLid="GP_native" COPASIkey="ModelValue_356"/>
    <SBMLMap SBMLid="GP_phospho" COPASIkey="ModelValue_358"/>
    <SBMLMap SBMLid="GP_vmax_native" COPASIkey="ModelValue_355"/>
    <SBMLMap SBMLid="GP_vmax_phospho" COPASIkey="ModelValue_357"/>
    <SBMLMap SBMLid="GS" COPASIkey="Reaction_43"/>
    <SBMLMap SBMLid="GS_C" COPASIkey="ModelValue_328"/>
    <SBMLMap SBMLid="GS_Vmax" COPASIkey="ModelValue_334"/>
    <SBMLMap SBMLid="GS_k1_max" COPASIkey="ModelValue_329"/>
    <SBMLMap SBMLid="GS_k1_nat" COPASIkey="ModelValue_330"/>
    <SBMLMap SBMLid="GS_k1_phospho" COPASIkey="ModelValue_332"/>
    <SBMLMap SBMLid="GS_k2_nat" COPASIkey="ModelValue_331"/>
    <SBMLMap SBMLid="GS_k2_phospho" COPASIkey="ModelValue_333"/>
    <SBMLMap SBMLid="GS_k_udpglc_native" COPASIkey="ModelValue_336"/>
    <SBMLMap SBMLid="GS_k_udpglc_phospho" COPASIkey="ModelValue_337"/>
    <SBMLMap SBMLid="GS_native" COPASIkey="ModelValue_338"/>
    <SBMLMap SBMLid="GS_phospho" COPASIkey="ModelValue_339"/>
    <SBMLMap SBMLid="GS_storage_factor" COPASIkey="ModelValue_335"/>
    <SBMLMap SBMLid="HGP" COPASIkey="ModelValue_511"/>
    <SBMLMap SBMLid="K_epi" COPASIkey="ModelValue_293"/>
    <SBMLMap SBMLid="K_glu" COPASIkey="ModelValue_292"/>
    <SBMLMap SBMLid="K_ins" COPASIkey="ModelValue_291"/>
    <SBMLMap SBMLid="K_val" COPASIkey="ModelValue_289"/>
    <SBMLMap SBMLid="LACT" COPASIkey="Reaction_63"/>
    <SBMLMap SBMLid="LACT_Vmax" COPASIkey="ModelValue_478"/>
    <SBMLMap SBMLid="LACT_k_lac" COPASIkey="ModelValue_477"/>
    <SBMLMap SBMLid="LACT_keq" COPASIkey="ModelValue_476"/>
    <SBMLMap SBMLid="LDH" COPASIkey="Reaction_62"/>
    <SBMLMap SBMLid="LDH_Vmax" COPASIkey="ModelValue_475"/>
    <SBMLMap SBMLid="LDH_k_lac" COPASIkey="ModelValue_472"/>
    <SBMLMap SBMLid="LDH_k_nad" COPASIkey="ModelValue_473"/>
    <SBMLMap SBMLid="LDH_k_nadh" COPASIkey="ModelValue_474"/>
    <SBMLMap SBMLid="LDH_k_pyr" COPASIkey="ModelValue_471"/>
    <SBMLMap SBMLid="LDH_keq" COPASIkey="ModelValue_470"/>
    <SBMLMap SBMLid="NDKGTP" COPASIkey="Reaction_45"/>
    <SBMLMap SBMLid="NDKGTPM" COPASIkey="Reaction_68"/>
    <SBMLMap SBMLid="NDKGTPM_Vmax" COPASIkey="ModelValue_507"/>
    <SBMLMap SBMLid="NDKGTPM_k_adp" COPASIkey="ModelValue_504"/>
    <SBMLMap SBMLid="NDKGTPM_k_atp" COPASIkey="ModelValue_503"/>
    <SBMLMap SBMLid="NDKGTPM_k_gdp" COPASIkey="ModelValue_506"/>
    <SBMLMap SBMLid="NDKGTPM_k_gtp" COPASIkey="ModelValue_505"/>
    <SBMLMap SBMLid="NDKGTPM_keq" COPASIkey="ModelValue_502"/>
    <SBMLMap SBMLid="NDKGTP_Vmax" COPASIkey="ModelValue_364"/>
    <SBMLMap SBMLid="NDKGTP_keq" COPASIkey="ModelValue_359"/>
    <SBMLMap SBMLid="NDKGTP_km_adp" COPASIkey="ModelValue_361"/>
    <SBMLMap SBMLid="NDKGTP_km_atp" COPASIkey="ModelValue_360"/>
    <SBMLMap SBMLid="NDKGTP_km_gdp" COPASIkey="ModelValue_363"/>
    <SBMLMap SBMLid="NDKGTP_km_gtp" COPASIkey="ModelValue_362"/>
    <SBMLMap SBMLid="NDKUTP" COPASIkey="Reaction_46"/>
    <SBMLMap SBMLid="NDKUTP_Vmax" COPASIkey="ModelValue_370"/>
    <SBMLMap SBMLid="NDKUTP_keq" COPASIkey="ModelValue_365"/>
    <SBMLMap SBMLid="NDKUTP_km_adp" COPASIkey="ModelValue_367"/>
    <SBMLMap SBMLid="NDKUTP_km_atp" COPASIkey="ModelValue_366"/>
    <SBMLMap SBMLid="NDKUTP_km_udp" COPASIkey="ModelValue_369"/>
    <SBMLMap SBMLid="NDKUTP_km_utp" COPASIkey="ModelValue_368"/>
    <SBMLMap SBMLid="OAAFLX" COPASIkey="Reaction_69"/>
    <SBMLMap SBMLid="OAAFLX_Vmax" COPASIkey="ModelValue_508"/>
    <SBMLMap SBMLid="PC" COPASIkey="Reaction_61"/>
    <SBMLMap SBMLid="PC_Vmax" COPASIkey="ModelValue_469"/>
    <SBMLMap SBMLid="PC_k_acoa" COPASIkey="ModelValue_467"/>
    <SBMLMap SBMLid="PC_k_atp" COPASIkey="ModelValue_464"/>
    <SBMLMap SBMLid="PC_k_co2" COPASIkey="ModelValue_466"/>
    <SBMLMap SBMLid="PC_k_pyr" COPASIkey="ModelValue_465"/>
    <SBMLMap SBMLid="PC_n" COPASIkey="ModelValue_468"/>
    <SBMLMap SBMLid="PDH" COPASIkey="Reaction_66"/>
    <SBMLMap SBMLid="PDH_Vmax" COPASIkey="ModelValue_492"/>
    <SBMLMap SBMLid="PDH_alpha_nat" COPASIkey="ModelValue_490"/>
    <SBMLMap SBMLid="PDH_alpha_p" COPASIkey="ModelValue_491"/>
    <SBMLMap SBMLid="PDH_base" COPASIkey="ModelValue_493"/>
    <SBMLMap SBMLid="PDH_k_coa" COPASIkey="ModelValue_486"/>
    <SBMLMap SBMLid="PDH_k_nad" COPASIkey="ModelValue_487"/>
    <SBMLMap SBMLid="PDH_k_pyr" COPASIkey="ModelValue_485"/>
    <SBMLMap SBMLid="PDH_ki_acoa" COPASIkey="ModelValue_488"/>
    <SBMLMap SBMLid="PDH_ki_nadh" COPASIkey="ModelValue_489"/>
    <SBMLMap SBMLid="PDH_nat" COPASIkey="ModelValue_494"/>
    <SBMLMap SBMLid="PDH_p" COPASIkey="ModelValue_495"/>
    <SBMLMap SBMLid="PEPCK" COPASIkey="Reaction_59"/>
    <SBMLMap SBMLid="PEPCKM" COPASIkey="Reaction_60"/>
    <SBMLMap SBMLid="PEPCKM_Vmax" COPASIkey="ModelValue_463"/>
    <SBMLMap SBMLid="PEPCK_Vmax" COPASIkey="ModelValue_462"/>
    <SBMLMap SBMLid="PEPCK_k_co2" COPASIkey="ModelValue_459"/>
    <SBMLMap SBMLid="PEPCK_k_gdp" COPASIkey="ModelValue_458"/>
    <SBMLMap SBMLid="PEPCK_k_gtp" COPASIkey="ModelValue_461"/>
    <SBMLMap SBMLid="PEPCK_k_oaa" COPASIkey="ModelValue_460"/>
    <SBMLMap SBMLid="PEPCK_k_pep" COPASIkey="ModelValue_457"/>
    <SBMLMap SBMLid="PEPCK_keq" COPASIkey="ModelValue_456"/>
    <SBMLMap SBMLid="PEPTM" COPASIkey="Reaction_65"/>
    <SBMLMap SBMLid="PEPTM_Vmax" COPASIkey="ModelValue_484"/>
    <SBMLMap SBMLid="PEPTM_k_pep" COPASIkey="ModelValue_483"/>
    <SBMLMap SBMLid="PEPTM_keq" COPASIkey="ModelValue_482"/>
    <SBMLMap SBMLid="PFK1" COPASIkey="Reaction_50"/>
    <SBMLMap SBMLid="PFK1_Vmax" COPASIkey="ModelValue_396"/>
    <SBMLMap SBMLid="PFK1_ka_fru26bp" COPASIkey="ModelValue_395"/>
    <SBMLMap SBMLid="PFK1_ki_fru6p" COPASIkey="ModelValue_394"/>
    <SBMLMap SBMLid="PFK1_km_atp" COPASIkey="ModelValue_392"/>
    <SBMLMap SBMLid="PFK1_km_fru6p" COPASIkey="ModelValue_393"/>
    <SBMLMap SBMLid="PFK2" COPASIkey="Reaction_48"/>
    <SBMLMap SBMLid="PFK2_Vmax" COPASIkey="ModelValue_382"/>
    <SBMLMap SBMLid="PFK2_k_atp_native" COPASIkey="ModelValue_380"/>
    <SBMLMap SBMLid="PFK2_k_atp_phospho" COPASIkey="ModelValue_381"/>
    <SBMLMap SBMLid="PFK2_k_fru6p_native" COPASIkey="ModelValue_378"/>
    <SBMLMap SBMLid="PFK2_k_fru6p_phospho" COPASIkey="ModelValue_379"/>
    <SBMLMap SBMLid="PFK2_n_native" COPASIkey="ModelValue_376"/>
    <SBMLMap SBMLid="PFK2_n_phospho" COPASIkey="ModelValue_377"/>
    <SBMLMap SBMLid="PFK2_native" COPASIkey="ModelValue_383"/>
    <SBMLMap SBMLid="PFK2_phospho" COPASIkey="ModelValue_384"/>
    <SBMLMap SBMLid="PGK" COPASIkey="Reaction_55"/>
    <SBMLMap SBMLid="PGK_Vmax" COPASIkey="ModelValue_423"/>
    <SBMLMap SBMLid="PGK_k_adp" COPASIkey="ModelValue_419"/>
    <SBMLMap SBMLid="PGK_k_atp" COPASIkey="ModelValue_420"/>
    <SBMLMap SBMLid="PGK_k_bpg13" COPASIkey="ModelValue_421"/>
    <SBMLMap SBMLid="PGK_k_pg3" COPASIkey="ModelValue_422"/>
    <SBMLMap SBMLid="PGK_keq" COPASIkey="ModelValue_418"/>
    <SBMLMap SBMLid="PGM" COPASIkey="Reaction_56"/>
    <SBMLMap SBMLid="PGM_Vmax" COPASIkey="ModelValue_427"/>
    <SBMLMap SBMLid="PGM_k_pg2" COPASIkey="ModelValue_426"/>
    <SBMLMap SBMLid="PGM_k_pg3" COPASIkey="ModelValue_425"/>
    <SBMLMap SBMLid="PGM_keq" COPASIkey="ModelValue_424"/>
    <SBMLMap SBMLid="PK" COPASIkey="Reaction_58"/>
    <SBMLMap SBMLid="PK_Vmax" COPASIkey="ModelValue_447"/>
    <SBMLMap SBMLid="PK_alpha" COPASIkey="ModelValue_436"/>
    <SBMLMap SBMLid="PK_alpha_end" COPASIkey="ModelValue_438"/>
    <SBMLMap SBMLid="PK_alpha_inp" COPASIkey="ModelValue_450"/>
    <SBMLMap SBMLid="PK_alpha_p" COPASIkey="ModelValue_437"/>
    <SBMLMap SBMLid="PK_alpha_p_inp" COPASIkey="ModelValue_451"/>
    <SBMLMap SBMLid="PK_base_act" COPASIkey="ModelValue_445"/>
    <SBMLMap SBMLid="PK_base_act_p" COPASIkey="ModelValue_446"/>
    <SBMLMap SBMLid="PK_f" COPASIkey="ModelValue_448"/>
    <SBMLMap SBMLid="PK_f_p" COPASIkey="ModelValue_449"/>
    <SBMLMap SBMLid="PK_k_adp" COPASIkey="ModelValue_444"/>
    <SBMLMap SBMLid="PK_k_fbp" COPASIkey="ModelValue_439"/>
    <SBMLMap SBMLid="PK_k_fbp_p" COPASIkey="ModelValue_440"/>
    <SBMLMap SBMLid="PK_k_pep" COPASIkey="ModelValue_441"/>
    <SBMLMap SBMLid="PK_k_pep_end" COPASIkey="ModelValue_443"/>
    <SBMLMap SBMLid="PK_k_pep_p" COPASIkey="ModelValue_442"/>
    <SBMLMap SBMLid="PK_n" COPASIkey="ModelValue_432"/>
    <SBMLMap SBMLid="PK_n_fbp" COPASIkey="ModelValue_434"/>
    <SBMLMap SBMLid="PK_n_fbp_p" COPASIkey="ModelValue_435"/>
    <SBMLMap SBMLid="PK_n_p" COPASIkey="ModelValue_433"/>
    <SBMLMap SBMLid="PK_native" COPASIkey="ModelValue_454"/>
    <SBMLMap SBMLid="PK_pep_inp" COPASIkey="ModelValue_452"/>
    <SBMLMap SBMLid="PK_pep_p_inp" COPASIkey="ModelValue_453"/>
    <SBMLMap SBMLid="PK_phospho" COPASIkey="ModelValue_455"/>
    <SBMLMap SBMLid="PPASE" COPASIkey="Reaction_42"/>
    <SBMLMap SBMLid="PPASE_Vmax" COPASIkey="ModelValue_327"/>
    <SBMLMap SBMLid="PPASE_km_pp" COPASIkey="ModelValue_326"/>
    <SBMLMap SBMLid="PYRTM" COPASIkey="Reaction_64"/>
    <SBMLMap SBMLid="PYRTM_Vmax" COPASIkey="ModelValue_481"/>
    <SBMLMap SBMLid="PYRTM_k_pyr" COPASIkey="ModelValue_480"/>
    <SBMLMap SBMLid="PYRTM_keq" COPASIkey="ModelValue_479"/>
    <SBMLMap SBMLid="TPI" COPASIkey="Reaction_53"/>
    <SBMLMap SBMLid="TPI_Vmax" COPASIkey="ModelValue_410"/>
    <SBMLMap SBMLid="TPI_keq" COPASIkey="ModelValue_407"/>
    <SBMLMap SBMLid="TPI_km_dhap" COPASIkey="ModelValue_408"/>
    <SBMLMap SBMLid="TPI_km_grap" COPASIkey="ModelValue_409"/>
    <SBMLMap SBMLid="UPGASE" COPASIkey="Reaction_41"/>
    <SBMLMap SBMLid="UPGASE_Vmax" COPASIkey="ModelValue_325"/>
    <SBMLMap SBMLid="UPGASE_keq" COPASIkey="ModelValue_320"/>
    <SBMLMap SBMLid="UPGASE_km_glc1p" COPASIkey="ModelValue_322"/>
    <SBMLMap SBMLid="UPGASE_km_pp" COPASIkey="ModelValue_324"/>
    <SBMLMap SBMLid="UPGASE_km_udpglc" COPASIkey="ModelValue_323"/>
    <SBMLMap SBMLid="UPGASE_km_utp" COPASIkey="ModelValue_321"/>
    <SBMLMap SBMLid="Vcyto" COPASIkey="ModelValue_258"/>
    <SBMLMap SBMLid="Vliver" COPASIkey="ModelValue_259"/>
    <SBMLMap SBMLid="acoa_mito" COPASIkey="Metabolite_86"/>
    <SBMLMap SBMLid="adp" COPASIkey="Metabolite_50"/>
    <SBMLMap SBMLid="adp_mito" COPASIkey="Metabolite_90"/>
    <SBMLMap SBMLid="amp" COPASIkey="Metabolite_51"/>
    <SBMLMap SBMLid="atp" COPASIkey="Metabolite_49"/>
    <SBMLMap SBMLid="atp_mito" COPASIkey="Metabolite_89"/>
    <SBMLMap SBMLid="atp_mito_tot" COPASIkey="ModelValue_269"/>
    <SBMLMap SBMLid="atp_tot" COPASIkey="ModelValue_265"/>
    <SBMLMap SBMLid="bodyweight" COPASIkey="ModelValue_261"/>
    <SBMLMap SBMLid="bpg13" COPASIkey="Metabolite_73"/>
    <SBMLMap SBMLid="cit_mito" COPASIkey="Metabolite_88"/>
    <SBMLMap SBMLid="co2" COPASIkey="Metabolite_60"/>
    <SBMLMap SBMLid="co2_mito" COPASIkey="Metabolite_82"/>
    <SBMLMap SBMLid="coa_mito" COPASIkey="Metabolite_93"/>
    <SBMLMap SBMLid="conversion_factor" COPASIkey="ModelValue_263"/>
    <SBMLMap SBMLid="cyto" COPASIkey="Compartment_4"/>
    <SBMLMap SBMLid="dhap" COPASIkey="Metabolite_72"/>
    <SBMLMap SBMLid="epi" COPASIkey="ModelValue_287"/>
    <SBMLMap SBMLid="epi_f" COPASIkey="ModelValue_290"/>
    <SBMLMap SBMLid="epi_norm" COPASIkey="ModelValue_288"/>
    <SBMLMap SBMLid="extern" COPASIkey="Compartment_3"/>
    <SBMLMap SBMLid="fliver" COPASIkey="ModelValue_260"/>
    <SBMLMap SBMLid="fru16bp" COPASIkey="Metabolite_69"/>
    <SBMLMap SBMLid="fru26bp" COPASIkey="Metabolite_70"/>
    <SBMLMap SBMLid="fru6p" COPASIkey="Metabolite_68"/>
    <SBMLMap SBMLid="gamma" COPASIkey="ModelValue_294"/>
    <SBMLMap SBMLid="gdp" COPASIkey="Metabolite_55"/>
    <SBMLMap SBMLid="gdp_mito" COPASIkey="Metabolite_92"/>
    <SBMLMap SBMLid="glc" COPASIkey="Metabolite_66"/>
    <SBMLMap SBMLid="glc1p" COPASIkey="Metabolite_63"/>
    <SBMLMap SBMLid="glc6p" COPASIkey="Metabolite_67"/>
    <SBMLMap SBMLid="glc_ext" COPASIkey="Metabolite_80"/>
    <SBMLMap SBMLid="glu" COPASIkey="ModelValue_281"/>
    <SBMLMap SBMLid="glu_norm" COPASIkey="ModelValue_282"/>
    <SBMLMap SBMLid="glyglc" COPASIkey="Metabolite_65"/>
    <SBMLMap SBMLid="grap" COPASIkey="Metabolite_71"/>
    <SBMLMap SBMLid="gtp" COPASIkey="Metabolite_54"/>
    <SBMLMap SBMLid="gtp_mito" COPASIkey="Metabolite_91"/>
    <SBMLMap SBMLid="gtp_mito_tot" COPASIkey="ModelValue_270"/>
    <SBMLMap SBMLid="gtp_tot" COPASIkey="ModelValue_267"/>
    <SBMLMap SBMLid="h" COPASIkey="Metabolite_62"/>
    <SBMLMap SBMLid="h2o" COPASIkey="Metabolite_61"/>
    <SBMLMap SBMLid="h2o_mito" COPASIkey="Metabolite_96"/>
    <SBMLMap SBMLid="h_mito" COPASIkey="Metabolite_97"/>
    <SBMLMap SBMLid="ins" COPASIkey="ModelValue_275"/>
    <SBMLMap SBMLid="ins_norm" COPASIkey="ModelValue_276"/>
    <SBMLMap SBMLid="lac" COPASIkey="Metabolite_79"/>
    <SBMLMap SBMLid="lac_ext" COPASIkey="Metabolite_81"/>
    <SBMLMap SBMLid="mito" COPASIkey="Compartment_5"/>
    <SBMLMap SBMLid="nad" COPASIkey="Metabolite_56"/>
    <SBMLMap SBMLid="nad_mito" COPASIkey="Metabolite_95"/>
    <SBMLMap SBMLid="nadh" COPASIkey="Metabolite_57"/>
    <SBMLMap SBMLid="nadh_mito" COPASIkey="Metabolite_94"/>
    <SBMLMap SBMLid="nadh_mito_tot" COPASIkey="ModelValue_268"/>
    <SBMLMap SBMLid="nadh_tot" COPASIkey="ModelValue_264"/>
    <SBMLMap SBMLid="oaa" COPASIkey="Metabolite_78"/>
    <SBMLMap SBMLid="oaa_mito" COPASIkey="Metabolite_84"/>
    <SBMLMap SBMLid="pep" COPASIkey="Metabolite_76"/>
    <SBMLMap SBMLid="pep_mito" COPASIkey="Metabolite_85"/>
    <SBMLMap SBMLid="pg2" COPASIkey="Metabolite_75"/>
    <SBMLMap SBMLid="pg3" COPASIkey="Metabolite_74"/>
    <SBMLMap SBMLid="phos" COPASIkey="Metabolite_58"/>
    <SBMLMap SBMLid="phos_mito" COPASIkey="Metabolite_83"/>
    <SBMLMap SBMLid="pp" COPASIkey="Metabolite_59"/>
    <SBMLMap SBMLid="pyr" COPASIkey="Metabolite_77"/>
    <SBMLMap SBMLid="pyr_mito" COPASIkey="Metabolite_87"/>
    <SBMLMap SBMLid="scale" COPASIkey="ModelValue_295"/>
    <SBMLMap SBMLid="scale_gly" COPASIkey="ModelValue_296"/>
    <SBMLMap SBMLid="scale_glyglc" COPASIkey="ModelValue_297"/>
    <SBMLMap SBMLid="sec_per_min" COPASIkey="ModelValue_262"/>
    <SBMLMap SBMLid="udp" COPASIkey="Metabolite_53"/>
    <SBMLMap SBMLid="udpglc" COPASIkey="Metabolite_64"/>
    <SBMLMap SBMLid="utp" COPASIkey="Metabolite_52"/>
    <SBMLMap SBMLid="utp_tot" COPASIkey="ModelValue_266"/>
    <SBMLMap SBMLid="x_epi1" COPASIkey="ModelValue_283"/>
    <SBMLMap SBMLid="x_epi2" COPASIkey="ModelValue_284"/>
    <SBMLMap SBMLid="x_epi3" COPASIkey="ModelValue_285"/>
    <SBMLMap SBMLid="x_epi4" COPASIkey="ModelValue_286"/>
    <SBMLMap SBMLid="x_glu1" COPASIkey="ModelValue_277"/>
    <SBMLMap SBMLid="x_glu2" COPASIkey="ModelValue_278"/>
    <SBMLMap SBMLid="x_glu3" COPASIkey="ModelValue_279"/>
    <SBMLMap SBMLid="x_glu4" COPASIkey="ModelValue_280"/>
    <SBMLMap SBMLid="x_ins1" COPASIkey="ModelValue_271"/>
    <SBMLMap SBMLid="x_ins2" COPASIkey="ModelValue_272"/>
    <SBMLMap SBMLid="x_ins3" COPASIkey="ModelValue_273"/>
    <SBMLMap SBMLid="x_ins4" COPASIkey="ModelValue_274"/>
  </SBMLReference>
</COPASI>
