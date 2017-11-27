best <- function(state,outcome) {
        
        
        readData <- data.frame()
        readData <- read.csv("outcome-of-care-measures.csv") #, colClasses = "character")
        data <- readData[,c(2,7,11,15,21,27)]
        colnames(data) <- c("Hospital","State","Heart Attack","Heart Failure","Pneumonia")
        data <- data[data[,"State"]==state & !is.na(data[,outcome]) & data[,outcome]!="Not Available",]
        data <- data[,c("Hospital",outcome)]
        minValue <- min(as.numeric(data[,outcome]))
        data <- data[data[,outcome]==minValue,]
        data <- data[order(data[,1]),]
        data <- data[1,]
        Hospital.Name<<-as.character(data$Hospital)
        Hospital.Name
}