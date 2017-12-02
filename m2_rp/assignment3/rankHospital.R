rankhospital <- function(state,outcome,num=61) {
        
        outcome <- tolower(outcome)
        state <- toupper(state)
        
        #checking whether num is either best or worst, if is.character at all

        
        #limiting Outcome to Heart Attack, Heart Failure, Pheumonia
        if (outcome == "heart attack") {
                i <- 11
        } else if (outcome == "heart failure") {
                i <- 17
        } else if (outcome == "pneumonia") {
                i <- 23
        } else {
                stop("invalid outcome")
        }
        
        
        readData <- data.frame()
        readData <- read.csv("outcome-of-care-measures.csv", colClasses = "character",stringsAsFactors=FALSE)
        
        #checking if state provided exists in data regardless CASE
        if (nrow(readData[readData[,"State"]==state,])==0) stop("Invalid state")
        
        #filtering data on State and Outcome column on NA and Not Availables
        readData <- readData[readData[,"State"]==state & !is.na(readData[,i]) & readData[,i]!="Not Available",]
        
        
        lens<- length(readData[,i])
        
        #ordering first on Outcome and then on Hostpital alphabetically
        readData <- readData[order(readData[,i],readData[,"Hospital.Name"]),]
        
        #introducing row numbers based on Ordering
        readData <- cbind(seq_along(1:lens),readData)

        if(is.character(num)) {
                
                num <- tolower(num)
                if (sum(num==c("best","worst"))==1) {
                        if (num=="best") {num <- 1}
                        else {num <- lens}
                } else {num <- lens+1}
        }
        
        if(lens >= num) {
                
                f <- readData[readData[,1]==num,]
                f <- f$'Hospital.Name'
                
        } else {f<-"NA"}

        Hospital.Name <<- f
        Hospital.Name
}