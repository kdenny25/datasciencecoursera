## Title: Assignment 3
## Name: KelseaD
## Date: 12/29/2019
## Description:


best <- function(state, outcome) {
  ## Read outcome data
  ocmData <- read.csv("programming_assignment3/outcome-of-care-measures.csv", colClasses = "character")
  
  ## place relavent data into a data.frame for easy referencing
  rData <- as.data.frame(cbind(ocmData[,2], ocmData[,7], ocmData[,11], ocmData[,17], ocmData[,23]), stringAsFactors = FALSE)
  
  ## assign names to columns, that match the names used for outcome requests
  rDataNames <- c("hospital name", "state", "heart attack", "heart failure", "pneumonia")
  colnames(rData) <- rDataNames
  
  # create a data index vector. This will help with referencing columns in the table
  # outcomeIndex <- c(2, 7, 11, 17, 23)
  # names(outcomeIndex) <- c("hospital name", "state", "heart attack", "heart failure", "pneumonia")
  
  if(!state %in% rData[, "state"]){
    stop('invalid state')
  } else if(!outcome %in% rDataNames[3:5]){
    stop('invalid state')
  } else {
    st <- which(rData[, "state"] == state)
    selectSt <- rData[st,]
    selectOt <- as.numeric(selectSt[, eval(outcome)])
    minVal <- min(selectOt, na.rm = TRUE)
    result <- selectSt[, "hospital name"][which(selectOt == minVal)]
    output <- result[order(result)]
  }
  return(output)
  
}