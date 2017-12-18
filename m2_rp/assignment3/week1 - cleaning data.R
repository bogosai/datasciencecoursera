



mxmlApply <- function(data,xmlAttrib){
        
        xmlAttrib <- paste("//",xmlAttrib)
        xpathSApply(data,xmlAttrib,xmlValue)
        
        
}

culcSysTime <- function(DT){
        # t0 <-data.frame()
        # t1 <- system.time(mean(DT$pwgtp15,by=DT$SEX))
        # t2 <- system.time(tapply(DT$pwgtp15,DT$SEX,mean))
        # # t3 <- system.time(DT[,mean(pwgtp15),by=SEX])
        # t4 <- system.time(mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15))
        # # t5 <- system.time(rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2])
        # t6 <- system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
        
        # tx <-data.frame()


        # tx <- c(
                # 1,mean(DT$pwgtp15,by=DT$SEX),
                print(c(1002,system.time(tapply(DT$pwgtp15,DT$SEX,mean))))
                print(c(1003,system.time(DT[,mean(pwgtp15),by=SEX])))
                print(c(1004,system.time(mean(DT[DT$SEX==1,]$pwgtp15)), system.time(mean(DT[DT$SEX==2,]$pwgtp15))))
                # # 5,rowMeans(DT)[DT$SEX==1], rowMeans(DT)[DT$SEX==2])
                print(c(1006,system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))))
        
        # # tx1 <- c(
        #         # 1,mean(DT$pwgtp15,by=DT$SEX),
        #         print(1002,system.time(tapply(DT$pwgtp15,DT$SEX,mean)))
        #         print(1003,system.time(DT[,mean(pwgtp15),by=SEX]))
        #         print(1004,system.time(mean(DT[DT$SEX==1,]$pwgtp15)), system.time(mean(DT[DT$SEX==2,]$pwgtp15)))
        #         # 5,rowMeans(DT)[DT$SEX==1], rowMeans(DT)[DT$SEX==2],
        #         print(1006,system.time(sapply(split(DT$pwgtp15,DT$SEX),mean)))
        #         # )
        
        
             
}
        
        