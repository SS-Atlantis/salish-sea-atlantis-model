rm(list = ls())
library(ReactiveAtlantis)
source('/home/por07g/Documents/PhD/Atlantis_Model/tools/Package/ReactiveAtlantis/R/pprey.mat.R')
#folder   <- '~/Documents/PhD/Atlantis_Model/model_JFR/'
prm.file <- '/home/por07g/Documents/2019/Office/Mariska/model/01MHI_biol.prm'
grp.file <- '/home/por07g/Documents/2019/Office/Mariska/model/FuncGrps.csv'
nc.file  <- '/home/por07g/Documents/2019/Office/Mariska/model/MHI_init_MSLdiv10_ZLhalved.nc'
bgm.file <- '/home/por07g/Documents/2019/Office/Mariska/model/HI_utm_400.bgm'
cum.depths <- c(0, 30, 150, 400)
#debug(feeding.mat)
feeding.mat(prm.file, grp.file, nc.file, bgm.file, cum.depths)

## )

## Rprof("out.out")
## for (i in 1:10) pos = feeding.mat(prm.file, grp.file, nc.file, bgm.file, cum.depths)
## Rprof(NULL)
## summaryRprof("out.out")
## proftable("out.out")


## OLD
rm(list = ls())
library(ReactiveAtlantis)
#source('/home/por07g/Documents/PhD/Atlantis_Model/tools/Package/ReactiveAtlantis/R/pprey.mat.R')
folder   <- '~/Documents/PhD/Atlantis_Model/model_JFR/'
prm.file <- '/home/por07g/Documents/2018/TBGB/model/old_files/TBGB_biol.prm'
grp.file <- '/home/por07g/Documents/2018/TBGB/analysis/TBGB_Groups.csv'
nc.file  <- '/home/por07g/Documents/2018/TBGB/model/TBGB_input.nc'
bgm.file <- '/home/por07g/Documents/2018/TBGB/model/TBGB.bgm'
cum.depths <- c(0, 10, 15, 20, 40, 70)
#debug(feeding.mat)
feeding.mat(prm.file, grp.file, nc.file, bgm.file, cum.depths)
