rankhospital <- function(state,outcome,num=61) {
        
        outcome <- tolower(outcome)
        
        if (outcome == "heart attack") {
                i <- 11
        } else if (outcome == "heart failure") {
                i <- 17
        } else if (outcome == "pneumonia") {
                i <- 23
        }
        
        
        readData <- data.frame()
        readData <- read.csv("outcome-of-care-measures.csv", colClasses = "character",stringsAsFactors=FALSE)
        
        
        # if (sum(nm==outcome) ==0) stop("Invalid outcome")
        # if (nrow(data[data[,"State"]==state,])==0) stop("Invalid state")
        
        
        readData <- readData[readData[,"State"]==state & !is.na(readData[,i]) & readData[,i]!="Not Available",]
        
        
        lens<- length(readData[,i])
        readData <- readData[order(readData[,i],readData[,"Hospital.Name"]),]
        readData <- cbind(seq_along(1:lens),readData)


        if(lens >= num | is.character(num)) {
                if (num=="best") {

                        f <- head(readData,1)
                        f <- f$'Hospital.Name'

                } else if (num=="worst") {

                        f <- tail(readData,1)
                        f <- f$'Hospital.Name'

                } else {

                        f <- readData[readData[,1]==num,]
                        f <- f$'Hospital.Name'
                }
        } else {f<-"NA"}


        Hospital.Name <<- f
        Hospital.Name
}