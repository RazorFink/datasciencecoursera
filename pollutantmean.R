# Function pollutantmean
pollutantmean <- function(directory, pollutant, id = 1:332){
#'directory' is a vector of character length 1 
#indicating the location of the CSV files.
#'pollutant' is a character vector of length 1.  
#it will contain the name of the pollutant for which
#we will calculate the mean; either 'nitrate' or 'sulfate'.
  
#'id' is an integer vector of length 1 indicating the monitor
#ID numbers to be used.
  
#Return the mean of the pollutant values across all monitors 
#listed in the id vector (excluding NA values)
#NOTE: Don't round the result!
    filenames <- dir(directory, full.names = TRUE)[id]
    pVecs <- lapply(filenames, function(f){read.csv(f)[[pollutant]]})
    mean(unlist(pVecs), na.rm = TRUE)
}