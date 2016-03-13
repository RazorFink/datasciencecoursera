corr <- function(directory, threshold = 0) {
    # output a vector of correlations
    completeEnough <-
        unlist(subset(complete(directory), nobs > threshold)$id)
    filenames <- dir(directory, full.names = TRUE)[completeEnough]
    if(length(filenames) < 1){
        return(numeric(0))
    }
    files <- lapply(filenames, function(f) {
        read.csv(f)
    })
    sapply(files, function(f) {
        cor(f[["sulfate"]], f[["nitrate"]], use = "complete.obs")
    })
}