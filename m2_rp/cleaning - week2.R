readsql <- function() {
        library(RMySQL)
        readData <- dbConnect(MySQL(),user="genome", db="hg19",host="genome-mysql.cse.ucsc.edu")
        # result <- dbGetQuery(readData,"show databases;")
        allTables <- dbListTables(readData)
        dbListFields(readData,tableName)
        dbGetQuery(readData,sqlQuery)
        
        query <- dbSendQuery(readData,sqlQuery)
        qResults <- fetch(query,n=10)
        
        dbDisconnect(readData)
        allTables
        
}




readgh <- function(murl="https://api.github.com/users/jtleek/repos",usr="jtleek",rep="datasharing"){
        v <- (function(){
                x<-c("httr","httpuv","sqldf","dplyr","XML","xlsx","RMySQL","readr","tidyr")
                lapply(x, require, character.only = TRUE)
                myapp <- oauth_app("github",
                                   key = "e5660b47a233d2ed3622",
                                   secret = "7fe46587facda090f61c03c9624839934b3b9461")
                # 3. Get OAuth credentials
                github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
                
                # 4. Use API
                gtoken <- config(token = github_token)
                req <- GET(murl, gtoken)
                stop_for_status(req)
                content(req)
        })()
        gusr <- paste(usr,"/",rep,sep="")
        if (length(v) == 0) {stop("no list provided")} 
        for (k in 1:length(v)){
                
                if(v[[k]]$full_name == gusr) {
                        print(paste(v[[k]]$name,v[[k]]$created_at,sep=" # "))
                }
        }
}


dload <- function(curl,cdest="none",type="none",c=0,r=0) {
        
        x<-c("httr","httpuv","sqldf","dplyr","XML","xlsx","RMySQL","readr") #,"lubridate")
        lapply(x, require, character.only = TRUE)
        
        if(type=="xlsx") cdest <- paste(cdest,".xlsx",sep="")
        else if (type=="csv") cdest <- paste(cdest,".csv",sep="")
        else if(type=="xml") cdest <- paste(cdest,".xml",sep="")
        else if(type=="fwf") cdest <- paste(cdest,".fwf",sep="")
        # print(cdest)
        if(!file.exists(cdest)) {download.file(curl,cdest)}

        if(type=="xlsx") {
                library(xlsx)
                readData <- read.xlsx(cdest,sheetIndex=1,colIndex=c,rowIndex=r, header=TRUE)
                readData <- tbl_df(readData)
                readData
        } else if(type=="csv") {
                library(data.table)
                readData <- read.csv(cdest, stringsAsFactors=FALSE)
                # readData <- fread(cdest)
                readData<-data.frame(readData)
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
        }
}

dfsql <- function(d="data", v=50){
        sqls<-paste("select * from ",d," where AGEP<50")
        r<-sqldf(sqls)
}
