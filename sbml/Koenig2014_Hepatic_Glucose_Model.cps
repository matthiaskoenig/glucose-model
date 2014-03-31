<?xml version="1.0" encoding="UTF-8"?>
<!-- generated with COPASI 4.11 (Build 65) (http://www.copasi.org) at 2014-03-31 16:28:45 UTC -->
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
    <Function key="Function_45" name="Function for D-Glucose-6-phosphate Isomerase" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*GPI_Vmax/GPI_km_glc6p*(glc6p-fru6p/GPI_keq)/(1+glc6p/GPI_km_glc6p+fru6p/GPI_km_fru6p)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_312" name="GPI_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_313" name="GPI_keq" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_314" name="GPI_km_fru6p" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_315" name="GPI_km_glc6p" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_316" name="cyto" order="4" role="volume"/>
        <ParameterDescription key="FunctionParameter_317" name="fru6p" order="5" role="product"/>
        <ParameterDescription key="FunctionParameter_318" name="glc6p" order="6" role="substrate"/>
        <ParameterDescription key="FunctionParameter_319" name="scale_gly" order="7" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_46" name="Function for Glucose 1-phosphate 1,6-phosphomutase" type="UserDefined" reversible="true">
      <Expression>
        scale_glyglc*G16PI_Vmax/G16PI_km_glc1p*(glc1p-glc6p/G16PI_keq)/(1+glc1p/G16PI_km_glc1p+glc6p/G16PI_km_glc6p)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_328" name="G16PI_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_329" name="G16PI_keq" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_330" name="G16PI_km_glc1p" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_331" name="G16PI_km_glc6p" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_332" name="cyto" order="4" role="volume"/>
        <ParameterDescription key="FunctionParameter_333" name="glc1p" order="5" role="substrate"/>
        <ParameterDescription key="FunctionParameter_334" name="glc6p" order="6" role="product"/>
        <ParameterDescription key="FunctionParameter_335" name="scale_glyglc" order="7" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_47" name="Function for UTP:Glucose-1-phosphate uridylyltransferase" type="UserDefined" reversible="true">
      <Expression>
        scale_glyglc*UPGASE_Vmax/(UPGASE_km_utp*UPGASE_km_glc1p)*(utp*glc1p-udpglc*pp/UPGASE_keq)/((1+utp/UPGASE_km_utp)*(1+glc1p/UPGASE_km_glc1p)+(1+udpglc/UPGASE_km_udpglc)*(1+pp/UPGASE_km_pp)-1)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_348" name="UPGASE_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_349" name="UPGASE_keq" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_350" name="UPGASE_km_glc1p" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_351" name="UPGASE_km_pp" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_352" name="UPGASE_km_udpglc" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_353" name="UPGASE_km_utp" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_354" name="cyto" order="6" role="volume"/>
        <ParameterDescription key="FunctionParameter_355" name="glc1p" order="7" role="substrate"/>
        <ParameterDescription key="FunctionParameter_356" name="pp" order="8" role="product"/>
        <ParameterDescription key="FunctionParameter_357" name="scale_glyglc" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_358" name="udpglc" order="10" role="product"/>
        <ParameterDescription key="FunctionParameter_359" name="utp" order="11" role="substrate"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_48" name="Function for Pyrophosphate phosphohydrolase" type="UserDefined" reversible="false">
      <Expression>
        scale_glyglc*PPASE_Vmax*pp/(pp+PPASE_km_pp)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_347" name="PPASE_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_311" name="PPASE_km_pp" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_345" name="cyto" order="2" role="volume"/>
        <ParameterDescription key="FunctionParameter_346" name="pp" order="3" role="substrate"/>
        <ParameterDescription key="FunctionParameter_284" name="scale_glyglc" order="4" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_49" name="Function for Glycogen synthase" type="UserDefined" reversible="false">
      <Expression>
        ((1-gamma)*GS_native+gamma*GS_phospho)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_310" name="GS_native" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_375" name="GS_phospho" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_376" name="cyto" order="2" role="volume"/>
        <ParameterDescription key="FunctionParameter_377" name="gamma" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_50" name="Function for Glycogen-Phosphorylase" type="UserDefined" reversible="true">
      <Expression>
        ((1-gamma)*GP_native+gamma*GP_phospho)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_382" name="GP_native" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_383" name="GP_phospho" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_384" name="cyto" order="2" role="volume"/>
        <ParameterDescription key="FunctionParameter_385" name="gamma" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_51" name="Function for Nucleoside-diphosphate kinase (ATP, GTP)" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*NDKGTP_Vmax/(NDKGTP_km_atp*NDKGTP_km_gdp)*(atp*gdp-adp*gtp/NDKGTP_keq)/((1+atp/NDKGTP_km_atp)*(1+gdp/NDKGTP_km_gdp)+(1+adp/NDKGTP_km_adp)*(1+gtp/NDKGTP_km_gtp)-1)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_398" name="NDKGTP_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_399" name="NDKGTP_keq" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_400" name="NDKGTP_km_adp" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_401" name="NDKGTP_km_atp" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_402" name="NDKGTP_km_gdp" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_403" name="NDKGTP_km_gtp" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_404" name="adp" order="6" role="product"/>
        <ParameterDescription key="FunctionParameter_405" name="atp" order="7" role="substrate"/>
        <ParameterDescription key="FunctionParameter_406" name="cyto" order="8" role="volume"/>
        <ParameterDescription key="FunctionParameter_407" name="gdp" order="9" role="substrate"/>
        <ParameterDescription key="FunctionParameter_408" name="gtp" order="10" role="product"/>
        <ParameterDescription key="FunctionParameter_409" name="scale_gly" order="11" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_52" name="Function for Nucleoside-diphosphate kinase (ATP, UTP)" type="UserDefined" reversible="true">
      <Expression>
        scale_glyglc*NDKUTP_Vmax/(NDKUTP_km_atp*NDKUTP_km_udp)*(atp*udp-adp*utp/NDKUTP_keq)/((1+atp/NDKUTP_km_atp)*(1+udp/NDKUTP_km_udp)+(1+adp/NDKUTP_km_adp)*(1+utp/NDKUTP_km_utp)-1)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_422" name="NDKUTP_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_423" name="NDKUTP_keq" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_424" name="NDKUTP_km_adp" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_425" name="NDKUTP_km_atp" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_426" name="NDKUTP_km_udp" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_427" name="NDKUTP_km_utp" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_428" name="adp" order="6" role="product"/>
        <ParameterDescription key="FunctionParameter_429" name="atp" order="7" role="substrate"/>
        <ParameterDescription key="FunctionParameter_430" name="cyto" order="8" role="volume"/>
        <ParameterDescription key="FunctionParameter_431" name="scale_glyglc" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_432" name="udp" order="10" role="substrate"/>
        <ParameterDescription key="FunctionParameter_433" name="utp" order="11" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_53" name="Function for ATP:AMP phosphotransferase (Adenylatkinase)" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*AK_Vmax/(AK_km_atp*AK_km_amp)*(atp*amp-adp*adp/AK_keq)/((1+atp/AK_km_atp)*(1+amp/AK_km_amp)+(1+adp/AK_km_adp)*(1+adp/AK_km_adp)-1)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_265" name="AK_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_393" name="AK_keq" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_446" name="AK_km_adp" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_447" name="AK_km_amp" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_448" name="AK_km_atp" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_449" name="adp" order="5" role="product"/>
        <ParameterDescription key="FunctionParameter_450" name="amp" order="6" role="substrate"/>
        <ParameterDescription key="FunctionParameter_451" name="atp" order="7" role="substrate"/>
        <ParameterDescription key="FunctionParameter_452" name="cyto" order="8" role="volume"/>
        <ParameterDescription key="FunctionParameter_453" name="scale_gly" order="9" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_54" name="Function for ATP:D-fructose-6-phosphate 2-phosphotransferase" type="UserDefined" reversible="false">
      <Expression>
        ((1-gamma)*PFK2_native+gamma*PFK2_phospho)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_394" name="PFK2_native" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_309" name="PFK2_phospho" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_258" name="cyto" order="2" role="volume"/>
        <ParameterDescription key="FunctionParameter_391" name="gamma" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_55" name="Function for D-Fructose-2,6-bisphosphate 2-phosphohydrolase" type="UserDefined" reversible="false">
      <Expression>
        ((1-gamma)*FBP2_native+gamma*FBP2_phospho)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_466" name="FBP2_native" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_467" name="FBP2_phospho" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_468" name="cyto" order="2" role="volume"/>
        <ParameterDescription key="FunctionParameter_469" name="gamma" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_56" name="Function for ATP:D-fructose-6-phosphate 1-phosphotransferase" type="UserDefined" reversible="false">
      <Expression>
        scale_gly*PFK1_Vmax*(1-1/(1+fru26bp/PFK1_ka_fru26bp))*fru6p*atp/(PFK1_ki_fru6p*PFK1_km_atp+PFK1_km_fru6p*atp+PFK1_km_atp*fru6p+atp*fru6p)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_480" name="PFK1_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_481" name="PFK1_ka_fru26bp" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_482" name="PFK1_ki_fru6p" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_483" name="PFK1_km_atp" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_484" name="PFK1_km_fru6p" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_485" name="atp" order="5" role="substrate"/>
        <ParameterDescription key="FunctionParameter_486" name="cyto" order="6" role="volume"/>
        <ParameterDescription key="FunctionParameter_487" name="fru26bp" order="7" role="modifier"/>
        <ParameterDescription key="FunctionParameter_488" name="fru6p" order="8" role="substrate"/>
        <ParameterDescription key="FunctionParameter_489" name="scale_gly" order="9" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_57" name="Function for D-Fructose-1,6-bisphosphate 1-phosphohydrolase" type="UserDefined" reversible="false">
      <Expression>
        scale_gly*FBP1_Vmax/(1+fru26bp/FBP1_ki_fru26bp)*fru16bp/(fru16bp+FBP1_km_fru16bp)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_476" name="FBP1_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_396" name="FBP1_ki_fru26bp" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_395" name="FBP1_km_fru16bp" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_500" name="cyto" order="3" role="volume"/>
        <ParameterDescription key="FunctionParameter_501" name="fru16bp" order="4" role="substrate"/>
        <ParameterDescription key="FunctionParameter_502" name="fru26bp" order="5" role="modifier"/>
        <ParameterDescription key="FunctionParameter_503" name="scale_gly" order="6" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_58" name="Function for Aldolase" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*ALD_Vmax/ALD_km_fru16bp*(fru16bp-grap*dhap/ALD_keq)/(1+fru16bp/ALD_km_fru16bp+grap/ALD_ki1_grap+dhap*(grap+ALD_km_grap)/(ALD_km_dhap*ALD_ki1_grap)+fru16bp*grap/(ALD_km_fru16bp*ALD_ki2_grap))/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_516" name="ALD_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_517" name="ALD_keq" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_518" name="ALD_ki1_grap" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_519" name="ALD_ki2_grap" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_520" name="ALD_km_dhap" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_521" name="ALD_km_fru16bp" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_522" name="ALD_km_grap" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_523" name="cyto" order="7" role="volume"/>
        <ParameterDescription key="FunctionParameter_524" name="dhap" order="8" role="product"/>
        <ParameterDescription key="FunctionParameter_525" name="fru16bp" order="9" role="substrate"/>
        <ParameterDescription key="FunctionParameter_526" name="grap" order="10" role="product"/>
        <ParameterDescription key="FunctionParameter_527" name="scale_gly" order="11" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_59" name="Function for Triosephosphate Isomerase" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*TPI_Vmax/TPI_km_dhap*(dhap-grap/TPI_keq)/(1+dhap/TPI_km_dhap+grap/TPI_km_grap)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_514" name="TPI_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_511" name="TPI_keq" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_474" name="TPI_km_dhap" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_390" name="TPI_km_grap" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_540" name="cyto" order="4" role="volume"/>
        <ParameterDescription key="FunctionParameter_541" name="dhap" order="5" role="substrate"/>
        <ParameterDescription key="FunctionParameter_542" name="grap" order="6" role="product"/>
        <ParameterDescription key="FunctionParameter_543" name="scale_gly" order="7" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_60" name="Function for D-Glyceraldehyde-3-phosphate:NAD+ oxidoreductase" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*GAPDH_Vmax/(GAPDH_k_nad*GAPDH_k_grap*GAPDH_k_p)*(nad*grap*phos-bpg13*nadh/GAPDH_keq)/((1+nad/GAPDH_k_nad)*(1+grap/GAPDH_k_grap)*(1+phos/GAPDH_k_p)+(1+nadh/GAPDH_k_nadh)*(1+bpg13/GAPDH_k_bpg13)-1)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_558" name="GAPDH_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_559" name="GAPDH_k_bpg13" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_560" name="GAPDH_k_grap" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_561" name="GAPDH_k_nad" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_562" name="GAPDH_k_nadh" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_563" name="GAPDH_k_p" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_564" name="GAPDH_keq" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_565" name="bpg13" order="7" role="product"/>
        <ParameterDescription key="FunctionParameter_566" name="cyto" order="8" role="volume"/>
        <ParameterDescription key="FunctionParameter_567" name="grap" order="9" role="substrate"/>
        <ParameterDescription key="FunctionParameter_568" name="nad" order="10" role="substrate"/>
        <ParameterDescription key="FunctionParameter_569" name="nadh" order="11" role="product"/>
        <ParameterDescription key="FunctionParameter_570" name="phos" order="12" role="substrate"/>
        <ParameterDescription key="FunctionParameter_571" name="scale_gly" order="13" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_61" name="Function for Phosphoglycerate Kinase" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*PGK_Vmax/(PGK_k_adp*PGK_k_bpg13)*(adp*bpg13-atp*pg3/PGK_keq)/((1+adp/PGK_k_adp)*(1+bpg13/PGK_k_bpg13)+(1+atp/PGK_k_atp)*(1+pg3/PGK_k_pg3)-1)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_556" name="PGK_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_515" name="PGK_k_adp" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_586" name="PGK_k_atp" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_587" name="PGK_k_bpg13" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_588" name="PGK_k_pg3" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_589" name="PGK_keq" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_590" name="adp" order="6" role="substrate"/>
        <ParameterDescription key="FunctionParameter_591" name="atp" order="7" role="product"/>
        <ParameterDescription key="FunctionParameter_592" name="bpg13" order="8" role="substrate"/>
        <ParameterDescription key="FunctionParameter_593" name="cyto" order="9" role="volume"/>
        <ParameterDescription key="FunctionParameter_594" name="pg3" order="10" role="product"/>
        <ParameterDescription key="FunctionParameter_595" name="scale_gly" order="11" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_62" name="Function for 2-Phospho-D-glycerate 2,3-phosphomutase" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*PGM_Vmax*(pg3-pg2/PGM_keq)/(pg3+PGM_k_pg3*(1+pg2/PGM_k_pg2))/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_477" name="PGM_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_555" name="PGM_k_pg2" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_553" name="PGM_k_pg3" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_478" name="PGM_keq" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_608" name="cyto" order="4" role="volume"/>
        <ParameterDescription key="FunctionParameter_609" name="pg2" order="5" role="product"/>
        <ParameterDescription key="FunctionParameter_610" name="pg3" order="6" role="substrate"/>
        <ParameterDescription key="FunctionParameter_611" name="scale_gly" order="7" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_63" name="Function for 2-Phospho-D-glucerate hydro-lyase (enolase)" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*EN_Vmax*(pg2-pep/EN_keq)/(pg2+EN_k_pg2*(1+pep/EN_k_pep))/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_620" name="EN_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_621" name="EN_k_pep" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_622" name="EN_k_pg2" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_623" name="EN_keq" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_624" name="cyto" order="4" role="volume"/>
        <ParameterDescription key="FunctionParameter_625" name="pep" order="5" role="product"/>
        <ParameterDescription key="FunctionParameter_626" name="pg2" order="6" role="substrate"/>
        <ParameterDescription key="FunctionParameter_627" name="scale_gly" order="7" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_64" name="Function for Pyruvatkinase" type="UserDefined" reversible="false">
      <Expression>
        ((1-gamma)*PK_native+gamma*PK_phospho)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_552" name="PK_native" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_512" name="PK_phospho" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_475" name="cyto" order="2" role="volume"/>
        <ParameterDescription key="FunctionParameter_513" name="gamma" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_65" name="Function for PEPCK cyto" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*PEPCK_Vmax/(PEPCK_k_oaa*PEPCK_k_gtp)*(oaa*gtp-pep*gdp*co2/PEPCK_keq)/((1+oaa/PEPCK_k_oaa)*(1+gtp/PEPCK_k_gtp)+(1+pep/PEPCK_k_pep)*(1+gdp/PEPCK_k_gdp)*(1+co2/PEPCK_k_co2)-1)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_650" name="PEPCK_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_651" name="PEPCK_k_co2" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_652" name="PEPCK_k_gdp" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_653" name="PEPCK_k_gtp" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_654" name="PEPCK_k_oaa" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_655" name="PEPCK_k_pep" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_656" name="PEPCK_keq" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_657" name="co2" order="7" role="product"/>
        <ParameterDescription key="FunctionParameter_658" name="cyto" order="8" role="volume"/>
        <ParameterDescription key="FunctionParameter_659" name="gdp" order="9" role="product"/>
        <ParameterDescription key="FunctionParameter_660" name="gtp" order="10" role="substrate"/>
        <ParameterDescription key="FunctionParameter_661" name="oaa" order="11" role="substrate"/>
        <ParameterDescription key="FunctionParameter_662" name="pep" order="12" role="product"/>
        <ParameterDescription key="FunctionParameter_663" name="scale_gly" order="13" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_66" name="Function for PEPCK mito" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*PEPCKM_Vmax/(PEPCK_k_oaa*PEPCK_k_gtp)*(oaa_mito*gtp_mito-pep_mito*gdp_mito*co2_mito/PEPCK_keq)/((1+oaa_mito/PEPCK_k_oaa)*(1+gtp_mito/PEPCK_k_gtp)+(1+pep_mito/PEPCK_k_pep)*(1+gdp_mito/PEPCK_k_gdp)*(1+co2_mito/PEPCK_k_co2)-1)/mito
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_678" name="PEPCKM_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_679" name="PEPCK_k_co2" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_680" name="PEPCK_k_gdp" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_681" name="PEPCK_k_gtp" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_682" name="PEPCK_k_oaa" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_683" name="PEPCK_k_pep" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_684" name="PEPCK_keq" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_685" name="co2_mito" order="7" role="product"/>
        <ParameterDescription key="FunctionParameter_686" name="gdp_mito" order="8" role="product"/>
        <ParameterDescription key="FunctionParameter_687" name="gtp_mito" order="9" role="substrate"/>
        <ParameterDescription key="FunctionParameter_688" name="mito" order="10" role="volume"/>
        <ParameterDescription key="FunctionParameter_689" name="oaa_mito" order="11" role="substrate"/>
        <ParameterDescription key="FunctionParameter_690" name="pep_mito" order="12" role="product"/>
        <ParameterDescription key="FunctionParameter_691" name="scale_gly" order="13" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_68" name="Function for Lactate Dehydrogenase" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*LDH_Vmax/(LDH_k_pyr*LDH_k_nadh)*(pyr*nadh-lac*nad/LDH_keq)/((1+nadh/LDH_k_nadh)*(1+pyr/LDH_k_pyr)+(1+lac/LDH_k_lac)*(1+nad/LDH_k_nad)-1)/cyto
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_728" name="LDH_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_729" name="LDH_k_lac" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_730" name="LDH_k_nad" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_731" name="LDH_k_nadh" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_732" name="LDH_k_pyr" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_733" name="LDH_keq" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_734" name="cyto" order="6" role="volume"/>
        <ParameterDescription key="FunctionParameter_735" name="lac" order="7" role="product"/>
        <ParameterDescription key="FunctionParameter_736" name="nad" order="8" role="product"/>
        <ParameterDescription key="FunctionParameter_737" name="nadh" order="9" role="substrate"/>
        <ParameterDescription key="FunctionParameter_738" name="pyr" order="10" role="substrate"/>
        <ParameterDescription key="FunctionParameter_739" name="scale_gly" order="11" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_69" name="Function for Lactate transport (import)" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*LACT_Vmax/LACT_k_lac*(lac_ext-lac/LACT_keq)/(1+lac_ext/LACT_k_lac+lac/LACT_k_lac)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_479" name="LACT_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_647" name="LACT_k_lac" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_646" name="LACT_keq" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_641" name="lac" order="3" role="product"/>
        <ParameterDescription key="FunctionParameter_554" name="lac_ext" order="4" role="substrate"/>
        <ParameterDescription key="FunctionParameter_649" name="scale_gly" order="5" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_70" name="Function for Pyruvate transport (mito)" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*PYRTM_Vmax/PYRTM_k_pyr*(pyr-pyr_mito/PYRTM_keq)/(1+pyr/PYRTM_k_pyr+pyr_mito/PYRTM_k_pyr)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_758" name="PYRTM_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_759" name="PYRTM_k_pyr" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_760" name="PYRTM_keq" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_761" name="pyr" order="3" role="substrate"/>
        <ParameterDescription key="FunctionParameter_762" name="pyr_mito" order="4" role="product"/>
        <ParameterDescription key="FunctionParameter_763" name="scale_gly" order="5" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_71" name="Function for PEP Transport (export mito)" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*PEPTM_Vmax/PEPTM_k_pep*(pep_mito-pep/PEPTM_keq)/(1+pep/PEPTM_k_pep+pep_mito/PEPTM_k_pep)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_770" name="PEPTM_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_771" name="PEPTM_k_pep" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_772" name="PEPTM_keq" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_773" name="pep" order="3" role="product"/>
        <ParameterDescription key="FunctionParameter_774" name="pep_mito" order="4" role="substrate"/>
        <ParameterDescription key="FunctionParameter_775" name="scale_gly" order="5" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_72" name="Function for Pyruvate Dehydrogenase" type="UserDefined" reversible="false">
      <Expression>
        ((1-gamma)*PDH_nat+gamma*PDH_p)/mito
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_644" name="PDH_nat" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_557" name="PDH_p" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_782" name="gamma" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_783" name="mito" order="3" role="volume"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_73" name="Function for Citrate Synthase" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*CS_Vmax/(CS_k_oaa*CS_k_acoa)*(acoa_mito*oaa_mito-cit_mito*coa_mito/CS_keq)/((1+acoa_mito/CS_k_acoa)*(1+oaa_mito/CS_k_oaa)+(1+cit_mito/CS_k_cit)*(1+coa_mito/CS_k_coa)-1)/mito
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_796" name="CS_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_797" name="CS_k_acoa" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_798" name="CS_k_cit" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_799" name="CS_k_coa" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_800" name="CS_k_oaa" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_801" name="CS_keq" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_802" name="acoa_mito" order="6" role="substrate"/>
        <ParameterDescription key="FunctionParameter_803" name="cit_mito" order="7" role="product"/>
        <ParameterDescription key="FunctionParameter_804" name="coa_mito" order="8" role="product"/>
        <ParameterDescription key="FunctionParameter_805" name="mito" order="9" role="volume"/>
        <ParameterDescription key="FunctionParameter_806" name="oaa_mito" order="10" role="substrate"/>
        <ParameterDescription key="FunctionParameter_807" name="scale_gly" order="11" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_74" name="Function for Nucleoside-diphosphate kinase (ATP, GTP) mito" type="UserDefined" reversible="true">
      <Expression>
        scale_gly*NDKGTPM_Vmax/(NDKGTPM_k_atp*NDKGTPM_k_gdp)*(atp_mito*gdp_mito-adp_mito*gtp_mito/NDKGTPM_keq)/((1+atp_mito/NDKGTPM_k_atp)*(1+gdp_mito/NDKGTPM_k_gdp)+(1+adp_mito/NDKGTPM_k_adp)*(1+gtp_mito/NDKGTPM_k_gtp)-1)/mito
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_820" name="NDKGTPM_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_821" name="NDKGTPM_k_adp" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_822" name="NDKGTPM_k_atp" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_823" name="NDKGTPM_k_gdp" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_824" name="NDKGTPM_k_gtp" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_825" name="NDKGTPM_keq" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_826" name="adp_mito" order="6" role="product"/>
        <ParameterDescription key="FunctionParameter_827" name="atp_mito" order="7" role="substrate"/>
        <ParameterDescription key="FunctionParameter_828" name="gdp_mito" order="8" role="substrate"/>
        <ParameterDescription key="FunctionParameter_829" name="gtp_mito" order="9" role="product"/>
        <ParameterDescription key="FunctionParameter_830" name="mito" order="10" role="volume"/>
        <ParameterDescription key="FunctionParameter_831" name="scale_gly" order="11" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_75" name="Function for oxalacetate influx" type="UserDefined" reversible="false">
      <Expression>
        scale_gly*OAAFLX_Vmax/mito
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_788" name="OAAFLX_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_790" name="mito" order="1" role="volume"/>
        <ParameterDescription key="FunctionParameter_792" name="scale_gly" order="2" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_76" name="Function for acetyl-coa efflux" type="UserDefined" reversible="false">
      <Expression>
        scale_gly*ACOAFLX_Vmax/mito
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_795" name="ACOAFLX_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_793" name="mito" order="1" role="volume"/>
        <ParameterDescription key="FunctionParameter_789" name="scale_gly" order="2" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_77" name="Function for citrate efflux" type="UserDefined" reversible="false">
      <Expression>
        scale_gly*CITFLX_Vmax/mito
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_847" name="CITFLX_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_848" name="mito" order="1" role="volume"/>
        <ParameterDescription key="FunctionParameter_849" name="scale_gly" order="2" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_78" name="Function for Pyruvate Carboxylase_1" type="UserDefined" reversible="false">
      <Expression>
        scale_gly*PC_Vmax*atp_mito/(PC_k_atp+atp_mito)*pyr_mito/(PC_k_pyr+pyr_mito)*co2_mito/(PC_k_co2+co2_mito)*acoa_mito^PC_n/(acoa_mito^PC_n+PC_k_acoa^PC_n)/mito
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_1061" name="PC_Vmax" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_1053" name="PC_k_acoa" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_1054" name="PC_k_atp" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_1055" name="PC_k_co2" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_1056" name="PC_k_pyr" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_1058" name="PC_n" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_1050" name="acoa_mito" order="6" role="modifier"/>
        <ParameterDescription key="FunctionParameter_1059" name="atp_mito" order="7" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1057" name="co2_mito" order="8" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1063" name="mito" order="9" role="volume"/>
        <ParameterDescription key="FunctionParameter_986" name="pyr_mito" order="10" role="substrate"/>
        <ParameterDescription key="FunctionParameter_984" name="scale_gly" order="11" role="constant"/>
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
        <dcterms:W3CDTF>2014-03-31T18:17:01Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

    </MiriamAnnotation>
    <ListOfCompartments>
      <Compartment key="Compartment_0" name="extern" simulationType="fixed" dimensionality="3">
      </Compartment>
      <Compartment key="Compartment_1" name="cyto" simulationType="fixed" dimensionality="3">
      </Compartment>
      <Compartment key="Compartment_2" name="mito" simulationType="fixed" dimensionality="3">
      </Compartment>
    </ListOfCompartments>
    <ListOfMetabolites>
      <Metabolite key="Metabolite_33" name="glc_ext" simulationType="fixed" compartment="Compartment_0">
      </Metabolite>
      <Metabolite key="Metabolite_34" name="lac_ext" simulationType="fixed" compartment="Compartment_0">
      </Metabolite>
      <Metabolite key="Metabolite_31" name="atp" simulationType="fixed" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_32" name="adp" simulationType="fixed" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_0" name="amp" simulationType="fixed" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_1" name="utp" simulationType="reactions" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_2" name="udp" simulationType="reactions" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_3" name="gtp" simulationType="reactions" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_4" name="gdp" simulationType="reactions" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_5" name="nad" simulationType="fixed" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_6" name="nadh" simulationType="fixed" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_7" name="phos" simulationType="fixed" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_8" name="pp" simulationType="reactions" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_9" name="co2" simulationType="fixed" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_10" name="h2o" simulationType="fixed" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_11" name="h" simulationType="fixed" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_12" name="glc1p" simulationType="reactions" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_13" name="udpglc" simulationType="reactions" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_16" name="glyglc" simulationType="reactions" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_17" name="glc" simulationType="reactions" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_18" name="glc6p" simulationType="reactions" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_19" name="fru6p" simulationType="reactions" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_20" name="fru16bp" simulationType="reactions" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_21" name="fru26bp" simulationType="reactions" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_22" name="grap" simulationType="reactions" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_23" name="dhap" simulationType="reactions" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_24" name="bpg13" simulationType="reactions" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_25" name="pg3" simulationType="reactions" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_26" name="pg2" simulationType="reactions" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_27" name="pep" simulationType="reactions" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_28" name="pyr" simulationType="reactions" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_29" name="oaa" simulationType="reactions" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_30" name="lac" simulationType="reactions" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_35" name="co2_mito" simulationType="fixed" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_36" name="phos_mito" simulationType="fixed" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_37" name="oaa_mito" simulationType="reactions" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_38" name="pep_mito" simulationType="reactions" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_39" name="acoa_mito" simulationType="fixed" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_40" name="pyr_mito" simulationType="reactions" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_41" name="cit_mito" simulationType="fixed" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_42" name="atp_mito" simulationType="fixed" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_43" name="adp_mito" simulationType="fixed" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_44" name="gtp_mito" simulationType="reactions" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_45" name="gdp_mito" simulationType="reactions" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_46" name="coa_mito" simulationType="fixed" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_47" name="nadh_mito" simulationType="fixed" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_48" name="nad_mito" simulationType="fixed" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_14" name="h2o_mito" simulationType="fixed" compartment="Compartment_2">
      </Metabolite>
      <Metabolite key="Metabolite_15" name="h_mito" simulationType="fixed" compartment="Compartment_2">
      </Metabolite>
    </ListOfMetabolites>
    <ListOfModelValues>
      <ModelValue key="ModelValue_492" name="nadh_tot" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[nadh],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[nad],Reference=Concentration&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_0" name="atp_tot" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[atp],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[adp],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[amp],Reference=Concentration&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_1" name="utp_tot" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[utp],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[udp],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[udpglc],Reference=Concentration&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_2" name="gtp_tot" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[gtp],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[gdp],Reference=Concentration&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_3" name="nadh_mito_tot" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[nadh_mito],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[nad_mito],Reference=Concentration&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_4" name="atp_mito_tot" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[atp_mito],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[adp_mito],Reference=Concentration&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_5" name="gtp_mito_tot" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[gtp_mito],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[gdp_mito],Reference=Concentration&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_6" name="x_ins1" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_7" name="x_ins2" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_8" name="x_ins3" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_9" name="x_ins4" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_10" name="ins" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_ins2],Reference=Value&gt;+(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_ins1],Reference=Value&gt;-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_ins2],Reference=Value&gt;)*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[extern],Vector=Metabolites[glc_ext],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_ins4],Reference=Value&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[extern],Vector=Metabolites[glc_ext],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_ins4],Reference=Value&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_ins3],Reference=Value&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_ins4],Reference=Value&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_11" name="ins_norm" simulationType="assignment">
        <Expression>
          maximum(0,&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[ins],Reference=Value&gt;-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_ins2],Reference=Value&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_12" name="x_glu1" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_13" name="x_glu2" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_14" name="x_glu3" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_15" name="x_glu4" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_16" name="glu" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_glu2],Reference=Value&gt;+(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_glu1],Reference=Value&gt;-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_glu2],Reference=Value&gt;)*(1-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[extern],Vector=Metabolites[glc_ext],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_glu4],Reference=Value&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[extern],Vector=Metabolites[glc_ext],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_glu4],Reference=Value&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_glu3],Reference=Value&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_glu4],Reference=Value&gt;))
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_17" name="glu_norm" simulationType="assignment">
        <Expression>
          maximum(0,&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[glu],Reference=Value&gt;-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_glu2],Reference=Value&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_18" name="x_epi1" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_19" name="x_epi2" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_20" name="x_epi3" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_21" name="x_epi4" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_22" name="epi" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_epi2],Reference=Value&gt;+(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_epi1],Reference=Value&gt;-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_epi2],Reference=Value&gt;)*(1-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[extern],Vector=Metabolites[glc_ext],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_epi4],Reference=Value&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[extern],Vector=Metabolites[glc_ext],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_epi4],Reference=Value&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_epi3],Reference=Value&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_epi4],Reference=Value&gt;))
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_23" name="epi_norm" simulationType="assignment">
        <Expression>
          maximum(0,&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[epi],Reference=Value&gt;-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_epi2],Reference=Value&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_24" name="K_val" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_25" name="epi_f" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_26" name="K_ins" simulationType="fixed">
        <InitialExpression>
          (&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_ins1],Reference=InitialValue&gt;-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_ins2],Reference=InitialValue&gt;)*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[K_val],Reference=InitialValue&gt;
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_27" name="K_glu" simulationType="fixed">
        <InitialExpression>
          (&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_glu1],Reference=InitialValue&gt;-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_glu2],Reference=InitialValue&gt;)*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[K_val],Reference=InitialValue&gt;
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_28" name="K_epi" simulationType="fixed">
        <InitialExpression>
          (&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_epi1],Reference=InitialValue&gt;-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[x_epi2],Reference=InitialValue&gt;)*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[K_val],Reference=InitialValue&gt;
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_29" name="gamma" simulationType="assignment">
        <Expression>
          0.5*(1-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[ins_norm],Reference=Value&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[ins_norm],Reference=Value&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[K_ins],Reference=Value&gt;)+maximum(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[glu_norm],Reference=Value&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[glu_norm],Reference=Value&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[K_glu],Reference=Value&gt;),&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[epi_f],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[epi_norm],Reference=Value&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[epi_norm],Reference=Value&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[K_epi],Reference=Value&gt;)))
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_30" name="scale" simulationType="fixed">
        <InitialExpression>
          1/60
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_31" name="scale_gly" simulationType="fixed">
        <InitialExpression>
          12.5*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[scale],Reference=InitialValue&gt;
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_32" name="scale_glyglc" simulationType="fixed">
        <InitialExpression>
          12.5*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[scale],Reference=InitialValue&gt;
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_33" name="GLUT2_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_34" name="GLUT2_km" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_35" name="GLUT2_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_36" name="GK_n_gkrp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_37" name="GK_km_glc1" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_38" name="GK_km_fru6p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_39" name="GK_b" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_40" name="GK_n" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_41" name="GK_km_glc" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_42" name="GK_km_atp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_43" name="GK_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_44" name="GK_gc_free" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glc],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GK_n_gkrp],Reference=Value&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glc],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GK_n_gkrp],Reference=Value&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GK_km_glc1],Reference=Value&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GK_n_gkrp],Reference=Value&gt;)*(1-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GK_b],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[fru6p],Reference=Concentration&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[fru6p],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GK_km_fru6p],Reference=Value&gt;))
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_45" name="G6PASE_km_glc6p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_46" name="G6PASE_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_47" name="GPI_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_48" name="GPI_km_glc6p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_49" name="GPI_km_fru6p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_50" name="GPI_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_51" name="G16PI_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_52" name="G16PI_km_glc6p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_53" name="G16PI_km_glc1p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_54" name="G16PI_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_55" name="UPGASE_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_56" name="UPGASE_km_utp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_57" name="UPGASE_km_glc1p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_58" name="UPGASE_km_udpglc" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_59" name="UPGASE_km_pp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_60" name="UPGASE_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_61" name="PPASE_km_pp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_62" name="PPASE_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_63" name="GS_C" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_64" name="GS_k1_max" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_65" name="GS_k1_nat" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_66" name="GS_k2_nat" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_67" name="GS_k1_phospho" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_68" name="GS_k2_phospho" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_69" name="GS_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_70" name="GS_storage_factor" simulationType="assignment">
        <Expression>
          (1+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GS_k1_max],Reference=Value&gt;)*(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GS_C],Reference=Value&gt;-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glyglc],Reference=Concentration&gt;)/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GS_C],Reference=Value&gt;-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glyglc],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GS_k1_max],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GS_C],Reference=Value&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_71" name="GS_k_udpglc_native" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GS_k1_nat],Reference=Value&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glc6p],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GS_k2_nat],Reference=Value&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_72" name="GS_k_udpglc_phospho" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GS_k1_phospho],Reference=Value&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glc6p],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GS_k2_phospho],Reference=Value&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_73" name="GS_native" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[scale_glyglc],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GS_Vmax],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GS_storage_factor],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[udpglc],Reference=Concentration&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GS_k_udpglc_native],Reference=Value&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[udpglc],Reference=Concentration&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_74" name="GS_phospho" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[scale_glyglc],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GS_Vmax],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GS_storage_factor],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[udpglc],Reference=Concentration&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GS_k_udpglc_phospho],Reference=Value&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[udpglc],Reference=Concentration&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_75" name="GP_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_76" name="GP_k_glyc_native" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_77" name="GP_k_glyc_phospho" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_78" name="GP_k_glc1p_native" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_79" name="GP_k_glc1p_phospho" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_80" name="GP_k_p_native" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_81" name="GP_k_p_phospho" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_82" name="GP_ki_glc_phospho" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_83" name="GP_ka_amp_native" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_84" name="GP_base_amp_native" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_85" name="GP_max_amp_native" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_86" name="GP_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_87" name="GP_C" simulationType="fixed">
        <InitialExpression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GS_C],Reference=InitialValue&gt;
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_88" name="GP_k1_max" simulationType="fixed">
        <InitialExpression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GS_k1_max],Reference=InitialValue&gt;
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_89" name="GP_fmax" simulationType="assignment">
        <Expression>
          (1+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_k1_max],Reference=Value&gt;)*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glyglc],Reference=Concentration&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glyglc],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_k1_max],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_C],Reference=Value&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_90" name="GP_vmax_native" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[scale_glyglc],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_Vmax],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_fmax],Reference=Value&gt;*(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_base_amp_native],Reference=Value&gt;+(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_max_amp_native],Reference=Value&gt;-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_base_amp_native],Reference=Value&gt;)*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[amp],Reference=Concentration&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[amp],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_ka_amp_native],Reference=Value&gt;))
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_91" name="GP_native" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_vmax_native],Reference=Value&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_k_glyc_native],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_k_p_native],Reference=Value&gt;)*(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glyglc],Reference=Concentration&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[phos],Reference=Concentration&gt;-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glc1p],Reference=Concentration&gt;/&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_keq],Reference=Value&gt;)/((1+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glyglc],Reference=Concentration&gt;/&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_k_glyc_native],Reference=Value&gt;)*(1+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[phos],Reference=Concentration&gt;/&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_k_p_native],Reference=Value&gt;)+1+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glc1p],Reference=Concentration&gt;/&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_k_glc1p_native],Reference=Value&gt;-1)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_92" name="GP_vmax_phospho" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[scale_glyglc],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_Vmax],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_fmax],Reference=Value&gt;*exp(-log(2)/&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_ki_glc_phospho],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glc],Reference=Concentration&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_93" name="GP_phospho" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_vmax_phospho],Reference=Value&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_k_glyc_phospho],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_k_p_phospho],Reference=Value&gt;)*(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glyglc],Reference=Concentration&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[phos],Reference=Concentration&gt;-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glc1p],Reference=Concentration&gt;/&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_keq],Reference=Value&gt;)/((1+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glyglc],Reference=Concentration&gt;/&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_k_glyc_phospho],Reference=Value&gt;)*(1+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[phos],Reference=Concentration&gt;/&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_k_p_phospho],Reference=Value&gt;)+1+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glc1p],Reference=Concentration&gt;/&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[GP_k_glc1p_phospho],Reference=Value&gt;-1)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_94" name="NDKGTP_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_95" name="NDKGTP_km_atp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_96" name="NDKGTP_km_adp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_97" name="NDKGTP_km_gtp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_98" name="NDKGTP_km_gdp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_99" name="NDKGTP_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_100" name="NDKUTP_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_101" name="NDKUTP_km_atp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_102" name="NDKUTP_km_adp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_103" name="NDKUTP_km_utp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_104" name="NDKUTP_km_udp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_105" name="NDKUTP_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_106" name="AK_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_107" name="AK_km_atp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_108" name="AK_km_amp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_109" name="AK_km_adp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_110" name="AK_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_111" name="PFK2_n_native" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_112" name="PFK2_n_phospho" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_113" name="PFK2_k_fru6p_native" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_114" name="PFK2_k_fru6p_phospho" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_115" name="PFK2_k_atp_native" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_116" name="PFK2_k_atp_phospho" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_117" name="PFK2_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_118" name="PFK2_native" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[scale_gly],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PFK2_Vmax],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[fru6p],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PFK2_n_native],Reference=Value&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[fru6p],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PFK2_n_native],Reference=Value&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PFK2_k_fru6p_native],Reference=Value&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PFK2_n_native],Reference=Value&gt;)*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[atp],Reference=Concentration&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[atp],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PFK2_k_atp_native],Reference=Value&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_119" name="PFK2_phospho" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[scale_gly],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PFK2_Vmax],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[fru6p],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PFK2_n_phospho],Reference=Value&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[fru6p],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PFK2_n_phospho],Reference=Value&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PFK2_k_fru6p_phospho],Reference=Value&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PFK2_n_phospho],Reference=Value&gt;)*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[atp],Reference=Concentration&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[atp],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PFK2_k_atp_phospho],Reference=Value&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_120" name="FBP2_km_fru26bp_native" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_121" name="FBP2_ki_fru6p_native" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_122" name="FBP2_km_fru26bp_phospho" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_123" name="FBP2_ki_fru6p_phospho" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_124" name="FBP2_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_125" name="FBP2_native" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[scale_gly],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[FBP2_Vmax],Reference=Value&gt;/(1+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[fru6p],Reference=Concentration&gt;/&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[FBP2_ki_fru6p_native],Reference=Value&gt;)*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[fru26bp],Reference=Concentration&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[FBP2_km_fru26bp_native],Reference=Value&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[fru26bp],Reference=Concentration&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_126" name="FBP2_phospho" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[scale_gly],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[FBP2_Vmax],Reference=Value&gt;/(1+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[fru6p],Reference=Concentration&gt;/&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[FBP2_ki_fru6p_phospho],Reference=Value&gt;)*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[fru26bp],Reference=Concentration&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[FBP2_km_fru26bp_phospho],Reference=Value&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[fru26bp],Reference=Concentration&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_127" name="PFK1_km_atp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_128" name="PFK1_km_fru6p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_129" name="PFK1_ki_fru6p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_130" name="PFK1_ka_fru26bp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_131" name="PFK1_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_132" name="FBP1_ki_fru26bp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_133" name="FBP1_km_fru16bp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_134" name="FBP1_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_135" name="ALD_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_136" name="ALD_km_fru16bp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_137" name="ALD_km_dhap" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_138" name="ALD_km_grap" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_139" name="ALD_ki1_grap" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_140" name="ALD_ki2_grap" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_141" name="ALD_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_142" name="TPI_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_143" name="TPI_km_dhap" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_144" name="TPI_km_grap" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_145" name="TPI_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_146" name="GAPDH_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_147" name="GAPDH_k_nad" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_148" name="GAPDH_k_grap" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_149" name="GAPDH_k_p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_150" name="GAPDH_k_nadh" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_151" name="GAPDH_k_bpg13" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_152" name="GAPDH_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_153" name="PGK_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_154" name="PGK_k_adp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_155" name="PGK_k_atp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_156" name="PGK_k_bpg13" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_157" name="PGK_k_pg3" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_158" name="PGK_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_159" name="PGM_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_160" name="PGM_k_pg3" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_161" name="PGM_k_pg2" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_162" name="PGM_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_163" name="EN_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_164" name="EN_k_pep" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_165" name="EN_k_pg2" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_166" name="EN_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_167" name="PK_n" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_168" name="PK_n_p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_169" name="PK_n_fbp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_170" name="PK_n_fbp_p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_171" name="PK_alpha" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_172" name="PK_alpha_p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_173" name="PK_alpha_end" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_174" name="PK_k_fbp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_175" name="PK_k_fbp_p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_176" name="PK_k_pep" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_177" name="PK_k_pep_p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_178" name="PK_k_pep_end" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_179" name="PK_k_adp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_180" name="PK_base_act" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_181" name="PK_base_act_p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_182" name="PK_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_183" name="PK_f" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[fru16bp],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_n_fbp],Reference=Value&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_k_fbp],Reference=Value&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_n_fbp],Reference=Value&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[fru16bp],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_n_fbp],Reference=Value&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_184" name="PK_f_p" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[fru16bp],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_n_fbp_p],Reference=Value&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_k_fbp_p],Reference=Value&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_n_fbp_p],Reference=Value&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[fru16bp],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_n_fbp_p],Reference=Value&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_185" name="PK_alpha_inp" simulationType="assignment">
        <Expression>
          (1-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_f],Reference=Value&gt;)*(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_alpha],Reference=Value&gt;-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_alpha_end],Reference=Value&gt;)+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_alpha_end],Reference=Value&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_186" name="PK_alpha_p_inp" simulationType="assignment">
        <Expression>
          (1-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_f_p],Reference=Value&gt;)*(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_alpha_p],Reference=Value&gt;-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_alpha_end],Reference=Value&gt;)+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_alpha_end],Reference=Value&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_187" name="PK_pep_inp" simulationType="assignment">
        <Expression>
          (1-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_f],Reference=Value&gt;)*(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_k_pep],Reference=Value&gt;-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_k_pep_end],Reference=Value&gt;)+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_k_pep_end],Reference=Value&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_188" name="PK_pep_p_inp" simulationType="assignment">
        <Expression>
          (1-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_f_p],Reference=Value&gt;)*(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_k_pep_p],Reference=Value&gt;-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_k_pep_end],Reference=Value&gt;)+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_k_pep_end],Reference=Value&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_189" name="PK_native" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[scale_gly],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_Vmax],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_alpha_inp],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[pep],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_n],Reference=Value&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_pep_inp],Reference=Value&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_n],Reference=Value&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[pep],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_n],Reference=Value&gt;)*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[adp],Reference=Concentration&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[adp],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_k_adp],Reference=Value&gt;)*(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_base_act],Reference=Value&gt;+(1-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_base_act],Reference=Value&gt;)*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_f],Reference=Value&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_190" name="PK_phospho" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[scale_gly],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_Vmax],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_alpha_p_inp],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[pep],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_n_p],Reference=Value&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_pep_p_inp],Reference=Value&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_n_p],Reference=Value&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[pep],Reference=Concentration&gt;^&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_n_p],Reference=Value&gt;)*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[adp],Reference=Concentration&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[adp],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_k_adp],Reference=Value&gt;)*(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_base_act_p],Reference=Value&gt;+(1-&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_base_act_p],Reference=Value&gt;)*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PK_f_p],Reference=Value&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_191" name="PEPCK_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_192" name="PEPCK_k_pep" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_193" name="PEPCK_k_gdp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_194" name="PEPCK_k_co2" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_195" name="PEPCK_k_oaa" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_196" name="PEPCK_k_gtp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_197" name="PEPCK_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_198" name="PEPCKM_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_199" name="PC_k_atp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_200" name="PC_k_pyr" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_201" name="PC_k_co2" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_202" name="PC_k_acoa" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_203" name="PC_n" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_204" name="PC_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_205" name="LDH_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_206" name="LDH_k_pyr" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_207" name="LDH_k_lac" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_208" name="LDH_k_nad" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_209" name="LDH_k_nadh" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_210" name="LDH_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_211" name="LACT_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_212" name="LACT_k_lac" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_213" name="LACT_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_214" name="PYRTM_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_215" name="PYRTM_k_pyr" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_216" name="PYRTM_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_217" name="PEPTM_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_218" name="PEPTM_k_pep" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_219" name="PEPTM_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_220" name="PDH_k_pyr" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_221" name="PDH_k_coa" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_222" name="PDH_k_nad" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_223" name="PDH_ki_acoa" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_224" name="PDH_ki_nadh" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_225" name="PDH_alpha_nat" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_226" name="PDH_alpha_p" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_227" name="PDH_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_228" name="PDH_base" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[scale_gly],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PDH_Vmax],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[pyr_mito],Reference=Concentration&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[pyr_mito],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PDH_k_pyr],Reference=Value&gt;)*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[nad_mito],Reference=Concentration&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[nad_mito],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PDH_k_nad],Reference=Value&gt;*(1+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[nadh_mito],Reference=Concentration&gt;/&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PDH_ki_nadh],Reference=Value&gt;))*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[coa_mito],Reference=Concentration&gt;/(&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[coa_mito],Reference=Concentration&gt;+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PDH_k_coa],Reference=Value&gt;*(1+&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[acoa_mito],Reference=Concentration&gt;/&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PDH_ki_acoa],Reference=Value&gt;))
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_229" name="PDH_nat" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PDH_base],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PDH_alpha_nat],Reference=Value&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_230" name="PDH_p" simulationType="assignment">
        <Expression>
          &lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PDH_base],Reference=Value&gt;*&lt;CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[PDH_alpha_p],Reference=Value&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_231" name="CS_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_232" name="CS_k_oaa" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_233" name="CS_k_acoa" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_234" name="CS_k_cit" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_235" name="CS_k_coa" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_236" name="CS_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_237" name="NDKGTPM_keq" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_238" name="NDKGTPM_k_atp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_239" name="NDKGTPM_k_adp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_240" name="NDKGTPM_k_gtp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_241" name="NDKGTPM_k_gdp" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_242" name="NDKGTPM_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_243" name="OAAFLX_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_244" name="ACOAFLX_Vmax" simulationType="fixed">
      </ModelValue>
      <ModelValue key="ModelValue_245" name="CITFLX_Vmax" simulationType="fixed">
      </ModelValue>
    </ListOfModelValues>
    <ListOfReactions>
      <Reaction key="Reaction_0" name="GLUT2 glucose transporter" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_33" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_17" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1354" name="GLUT2_Vmax" value="1"/>
          <Constant key="Parameter_1355" name="GLUT2_keq" value="1"/>
          <Constant key="Parameter_1356" name="GLUT2_km" value="1"/>
          <Constant key="Parameter_1357" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_42">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_270">
              <SourceParameter reference="ModelValue_35"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_271">
              <SourceParameter reference="ModelValue_33"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_272">
              <SourceParameter reference="ModelValue_34"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_273">
              <SourceParameter reference="Metabolite_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_274">
              <SourceParameter reference="Metabolite_33"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_275">
              <SourceParameter reference="ModelValue_31"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1" name="Glucokinase" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_17" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_31" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_18" stoichiometry="1"/>
          <Product metabolite="Metabolite_32" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1358" name="GK_Vmax" value="1"/>
          <Constant key="Parameter_1359" name="GK_gc_free" value="1"/>
          <Constant key="Parameter_1366" name="GK_km_atp" value="1"/>
          <Constant key="Parameter_1367" name="GK_km_glc" value="1"/>
          <Constant key="Parameter_1368" name="GK_n" value="1"/>
          <Constant key="Parameter_1369" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_43">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_285">
              <SourceParameter reference="ModelValue_43"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_286">
              <SourceParameter reference="ModelValue_44"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_287">
              <SourceParameter reference="ModelValue_42"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_288">
              <SourceParameter reference="ModelValue_41"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_289">
              <SourceParameter reference="ModelValue_40"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_290">
              <SourceParameter reference="Metabolite_31"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_291">
              <SourceParameter reference="Compartment_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_292">
              <SourceParameter reference="Metabolite_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_293">
              <SourceParameter reference="ModelValue_31"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_2" name="D-Glucose-6-phosphate Phosphatase" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_18" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_10" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_17" stoichiometry="1"/>
          <Product metabolite="Metabolite_7" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1370" name="G6PASE_Vmax" value="1"/>
          <Constant key="Parameter_1371" name="G6PASE_km_glc6p" value="1"/>
          <Constant key="Parameter_1378" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_44">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_283">
              <SourceParameter reference="ModelValue_46"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_269">
              <SourceParameter reference="ModelValue_45"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_268">
              <SourceParameter reference="Compartment_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_267">
              <SourceParameter reference="Metabolite_18"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_303">
              <SourceParameter reference="ModelValue_31"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_3" name="D-Glucose-6-phosphate Isomerase" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_18" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_19" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1379" name="GPI_Vmax" value="1"/>
          <Constant key="Parameter_1380" name="GPI_keq" value="1"/>
          <Constant key="Parameter_1381" name="GPI_km_fru6p" value="1"/>
          <Constant key="Parameter_1382" name="GPI_km_glc6p" value="1"/>
          <Constant key="Parameter_1383" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_45">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_312">
              <SourceParameter reference="ModelValue_50"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_313">
              <SourceParameter reference="ModelValue_47"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_314">
              <SourceParameter reference="ModelValue_49"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_315">
              <SourceParameter reference="ModelValue_48"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_316">
              <SourceParameter reference="Compartment_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_317">
              <SourceParameter reference="Metabolite_19"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_318">
              <SourceParameter reference="Metabolite_18"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_319">
              <SourceParameter reference="ModelValue_31"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_4" name="Glucose 1-phosphate 1,6-phosphomutase" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_12" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_18" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1390" name="G16PI_Vmax" value="1"/>
          <Constant key="Parameter_1391" name="G16PI_keq" value="1"/>
          <Constant key="Parameter_1392" name="G16PI_km_glc1p" value="1"/>
          <Constant key="Parameter_1393" name="G16PI_km_glc6p" value="1"/>
          <Constant key="Parameter_1394" name="scale_glyglc" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_46">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_328">
              <SourceParameter reference="ModelValue_54"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_329">
              <SourceParameter reference="ModelValue_51"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_330">
              <SourceParameter reference="ModelValue_53"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_331">
              <SourceParameter reference="ModelValue_52"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_332">
              <SourceParameter reference="Compartment_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_333">
              <SourceParameter reference="Metabolite_12"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_334">
              <SourceParameter reference="Metabolite_18"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_335">
              <SourceParameter reference="ModelValue_32"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_5" name="UTP:Glucose-1-phosphate uridylyltransferase" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_12" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_13" stoichiometry="1"/>
          <Product metabolite="Metabolite_8" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1395" name="UPGASE_Vmax" value="1"/>
          <Constant key="Parameter_1402" name="UPGASE_keq" value="1"/>
          <Constant key="Parameter_1403" name="UPGASE_km_glc1p" value="1"/>
          <Constant key="Parameter_1404" name="UPGASE_km_pp" value="1"/>
          <Constant key="Parameter_1405" name="UPGASE_km_udpglc" value="1"/>
          <Constant key="Parameter_1406" name="UPGASE_km_utp" value="1"/>
          <Constant key="Parameter_1407" name="scale_glyglc" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_47">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_348">
              <SourceParameter reference="ModelValue_60"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_349">
              <SourceParameter reference="ModelValue_55"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_350">
              <SourceParameter reference="ModelValue_57"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_351">
              <SourceParameter reference="ModelValue_59"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_352">
              <SourceParameter reference="ModelValue_58"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_353">
              <SourceParameter reference="ModelValue_56"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_354">
              <SourceParameter reference="Compartment_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_355">
              <SourceParameter reference="Metabolite_12"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_356">
              <SourceParameter reference="Metabolite_8"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_357">
              <SourceParameter reference="ModelValue_32"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_358">
              <SourceParameter reference="Metabolite_13"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_359">
              <SourceParameter reference="Metabolite_1"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_6" name="Pyrophosphate phosphohydrolase" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_8" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_10" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_7" stoichiometry="2"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1414" name="PPASE_Vmax" value="1"/>
          <Constant key="Parameter_1415" name="PPASE_km_pp" value="1"/>
          <Constant key="Parameter_1416" name="scale_glyglc" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_48">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_347">
              <SourceParameter reference="ModelValue_62"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_311">
              <SourceParameter reference="ModelValue_61"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_345">
              <SourceParameter reference="Compartment_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_346">
              <SourceParameter reference="Metabolite_8"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_284">
              <SourceParameter reference="ModelValue_32"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_7" name="Glycogen synthase" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_13" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_2" stoichiometry="1"/>
          <Product metabolite="Metabolite_16" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1417" name="GS_native" value="1"/>
          <Constant key="Parameter_1418" name="GS_phospho" value="1"/>
          <Constant key="Parameter_1419" name="gamma" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_49">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_310">
              <SourceParameter reference="ModelValue_73"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_375">
              <SourceParameter reference="ModelValue_74"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_376">
              <SourceParameter reference="Compartment_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_377">
              <SourceParameter reference="ModelValue_29"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_8" name="Glycogen-Phosphorylase" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_16" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_7" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_12" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1426" name="GP_native" value="1"/>
          <Constant key="Parameter_1427" name="GP_phospho" value="1"/>
          <Constant key="Parameter_1428" name="gamma" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_50">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_382">
              <SourceParameter reference="ModelValue_91"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_383">
              <SourceParameter reference="ModelValue_93"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_384">
              <SourceParameter reference="Compartment_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_385">
              <SourceParameter reference="ModelValue_29"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_9" name="Nucleoside-diphosphate kinase (ATP, GTP)" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_31" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_4" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_32" stoichiometry="1"/>
          <Product metabolite="Metabolite_3" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1429" name="NDKGTP_Vmax" value="1"/>
          <Constant key="Parameter_1430" name="NDKGTP_keq" value="1"/>
          <Constant key="Parameter_1431" name="NDKGTP_km_adp" value="1"/>
          <Constant key="Parameter_1438" name="NDKGTP_km_atp" value="1"/>
          <Constant key="Parameter_1439" name="NDKGTP_km_gdp" value="1"/>
          <Constant key="Parameter_1440" name="NDKGTP_km_gtp" value="1"/>
          <Constant key="Parameter_1441" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_51">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_398">
              <SourceParameter reference="ModelValue_99"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_399">
              <SourceParameter reference="ModelValue_94"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_400">
              <SourceParameter reference="ModelValue_96"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_401">
              <SourceParameter reference="ModelValue_95"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_402">
              <SourceParameter reference="ModelValue_98"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_403">
              <SourceParameter reference="ModelValue_97"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_404">
              <SourceParameter reference="Metabolite_32"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_405">
              <SourceParameter reference="Metabolite_31"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_406">
              <SourceParameter reference="Compartment_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_407">
              <SourceParameter reference="Metabolite_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_408">
              <SourceParameter reference="Metabolite_3"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_409">
              <SourceParameter reference="ModelValue_31"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_10" name="Nucleoside-diphosphate kinase (ATP, UTP)" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_31" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_2" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_32" stoichiometry="1"/>
          <Product metabolite="Metabolite_1" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1442" name="NDKUTP_Vmax" value="1"/>
          <Constant key="Parameter_1443" name="NDKUTP_keq" value="1"/>
          <Constant key="Parameter_1450" name="NDKUTP_km_adp" value="1"/>
          <Constant key="Parameter_1451" name="NDKUTP_km_atp" value="1"/>
          <Constant key="Parameter_1452" name="NDKUTP_km_udp" value="1"/>
          <Constant key="Parameter_1453" name="NDKUTP_km_utp" value="1"/>
          <Constant key="Parameter_1454" name="scale_glyglc" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_52">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_422">
              <SourceParameter reference="ModelValue_105"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_423">
              <SourceParameter reference="ModelValue_100"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_424">
              <SourceParameter reference="ModelValue_102"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_425">
              <SourceParameter reference="ModelValue_101"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_426">
              <SourceParameter reference="ModelValue_104"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_427">
              <SourceParameter reference="ModelValue_103"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_428">
              <SourceParameter reference="Metabolite_32"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_429">
              <SourceParameter reference="Metabolite_31"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_430">
              <SourceParameter reference="Compartment_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_431">
              <SourceParameter reference="ModelValue_32"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_432">
              <SourceParameter reference="Metabolite_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_433">
              <SourceParameter reference="Metabolite_1"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_11" name="ATP:AMP phosphotransferase (Adenylatkinase)" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_31" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_0" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_32" stoichiometry="2"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1455" name="AK_Vmax" value="1"/>
          <Constant key="Parameter_1462" name="AK_keq" value="1"/>
          <Constant key="Parameter_1463" name="AK_km_adp" value="1"/>
          <Constant key="Parameter_1464" name="AK_km_amp" value="1"/>
          <Constant key="Parameter_1465" name="AK_km_atp" value="1"/>
          <Constant key="Parameter_1466" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_53">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_265">
              <SourceParameter reference="ModelValue_110"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_393">
              <SourceParameter reference="ModelValue_106"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_446">
              <SourceParameter reference="ModelValue_109"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_447">
              <SourceParameter reference="ModelValue_108"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_448">
              <SourceParameter reference="ModelValue_107"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_449">
              <SourceParameter reference="Metabolite_32"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_450">
              <SourceParameter reference="Metabolite_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_451">
              <SourceParameter reference="Metabolite_31"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_452">
              <SourceParameter reference="Compartment_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_453">
              <SourceParameter reference="ModelValue_31"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_12" name="ATP:D-fructose-6-phosphate 2-phosphotransferase" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_19" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_31" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_21" stoichiometry="1"/>
          <Product metabolite="Metabolite_32" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1467" name="PFK2_native" value="1"/>
          <Constant key="Parameter_1474" name="PFK2_phospho" value="1"/>
          <Constant key="Parameter_1475" name="gamma" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_54">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_394">
              <SourceParameter reference="ModelValue_118"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_309">
              <SourceParameter reference="ModelValue_119"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_258">
              <SourceParameter reference="Compartment_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_391">
              <SourceParameter reference="ModelValue_29"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_13" name="D-Fructose-2,6-bisphosphate 2-phosphohydrolase" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_21" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_19" stoichiometry="1"/>
          <Product metabolite="Metabolite_7" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1476" name="FBP2_native" value="1"/>
          <Constant key="Parameter_1477" name="FBP2_phospho" value="1"/>
          <Constant key="Parameter_1478" name="gamma" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_55">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_466">
              <SourceParameter reference="ModelValue_125"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_467">
              <SourceParameter reference="ModelValue_126"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_468">
              <SourceParameter reference="Compartment_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_469">
              <SourceParameter reference="ModelValue_29"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_14" name="ATP:D-fructose-6-phosphate 1-phosphotransferase" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_19" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_31" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_20" stoichiometry="1"/>
          <Product metabolite="Metabolite_32" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_21" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_1479" name="PFK1_Vmax" value="1"/>
          <Constant key="Parameter_1486" name="PFK1_ka_fru26bp" value="1"/>
          <Constant key="Parameter_1487" name="PFK1_ki_fru6p" value="1"/>
          <Constant key="Parameter_1488" name="PFK1_km_atp" value="1"/>
          <Constant key="Parameter_1489" name="PFK1_km_fru6p" value="1"/>
          <Constant key="Parameter_1490" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_56">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_480">
              <SourceParameter reference="ModelValue_131"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_481">
              <SourceParameter reference="ModelValue_130"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_482">
              <SourceParameter reference="ModelValue_129"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_483">
              <SourceParameter reference="ModelValue_127"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_484">
              <SourceParameter reference="ModelValue_128"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_485">
              <SourceParameter reference="Metabolite_31"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_486">
              <SourceParameter reference="Compartment_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_487">
              <SourceParameter reference="Metabolite_21"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_488">
              <SourceParameter reference="Metabolite_19"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_489">
              <SourceParameter reference="ModelValue_31"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_15" name="D-Fructose-1,6-bisphosphate 1-phosphohydrolase" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_20" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_10" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_19" stoichiometry="1"/>
          <Product metabolite="Metabolite_7" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_21" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_1491" name="FBP1_Vmax" value="1"/>
          <Constant key="Parameter_1498" name="FBP1_ki_fru26bp" value="1"/>
          <Constant key="Parameter_1499" name="FBP1_km_fru16bp" value="1"/>
          <Constant key="Parameter_1500" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_57">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_476">
              <SourceParameter reference="ModelValue_134"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_396">
              <SourceParameter reference="ModelValue_132"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_395">
              <SourceParameter reference="ModelValue_133"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_500">
              <SourceParameter reference="Compartment_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_501">
              <SourceParameter reference="Metabolite_20"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_502">
              <SourceParameter reference="Metabolite_21"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_503">
              <SourceParameter reference="ModelValue_31"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_16" name="Aldolase" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_20" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_22" stoichiometry="1"/>
          <Product metabolite="Metabolite_23" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1501" name="ALD_Vmax" value="1"/>
          <Constant key="Parameter_1502" name="ALD_keq" value="1"/>
          <Constant key="Parameter_1503" name="ALD_ki1_grap" value="1"/>
          <Constant key="Parameter_1510" name="ALD_ki2_grap" value="1"/>
          <Constant key="Parameter_1511" name="ALD_km_dhap" value="1"/>
          <Constant key="Parameter_1512" name="ALD_km_fru16bp" value="1"/>
          <Constant key="Parameter_1513" name="ALD_km_grap" value="1"/>
          <Constant key="Parameter_1514" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_58">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_516">
              <SourceParameter reference="ModelValue_141"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_517">
              <SourceParameter reference="ModelValue_135"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_518">
              <SourceParameter reference="ModelValue_139"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_519">
              <SourceParameter reference="ModelValue_140"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_520">
              <SourceParameter reference="ModelValue_137"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_521">
              <SourceParameter reference="ModelValue_136"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_522">
              <SourceParameter reference="ModelValue_138"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_523">
              <SourceParameter reference="Compartment_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_524">
              <SourceParameter reference="Metabolite_23"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_525">
              <SourceParameter reference="Metabolite_20"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_526">
              <SourceParameter reference="Metabolite_22"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_527">
              <SourceParameter reference="ModelValue_31"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_17" name="Triosephosphate Isomerase" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_23" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_22" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1515" name="TPI_Vmax" value="1"/>
          <Constant key="Parameter_1522" name="TPI_keq" value="1"/>
          <Constant key="Parameter_1523" name="TPI_km_dhap" value="1"/>
          <Constant key="Parameter_1524" name="TPI_km_grap" value="1"/>
          <Constant key="Parameter_1525" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_59">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_514">
              <SourceParameter reference="ModelValue_145"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_511">
              <SourceParameter reference="ModelValue_142"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_474">
              <SourceParameter reference="ModelValue_143"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_390">
              <SourceParameter reference="ModelValue_144"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_540">
              <SourceParameter reference="Compartment_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_541">
              <SourceParameter reference="Metabolite_23"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_542">
              <SourceParameter reference="Metabolite_22"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_543">
              <SourceParameter reference="ModelValue_31"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_18" name="D-Glyceraldehyde-3-phosphate:NAD+ oxidoreductase" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_22" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_7" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_5" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_24" stoichiometry="1"/>
          <Product metabolite="Metabolite_6" stoichiometry="1"/>
          <Product metabolite="Metabolite_11" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1526" name="GAPDH_Vmax" value="1"/>
          <Constant key="Parameter_1527" name="GAPDH_k_bpg13" value="1"/>
          <Constant key="Parameter_1744" name="GAPDH_k_grap" value="1"/>
          <Constant key="Parameter_1745" name="GAPDH_k_nad" value="1"/>
          <Constant key="Parameter_1746" name="GAPDH_k_nadh" value="1"/>
          <Constant key="Parameter_1747" name="GAPDH_k_p" value="1"/>
          <Constant key="Parameter_1748" name="GAPDH_keq" value="1"/>
          <Constant key="Parameter_1749" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_60">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_558">
              <SourceParameter reference="ModelValue_152"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_559">
              <SourceParameter reference="ModelValue_151"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_560">
              <SourceParameter reference="ModelValue_148"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_561">
              <SourceParameter reference="ModelValue_147"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_562">
              <SourceParameter reference="ModelValue_150"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_563">
              <SourceParameter reference="ModelValue_149"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_564">
              <SourceParameter reference="ModelValue_146"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_565">
              <SourceParameter reference="Metabolite_24"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_566">
              <SourceParameter reference="Compartment_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_567">
              <SourceParameter reference="Metabolite_22"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_568">
              <SourceParameter reference="Metabolite_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_569">
              <SourceParameter reference="Metabolite_6"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_570">
              <SourceParameter reference="Metabolite_7"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_571">
              <SourceParameter reference="ModelValue_31"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_19" name="Phosphoglycerate Kinase" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_32" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_24" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_31" stoichiometry="1"/>
          <Product metabolite="Metabolite_25" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1750" name="PGK_Vmax" value="1"/>
          <Constant key="Parameter_1751" name="PGK_k_adp" value="1"/>
          <Constant key="Parameter_1752" name="PGK_k_atp" value="1"/>
          <Constant key="Parameter_1753" name="PGK_k_bpg13" value="1"/>
          <Constant key="Parameter_1754" name="PGK_k_pg3" value="1"/>
          <Constant key="Parameter_1755" name="PGK_keq" value="1"/>
          <Constant key="Parameter_1756" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_61">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_556">
              <SourceParameter reference="ModelValue_158"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_515">
              <SourceParameter reference="ModelValue_154"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_586">
              <SourceParameter reference="ModelValue_155"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_587">
              <SourceParameter reference="ModelValue_156"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_588">
              <SourceParameter reference="ModelValue_157"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_589">
              <SourceParameter reference="ModelValue_153"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_590">
              <SourceParameter reference="Metabolite_32"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_591">
              <SourceParameter reference="Metabolite_31"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_592">
              <SourceParameter reference="Metabolite_24"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_593">
              <SourceParameter reference="Compartment_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_594">
              <SourceParameter reference="Metabolite_25"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_595">
              <SourceParameter reference="ModelValue_31"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_20" name="2-Phospho-D-glycerate 2,3-phosphomutase" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_25" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_26" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1757" name="PGM_Vmax" value="1"/>
          <Constant key="Parameter_1758" name="PGM_k_pg2" value="1"/>
          <Constant key="Parameter_1759" name="PGM_k_pg3" value="1"/>
          <Constant key="Parameter_1760" name="PGM_keq" value="1"/>
          <Constant key="Parameter_1761" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_62">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_477">
              <SourceParameter reference="ModelValue_162"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_555">
              <SourceParameter reference="ModelValue_161"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_553">
              <SourceParameter reference="ModelValue_160"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_478">
              <SourceParameter reference="ModelValue_159"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_608">
              <SourceParameter reference="Compartment_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_609">
              <SourceParameter reference="Metabolite_26"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_610">
              <SourceParameter reference="Metabolite_25"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_611">
              <SourceParameter reference="ModelValue_31"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_21" name="2-Phospho-D-glucerate hydro-lyase (enolase)" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_26" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_27" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1762" name="EN_Vmax" value="1"/>
          <Constant key="Parameter_1763" name="EN_k_pep" value="1"/>
          <Constant key="Parameter_1764" name="EN_k_pg2" value="1"/>
          <Constant key="Parameter_1765" name="EN_keq" value="1"/>
          <Constant key="Parameter_1766" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_63">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_620">
              <SourceParameter reference="ModelValue_166"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_621">
              <SourceParameter reference="ModelValue_164"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_622">
              <SourceParameter reference="ModelValue_165"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_623">
              <SourceParameter reference="ModelValue_163"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_624">
              <SourceParameter reference="Compartment_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_625">
              <SourceParameter reference="Metabolite_27"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_626">
              <SourceParameter reference="Metabolite_26"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_627">
              <SourceParameter reference="ModelValue_31"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_22" name="Pyruvatkinase" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_27" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_32" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_28" stoichiometry="1"/>
          <Product metabolite="Metabolite_31" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1767" name="PK_native" value="1"/>
          <Constant key="Parameter_1768" name="PK_phospho" value="1"/>
          <Constant key="Parameter_1769" name="gamma" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_64">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_552">
              <SourceParameter reference="ModelValue_189"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_512">
              <SourceParameter reference="ModelValue_190"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_475">
              <SourceParameter reference="Compartment_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_513">
              <SourceParameter reference="ModelValue_29"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_23" name="PEPCK cyto" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_29" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_3" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_27" stoichiometry="1"/>
          <Product metabolite="Metabolite_4" stoichiometry="1"/>
          <Product metabolite="Metabolite_9" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1770" name="PEPCK_Vmax" value="1"/>
          <Constant key="Parameter_1771" name="PEPCK_k_co2" value="1"/>
          <Constant key="Parameter_1772" name="PEPCK_k_gdp" value="1"/>
          <Constant key="Parameter_1773" name="PEPCK_k_gtp" value="1"/>
          <Constant key="Parameter_1774" name="PEPCK_k_oaa" value="1"/>
          <Constant key="Parameter_1775" name="PEPCK_k_pep" value="1"/>
          <Constant key="Parameter_1776" name="PEPCK_keq" value="1"/>
          <Constant key="Parameter_1777" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_65">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_650">
              <SourceParameter reference="ModelValue_197"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_651">
              <SourceParameter reference="ModelValue_194"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_652">
              <SourceParameter reference="ModelValue_193"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_653">
              <SourceParameter reference="ModelValue_196"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_654">
              <SourceParameter reference="ModelValue_195"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_655">
              <SourceParameter reference="ModelValue_192"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_656">
              <SourceParameter reference="ModelValue_191"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_657">
              <SourceParameter reference="Metabolite_9"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_658">
              <SourceParameter reference="Compartment_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_659">
              <SourceParameter reference="Metabolite_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_660">
              <SourceParameter reference="Metabolite_3"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_661">
              <SourceParameter reference="Metabolite_29"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_662">
              <SourceParameter reference="Metabolite_27"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_663">
              <SourceParameter reference="ModelValue_31"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_24" name="PEPCK mito" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_37" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_44" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_38" stoichiometry="1"/>
          <Product metabolite="Metabolite_45" stoichiometry="1"/>
          <Product metabolite="Metabolite_35" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1778" name="PEPCKM_Vmax" value="1"/>
          <Constant key="Parameter_1779" name="PEPCK_k_co2" value="1"/>
          <Constant key="Parameter_1780" name="PEPCK_k_gdp" value="1"/>
          <Constant key="Parameter_1781" name="PEPCK_k_gtp" value="1"/>
          <Constant key="Parameter_1782" name="PEPCK_k_oaa" value="1"/>
          <Constant key="Parameter_1783" name="PEPCK_k_pep" value="1"/>
          <Constant key="Parameter_1784" name="PEPCK_keq" value="1"/>
          <Constant key="Parameter_1785" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_66">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_678">
              <SourceParameter reference="ModelValue_198"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_679">
              <SourceParameter reference="ModelValue_194"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_680">
              <SourceParameter reference="ModelValue_193"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_681">
              <SourceParameter reference="ModelValue_196"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_682">
              <SourceParameter reference="ModelValue_195"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_683">
              <SourceParameter reference="ModelValue_192"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_684">
              <SourceParameter reference="ModelValue_191"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_685">
              <SourceParameter reference="Metabolite_35"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_686">
              <SourceParameter reference="Metabolite_45"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_687">
              <SourceParameter reference="Metabolite_44"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_688">
              <SourceParameter reference="Compartment_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_689">
              <SourceParameter reference="Metabolite_37"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_690">
              <SourceParameter reference="Metabolite_38"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_691">
              <SourceParameter reference="ModelValue_31"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_25" name="Pyruvate Carboxylase" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_42" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_40" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_35" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_37" stoichiometry="1"/>
          <Product metabolite="Metabolite_43" stoichiometry="1"/>
          <Product metabolite="Metabolite_36" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_39" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_1786" name="PC_Vmax" value="1"/>
          <Constant key="Parameter_1787" name="PC_k_acoa" value="1"/>
          <Constant key="Parameter_1788" name="PC_k_atp" value="1"/>
          <Constant key="Parameter_1789" name="PC_k_co2" value="1"/>
          <Constant key="Parameter_1790" name="PC_k_pyr" value="1"/>
          <Constant key="Parameter_1791" name="PC_n" value="1"/>
          <Constant key="Parameter_1792" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_78">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_1061">
              <SourceParameter reference="ModelValue_204"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1053">
              <SourceParameter reference="ModelValue_202"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1054">
              <SourceParameter reference="ModelValue_199"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1055">
              <SourceParameter reference="ModelValue_201"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1056">
              <SourceParameter reference="ModelValue_200"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1058">
              <SourceParameter reference="ModelValue_203"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1050">
              <SourceParameter reference="Metabolite_39"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1059">
              <SourceParameter reference="Metabolite_42"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1057">
              <SourceParameter reference="Metabolite_35"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1063">
              <SourceParameter reference="Compartment_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_986">
              <SourceParameter reference="Metabolite_40"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_984">
              <SourceParameter reference="ModelValue_31"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_26" name="Lactate Dehydrogenase" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_28" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_6" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_30" stoichiometry="1"/>
          <Product metabolite="Metabolite_5" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1793" name="LDH_Vmax" value="1"/>
          <Constant key="Parameter_1794" name="LDH_k_lac" value="1"/>
          <Constant key="Parameter_1795" name="LDH_k_nad" value="1"/>
          <Constant key="Parameter_1796" name="LDH_k_nadh" value="1"/>
          <Constant key="Parameter_1797" name="LDH_k_pyr" value="1"/>
          <Constant key="Parameter_1798" name="LDH_keq" value="1"/>
          <Constant key="Parameter_1799" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_68">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_728">
              <SourceParameter reference="ModelValue_210"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_729">
              <SourceParameter reference="ModelValue_207"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_730">
              <SourceParameter reference="ModelValue_208"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_731">
              <SourceParameter reference="ModelValue_209"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_732">
              <SourceParameter reference="ModelValue_206"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_733">
              <SourceParameter reference="ModelValue_205"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_734">
              <SourceParameter reference="Compartment_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_735">
              <SourceParameter reference="Metabolite_30"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_736">
              <SourceParameter reference="Metabolite_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_737">
              <SourceParameter reference="Metabolite_6"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_738">
              <SourceParameter reference="Metabolite_28"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_739">
              <SourceParameter reference="ModelValue_31"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_27" name="Lactate transport (import)" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_34" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_30" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1800" name="LACT_Vmax" value="1"/>
          <Constant key="Parameter_1801" name="LACT_k_lac" value="1"/>
          <Constant key="Parameter_1802" name="LACT_keq" value="1"/>
          <Constant key="Parameter_1803" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_69">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_479">
              <SourceParameter reference="ModelValue_213"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_647">
              <SourceParameter reference="ModelValue_212"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_646">
              <SourceParameter reference="ModelValue_211"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_641">
              <SourceParameter reference="Metabolite_30"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_554">
              <SourceParameter reference="Metabolite_34"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_649">
              <SourceParameter reference="ModelValue_31"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_28" name="Pyruvate transport (mito)" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_28" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_40" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1804" name="PYRTM_Vmax" value="1"/>
          <Constant key="Parameter_1805" name="PYRTM_k_pyr" value="1"/>
          <Constant key="Parameter_1806" name="PYRTM_keq" value="1"/>
          <Constant key="Parameter_1807" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_70">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_758">
              <SourceParameter reference="ModelValue_216"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_759">
              <SourceParameter reference="ModelValue_215"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_760">
              <SourceParameter reference="ModelValue_214"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_761">
              <SourceParameter reference="Metabolite_28"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_762">
              <SourceParameter reference="Metabolite_40"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_763">
              <SourceParameter reference="ModelValue_31"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_29" name="PEP Transport (export mito)" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_38" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_27" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1808" name="PEPTM_Vmax" value="1"/>
          <Constant key="Parameter_1809" name="PEPTM_k_pep" value="1"/>
          <Constant key="Parameter_1810" name="PEPTM_keq" value="1"/>
          <Constant key="Parameter_1811" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_71">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_770">
              <SourceParameter reference="ModelValue_219"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_771">
              <SourceParameter reference="ModelValue_218"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_772">
              <SourceParameter reference="ModelValue_217"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_773">
              <SourceParameter reference="Metabolite_27"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_774">
              <SourceParameter reference="Metabolite_38"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_775">
              <SourceParameter reference="ModelValue_31"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_30" name="Pyruvate Dehydrogenase" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_40" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_46" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_48" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_39" stoichiometry="1"/>
          <Product metabolite="Metabolite_35" stoichiometry="1"/>
          <Product metabolite="Metabolite_47" stoichiometry="1"/>
          <Product metabolite="Metabolite_15" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1812" name="PDH_nat" value="1"/>
          <Constant key="Parameter_1813" name="PDH_p" value="1"/>
          <Constant key="Parameter_1814" name="gamma" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_72">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_644">
              <SourceParameter reference="ModelValue_229"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_557">
              <SourceParameter reference="ModelValue_230"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_782">
              <SourceParameter reference="ModelValue_29"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_783">
              <SourceParameter reference="Compartment_2"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_31" name="Citrate Synthase" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_39" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_37" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_14" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_41" stoichiometry="1"/>
          <Product metabolite="Metabolite_46" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1815" name="CS_Vmax" value="1"/>
          <Constant key="Parameter_1816" name="CS_k_acoa" value="1"/>
          <Constant key="Parameter_1817" name="CS_k_cit" value="1"/>
          <Constant key="Parameter_1818" name="CS_k_coa" value="1"/>
          <Constant key="Parameter_1819" name="CS_k_oaa" value="1"/>
          <Constant key="Parameter_1820" name="CS_keq" value="1"/>
          <Constant key="Parameter_1821" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_73">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_796">
              <SourceParameter reference="ModelValue_236"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_797">
              <SourceParameter reference="ModelValue_233"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_798">
              <SourceParameter reference="ModelValue_234"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_799">
              <SourceParameter reference="ModelValue_235"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_800">
              <SourceParameter reference="ModelValue_232"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_801">
              <SourceParameter reference="ModelValue_231"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_802">
              <SourceParameter reference="Metabolite_39"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_803">
              <SourceParameter reference="Metabolite_41"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_804">
              <SourceParameter reference="Metabolite_46"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_805">
              <SourceParameter reference="Compartment_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_806">
              <SourceParameter reference="Metabolite_37"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_807">
              <SourceParameter reference="ModelValue_31"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_32" name="Nucleoside-diphosphate kinase (ATP, GTP) mito" reversible="true">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_42" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_45" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_43" stoichiometry="1"/>
          <Product metabolite="Metabolite_44" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1822" name="NDKGTPM_Vmax" value="1"/>
          <Constant key="Parameter_1823" name="NDKGTPM_k_adp" value="1"/>
          <Constant key="Parameter_1824" name="NDKGTPM_k_atp" value="1"/>
          <Constant key="Parameter_1825" name="NDKGTPM_k_gdp" value="1"/>
          <Constant key="Parameter_1826" name="NDKGTPM_k_gtp" value="1"/>
          <Constant key="Parameter_1827" name="NDKGTPM_keq" value="1"/>
          <Constant key="Parameter_1828" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_74">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_820">
              <SourceParameter reference="ModelValue_242"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_821">
              <SourceParameter reference="ModelValue_239"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_822">
              <SourceParameter reference="ModelValue_238"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_823">
              <SourceParameter reference="ModelValue_241"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_824">
              <SourceParameter reference="ModelValue_240"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_825">
              <SourceParameter reference="ModelValue_237"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_826">
              <SourceParameter reference="Metabolite_43"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_827">
              <SourceParameter reference="Metabolite_42"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_828">
              <SourceParameter reference="Metabolite_45"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_829">
              <SourceParameter reference="Metabolite_44"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_830">
              <SourceParameter reference="Compartment_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_831">
              <SourceParameter reference="ModelValue_31"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_33" name="oxalacetate influx" reversible="false">
        <ListOfProducts>
          <Product metabolite="Metabolite_37" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1829" name="OAAFLX_Vmax" value="1"/>
          <Constant key="Parameter_1830" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_75">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_788">
              <SourceParameter reference="ModelValue_243"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_790">
              <SourceParameter reference="Compartment_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_792">
              <SourceParameter reference="ModelValue_31"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_34" name="acetyl-coa efflux" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_39" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_1831" name="ACOAFLX_Vmax" value="1"/>
          <Constant key="Parameter_1832" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_76">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_795">
              <SourceParameter reference="ModelValue_244"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_793">
              <SourceParameter reference="Compartment_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_789">
              <SourceParameter reference="ModelValue_31"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_35" name="citrate efflux" reversible="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_41" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_1833" name="CITFLX_Vmax" value="1"/>
          <Constant key="Parameter_1834" name="scale_gly" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_77">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_847">
              <SourceParameter reference="ModelValue_245"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_848">
              <SourceParameter reference="Compartment_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_849">
              <SourceParameter reference="ModelValue_31"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
    </ListOfReactions>
    <StateTemplate>
      <StateTemplateVariable objectReference="Model_0"/>
      <StateTemplateVariable objectReference="Metabolite_19"/>
      <StateTemplateVariable objectReference="Metabolite_27"/>
      <StateTemplateVariable objectReference="Metabolite_37"/>
      <StateTemplateVariable objectReference="Metabolite_18"/>
      <StateTemplateVariable objectReference="Metabolite_22"/>
      <StateTemplateVariable objectReference="Metabolite_28"/>
      <StateTemplateVariable objectReference="Metabolite_12"/>
      <StateTemplateVariable objectReference="Metabolite_40"/>
      <StateTemplateVariable objectReference="Metabolite_23"/>
      <StateTemplateVariable objectReference="Metabolite_25"/>
      <StateTemplateVariable objectReference="Metabolite_2"/>
      <StateTemplateVariable objectReference="Metabolite_17"/>
      <StateTemplateVariable objectReference="Metabolite_4"/>
      <StateTemplateVariable objectReference="Metabolite_44"/>
      <StateTemplateVariable objectReference="Metabolite_8"/>
      <StateTemplateVariable objectReference="Metabolite_30"/>
      <StateTemplateVariable objectReference="Metabolite_20"/>
      <StateTemplateVariable objectReference="Metabolite_26"/>
      <StateTemplateVariable objectReference="Metabolite_16"/>
      <StateTemplateVariable objectReference="Metabolite_38"/>
      <StateTemplateVariable objectReference="Metabolite_24"/>
      <StateTemplateVariable objectReference="Metabolite_21"/>
      <StateTemplateVariable objectReference="Metabolite_29"/>
      <StateTemplateVariable objectReference="Metabolite_13"/>
      <StateTemplateVariable objectReference="Metabolite_3"/>
      <StateTemplateVariable objectReference="Metabolite_1"/>
      <StateTemplateVariable objectReference="Metabolite_45"/>
      <StateTemplateVariable objectReference="ModelValue_10"/>
      <StateTemplateVariable objectReference="ModelValue_11"/>
      <StateTemplateVariable objectReference="ModelValue_16"/>
      <StateTemplateVariable objectReference="ModelValue_17"/>
      <StateTemplateVariable objectReference="ModelValue_22"/>
      <StateTemplateVariable objectReference="ModelValue_23"/>
      <StateTemplateVariable objectReference="ModelValue_29"/>
      <StateTemplateVariable objectReference="ModelValue_44"/>
      <StateTemplateVariable objectReference="ModelValue_70"/>
      <StateTemplateVariable objectReference="ModelValue_71"/>
      <StateTemplateVariable objectReference="ModelValue_72"/>
      <StateTemplateVariable objectReference="ModelValue_73"/>
      <StateTemplateVariable objectReference="ModelValue_74"/>
      <StateTemplateVariable objectReference="ModelValue_89"/>
      <StateTemplateVariable objectReference="ModelValue_90"/>
      <StateTemplateVariable objectReference="ModelValue_91"/>
      <StateTemplateVariable objectReference="ModelValue_92"/>
      <StateTemplateVariable objectReference="ModelValue_93"/>
      <StateTemplateVariable objectReference="ModelValue_118"/>
      <StateTemplateVariable objectReference="ModelValue_119"/>
      <StateTemplateVariable objectReference="ModelValue_125"/>
      <StateTemplateVariable objectReference="ModelValue_126"/>
      <StateTemplateVariable objectReference="ModelValue_183"/>
      <StateTemplateVariable objectReference="ModelValue_184"/>
      <StateTemplateVariable objectReference="ModelValue_185"/>
      <StateTemplateVariable objectReference="ModelValue_186"/>
      <StateTemplateVariable objectReference="ModelValue_187"/>
      <StateTemplateVariable objectReference="ModelValue_188"/>
      <StateTemplateVariable objectReference="ModelValue_189"/>
      <StateTemplateVariable objectReference="ModelValue_190"/>
      <StateTemplateVariable objectReference="ModelValue_228"/>
      <StateTemplateVariable objectReference="ModelValue_229"/>
      <StateTemplateVariable objectReference="ModelValue_230"/>
      <StateTemplateVariable objectReference="ModelValue_492"/>
      <StateTemplateVariable objectReference="ModelValue_0"/>
      <StateTemplateVariable objectReference="ModelValue_1"/>
      <StateTemplateVariable objectReference="ModelValue_2"/>
      <StateTemplateVariable objectReference="ModelValue_3"/>
      <StateTemplateVariable objectReference="ModelValue_4"/>
      <StateTemplateVariable objectReference="ModelValue_5"/>
      <StateTemplateVariable objectReference="Metabolite_33"/>
      <StateTemplateVariable objectReference="Metabolite_34"/>
      <StateTemplateVariable objectReference="Metabolite_31"/>
      <StateTemplateVariable objectReference="Metabolite_32"/>
      <StateTemplateVariable objectReference="Metabolite_0"/>
      <StateTemplateVariable objectReference="Metabolite_5"/>
      <StateTemplateVariable objectReference="Metabolite_6"/>
      <StateTemplateVariable objectReference="Metabolite_7"/>
      <StateTemplateVariable objectReference="Metabolite_9"/>
      <StateTemplateVariable objectReference="Metabolite_10"/>
      <StateTemplateVariable objectReference="Metabolite_11"/>
      <StateTemplateVariable objectReference="Metabolite_35"/>
      <StateTemplateVariable objectReference="Metabolite_36"/>
      <StateTemplateVariable objectReference="Metabolite_39"/>
      <StateTemplateVariable objectReference="Metabolite_41"/>
      <StateTemplateVariable objectReference="Metabolite_42"/>
      <StateTemplateVariable objectReference="Metabolite_43"/>
      <StateTemplateVariable objectReference="Metabolite_46"/>
      <StateTemplateVariable objectReference="Metabolite_47"/>
      <StateTemplateVariable objectReference="Metabolite_48"/>
      <StateTemplateVariable objectReference="Metabolite_14"/>
      <StateTemplateVariable objectReference="Metabolite_15"/>
      <StateTemplateVariable objectReference="Compartment_0"/>
      <StateTemplateVariable objectReference="Compartment_1"/>
      <StateTemplateVariable objectReference="Compartment_2"/>
      <StateTemplateVariable objectReference="ModelValue_6"/>
      <StateTemplateVariable objectReference="ModelValue_7"/>
      <StateTemplateVariable objectReference="ModelValue_8"/>
      <StateTemplateVariable objectReference="ModelValue_9"/>
      <StateTemplateVariable objectReference="ModelValue_12"/>
      <StateTemplateVariable objectReference="ModelValue_13"/>
      <StateTemplateVariable objectReference="ModelValue_14"/>
      <StateTemplateVariable objectReference="ModelValue_15"/>
      <StateTemplateVariable objectReference="ModelValue_18"/>
      <StateTemplateVariable objectReference="ModelValue_19"/>
      <StateTemplateVariable objectReference="ModelValue_20"/>
      <StateTemplateVariable objectReference="ModelValue_21"/>
      <StateTemplateVariable objectReference="ModelValue_24"/>
      <StateTemplateVariable objectReference="ModelValue_25"/>
      <StateTemplateVariable objectReference="ModelValue_26"/>
      <StateTemplateVariable objectReference="ModelValue_27"/>
      <StateTemplateVariable objectReference="ModelValue_28"/>
      <StateTemplateVariable objectReference="ModelValue_30"/>
      <StateTemplateVariable objectReference="ModelValue_31"/>
      <StateTemplateVariable objectReference="ModelValue_32"/>
      <StateTemplateVariable objectReference="ModelValue_33"/>
      <StateTemplateVariable objectReference="ModelValue_34"/>
      <StateTemplateVariable objectReference="ModelValue_35"/>
      <StateTemplateVariable objectReference="ModelValue_36"/>
      <StateTemplateVariable objectReference="ModelValue_37"/>
      <StateTemplateVariable objectReference="ModelValue_38"/>
      <StateTemplateVariable objectReference="ModelValue_39"/>
      <StateTemplateVariable objectReference="ModelValue_40"/>
      <StateTemplateVariable objectReference="ModelValue_41"/>
      <StateTemplateVariable objectReference="ModelValue_42"/>
      <StateTemplateVariable objectReference="ModelValue_43"/>
      <StateTemplateVariable objectReference="ModelValue_45"/>
      <StateTemplateVariable objectReference="ModelValue_46"/>
      <StateTemplateVariable objectReference="ModelValue_47"/>
      <StateTemplateVariable objectReference="ModelValue_48"/>
      <StateTemplateVariable objectReference="ModelValue_49"/>
      <StateTemplateVariable objectReference="ModelValue_50"/>
      <StateTemplateVariable objectReference="ModelValue_51"/>
      <StateTemplateVariable objectReference="ModelValue_52"/>
      <StateTemplateVariable objectReference="ModelValue_53"/>
      <StateTemplateVariable objectReference="ModelValue_54"/>
      <StateTemplateVariable objectReference="ModelValue_55"/>
      <StateTemplateVariable objectReference="ModelValue_56"/>
      <StateTemplateVariable objectReference="ModelValue_57"/>
      <StateTemplateVariable objectReference="ModelValue_58"/>
      <StateTemplateVariable objectReference="ModelValue_59"/>
      <StateTemplateVariable objectReference="ModelValue_60"/>
      <StateTemplateVariable objectReference="ModelValue_61"/>
      <StateTemplateVariable objectReference="ModelValue_62"/>
      <StateTemplateVariable objectReference="ModelValue_63"/>
      <StateTemplateVariable objectReference="ModelValue_64"/>
      <StateTemplateVariable objectReference="ModelValue_65"/>
      <StateTemplateVariable objectReference="ModelValue_66"/>
      <StateTemplateVariable objectReference="ModelValue_67"/>
      <StateTemplateVariable objectReference="ModelValue_68"/>
      <StateTemplateVariable objectReference="ModelValue_69"/>
      <StateTemplateVariable objectReference="ModelValue_75"/>
      <StateTemplateVariable objectReference="ModelValue_76"/>
      <StateTemplateVariable objectReference="ModelValue_77"/>
      <StateTemplateVariable objectReference="ModelValue_78"/>
      <StateTemplateVariable objectReference="ModelValue_79"/>
      <StateTemplateVariable objectReference="ModelValue_80"/>
      <StateTemplateVariable objectReference="ModelValue_81"/>
      <StateTemplateVariable objectReference="ModelValue_82"/>
      <StateTemplateVariable objectReference="ModelValue_83"/>
      <StateTemplateVariable objectReference="ModelValue_84"/>
      <StateTemplateVariable objectReference="ModelValue_85"/>
      <StateTemplateVariable objectReference="ModelValue_86"/>
      <StateTemplateVariable objectReference="ModelValue_87"/>
      <StateTemplateVariable objectReference="ModelValue_88"/>
      <StateTemplateVariable objectReference="ModelValue_94"/>
      <StateTemplateVariable objectReference="ModelValue_95"/>
      <StateTemplateVariable objectReference="ModelValue_96"/>
      <StateTemplateVariable objectReference="ModelValue_97"/>
      <StateTemplateVariable objectReference="ModelValue_98"/>
      <StateTemplateVariable objectReference="ModelValue_99"/>
      <StateTemplateVariable objectReference="ModelValue_100"/>
      <StateTemplateVariable objectReference="ModelValue_101"/>
      <StateTemplateVariable objectReference="ModelValue_102"/>
      <StateTemplateVariable objectReference="ModelValue_103"/>
      <StateTemplateVariable objectReference="ModelValue_104"/>
      <StateTemplateVariable objectReference="ModelValue_105"/>
      <StateTemplateVariable objectReference="ModelValue_106"/>
      <StateTemplateVariable objectReference="ModelValue_107"/>
      <StateTemplateVariable objectReference="ModelValue_108"/>
      <StateTemplateVariable objectReference="ModelValue_109"/>
      <StateTemplateVariable objectReference="ModelValue_110"/>
      <StateTemplateVariable objectReference="ModelValue_111"/>
      <StateTemplateVariable objectReference="ModelValue_112"/>
      <StateTemplateVariable objectReference="ModelValue_113"/>
      <StateTemplateVariable objectReference="ModelValue_114"/>
      <StateTemplateVariable objectReference="ModelValue_115"/>
      <StateTemplateVariable objectReference="ModelValue_116"/>
      <StateTemplateVariable objectReference="ModelValue_117"/>
      <StateTemplateVariable objectReference="ModelValue_120"/>
      <StateTemplateVariable objectReference="ModelValue_121"/>
      <StateTemplateVariable objectReference="ModelValue_122"/>
      <StateTemplateVariable objectReference="ModelValue_123"/>
      <StateTemplateVariable objectReference="ModelValue_124"/>
      <StateTemplateVariable objectReference="ModelValue_127"/>
      <StateTemplateVariable objectReference="ModelValue_128"/>
      <StateTemplateVariable objectReference="ModelValue_129"/>
      <StateTemplateVariable objectReference="ModelValue_130"/>
      <StateTemplateVariable objectReference="ModelValue_131"/>
      <StateTemplateVariable objectReference="ModelValue_132"/>
      <StateTemplateVariable objectReference="ModelValue_133"/>
      <StateTemplateVariable objectReference="ModelValue_134"/>
      <StateTemplateVariable objectReference="ModelValue_135"/>
      <StateTemplateVariable objectReference="ModelValue_136"/>
      <StateTemplateVariable objectReference="ModelValue_137"/>
      <StateTemplateVariable objectReference="ModelValue_138"/>
      <StateTemplateVariable objectReference="ModelValue_139"/>
      <StateTemplateVariable objectReference="ModelValue_140"/>
      <StateTemplateVariable objectReference="ModelValue_141"/>
      <StateTemplateVariable objectReference="ModelValue_142"/>
      <StateTemplateVariable objectReference="ModelValue_143"/>
      <StateTemplateVariable objectReference="ModelValue_144"/>
      <StateTemplateVariable objectReference="ModelValue_145"/>
      <StateTemplateVariable objectReference="ModelValue_146"/>
      <StateTemplateVariable objectReference="ModelValue_147"/>
      <StateTemplateVariable objectReference="ModelValue_148"/>
      <StateTemplateVariable objectReference="ModelValue_149"/>
      <StateTemplateVariable objectReference="ModelValue_150"/>
      <StateTemplateVariable objectReference="ModelValue_151"/>
      <StateTemplateVariable objectReference="ModelValue_152"/>
      <StateTemplateVariable objectReference="ModelValue_153"/>
      <StateTemplateVariable objectReference="ModelValue_154"/>
      <StateTemplateVariable objectReference="ModelValue_155"/>
      <StateTemplateVariable objectReference="ModelValue_156"/>
      <StateTemplateVariable objectReference="ModelValue_157"/>
      <StateTemplateVariable objectReference="ModelValue_158"/>
      <StateTemplateVariable objectReference="ModelValue_159"/>
      <StateTemplateVariable objectReference="ModelValue_160"/>
      <StateTemplateVariable objectReference="ModelValue_161"/>
      <StateTemplateVariable objectReference="ModelValue_162"/>
      <StateTemplateVariable objectReference="ModelValue_163"/>
      <StateTemplateVariable objectReference="ModelValue_164"/>
      <StateTemplateVariable objectReference="ModelValue_165"/>
      <StateTemplateVariable objectReference="ModelValue_166"/>
      <StateTemplateVariable objectReference="ModelValue_167"/>
      <StateTemplateVariable objectReference="ModelValue_168"/>
      <StateTemplateVariable objectReference="ModelValue_169"/>
      <StateTemplateVariable objectReference="ModelValue_170"/>
      <StateTemplateVariable objectReference="ModelValue_171"/>
      <StateTemplateVariable objectReference="ModelValue_172"/>
      <StateTemplateVariable objectReference="ModelValue_173"/>
      <StateTemplateVariable objectReference="ModelValue_174"/>
      <StateTemplateVariable objectReference="ModelValue_175"/>
      <StateTemplateVariable objectReference="ModelValue_176"/>
      <StateTemplateVariable objectReference="ModelValue_177"/>
      <StateTemplateVariable objectReference="ModelValue_178"/>
      <StateTemplateVariable objectReference="ModelValue_179"/>
      <StateTemplateVariable objectReference="ModelValue_180"/>
      <StateTemplateVariable objectReference="ModelValue_181"/>
      <StateTemplateVariable objectReference="ModelValue_182"/>
      <StateTemplateVariable objectReference="ModelValue_191"/>
      <StateTemplateVariable objectReference="ModelValue_192"/>
      <StateTemplateVariable objectReference="ModelValue_193"/>
      <StateTemplateVariable objectReference="ModelValue_194"/>
      <StateTemplateVariable objectReference="ModelValue_195"/>
      <StateTemplateVariable objectReference="ModelValue_196"/>
      <StateTemplateVariable objectReference="ModelValue_197"/>
      <StateTemplateVariable objectReference="ModelValue_198"/>
      <StateTemplateVariable objectReference="ModelValue_199"/>
      <StateTemplateVariable objectReference="ModelValue_200"/>
      <StateTemplateVariable objectReference="ModelValue_201"/>
      <StateTemplateVariable objectReference="ModelValue_202"/>
      <StateTemplateVariable objectReference="ModelValue_203"/>
      <StateTemplateVariable objectReference="ModelValue_204"/>
      <StateTemplateVariable objectReference="ModelValue_205"/>
      <StateTemplateVariable objectReference="ModelValue_206"/>
      <StateTemplateVariable objectReference="ModelValue_207"/>
      <StateTemplateVariable objectReference="ModelValue_208"/>
      <StateTemplateVariable objectReference="ModelValue_209"/>
      <StateTemplateVariable objectReference="ModelValue_210"/>
      <StateTemplateVariable objectReference="ModelValue_211"/>
      <StateTemplateVariable objectReference="ModelValue_212"/>
      <StateTemplateVariable objectReference="ModelValue_213"/>
      <StateTemplateVariable objectReference="ModelValue_214"/>
      <StateTemplateVariable objectReference="ModelValue_215"/>
      <StateTemplateVariable objectReference="ModelValue_216"/>
      <StateTemplateVariable objectReference="ModelValue_217"/>
      <StateTemplateVariable objectReference="ModelValue_218"/>
      <StateTemplateVariable objectReference="ModelValue_219"/>
      <StateTemplateVariable objectReference="ModelValue_220"/>
      <StateTemplateVariable objectReference="ModelValue_221"/>
      <StateTemplateVariable objectReference="ModelValue_222"/>
      <StateTemplateVariable objectReference="ModelValue_223"/>
      <StateTemplateVariable objectReference="ModelValue_224"/>
      <StateTemplateVariable objectReference="ModelValue_225"/>
      <StateTemplateVariable objectReference="ModelValue_226"/>
      <StateTemplateVariable objectReference="ModelValue_227"/>
      <StateTemplateVariable objectReference="ModelValue_231"/>
      <StateTemplateVariable objectReference="ModelValue_232"/>
      <StateTemplateVariable objectReference="ModelValue_233"/>
      <StateTemplateVariable objectReference="ModelValue_234"/>
      <StateTemplateVariable objectReference="ModelValue_235"/>
      <StateTemplateVariable objectReference="ModelValue_236"/>
      <StateTemplateVariable objectReference="ModelValue_237"/>
      <StateTemplateVariable objectReference="ModelValue_238"/>
      <StateTemplateVariable objectReference="ModelValue_239"/>
      <StateTemplateVariable objectReference="ModelValue_240"/>
      <StateTemplateVariable objectReference="ModelValue_241"/>
      <StateTemplateVariable objectReference="ModelValue_242"/>
      <StateTemplateVariable objectReference="ModelValue_243"/>
      <StateTemplateVariable objectReference="ModelValue_244"/>
      <StateTemplateVariable objectReference="ModelValue_245"/>
    </StateTemplate>
    <InitialState type="initialState">
      0 3.011070895000001e+19 9.033212685000003e+19 1.204428358e+18 7.226570148e+19 6.022141790000001e+19 6.022141790000001e+19 7.226570148000001e+18 1.204428358e+19 1.806642537e+19 1.6259782833e+20 5.419927611000001e+19 3.011070895e+21 6.022141790000001e+19 3.4928422382e+19 4.817713432000005e+18 3.011070895e+20 1.204428358e+19 1.806642537e+19 1.5055354475e+23 1.806642537e+19 1.806642537000001e+20 2.408856716000003e+18 6.022141790000001e+18 2.2884138802e+20 1.7464211191e+20 1.6259782833e+20 1.204428358e+19 9.706621497248314 9.706621497248314 114.7598203860621 76.8598203860621 3504.875214827858 3404.875214827858 0.8644139472762336 0.04166666666666668 0.8571428571428571 0.8284023668639054 14.28027961386657 0.7412384403374512 0.06109803559729282 0.8571428571428571 0.08165024630541871 0.001313251065138865 0.6071428571428571 0.3003046505846783 0.0006481073377200431 0.000355072463768116 0.0004906542056074769 0.00388888888888889 0.9998319304726325 0.9993126627543607 1 1.000068733724564 0.08008403476368374 0.08070108399055208 2.234966307746586 2.227920075072195 1.068820504173341 5.344102520866706 1.068820504173341 1.22056 3.76 0.74 0.39 1.22 3.6 0.39 1.806642537e+22 7.226570148000002e+21 1.6861997012e+21 4.817713432000001e+20 9.635426864000002e+19 7.347012983800001e+20 3.3723994024e+17 3.011070895e+21 3.011070895e+21 0 0 6.022141790000001e+20 6.022141790000001e+20 4.817713432000001e+18 3.854170745600001e+19 3.3723994024e+20 9.635426864000003e+19 6.624355969000003e+18 2.8906280592e+19 1.180339790840001e+20 0 0 10 1 0.2 818.9 0 8.6 4.2 190 37.9 3.01 6.4 6090 100 3.1 8.4 0.1 0.8 81.89 15.21 599 0.01666666666666667 0.2083333333333333 0.2083333333333333 1 42 420 2 15 0.01 0.7 1.6 7.5 0.26 25.2 2 18.9 0.517060817492925 0.182 0.07099999999999999 420 15.7175540821514 0.67 0.045 100 0.312237619153088 0.5629999999999999 0.172 0.049 0.166 80 0.005 2.4 500 0.2 0.224 0.1504 3.003 0.09029 13.2 0.211826505793075 4.8 2.7 120 2 300 5 5 1 0.03 0.3 6.8 500 0.2 1 1.33 0.042 0.15 0.031 0 1 1.33 0.042 16 0.19 2940 0.247390074904985 0.09 0.08 0.11 0 1.3 2.1 0.016 0.05 0.28 0.65 0.0042 0.01 0.0035 0.0005 0.01 0.126 0.111 0.077 0.012 0.001 7.182 0.001 0.0013 4.326 9.76298897362969e-05 0.0071 0.0364 0.0071 0.0572 0.176 420 0.054476985386756 0.59 0.42 420 0.086779866194594 0.05 0.005 3.9 0.0083 0.0035 420 6.95864405248854 0.35 0.48 0.002 1.2 420 0.181375378837397 5 1 420 0.054476985386756 1 1 35.994 3.5 3.5 1.8 1.8 1 1.1 1 0.00016 0.00035 0.58 1.1 0.08 2.3 0.08 0.04 46.2 336.956521586429 0.237 0.0921 25.5 0.0055 0.0222 0 546 0.22 0.22 3.2 0.015 2.5 168 0.000278321076004752 0.495 31.98 0.984 0.027 12.6 1 0.8 5.418 1 0.1 42 1 0.1 33.6 0.025 0.013 0.05 0.035 0.036 5 1 13.44 266599.030842759 0.002 0.016 0.42 0.07000000000000001 4.2 1 1.33 0.042 0.15 0.031 420 0 0 0 
    </InitialState>
  </Model>
  <ListOfTasks>
    <Task key="Task_0" name="Steady-State" type="steadyState" scheduled="false" updateModel="false">
      <Report reference="Report_8" target="" append="1" confirmOverwrite="1"/>
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
    <Task key="Task_11" name="Time-Course" type="timeCourse" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="StepNumber" type="unsignedInteger" value="2000"/>
        <Parameter name="StepSize" type="float" value="60"/>
        <Parameter name="Duration" type="float" value="120000"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
        <Parameter name="Output Event" type="bool" value="0"/>
      </Problem>
      <Method name="Deterministic (LSODA)" type="Deterministic(LSODA)">
        <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="1e-06"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="1e-12"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="10000"/>
      </Method>
    </Task>
    <Task key="Task_10" name="Scan" type="scan" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="Subtask" type="unsignedInteger" value="1"/>
        <ParameterGroup name="ScanItems">
          <ParameterGroup name="ScanItem">
            <Parameter name="Number of steps" type="unsignedInteger" value="40"/>
            <Parameter name="Type" type="unsignedInteger" value="1"/>
            <Parameter name="Object" type="cn" value="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[extern],Vector=Metabolites[glc_ext],Reference=InitialConcentration"/>
            <Parameter name="Minimum" type="float" value="2"/>
            <Parameter name="Maximum" type="float" value="16"/>
            <Parameter name="log" type="bool" value="0"/>
          </ParameterGroup>
        </ParameterGroup>
        <Parameter name="Output in subtask" type="bool" value="1"/>
        <Parameter name="Adjust initial conditions" type="bool" value="0"/>
      </Problem>
      <Method name="Scan Framework" type="ScanFramework">
      </Method>
    </Task>
    <Task key="Task_9" name="Elementary Flux Modes" type="fluxMode" scheduled="false" updateModel="false">
      <Report reference="Report_7" target="" append="1" confirmOverwrite="1"/>
      <Problem>
      </Problem>
      <Method name="EFM Algorithm" type="EFMAlgorithm">
      </Method>
    </Task>
    <Task key="Task_8" name="Optimization" type="optimization" scheduled="false" updateModel="false">
      <Report reference="Report_6" target="" append="1" confirmOverwrite="1"/>
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
    <Task key="Task_7" name="Parameter Estimation" type="parameterFitting" scheduled="false" updateModel="false">
      <Report reference="Report_5" target="" append="1" confirmOverwrite="1"/>
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
        <Parameter name="Steady-State" type="key" value="Task_0"/>
      </Problem>
      <Method name="MCA Method (Reder)" type="MCAMethod(Reder)">
        <Parameter name="Modulation Factor" type="unsignedFloat" value="1e-09"/>
      </Method>
    </Task>
    <Task key="Task_5" name="Lyapunov Exponents" type="lyapunovExponents" scheduled="false" updateModel="false">
      <Report reference="Report_3" target="" append="1" confirmOverwrite="1"/>
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
    <Task key="Task_4" name="Time Scale Separation Analysis" type="timeScaleSeparationAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_2" target="" append="1" confirmOverwrite="1"/>
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
    <Task key="Task_3" name="Sensitivities" type="sensitivities" scheduled="false" updateModel="false">
      <Report reference="Report_1" target="" append="1" confirmOverwrite="1"/>
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
    <Task key="Task_2" name="Moieties" type="moieties" scheduled="false" updateModel="false">
      <Problem>
      </Problem>
      <Method name="Householder Reduction" type="Householder">
      </Method>
    </Task>
    <Task key="Task_1" name="Cross Section" type="crosssection" scheduled="false" updateModel="false">
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
    <Task key="Task_12" name="Linear Noise Approximation" type="linearNoiseApproximation" scheduled="false" updateModel="false">
      <Report reference="Report_0" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value="Task_0"/>
      </Problem>
      <Method name="Linear Noise Approximation" type="LinearNoiseApproximation">
      </Method>
    </Task>
  </ListOfTasks>
  <ListOfReports>
    <Report key="Report_8" name="Steady-State" taskType="steadyState" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Steady-State]"/>
      </Footer>
    </Report>
    <Report key="Report_7" name="Elementary Flux Modes" taskType="fluxMode" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Elementary Flux Modes],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_6" name="Optimization" taskType="optimization" separator="&#x09;" precision="6">
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
    <Report key="Report_5" name="Parameter Estimation" taskType="parameterFitting" separator="&#x09;" precision="6">
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
    <Report key="Report_3" name="Lyapunov Exponents" taskType="lyapunovExponents" separator="&#x09;" precision="6">
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
    <Report key="Report_2" name="Time Scale Separation Analysis" taskType="timeScaleSeparationAnalysis" separator="&#x09;" precision="6">
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
    <Report key="Report_1" name="Sensitivities" taskType="sensitivities" separator="&#x09;" precision="6">
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
    <Report key="Report_0" name="Linear Noise Approximation" taskType="linearNoiseApproximation" separator="&#x09;" precision="6">
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
    <PlotSpecification name="plot_1" type="Plot2D" active="1">
      <Parameter name="log X" type="bool" value="0"/>
      <Parameter name="log Y" type="bool" value="0"/>
      <ListOfPlotItems>
        <PlotItem name="[acoa_mito]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[acoa_mito],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[adp]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[adp],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[adp_mito]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[adp_mito],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[amp]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[amp],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[atp]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[atp],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[atp_mito]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[atp_mito],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[bpg13]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[bpg13],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[cit_mito]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[cit_mito],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[co2]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[co2],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[co2_mito]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[co2_mito],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[coa_mito]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[coa_mito],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[dhap]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[dhap],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[fru16bp]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[fru16bp],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[fru26bp]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[fru26bp],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[fru6p]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[fru6p],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[gdp]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[gdp],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[gdp_mito]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[gdp_mito],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[glc1p]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glc1p],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[glc6p]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glc6p],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[glc]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glc],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[glc_ext]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[extern],Vector=Metabolites[glc_ext],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[glyglc]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[glyglc],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[grap]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[grap],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[gtp]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[gtp],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[gtp_mito]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[gtp_mito],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[h2o]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[h2o],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[h2o_mito]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[h2o_mito],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[h]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[h],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[h_mito]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[h_mito],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[lac]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[lac],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[lac_ext]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[extern],Vector=Metabolites[lac_ext],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[nad]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[nad],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[nad_mito]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[nad_mito],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[nadh]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[nadh],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[nadh_mito]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[nadh_mito],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[oaa]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[oaa],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[oaa_mito]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[oaa_mito],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[pep]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[pep],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[pep_mito]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[pep_mito],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[pg2]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[pg2],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[pg3]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[pg3],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[phos]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[phos],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[phos_mito]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[phos_mito],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[pp]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[pp],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[pyr]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[pyr],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[pyr_mito]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[mito],Vector=Metabolites[pyr_mito],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[udp]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[udp],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[udpglc]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[udpglc],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[utp]|Time" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[cyto],Vector=Metabolites[utp],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
      </ListOfPlotItems>
    </PlotSpecification>
    <PlotSpecification name="Hormonal Response" type="Plot2D" active="1">
      <Parameter name="log X" type="bool" value="0"/>
      <Parameter name="log Y" type="bool" value="0"/>
      <ListOfPlotItems>
        <PlotItem name="Values[epi]|[glc_ext]" type="Curve2D">
          <Parameter name="Color" type="string" value="#FF0000"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="3"/>
          <Parameter name="Line width" type="unsignedFloat" value="3"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[extern],Vector=Metabolites[glc_ext],Reference=Concentration"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[epi],Reference=Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="Values[gamma]|[glc_ext]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="3"/>
          <Parameter name="Line width" type="unsignedFloat" value="3"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[extern],Vector=Metabolites[glc_ext],Reference=Concentration"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[gamma],Reference=Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="Values[glu]|[glc_ext]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="3"/>
          <Parameter name="Line width" type="unsignedFloat" value="2"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[extern],Vector=Metabolites[glc_ext],Reference=Concentration"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[glu],Reference=Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="Values[ins]|[glc_ext]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="3"/>
          <Parameter name="Line width" type="unsignedFloat" value="2"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Compartments[extern],Vector=Metabolites[glc_ext],Reference=Concentration"/>
            <ChannelSpec cn="CN=Root,Model=Koenig2014_hepatic_glucose,Vector=Values[ins],Reference=Value"/>
          </ListOfChannels>
        </PlotItem>
      </ListOfPlotItems>
    </PlotSpecification>
  </ListOfPlots>
  <GUI>
  </GUI>
  <SBMLReference file="Koenig2014_hepatic_glucose_win.xml">
    <SBMLMap SBMLid="ACOAFLX" COPASIkey="Reaction_34"/>
    <SBMLMap SBMLid="ACOAFLX_Vmax" COPASIkey="ModelValue_244"/>
    <SBMLMap SBMLid="AK" COPASIkey="Reaction_11"/>
    <SBMLMap SBMLid="AK_Vmax" COPASIkey="ModelValue_110"/>
    <SBMLMap SBMLid="AK_keq" COPASIkey="ModelValue_106"/>
    <SBMLMap SBMLid="AK_km_adp" COPASIkey="ModelValue_109"/>
    <SBMLMap SBMLid="AK_km_amp" COPASIkey="ModelValue_108"/>
    <SBMLMap SBMLid="AK_km_atp" COPASIkey="ModelValue_107"/>
    <SBMLMap SBMLid="ALD" COPASIkey="Reaction_16"/>
    <SBMLMap SBMLid="ALD_Vmax" COPASIkey="ModelValue_141"/>
    <SBMLMap SBMLid="ALD_keq" COPASIkey="ModelValue_135"/>
    <SBMLMap SBMLid="ALD_ki1_grap" COPASIkey="ModelValue_139"/>
    <SBMLMap SBMLid="ALD_ki2_grap" COPASIkey="ModelValue_140"/>
    <SBMLMap SBMLid="ALD_km_dhap" COPASIkey="ModelValue_137"/>
    <SBMLMap SBMLid="ALD_km_fru16bp" COPASIkey="ModelValue_136"/>
    <SBMLMap SBMLid="ALD_km_grap" COPASIkey="ModelValue_138"/>
    <SBMLMap SBMLid="CITFLX" COPASIkey="Reaction_35"/>
    <SBMLMap SBMLid="CITFLX_Vmax" COPASIkey="ModelValue_245"/>
    <SBMLMap SBMLid="CS" COPASIkey="Reaction_31"/>
    <SBMLMap SBMLid="CS_Vmax" COPASIkey="ModelValue_236"/>
    <SBMLMap SBMLid="CS_k_acoa" COPASIkey="ModelValue_233"/>
    <SBMLMap SBMLid="CS_k_cit" COPASIkey="ModelValue_234"/>
    <SBMLMap SBMLid="CS_k_coa" COPASIkey="ModelValue_235"/>
    <SBMLMap SBMLid="CS_k_oaa" COPASIkey="ModelValue_232"/>
    <SBMLMap SBMLid="CS_keq" COPASIkey="ModelValue_231"/>
    <SBMLMap SBMLid="EN" COPASIkey="Reaction_21"/>
    <SBMLMap SBMLid="EN_Vmax" COPASIkey="ModelValue_166"/>
    <SBMLMap SBMLid="EN_k_pep" COPASIkey="ModelValue_164"/>
    <SBMLMap SBMLid="EN_k_pg2" COPASIkey="ModelValue_165"/>
    <SBMLMap SBMLid="EN_keq" COPASIkey="ModelValue_163"/>
    <SBMLMap SBMLid="FBP1" COPASIkey="Reaction_15"/>
    <SBMLMap SBMLid="FBP1_Vmax" COPASIkey="ModelValue_134"/>
    <SBMLMap SBMLid="FBP1_ki_fru26bp" COPASIkey="ModelValue_132"/>
    <SBMLMap SBMLid="FBP1_km_fru16bp" COPASIkey="ModelValue_133"/>
    <SBMLMap SBMLid="FBP2" COPASIkey="Reaction_13"/>
    <SBMLMap SBMLid="FBP2_Vmax" COPASIkey="ModelValue_124"/>
    <SBMLMap SBMLid="FBP2_ki_fru6p_native" COPASIkey="ModelValue_121"/>
    <SBMLMap SBMLid="FBP2_ki_fru6p_phospho" COPASIkey="ModelValue_123"/>
    <SBMLMap SBMLid="FBP2_km_fru26bp_native" COPASIkey="ModelValue_120"/>
    <SBMLMap SBMLid="FBP2_km_fru26bp_phospho" COPASIkey="ModelValue_122"/>
    <SBMLMap SBMLid="FBP2_native" COPASIkey="ModelValue_125"/>
    <SBMLMap SBMLid="FBP2_phospho" COPASIkey="ModelValue_126"/>
    <SBMLMap SBMLid="G16PI" COPASIkey="Reaction_4"/>
    <SBMLMap SBMLid="G16PI_Vmax" COPASIkey="ModelValue_54"/>
    <SBMLMap SBMLid="G16PI_keq" COPASIkey="ModelValue_51"/>
    <SBMLMap SBMLid="G16PI_km_glc1p" COPASIkey="ModelValue_53"/>
    <SBMLMap SBMLid="G16PI_km_glc6p" COPASIkey="ModelValue_52"/>
    <SBMLMap SBMLid="G6PASE" COPASIkey="Reaction_2"/>
    <SBMLMap SBMLid="G6PASE_Vmax" COPASIkey="ModelValue_46"/>
    <SBMLMap SBMLid="G6PASE_km_glc6p" COPASIkey="ModelValue_45"/>
    <SBMLMap SBMLid="GAPDH" COPASIkey="Reaction_18"/>
    <SBMLMap SBMLid="GAPDH_Vmax" COPASIkey="ModelValue_152"/>
    <SBMLMap SBMLid="GAPDH_k_bpg13" COPASIkey="ModelValue_151"/>
    <SBMLMap SBMLid="GAPDH_k_grap" COPASIkey="ModelValue_148"/>
    <SBMLMap SBMLid="GAPDH_k_nad" COPASIkey="ModelValue_147"/>
    <SBMLMap SBMLid="GAPDH_k_nadh" COPASIkey="ModelValue_150"/>
    <SBMLMap SBMLid="GAPDH_k_p" COPASIkey="ModelValue_149"/>
    <SBMLMap SBMLid="GAPDH_keq" COPASIkey="ModelValue_146"/>
    <SBMLMap SBMLid="GK" COPASIkey="Reaction_1"/>
    <SBMLMap SBMLid="GK_Vmax" COPASIkey="ModelValue_43"/>
    <SBMLMap SBMLid="GK_b" COPASIkey="ModelValue_39"/>
    <SBMLMap SBMLid="GK_gc_free" COPASIkey="ModelValue_44"/>
    <SBMLMap SBMLid="GK_km_atp" COPASIkey="ModelValue_42"/>
    <SBMLMap SBMLid="GK_km_fru6p" COPASIkey="ModelValue_38"/>
    <SBMLMap SBMLid="GK_km_glc" COPASIkey="ModelValue_41"/>
    <SBMLMap SBMLid="GK_km_glc1" COPASIkey="ModelValue_37"/>
    <SBMLMap SBMLid="GK_n" COPASIkey="ModelValue_40"/>
    <SBMLMap SBMLid="GK_n_gkrp" COPASIkey="ModelValue_36"/>
    <SBMLMap SBMLid="GLUT2" COPASIkey="Reaction_0"/>
    <SBMLMap SBMLid="GLUT2_Vmax" COPASIkey="ModelValue_35"/>
    <SBMLMap SBMLid="GLUT2_keq" COPASIkey="ModelValue_33"/>
    <SBMLMap SBMLid="GLUT2_km" COPASIkey="ModelValue_34"/>
    <SBMLMap SBMLid="GP" COPASIkey="Reaction_8"/>
    <SBMLMap SBMLid="GPI" COPASIkey="Reaction_3"/>
    <SBMLMap SBMLid="GPI_Vmax" COPASIkey="ModelValue_50"/>
    <SBMLMap SBMLid="GPI_keq" COPASIkey="ModelValue_47"/>
    <SBMLMap SBMLid="GPI_km_fru6p" COPASIkey="ModelValue_49"/>
    <SBMLMap SBMLid="GPI_km_glc6p" COPASIkey="ModelValue_48"/>
    <SBMLMap SBMLid="GP_C" COPASIkey="ModelValue_87"/>
    <SBMLMap SBMLid="GP_Vmax" COPASIkey="ModelValue_86"/>
    <SBMLMap SBMLid="GP_base_amp_native" COPASIkey="ModelValue_84"/>
    <SBMLMap SBMLid="GP_fmax" COPASIkey="ModelValue_89"/>
    <SBMLMap SBMLid="GP_k1_max" COPASIkey="ModelValue_88"/>
    <SBMLMap SBMLid="GP_k_glc1p_native" COPASIkey="ModelValue_78"/>
    <SBMLMap SBMLid="GP_k_glc1p_phospho" COPASIkey="ModelValue_79"/>
    <SBMLMap SBMLid="GP_k_glyc_native" COPASIkey="ModelValue_76"/>
    <SBMLMap SBMLid="GP_k_glyc_phospho" COPASIkey="ModelValue_77"/>
    <SBMLMap SBMLid="GP_k_p_native" COPASIkey="ModelValue_80"/>
    <SBMLMap SBMLid="GP_k_p_phospho" COPASIkey="ModelValue_81"/>
    <SBMLMap SBMLid="GP_ka_amp_native" COPASIkey="ModelValue_83"/>
    <SBMLMap SBMLid="GP_keq" COPASIkey="ModelValue_75"/>
    <SBMLMap SBMLid="GP_ki_glc_phospho" COPASIkey="ModelValue_82"/>
    <SBMLMap SBMLid="GP_max_amp_native" COPASIkey="ModelValue_85"/>
    <SBMLMap SBMLid="GP_native" COPASIkey="ModelValue_91"/>
    <SBMLMap SBMLid="GP_phospho" COPASIkey="ModelValue_93"/>
    <SBMLMap SBMLid="GP_vmax_native" COPASIkey="ModelValue_90"/>
    <SBMLMap SBMLid="GP_vmax_phospho" COPASIkey="ModelValue_92"/>
    <SBMLMap SBMLid="GS" COPASIkey="Reaction_7"/>
    <SBMLMap SBMLid="GS_C" COPASIkey="ModelValue_63"/>
    <SBMLMap SBMLid="GS_Vmax" COPASIkey="ModelValue_69"/>
    <SBMLMap SBMLid="GS_k1_max" COPASIkey="ModelValue_64"/>
    <SBMLMap SBMLid="GS_k1_nat" COPASIkey="ModelValue_65"/>
    <SBMLMap SBMLid="GS_k1_phospho" COPASIkey="ModelValue_67"/>
    <SBMLMap SBMLid="GS_k2_nat" COPASIkey="ModelValue_66"/>
    <SBMLMap SBMLid="GS_k2_phospho" COPASIkey="ModelValue_68"/>
    <SBMLMap SBMLid="GS_k_udpglc_native" COPASIkey="ModelValue_71"/>
    <SBMLMap SBMLid="GS_k_udpglc_phospho" COPASIkey="ModelValue_72"/>
    <SBMLMap SBMLid="GS_native" COPASIkey="ModelValue_73"/>
    <SBMLMap SBMLid="GS_phospho" COPASIkey="ModelValue_74"/>
    <SBMLMap SBMLid="GS_storage_factor" COPASIkey="ModelValue_70"/>
    <SBMLMap SBMLid="K_epi" COPASIkey="ModelValue_28"/>
    <SBMLMap SBMLid="K_glu" COPASIkey="ModelValue_27"/>
    <SBMLMap SBMLid="K_ins" COPASIkey="ModelValue_26"/>
    <SBMLMap SBMLid="K_val" COPASIkey="ModelValue_24"/>
    <SBMLMap SBMLid="LACT" COPASIkey="Reaction_27"/>
    <SBMLMap SBMLid="LACT_Vmax" COPASIkey="ModelValue_213"/>
    <SBMLMap SBMLid="LACT_k_lac" COPASIkey="ModelValue_212"/>
    <SBMLMap SBMLid="LACT_keq" COPASIkey="ModelValue_211"/>
    <SBMLMap SBMLid="LDH" COPASIkey="Reaction_26"/>
    <SBMLMap SBMLid="LDH_Vmax" COPASIkey="ModelValue_210"/>
    <SBMLMap SBMLid="LDH_k_lac" COPASIkey="ModelValue_207"/>
    <SBMLMap SBMLid="LDH_k_nad" COPASIkey="ModelValue_208"/>
    <SBMLMap SBMLid="LDH_k_nadh" COPASIkey="ModelValue_209"/>
    <SBMLMap SBMLid="LDH_k_pyr" COPASIkey="ModelValue_206"/>
    <SBMLMap SBMLid="LDH_keq" COPASIkey="ModelValue_205"/>
    <SBMLMap SBMLid="NDKGTP" COPASIkey="Reaction_9"/>
    <SBMLMap SBMLid="NDKGTPM" COPASIkey="Reaction_32"/>
    <SBMLMap SBMLid="NDKGTPM_Vmax" COPASIkey="ModelValue_242"/>
    <SBMLMap SBMLid="NDKGTPM_k_adp" COPASIkey="ModelValue_239"/>
    <SBMLMap SBMLid="NDKGTPM_k_atp" COPASIkey="ModelValue_238"/>
    <SBMLMap SBMLid="NDKGTPM_k_gdp" COPASIkey="ModelValue_241"/>
    <SBMLMap SBMLid="NDKGTPM_k_gtp" COPASIkey="ModelValue_240"/>
    <SBMLMap SBMLid="NDKGTPM_keq" COPASIkey="ModelValue_237"/>
    <SBMLMap SBMLid="NDKGTP_Vmax" COPASIkey="ModelValue_99"/>
    <SBMLMap SBMLid="NDKGTP_keq" COPASIkey="ModelValue_94"/>
    <SBMLMap SBMLid="NDKGTP_km_adp" COPASIkey="ModelValue_96"/>
    <SBMLMap SBMLid="NDKGTP_km_atp" COPASIkey="ModelValue_95"/>
    <SBMLMap SBMLid="NDKGTP_km_gdp" COPASIkey="ModelValue_98"/>
    <SBMLMap SBMLid="NDKGTP_km_gtp" COPASIkey="ModelValue_97"/>
    <SBMLMap SBMLid="NDKUTP" COPASIkey="Reaction_10"/>
    <SBMLMap SBMLid="NDKUTP_Vmax" COPASIkey="ModelValue_105"/>
    <SBMLMap SBMLid="NDKUTP_keq" COPASIkey="ModelValue_100"/>
    <SBMLMap SBMLid="NDKUTP_km_adp" COPASIkey="ModelValue_102"/>
    <SBMLMap SBMLid="NDKUTP_km_atp" COPASIkey="ModelValue_101"/>
    <SBMLMap SBMLid="NDKUTP_km_udp" COPASIkey="ModelValue_104"/>
    <SBMLMap SBMLid="NDKUTP_km_utp" COPASIkey="ModelValue_103"/>
    <SBMLMap SBMLid="OAAFLX" COPASIkey="Reaction_33"/>
    <SBMLMap SBMLid="OAAFLX_Vmax" COPASIkey="ModelValue_243"/>
    <SBMLMap SBMLid="PC" COPASIkey="Reaction_25"/>
    <SBMLMap SBMLid="PC_Vmax" COPASIkey="ModelValue_204"/>
    <SBMLMap SBMLid="PC_k_acoa" COPASIkey="ModelValue_202"/>
    <SBMLMap SBMLid="PC_k_atp" COPASIkey="ModelValue_199"/>
    <SBMLMap SBMLid="PC_k_co2" COPASIkey="ModelValue_201"/>
    <SBMLMap SBMLid="PC_k_pyr" COPASIkey="ModelValue_200"/>
    <SBMLMap SBMLid="PC_n" COPASIkey="ModelValue_203"/>
    <SBMLMap SBMLid="PDH" COPASIkey="Reaction_30"/>
    <SBMLMap SBMLid="PDH_Vmax" COPASIkey="ModelValue_227"/>
    <SBMLMap SBMLid="PDH_alpha_nat" COPASIkey="ModelValue_225"/>
    <SBMLMap SBMLid="PDH_alpha_p" COPASIkey="ModelValue_226"/>
    <SBMLMap SBMLid="PDH_base" COPASIkey="ModelValue_228"/>
    <SBMLMap SBMLid="PDH_k_coa" COPASIkey="ModelValue_221"/>
    <SBMLMap SBMLid="PDH_k_nad" COPASIkey="ModelValue_222"/>
    <SBMLMap SBMLid="PDH_k_pyr" COPASIkey="ModelValue_220"/>
    <SBMLMap SBMLid="PDH_ki_acoa" COPASIkey="ModelValue_223"/>
    <SBMLMap SBMLid="PDH_ki_nadh" COPASIkey="ModelValue_224"/>
    <SBMLMap SBMLid="PDH_nat" COPASIkey="ModelValue_229"/>
    <SBMLMap SBMLid="PDH_p" COPASIkey="ModelValue_230"/>
    <SBMLMap SBMLid="PEPCK" COPASIkey="Reaction_23"/>
    <SBMLMap SBMLid="PEPCKM" COPASIkey="Reaction_24"/>
    <SBMLMap SBMLid="PEPCKM_Vmax" COPASIkey="ModelValue_198"/>
    <SBMLMap SBMLid="PEPCK_Vmax" COPASIkey="ModelValue_197"/>
    <SBMLMap SBMLid="PEPCK_k_co2" COPASIkey="ModelValue_194"/>
    <SBMLMap SBMLid="PEPCK_k_gdp" COPASIkey="ModelValue_193"/>
    <SBMLMap SBMLid="PEPCK_k_gtp" COPASIkey="ModelValue_196"/>
    <SBMLMap SBMLid="PEPCK_k_oaa" COPASIkey="ModelValue_195"/>
    <SBMLMap SBMLid="PEPCK_k_pep" COPASIkey="ModelValue_192"/>
    <SBMLMap SBMLid="PEPCK_keq" COPASIkey="ModelValue_191"/>
    <SBMLMap SBMLid="PEPTM" COPASIkey="Reaction_29"/>
    <SBMLMap SBMLid="PEPTM_Vmax" COPASIkey="ModelValue_219"/>
    <SBMLMap SBMLid="PEPTM_k_pep" COPASIkey="ModelValue_218"/>
    <SBMLMap SBMLid="PEPTM_keq" COPASIkey="ModelValue_217"/>
    <SBMLMap SBMLid="PFK1" COPASIkey="Reaction_14"/>
    <SBMLMap SBMLid="PFK1_Vmax" COPASIkey="ModelValue_131"/>
    <SBMLMap SBMLid="PFK1_ka_fru26bp" COPASIkey="ModelValue_130"/>
    <SBMLMap SBMLid="PFK1_ki_fru6p" COPASIkey="ModelValue_129"/>
    <SBMLMap SBMLid="PFK1_km_atp" COPASIkey="ModelValue_127"/>
    <SBMLMap SBMLid="PFK1_km_fru6p" COPASIkey="ModelValue_128"/>
    <SBMLMap SBMLid="PFK2" COPASIkey="Reaction_12"/>
    <SBMLMap SBMLid="PFK2_Vmax" COPASIkey="ModelValue_117"/>
    <SBMLMap SBMLid="PFK2_k_atp_native" COPASIkey="ModelValue_115"/>
    <SBMLMap SBMLid="PFK2_k_atp_phospho" COPASIkey="ModelValue_116"/>
    <SBMLMap SBMLid="PFK2_k_fru6p_native" COPASIkey="ModelValue_113"/>
    <SBMLMap SBMLid="PFK2_k_fru6p_phospho" COPASIkey="ModelValue_114"/>
    <SBMLMap SBMLid="PFK2_n_native" COPASIkey="ModelValue_111"/>
    <SBMLMap SBMLid="PFK2_n_phospho" COPASIkey="ModelValue_112"/>
    <SBMLMap SBMLid="PFK2_native" COPASIkey="ModelValue_118"/>
    <SBMLMap SBMLid="PFK2_phospho" COPASIkey="ModelValue_119"/>
    <SBMLMap SBMLid="PGK" COPASIkey="Reaction_19"/>
    <SBMLMap SBMLid="PGK_Vmax" COPASIkey="ModelValue_158"/>
    <SBMLMap SBMLid="PGK_k_adp" COPASIkey="ModelValue_154"/>
    <SBMLMap SBMLid="PGK_k_atp" COPASIkey="ModelValue_155"/>
    <SBMLMap SBMLid="PGK_k_bpg13" COPASIkey="ModelValue_156"/>
    <SBMLMap SBMLid="PGK_k_pg3" COPASIkey="ModelValue_157"/>
    <SBMLMap SBMLid="PGK_keq" COPASIkey="ModelValue_153"/>
    <SBMLMap SBMLid="PGM" COPASIkey="Reaction_20"/>
    <SBMLMap SBMLid="PGM_Vmax" COPASIkey="ModelValue_162"/>
    <SBMLMap SBMLid="PGM_k_pg2" COPASIkey="ModelValue_161"/>
    <SBMLMap SBMLid="PGM_k_pg3" COPASIkey="ModelValue_160"/>
    <SBMLMap SBMLid="PGM_keq" COPASIkey="ModelValue_159"/>
    <SBMLMap SBMLid="PK" COPASIkey="Reaction_22"/>
    <SBMLMap SBMLid="PK_Vmax" COPASIkey="ModelValue_182"/>
    <SBMLMap SBMLid="PK_alpha" COPASIkey="ModelValue_171"/>
    <SBMLMap SBMLid="PK_alpha_end" COPASIkey="ModelValue_173"/>
    <SBMLMap SBMLid="PK_alpha_inp" COPASIkey="ModelValue_185"/>
    <SBMLMap SBMLid="PK_alpha_p" COPASIkey="ModelValue_172"/>
    <SBMLMap SBMLid="PK_alpha_p_inp" COPASIkey="ModelValue_186"/>
    <SBMLMap SBMLid="PK_base_act" COPASIkey="ModelValue_180"/>
    <SBMLMap SBMLid="PK_base_act_p" COPASIkey="ModelValue_181"/>
    <SBMLMap SBMLid="PK_f" COPASIkey="ModelValue_183"/>
    <SBMLMap SBMLid="PK_f_p" COPASIkey="ModelValue_184"/>
    <SBMLMap SBMLid="PK_k_adp" COPASIkey="ModelValue_179"/>
    <SBMLMap SBMLid="PK_k_fbp" COPASIkey="ModelValue_174"/>
    <SBMLMap SBMLid="PK_k_fbp_p" COPASIkey="ModelValue_175"/>
    <SBMLMap SBMLid="PK_k_pep" COPASIkey="ModelValue_176"/>
    <SBMLMap SBMLid="PK_k_pep_end" COPASIkey="ModelValue_178"/>
    <SBMLMap SBMLid="PK_k_pep_p" COPASIkey="ModelValue_177"/>
    <SBMLMap SBMLid="PK_n" COPASIkey="ModelValue_167"/>
    <SBMLMap SBMLid="PK_n_fbp" COPASIkey="ModelValue_169"/>
    <SBMLMap SBMLid="PK_n_fbp_p" COPASIkey="ModelValue_170"/>
    <SBMLMap SBMLid="PK_n_p" COPASIkey="ModelValue_168"/>
    <SBMLMap SBMLid="PK_native" COPASIkey="ModelValue_189"/>
    <SBMLMap SBMLid="PK_pep_inp" COPASIkey="ModelValue_187"/>
    <SBMLMap SBMLid="PK_pep_p_inp" COPASIkey="ModelValue_188"/>
    <SBMLMap SBMLid="PK_phospho" COPASIkey="ModelValue_190"/>
    <SBMLMap SBMLid="PPASE" COPASIkey="Reaction_6"/>
    <SBMLMap SBMLid="PPASE_Vmax" COPASIkey="ModelValue_62"/>
    <SBMLMap SBMLid="PPASE_km_pp" COPASIkey="ModelValue_61"/>
    <SBMLMap SBMLid="PYRTM" COPASIkey="Reaction_28"/>
    <SBMLMap SBMLid="PYRTM_Vmax" COPASIkey="ModelValue_216"/>
    <SBMLMap SBMLid="PYRTM_k_pyr" COPASIkey="ModelValue_215"/>
    <SBMLMap SBMLid="PYRTM_keq" COPASIkey="ModelValue_214"/>
    <SBMLMap SBMLid="TPI" COPASIkey="Reaction_17"/>
    <SBMLMap SBMLid="TPI_Vmax" COPASIkey="ModelValue_145"/>
    <SBMLMap SBMLid="TPI_keq" COPASIkey="ModelValue_142"/>
    <SBMLMap SBMLid="TPI_km_dhap" COPASIkey="ModelValue_143"/>
    <SBMLMap SBMLid="TPI_km_grap" COPASIkey="ModelValue_144"/>
    <SBMLMap SBMLid="UPGASE" COPASIkey="Reaction_5"/>
    <SBMLMap SBMLid="UPGASE_Vmax" COPASIkey="ModelValue_60"/>
    <SBMLMap SBMLid="UPGASE_keq" COPASIkey="ModelValue_55"/>
    <SBMLMap SBMLid="UPGASE_km_glc1p" COPASIkey="ModelValue_57"/>
    <SBMLMap SBMLid="UPGASE_km_pp" COPASIkey="ModelValue_59"/>
    <SBMLMap SBMLid="UPGASE_km_udpglc" COPASIkey="ModelValue_58"/>
    <SBMLMap SBMLid="UPGASE_km_utp" COPASIkey="ModelValue_56"/>
    <SBMLMap SBMLid="acoa_mito" COPASIkey="Metabolite_39"/>
    <SBMLMap SBMLid="adp" COPASIkey="Metabolite_32"/>
    <SBMLMap SBMLid="adp_mito" COPASIkey="Metabolite_43"/>
    <SBMLMap SBMLid="amp" COPASIkey="Metabolite_0"/>
    <SBMLMap SBMLid="atp" COPASIkey="Metabolite_31"/>
    <SBMLMap SBMLid="atp_mito" COPASIkey="Metabolite_42"/>
    <SBMLMap SBMLid="atp_mito_tot" COPASIkey="ModelValue_4"/>
    <SBMLMap SBMLid="atp_tot" COPASIkey="ModelValue_0"/>
    <SBMLMap SBMLid="bpg13" COPASIkey="Metabolite_24"/>
    <SBMLMap SBMLid="cit_mito" COPASIkey="Metabolite_41"/>
    <SBMLMap SBMLid="co2" COPASIkey="Metabolite_9"/>
    <SBMLMap SBMLid="co2_mito" COPASIkey="Metabolite_35"/>
    <SBMLMap SBMLid="coa_mito" COPASIkey="Metabolite_46"/>
    <SBMLMap SBMLid="cyto" COPASIkey="Compartment_1"/>
    <SBMLMap SBMLid="dhap" COPASIkey="Metabolite_23"/>
    <SBMLMap SBMLid="epi" COPASIkey="ModelValue_22"/>
    <SBMLMap SBMLid="epi_f" COPASIkey="ModelValue_25"/>
    <SBMLMap SBMLid="epi_norm" COPASIkey="ModelValue_23"/>
    <SBMLMap SBMLid="extern" COPASIkey="Compartment_0"/>
    <SBMLMap SBMLid="fru16bp" COPASIkey="Metabolite_20"/>
    <SBMLMap SBMLid="fru26bp" COPASIkey="Metabolite_21"/>
    <SBMLMap SBMLid="fru6p" COPASIkey="Metabolite_19"/>
    <SBMLMap SBMLid="gamma" COPASIkey="ModelValue_29"/>
    <SBMLMap SBMLid="gdp" COPASIkey="Metabolite_4"/>
    <SBMLMap SBMLid="gdp_mito" COPASIkey="Metabolite_45"/>
    <SBMLMap SBMLid="glc" COPASIkey="Metabolite_17"/>
    <SBMLMap SBMLid="glc1p" COPASIkey="Metabolite_12"/>
    <SBMLMap SBMLid="glc6p" COPASIkey="Metabolite_18"/>
    <SBMLMap SBMLid="glc_ext" COPASIkey="Metabolite_33"/>
    <SBMLMap SBMLid="glu" COPASIkey="ModelValue_16"/>
    <SBMLMap SBMLid="glu_norm" COPASIkey="ModelValue_17"/>
    <SBMLMap SBMLid="glyglc" COPASIkey="Metabolite_16"/>
    <SBMLMap SBMLid="grap" COPASIkey="Metabolite_22"/>
    <SBMLMap SBMLid="gtp" COPASIkey="Metabolite_3"/>
    <SBMLMap SBMLid="gtp_mito" COPASIkey="Metabolite_44"/>
    <SBMLMap SBMLid="gtp_mito_tot" COPASIkey="ModelValue_5"/>
    <SBMLMap SBMLid="gtp_tot" COPASIkey="ModelValue_2"/>
    <SBMLMap SBMLid="h" COPASIkey="Metabolite_11"/>
    <SBMLMap SBMLid="h2o" COPASIkey="Metabolite_10"/>
    <SBMLMap SBMLid="h2o_mito" COPASIkey="Metabolite_14"/>
    <SBMLMap SBMLid="h_mito" COPASIkey="Metabolite_15"/>
    <SBMLMap SBMLid="ins" COPASIkey="ModelValue_10"/>
    <SBMLMap SBMLid="ins_norm" COPASIkey="ModelValue_11"/>
    <SBMLMap SBMLid="lac" COPASIkey="Metabolite_30"/>
    <SBMLMap SBMLid="lac_ext" COPASIkey="Metabolite_34"/>
    <SBMLMap SBMLid="mito" COPASIkey="Compartment_2"/>
    <SBMLMap SBMLid="nad" COPASIkey="Metabolite_5"/>
    <SBMLMap SBMLid="nad_mito" COPASIkey="Metabolite_48"/>
    <SBMLMap SBMLid="nadh" COPASIkey="Metabolite_6"/>
    <SBMLMap SBMLid="nadh_mito" COPASIkey="Metabolite_47"/>
    <SBMLMap SBMLid="nadh_mito_tot" COPASIkey="ModelValue_3"/>
    <SBMLMap SBMLid="nadh_tot" COPASIkey="ModelValue_492"/>
    <SBMLMap SBMLid="oaa" COPASIkey="Metabolite_29"/>
    <SBMLMap SBMLid="oaa_mito" COPASIkey="Metabolite_37"/>
    <SBMLMap SBMLid="pep" COPASIkey="Metabolite_27"/>
    <SBMLMap SBMLid="pep_mito" COPASIkey="Metabolite_38"/>
    <SBMLMap SBMLid="pg2" COPASIkey="Metabolite_26"/>
    <SBMLMap SBMLid="pg3" COPASIkey="Metabolite_25"/>
    <SBMLMap SBMLid="phos" COPASIkey="Metabolite_7"/>
    <SBMLMap SBMLid="phos_mito" COPASIkey="Metabolite_36"/>
    <SBMLMap SBMLid="pp" COPASIkey="Metabolite_8"/>
    <SBMLMap SBMLid="pyr" COPASIkey="Metabolite_28"/>
    <SBMLMap SBMLid="pyr_mito" COPASIkey="Metabolite_40"/>
    <SBMLMap SBMLid="scale" COPASIkey="ModelValue_30"/>
    <SBMLMap SBMLid="scale_gly" COPASIkey="ModelValue_31"/>
    <SBMLMap SBMLid="scale_glyglc" COPASIkey="ModelValue_32"/>
    <SBMLMap SBMLid="udp" COPASIkey="Metabolite_2"/>
    <SBMLMap SBMLid="udpglc" COPASIkey="Metabolite_13"/>
    <SBMLMap SBMLid="utp" COPASIkey="Metabolite_1"/>
    <SBMLMap SBMLid="utp_tot" COPASIkey="ModelValue_1"/>
    <SBMLMap SBMLid="x_epi1" COPASIkey="ModelValue_18"/>
    <SBMLMap SBMLid="x_epi2" COPASIkey="ModelValue_19"/>
    <SBMLMap SBMLid="x_epi3" COPASIkey="ModelValue_20"/>
    <SBMLMap SBMLid="x_epi4" COPASIkey="ModelValue_21"/>
    <SBMLMap SBMLid="x_glu1" COPASIkey="ModelValue_12"/>
    <SBMLMap SBMLid="x_glu2" COPASIkey="ModelValue_13"/>
    <SBMLMap SBMLid="x_glu3" COPASIkey="ModelValue_14"/>
    <SBMLMap SBMLid="x_glu4" COPASIkey="ModelValue_15"/>
    <SBMLMap SBMLid="x_ins1" COPASIkey="ModelValue_6"/>
    <SBMLMap SBMLid="x_ins2" COPASIkey="ModelValue_7"/>
    <SBMLMap SBMLid="x_ins3" COPASIkey="ModelValue_8"/>
    <SBMLMap SBMLid="x_ins4" COPASIkey="ModelValue_9"/>
  </SBMLReference>
</COPASI>
