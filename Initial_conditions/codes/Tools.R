library(ncdf4)
##' @title Read Atlantis initial condition file
##' @param nc.file netCDF initial confition file
##' @param just.Sum This fucntion only calculate the Sum by box. If you want the mean this should be false
##' @param fill.value Just look for the fill value of some variablers
##' @param file.out Name of the output file
##' @return A csv file with the sum by box of the values in the initial condition
##' @author Demiurgo
transform.ini <- function(nc.file = NULL, just.Sum = TRUE, fill.value=FALSE, file.out = 'IniCond'){
#    browser()
    nc    <- nc_open(nc.file)
    var2d <- NULL
    var   <- names(nc[['var']])
    ## Ugly loop
    if(!fill.value){
        for(v in 1 : length(var)){
            var.tmp <- ncvar_get(nc, var[v])
            if(length(dim(var.tmp)) >= 2){ ## Avoiding problem with the variables like "numlayers" that only have one dimention
                if(just.Sum){
                    temp2d  <- colSums(var.tmp, na.rm = TRUE)
                } else {
                    var.tmp[var.tmp == 0] <- NA
                    temp2d  <- colMeans(var.tmp, na.rm = TRUE)
                }
                var2d   <- cbind(var2d,  temp2d)
            } else {
                var2d   <- cbind(var2d,  var.tmp)
            }
        }
        colnames(var2d) <- var
    } else {
        for(v in 1 : length(var)){
            var.tmp <- ncatt_get(nc, var[v], '_FillValue')$value
            var2d   <- c(var2d,  var.tmp)
        }
        names(var2d) <- var
    }

    if(just.Sum){
        file <- paste0(file.out, '_Sums.csv')
    } else {
        file <- paste0(file.out, '_Means.csv')
    }
    if(fill.value) file <- paste0(file.out, '_FillValue.csv')
    rn             <- FALSE
    if(fill.value) rn <- TRUE
    write.table( var2d,  file,  row.names = rn)
    cat(paste('file', file, 'has been created\n'))
}
