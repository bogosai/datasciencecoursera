complete <- function(directory,ids=1:332) {
        
        rng <-ids
        flist <-list.files(directory)
        data <-data.frame()
        
        for (i in ids) {
                data <- rbind(data,read.csv(file.path(directory,flist[i]),skip=1,header=FALSE))
        }
        
        colnames(data) <- c("Date","sulfate","nitrate","id")
        sbset <- data[data[,"id"] %in% rng & !is.na(data[,2]) & !is.na(data[,3]),]
        fctr <- factor(sbset[,"id"],levels=rng)
        dframe <- data.frame(table(fctr))
        colnames(dframe) <- c("id","nobs")
        dframe
}