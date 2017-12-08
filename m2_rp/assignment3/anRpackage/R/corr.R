corr <-
function(directory,threshold=0) {
        if (threshold>0) {
                #rng <-ids
                flist <-list.files(directory)
                if (length(flist>0)) {
                        data <-data.frame()
                        
                        for (i in 1:length(flist)) {
                        #for (i in 1:4) {
                                data <- rbind(data,read.csv(file.path(directory,flist[i]),skip=1,header=FALSE))
                        }
                        
                        colnames(data) <- c("Date","sulfate","nitrate","id")
                        sbset <- data[!is.na(data[,2]) & !is.na(data[,3]),]
                        fctr <- factor(sbset[,"id"],levels=1:length(flist))
                        #fctr <- factor(sbset[,"id"],levels=1:4)
                        dframe <- data.frame(table(fctr))
                        colnames(dframe) <- c("id","nobs")
                        dframe[dframe[,"nobs"]>threshold,]
                } #if (length(flist>0))
        } #if (threshold>0) 
}
