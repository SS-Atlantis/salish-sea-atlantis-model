source('Tools.R')
library(ncdf4)
library(shinyrAtlantis)

#/home/por07g/Documents/2019/Oil_spill/Initial_conditions/old_data
## Getting information from previous initial condition File
prev.ini <- '../old_data/FIXED_OLD_SalishSea_InitCond_12082019.nc'
transform.ini(nc.file = prev.ini, file.out = '../Step_01_Extract/SalishSea')
transform.ini(nc.file = prev.ini, just.Sum = FALSE,  file.out = '../Step_01_Extract/SalishSea')
transform.ini(nc.file = prev.ini, fill.value = TRUE, file.out = '../Step_01_Extract/SalishSea')
## ~~~~~~~~~~~~~~~~~~~~~~~~~~ ##
## ~       New Templates    ~ ##
## ~~~~~~~~~~~~~~~~~~~~~~~~~~ ##
## creating the templates for the New initial condition
grp.file    <-  '../old_data/SalishSea_functional_groups_v6_Aqu.csv'
bgm.file    <-  'SS_ll.bgm'
cum.depths  <-  c(0, 25, 50, 100, 250, 400, 700)
csv.name    <-  '../Step_02_Templates/Salish_SeaNEW_try'
## Creating the templates
#debug(make.init.csv)
make.init.csv(grp.file, bgm.file, cum.depths, csv.name)

## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ##
## ~             Filling up the templates         ~ ##
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ##
orig <- read.csv('../Step_01_Extract/SalishSea_Sums.csv', sep = ' ')
## For the template I use the updated version with the missed variables
template.h <- read.csv('../Step_02_Templates/Salish_Sea_horiz.csv')
col <- colnames(orig)
for(i in 1 : nrow(template.h)){
    pos <- which(col %in% template.h$Variable[i])
    if(length(pos) == 0 | is.null(pos)) next()
    template.h[i, 2 : ncol(template.h)] <- orig[, pos]
}

folder <- '../Variables_extra/'
files <- sort(c(dir(folder)[2], dir(folder)))
f = 1
nam.new <- c("Si","Diatom_N", "Diatom_S", "DON", "Zoo_N", "NH3", 'NO3', 'Det_Si',"MicroZoo_N")
out <- matrix(0, 130, length(files))
for(f in 1 : length(files)){
    tmp <- read.csv(paste0(folder, files[f]), header = FALSE)
    tmp[which(tmp == 0,  arr.ind = TRUE)] <- NA
    out[, f] <- rowMeans(tmp, na.rm = TRUE)
}
## from mmoles to grams and to miligrams

out2               <- out * 0.0140067 * 1000 ## moles of Notrogen molecular weigth 14.007
out2[, c(1, 3, 8)] <- out[, c(1, 3, 8)] * 0.028086 * 1000 ## models os Silicon. molecualr weight 28.086
out2[, 6]          <- out[, 6] * 0.01703052 * 1000   #Amonium molecualr weight 14.0067 + 1.00794*4 = 17.03052


for(i in 1 : nrow(template.h)){
    pos <- which(nam.new %in% template.h$Variable[i])
    if(length(pos) == 0 | is.null(pos)) next()
    print(i)
    template.h[i, 2 : ncol(template.h)] <- out2[, pos]
}

orig.m <- read.csv('../Step_01_Extract/SalishSea_Means.csv', sep = ' ')
col.nam <- colnames(orig.m)
col <- 'Chl_a'
for(i in 1 : nrow(template.h)){
    pos <- which(col %in% template.h$Variable[i])
    if(length(pos) == 0 | is.null(pos)) next()
    t.pos <- which(col.nam %in% col[pos])
    template.h[i, 2 : ncol(template.h)] <- orig.m[, t.pos]
}



write.table(template.h, file = paste0(csv.name, '_horiz_filled.csv'), row.names = FALSE, sep = ',')

## complete reserve and struct
original.mean <- read.csv('../Step_01_Extract/SalishSea_FillValue.csv', sep = ' ')

need.col <- c(grep('*_StructN', rownames(original.mean)), grep('*_ResN', rownames(original.mean)))
## using the updated version of the initial condition templeate files
template.ini <- read.csv('../Step_02_Templates/Salish_Sea_init.csv')

col.names <- rownames(original.mean)[need.col]
#i
for( i in 1 : nrow(template.ini)){
    pos <- which(col.names %in% template.ini[i, 1])
    if(length(pos) == 0) next()
    template.ini[i, c("sediment", "wc.hor.scalar")] <- rep(original.mean[need.col[pos], ], 2)
}

template.ini[which(template.ini[, 1] %in% template.h[, 1]), 'wc.hor.pattern'] <- 'custom'

csv.name    <-  '../Step_02_Templates/Salish_Sea'
#write.table(template.ini, paste0(csv.name, '_init_filled.csv'), row.names = FALSE, sep = ',')
#name of your template csv files  (which is the horiz one you have modified)
Salish_Sea_filled_templates   <- paste0(csv.name, '_init_filled.csv')
Salish_Sea_filled_templates.h <- paste0(csv.name, '_horiz_filled.csv')
nc.file <- 'SS_init.nc'
#create 'updated' NC file, using values you have modified in template csv files (above)


library(shinyrAtlantis)
library(stringr)
library(shiny)
library(dplyr)
library(ncdf4)
library(tidyverse)

source('Tools.R')
source('/home/por07g/Documents/Code_Tools/shiny-Shane/Fork_git/shinyrAtlantis/R/initGen.R')
                                        #debug(make.init.nc)
bgm.file    <-  'SS_xy.bgm'
cum.depths  <-  c(0, 25, 50, 100, 250, 400, 700)
make.init.nc(bgm.file, cum.depths, Salish_Sea_filled_templates, Salish_Sea_filled_templates.h, nc.file)
## Dungenes crab was an issue

dat <- read.csv(Salish_Sea_filled_templates, stringsAsFactors = FALSE)
dat$bmtype
sapply(dat, class)


new <- read.csv('/home/por07g/Documents/2019/North-Sea/JPG_North_Sea_Atlantis/New_inital_conditions/trey.csv', stringsAsFactors = FALSE)
new$data
