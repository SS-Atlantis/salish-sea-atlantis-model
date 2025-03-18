# source('/home/por07g/Documents/PhD/Atlantis_Model/tools/Package/ReactiveAtlantis/R/predation.R')
library('ReactiveAtlantis')
current = '06'
biom      <- paste0('/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/outputs/output', current,'/outputSalishSeaBiomIndx.txt')
diet.file <- paste0('/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/outputs/output', current,'/outputSalishSeaDietCheck.txt')
bio.age   <- paste0('/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/outputs/output', current,'/outputSalishSeaAgeBiomIndx.txt')
grp.csv   <- '/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/SS_grps.csv'
#predation(biom,grp.csv, diet.file)
predation(biom,grp.csv, diet.file, age.biomass=bio.age)

