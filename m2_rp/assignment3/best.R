best <- function(state,outcome) {
        
        readData <- data.frame()
        readData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        data <- readData[,c(2,7,15,21,27)]
        colnames(data) <- c("Hospital","State","Heart Attack","Heart Failure","Pneumonia")
        nm <- names(data)

        if (sum(nm==outcome) ==0) stop("Invalid outcome")
        if (nrow(data[data[,"State"]==state,])==0) stop("Invalid state")
        
        data <- data[data[,"State"]==state & !is.na(data[,outcome]) & data[,outcome]!="Not Available",]
        data <- data[,c("Hospital",outcome)]
        minValue <- min(as.numeric(data[,outcome]))
        data <- data[data[,outcome] == minValue,]
        data <- data[order(data[,"Hospital"]),]
        Hospital.Names <<-data[1,1]
        Hospital.Names

}