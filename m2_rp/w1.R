pollutantmean <- function(directory,pollutant,id = 1:332) {
        flist <-list.files(directory)
        data <-data.frame()
        for (i in id) {
                data <- rbind(data,read.csv(file.path(directory,flist[i]),skip=1,header=FALSE,nrow=5))
        }
        colnames(data) <- c("Date","sulfate","nitrate","ID")
        print(data[4])
        

        }