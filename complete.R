complete <- function(directory, id = 1:332){
    filenames <- dir(directory, full.names = TRUE)[id]
    files <- lapply(filenames, function(f){read.csv(f)})
    nobs <- lapply(files, function(f){ sum(complete.cases(f)) })
    id <- lapply(files, function(f){ unique(f[["ID"]]) })
    data.frame(cbind(id, nobs))
}