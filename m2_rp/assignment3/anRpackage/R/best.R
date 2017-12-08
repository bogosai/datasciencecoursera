best <-
function(state,outcome) {
        
        
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
                readData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
                
                
                if (nrow(readData[readData[,"State"]==state,])==0) stop("Invalid state")
                
                readData <- readData[readData[,"State"]==state & !is.na(readData[,i]) & readData[,i]!="Not Available",]
                
                minValue <- min(as.numeric(readData[,i]))
                
                readData <- readData[readData[,i] == minValue,]
                readData <- readData[order(readData[,"Hospital.Name"]),]
                Hospital.Names <<-readData[1,2]
                Hospital.Names
                
        }
