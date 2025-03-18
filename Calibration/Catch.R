library(ReactiveAtlantis)

groups.csv     <- '/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/SS_grps.csv'
bgm.file       <- '/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/SS_xy.bgm'
cum.depths     <- c(0, 25, 50, 100, 250, 400, 700)
current = '02'
fish.csv <- '/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/SS_fisheries.csv'
catch.nc <- paste0('/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/outputs/output', current, '/outputSalishSeaCATCH.nc')
#debug(catch)
catch(grp.csv, fish.csv, catch.nc)

