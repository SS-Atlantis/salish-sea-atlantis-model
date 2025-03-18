library(ReactiveAtlantis)
current <- '03'
ini.nc.file  <- '/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/SS_init.nc'
yoy.file     <- paste0('/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/outputs/output', current,'/outputSalishSeaYOY.txt')
grp.file     <- '/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/SS_grps.csv'
prm.file     <- paste0('/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/', current, 'SS_biology.prm')                        
out.nc.file   <- paste0('/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/outputs/output', current,'/outputSalishSea.nc')
recruitment.cal(ini.nc.file, out.nc.file, yoy.file, grp.file, prm.file)

read.csv(yoy.file)


library(ReactiveAtlantis)
grp.csv     <- '/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/SS_grps.csv'
prm.file    <- paste0('/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/', current, 'SS_biology.prm')       
diet.file   <- paste0('/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/outputs/output', current,'/outputSalishSeaDietCheck.txt')
food.web(diet.file, grp.csv)
## optional you can explore the food web by polygon
food.web(diet.file, grp.file, diet.file.bypol)