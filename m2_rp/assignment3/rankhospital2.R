rankhospital <- function(state,outcome,num=61) {
        
        readData <- data.frame()
        data <- data.frame()
        fdata <- data.frame()
        readData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        data <- readData[,c(2,7,15,21,27)]
        colnames(data) <- c("Hospital","State","Heart Attack","Heart Failure","Pneumonia")
        nm <- names(data)
        
        # if (sum(nm==outcome) ==0) stop("Invalid outcome")
        # if (nrow(data[data[,"State"]==state,])==0) stop("Invalid state")
        
        data <- data[data[,"State"]==state & !is.na(data[,outcome]) & data[,outcome]!="Not Available",]
        fdata <-data[,"Hospital"]
        outcome <- as.numeric(data[[outcome]])
        fdata <- cbind(fdata,as.numeric(outcome))
        fdata
        #data <- data[order(data[,outcome],data[,"Hospital"]),]
        
        # ldata <- as.numeric(levels(factor(data[,outcome])))
        # odata <- order(ldata)
        # 
        # fdata <- cbind(ldata[odata],seq_along(1:length(odata)))
        # fdata <- data.frame(fdata)
        # 
        # colnames(fdata) <- c("value","order")
        # fdata
        # if (num=="best") {
        #         f<-head(fdata,1)
        #         f<-f$value
        # 
        # } else if (num=="worst") {
        #         f<-tail(fdata,1)
        #         f<-f$value
        # } else {
        #         f <- fdata[fdata[,"order"]==num,]
        #         f <- f$value
        # }
        # 
        # data <- data[data[,outcome]==f,]
        # data <- data[order(data[,"Hospital"]),]
        # data
        
        
        
        
        # data <- head(data[order(data[,"Hospital"]),],1)
        # 
        # Hospital.Name <<- data$Hospital
        
}