MCA analysis of kinetic model
-----------------------------------------------------

author: Matthias Koenig (matthias.koenig@charite.de)
date: 110810

- analysis of effects on steady state concentrations and fluxes for 
    single mutations (changes in Vmax of enzymes)
- effect of protein level on the steady states
- knockdown and overexpression of single enzymes (effects of stepwise 
    increase and decrease in Vmax) on steady states
- double mutations : search for compensatory mutations (changes in Vmax) 
    which can regenerate the normal phenotype of the system

dm_distance.m : distance calculation for double mutants
sim_mca_double_muts.m : calculate double mutation effects
sim_mca_glycolysis.m : MCA of undisturbed system
sim_mca_glycolysis_single_enzyme.m : vary single enzyme

-----------------------------------------------------