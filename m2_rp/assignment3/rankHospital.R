rankhospital <- function(state,outcome,num="best") {
        
        readData <- data.frame()
        readData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        data <- readData[,c(2,7,11,17,23)]
        colnames(data) <- c("Hospital","State","Heart Attack","Heart Failure","Pneumonia")
        nm <- names(data)
        
        if (sum(nm==outcome) ==0) stop("Invalid outcome")
        if (nrow(data[data[,"State"]==state,])==0) stop("Invalid state")
        
        data <- data[data[,"State"]==state & !is.na(data[,outcome]) & data[,outcome]!="Not Available",]
        # t <-as.numeric(data[,outcome])
        t <-as.numeric(data[,outcome])
        rank(t)
        # data <- data[,c("Hospital",outcome)]
        # minValue <- min(as.numeric(data[,outcome]))
        # data <- data[data[,outcome] == minValue,]
        # data <- data[order(data[,"Hospital"]),]
        # Hospital.Names <<-data[1,1]
        # Hospital.Names
        
}