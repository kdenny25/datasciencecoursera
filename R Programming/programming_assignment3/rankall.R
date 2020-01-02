## Title: rankHospital function
## Name: KelseaD
## Date: 12/31/2019
## Description:

rankall <- function(outcome, num = "best") {
  ## Read outcome data
  ocmData <- read.csv("programming_assignment3/outcome-of-care-measures.csv", colClasses = "character")
  
  ## place relavent data into a data.frame for easy referencing
  rData <- as.data.frame(cbind(ocmData[,2], ocmData[,7], ocmData[,11], ocmData[,17], ocmData[,23]), stringAsFactors = FALSE)
  
  ## assign names to columns, that match the names used for outcome requests
  rDataNames <- c("hospital name", "state", "heart attack", "heart failure", "pneumonia")
  colnames(rData) <- rDataNames
  
  ## Check that state and outcome are valid
}