## Kelsea D.
## Date: 12/12/2019
## pollutantmean function for Coursera R Programming Week 2 Assignment

pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used.
  
  ## Return the mean of the pollutant across all monitors lists
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  
  ## list all files to be read in the directory
  files <- list.files(directory)
  data <- NA
  
  for( i in id ){
    #select file to pull data from
    file <- paste(directory, "/", files[i], sep = "")
    fData <- read.csv(file)
    
    #concatenate data from file to working data table
    data <- rbind(data, fData)
    
  }
  
  mean(data[[pollutant]],na.rm = TRUE)
  
}
