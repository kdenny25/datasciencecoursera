## Title: rankHospital function
## Name: KelseaD
## Date: 12/31/2019
## Description:

source("programming_assignment3/best.R")

rankhospital <- function(state, outcome, rank = "best"){
  
  ## Read outcome data
  ocmData <- read.csv("programming_assignment3/outcome-of-care-measures.csv", colClasses = "character")
  
  ## place relavent data into a data.frame for easy referencing
  rData <- as.data.frame(cbind(ocmData[, 2], 
                               ocmData[, 7], 
                               ocmData[, 11], 
                               ocmData[, 17], 
                               ocmData[, 23]), 
                              stringAsFactors = FALSE)
  
  ## assign names to columns, that match the names used for outcome requests
  ## rDataNames <- c("hospital", "state", "heart attack", "heart failure", "pneumonia")
  colnames(rData) <- c("hospital", "state", "heart attack", "heart failure", "pneumonia")
  
  if(!state %in% rData[, "state"]){
    stop('invalid state')
  } else if (!outcome %in% c("heart attack", "heart failure", "pneumonia")){
    stop('invalid outcome')
  } else if (is.numeric(rank)) {
      si <- which(rData[, "state"] == state)
      ts <- rData[si,]
      ts[, eval(outcome)] <- as.numeric(ts[, eval(outcome)])
      ts <- ts[order(ts[, eval(outcome)], ts[, "hospital"]), ]
      output <- ts[, "hospital"][rank]
  } else if (!is.numeric(rank)) {
    if ( rank == "best") {
      output <- best(state, outcome)
    } else if (rank == "worst") {
        si <- which(rData[, "state"] == state)
        ts <- rData[si,]
        ts[, eval(outcome)] <- as.numeric(ts[, eval(outcome)])
        ts <- ts[order(ts[, eval(outcome)], ts[, "hospital"], decreasing = TRUE), ]
        output <- ts[, "hospital"][1]
    } else {
      stop('invalid rank')
    }
  }
  return(output)
}