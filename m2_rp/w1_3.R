corr <- function(directory,threshold=0) {
        
                #rng <-ids
                flist <-list.files(directory)
                if (length(flist)>0) {
                        data <-data.frame()
                        
                        for (i in 1:length(flist)) {
                        
                                data <- rbind(data,read.csv(file.path(directory,flist[i]),skip=1,header=FALSE))
                        }
                        
                        colnames(data) <- c("Date","sulfate","nitrate","id")
                        sbset <- data[!is.na(data[,2]) & !is.na(data[,3]),]
                        fctr <- factor(sbset[,"id"],levels=1:length(flist))
                        #fctr <- factor(sbset[,"id"],levels=1:4)
                        dframe <- data.frame(table(fctr))
                        colnames(dframe) <- c("id","nobs")
                        ftr <- dframe[dframe[,"nobs"]>threshold,]
                        rslt<-data.frame()
                        for (i in 1:length(ftr$id)) {
                                sbsetId <- sbset[sbset[,"id"] == i,]
                                #print(cor(sbsetId[,"sulfate"],sbsetId[,"nitrate"]))
                                rslt <- rbind(rslt,c(i,cor(sbsetId[,"sulfate"],sbsetId[,"nitrate"])))
                                #rslt <- cbind(i,rslt)
                        }
                        
                        colnames(rslt)<-c("id","cor")
                        rslt
                } #if (length(flist>0))
        
}