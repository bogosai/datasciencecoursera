pollutantmean <-
function(directory,pollutant,ids = 1:332) {
        rng <-ids
        flist <-list.files(directory)
        data <-data.frame()
        
        for (i in 1:length(flist)) {
        # for (i in 1:3) {        
                data <- rbind(data,read.csv(file.path(directory,flist[i]),skip=1,header=FALSE))
        }
        colnames(data) <- c("Date","sulfate","nitrate","id")
        sbset <- data[data[,"id"] %in% rng & !is.na(data[,pollutant]),]
        mean(sbset[,pollutant])
}
