complete <- function(directory, id = 1:332) {
  # Get full path of the specsdata folder
  directory <- paste(getwd(),"/","specdata","/",sep="")
  
  # Aux variables
  file_list <- list.files(directory)
  ids <- vector()
  nobs <- vector()
  
  #For each id passed as parameter:
  for (i in id) {
    # Read the file,
    file_dir <- paste(directory,file_list[i],sep="")
    file_data <- read.csv(file_dir)
    
    # acumulate ids and nobs values in the vectors    
    ids = c(ids,i)
    nobs = c(nobs,sum(complete.cases(file_data)))        
  }
  # Finally, Create the data frame using the vectors and return it
  data.frame(id = ids, nobs = nobs)
}