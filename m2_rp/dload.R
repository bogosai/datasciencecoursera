
dload <- function(curl,type="none",cdest="none",reload=FALSE,c=0,r=0) {
        
        x<-c("tibble","readr","tidyr","data.table","jpeg","httr","httpuv","sqldf","dplyr","XML","xlsx","RMySQL","readr","lubridate")
        # for(i in 1:length(x)){
        #         install.packages(x[i])
        }
        lapply(x, require, character.only = TRUE)
        
        if(type=="xlsx") cdest <- paste(cdest,".xlsx",sep="")
        else if (type=="csv") cdest <- paste(cdest,".csv",sep="")
        else if(type=="xml") cdest <- paste(cdest,".xml",sep="")
        else if(type=="fwf") cdest <- paste(cdest,".fwf",sep="")
        else if(type=="jpg") cdest <- paste(cdest,".jpg",sep="")
        else if(type=="jpeg") cdest <- paste(cdest,".jpeg",sep="")
        
        # print(cdest)
        if(cdest!="none" | type !="none") {
                if(!file.exists(cdest) | reload) {download.file(curl,cdest)}
        } else {stop("")}
        
        if(type=="xlsx") {
                library(xlsx)
                readData <- read.xlsx(cdest,sheetIndex=1,colIndex=c,rowIndex=r, header=TRUE)
                readData <- tbl_df(readData)
                readData
        } else if(type=="csv") {
                library(data.table)
                readData <- read.csv(#colClasses=c(V1="character",V2="numeric",V4="character",V5="numeric")
                                     file=cdest, stringsAsFactors=FALSE,header=FALSE #,skip=5
                                     ,blank.lines.skip = TRUE)
                # readData <- fread(cdest)
                readData<-tbl_df(readData)
                # readData <- select(readData,c(1,2,4,5))
                # readData <- rename(readData,countryCodes=V1,rank=V2,country=V4,money=V5)
                readData<-filter(readData,nchar(V1)!=0)
                readData
        } else if(type=="xml"){
                library(XML)
                readData <- xmlTreeParse(cdest,useInternal=TRUE)
                readData <- xmlRoot(readData)
                readData
        } else if(type=="html"){
                library(XML)
                # readData <- htmlTreeParse(cdest,useInternal=TRUE)
                # readData <- xmlRoot(readData)
                con <- url(curl)
                readData <- readLines(con)
                readData
        } else if(type=="fwf") {
                library(readr)
                readData <- read.fwf(cdest,header=TRUE,width=c(10,5,4,1,3,5,4,1,3,5,4,1,3,5,4,1,3),col.names=c("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q"),sep="\t",skip=3,stringsAsFactors=FALSE)
                # readData <- fread(cdest)
                readData<-data.table(readData)
                readData<-select(readData,c(1,3,5,7,9,11,13,15,17))
                readData
        } else if(type=="jpg"){
                
                img <- readJPEG(cdest,native=TRUE)
                img #<- tbl_df(img)
                
        }else if(type=="jpeg"){
                
                img <- readJPEG(cdest,native=TRUE)
                img #<- tbl_df(img)
        }
}