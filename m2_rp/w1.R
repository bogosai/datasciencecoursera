pollutantmean <- function(directory,pollutant,id = 1:332) {
        flist <-list.files(directory)
        data <-data.frame()
        
        # for (i in 1:length(flist)) {
        for (i in 1:3) {        
                data <- rbind(data,read.csv(file.path(directory,flist[i]),skip=1,header=FALSE))
        }
        colnames(data) <- c("Date","sulfate","nitrate","ids")

        z<-id

        
        # q<-data[!is.na(data[pollutant]) & data["ids"] %in% z]
        data[data["ids"]>1]

}
pollutantmean("specdata","sulfate",1:3)