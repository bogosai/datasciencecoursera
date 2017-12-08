rankall <-
function(outcome,num="best") {
        
        outcome <- tolower(outcome)
        
        
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
        readData <- read.csv("outcome-of-care-measures.csv", stringsAsFactors=FALSE)
        
        #checking if state provided exists in data regardless CASE
        #if (nrow(readData[readData[,"State"]==state,])==0) stop("Invalid state")
        
        #filtering data on State and Outcome column on NA and Not Availables
       

        fstate <- levels(factor(readData[,7]))
        lstate <- length(fstate)
        # lstate       
        
        Hospital.Name <- data.frame()
        for (k in 1:lstate) {
                
                areadData <- readData[readData[,"State"]==fstate[k] & !is.na(readData[,i]) & readData[,i]!="Not Available",]
                # 
                lens<- length(areadData[,i])
                # 
                # 
                areadData <- areadData[order(as.numeric(areadData[,i]),areadData[,"Hospital.Name"]),]
                # 
                # 
                areadData <- cbind(seq_along(1:lens),areadData)
                # print(areadData[,1])
                anum <- tolower(num)
                # 
                if (sum(anum==c("best","worst"))>=1) {
                        if (anum=="best") {anum <- 1}
                        else if (anum == "worst") {anum <- lens}
                        else if (is.character(num)) {anum <- lens+1}
                } else if (is.character(num)) {anum <- lens+1}
                else {anum <- num}
                # print(c(k,anum))
                # 
                # 
                if(lens >= anum) {
                        f <- data.frame()
                        f <- areadData[areadData[,1]==anum,]
                        f <- f$'Hospital.Name'

                } else {f<-"NA"}
                # print(f)
                
                Hospital.Name <- rbind.data.frame(Hospital.Name,data.frame(f,fstate[k]))
                
        }       
        colnames(Hospital.Name) <- c("hospital","state")
        print(Hospital.Name)
}
