library(RColorBrewer)
library(tidyverse)
library(reshape)
f1 = '01'

library(ReactiveAtlantis)
#source('/home/por07g/Documents/PhD/Atlantis_Model/tools/Package/ReactiveAtlantis/R/mortality.R')
grp.csv   <- '/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/SS_grps.csv'
prm.file = paste0('/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/outputs/output', f1,'/outputSalishSea.nc')
SpeMort  <- paste0('/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/outputs/output', f1,'/outputSalishSeaSpecificMort.txt')
PredMort <- paste0('/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/outputs/output', f1,'/outputSalishSeaSpecificPredMort.txt')

mortality(grp.csv, prm.file,SpeMort,PredMort)
