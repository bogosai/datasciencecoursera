#run_analysis 
ra<- function(){
        
        f<-read.csv("./gc/features.txt",header=FALSE,sep=" ")
                f<-data.table(f)
                f<-f[!grep("^[angle]",f$V2),]
                f<-separate(f,V2,into=c("V2","V3","V4","V5","V6"),sep="[-|,]")
                f$V33<-gsub("[()]","",f$V3)
                f<-filter(f,V33=="mean"|V33=="std")
}