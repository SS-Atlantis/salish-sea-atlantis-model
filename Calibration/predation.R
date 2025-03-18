f1="00"
grp.csv     <- 'functionalGroups.csv'
prm.file      <- paste0('/datasets/work/oa-alantis/work/NS-Model/',f1, 'NorthSea_biol_fishing.prm')
diet.file <- paste0('/datasets/work/oa-alantis/work/NS-Model/outputs/output', f1,'/outputNorthSeaDietCheck.txt')

food.web(diet.file, grp.csv )

setwd('/datasets/work/oa-alantis/work/NS-Model/')

library('ReactiveAtlantis')
f1='03'
biom      <- paste0('/datasets/work/oa-alantis/work/NS-Model/outputs/output', f1,'/outputNorthSeaBiomIndx.txt')
diet.file <- paste0('/datasets/work/oa-alantis/work/NS-Model/outputs/output', f1,'/outputNorthSeaDietCheck.txt')
bio.age   <- paste0('/datasets/work/oa-alantis/work/NS-Model/outputs/output', f1,'/outputNorthSeaAgeBiomIndx.txt')
grp.csv   <- 'functionalGroups.csv'
predation(biom,grp.csv, diet.file, age.biomass=bio.age)
