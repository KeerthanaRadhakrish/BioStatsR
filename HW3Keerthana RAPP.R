##Hwk 3
## Keerthana Radhakrishnan
############
#1
list1<-c(list(A=c(1:10)),list(B=LETTERS[1:4]),list(C=list(C1=matrix(1:4,2,2),C2=pi)))
############
#2
str(list1)
############
#3a
list1

#3b
list1[c(1,3)]

#3c
list1$C[1]

#3d
length(list1$C)
names(list1$C)
############
#4
E1<-c("M","M","F","F")
E<-factor(E1)
list2<- list(D=c(10:1),E)
list2
############
#5
list3<-c(list1,list2)
str(list3)
############
#6
dat1<-data.frame(Name=c("Alfred","Barbara","John","Kerry"),sex=c("M","F","M","F"),age=c(23,35,25,19),height=c(72,61,NA,66),weight=c(160.3,125.4,175.0,130.2),smoke=c("TRUE","TRUE","FALSE","FALSE"))
dat1
############
#7
dat2<-data.frame(smoke_ind=as.integer(dat1$smoke),bmi=100*(dat1$height/dat1$weight))
dat2  
############
#8
dat3<-cbind(dat1,dat2)
dat3
############
#9
dat4<-dat3[,c(2:8)]
rownames(dat4)<-dat3$Name
dat4
############
#10
setwd("C:/Users/Keerthana/Downloads/spring term 2019/H 599- R")
write.table(dat4,file="dat4.txt",quote=F,na =" ",sep="\t",row.names =F,col.names =T )
read.table("dat4.txt")
############