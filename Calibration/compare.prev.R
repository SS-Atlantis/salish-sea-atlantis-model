##install.packages('devtools')   ## +you need to do this step just once
## running
#library("devtools")
#install.packages('rlang')
#install_github('Atlantis-Ecosystem-Model/ReactiveAtlantis', force=TRUE, dependencies=TRUE)
#library("ReactiveAtlantis")
#install.packages('tidyverse')
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ##
## ~          Comparation previous run            ~ ##
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ##
rm(list=ls())
library(ReactiveAtlantis)
current  <- '04'
previous <- '00'
nc.out.current  <- paste0('/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/outputs/output', current,'/outputSalishSea.nc')
nc.out.previous <- paste0('/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/outputs/output', previous, '/outputSalishSea.nc')
groups.csv     <- '/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/SS_grps.csv'
bgm.file       <- '/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/SS_xy.bgm'
cum.depths     <- c(0, 25, 50, 100, 250, 400, 700)
#compare(nc.out.current, nc.out.old=NULL, grp.csv = groups.csv,bgm.file=bgm.file, cum.depths=cum.depths)
compare(nc.out.current, nc.out.old = nc.out.previous, grp.csv = groups.csv,bgm.file=bgm.file, cum.depths=cum.depths)
##                                        debug(compare)
#library(ggplot2)
#library(shiny)
#compare(nc.out.current, nc.out.old = nc.out.previous , grp.csv = groups.csv,bgm.file=bgm.file, cum.depths=cum.depths)

current  <- '01'
nc.initial  <- '/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/SS_init.nc'
nc.current  <- paste0('/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/outputs/output', current,'/outputSalishSea.nc')
grp.csv     <- '/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/SS_grps.csv'
prm.file    <- paste0('/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/',current,'SS_biology.prm')

growth.pp(nc.initial, grp.csv, prm.file, nc.current)
