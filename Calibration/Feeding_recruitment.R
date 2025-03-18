rm(list = ls())
library(ReactiveAtlantis)
prm.file <- '/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/05SS_biology.prm'
nc.file  <- '/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/SS_init.nc'
grp.file     <- '/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/SS_grps.csv'
bgm.file       <- '/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/SS_xy.bgm'
cum.depths     <- c(0, 25, 50, 100, 250, 400, 700)
#debug(feeding.mat)
feeding.mat(prm.file, grp.file, nc.file, bgm.file, cum.depths)
## This a simple raw model
## Assuming that X_rs is constatnat,  doesn't include evolution
#source('/home/por07g/Documents/PhD/Atlantis_Model/tools/Package/Kichen/recruitment.R')
#library('ReactiveAtlantis')
current <- '06'
ini.nc.file   <- '/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/SS_init.nc'
yoy.file      <- paste0('/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/outputs/output', current,'/outputSalishSeaYOY.txt')
grp.file      <- '/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/SS_grps.csv'
prm.file      <-  paste0('/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/',current,'SS_biology.prm')
out.nc.file   <- paste0('/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/outputs/output', current,'/outputSalishSea.nc')
#source('/home/por07g/Documents/PhD/Atlantis_Model/tools/Package/ReactiveAtlantis/R/recruitment.R')
debug(recruitment.cal)
recruitment.cal(ini.nc.file, out.nc.file, yoy.file, grp.file, prm.file)
undebug(recruitment.cal)
