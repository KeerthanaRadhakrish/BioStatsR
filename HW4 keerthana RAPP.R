##
##Hwk4
##Keerthana Radhakrishnan
##1
a <- c(seq(1,10, by=2), NA, 20) 
names(a) <- c(LETTERS[1:6], "A") 
a
#1a
a[c(1,3,5,7)]
#1b
a[which(!is.na(a))]
#(or)
a[-c(6)]
#1c
a[which(a<10)]
#1d
a[-c(1, 3)]
#1e
a[which(names(a)=="C"|names(a)=="D")]
#1f
a[which(names(a)=="A"|names(a)=="D")]
################################################################################################################
##2
b <- matrix(1:12, nrow=3)
dimnames(b) <- list(c("I","II","III"), letters[1:4]) 
b
#2a
b[c(1,2),c(1,3)]
#2b
b[c("I","III"),]
#2c
b[c("I","III"),c("a","b","c")]
#2d
as.matrix(b[,c("a")])
################################################################################################################
##3
library(MASS)
head(quine)
#3a
quine1<-data.frame(quine$Eth,quine$Days)
quine1
#3b
quine2<-data.frame(quine[which(quine$Age== "F0"| quine$Age=="F1"),])
quine2
#3c
quine3<-data.frame(quine$Age)
quine3
#3d
quine4<-data.frame(quine$Age[which(quine$Days>10)])
quine4
###############################################################################################################
##4
Days.Age <- lm(Days~Age, data = quine) 
Days.Age
#4a
mode(Days.Age)
#(or)
typeof(Days.Age)
class(Days.Age)
#4b
attributes(Days.Age)
#4c
days.age.coef<-c(Days.Age$coefficients)
days.age.coef
#4d
typeof(days.age.coef)
class(days.age.coef)
#4e
days.age.coef[c(2,3)]
#4f
Days.Age.Anova <- anova(Days.Age) 
Days.Age.Anova
typeof(Days.Age.Anova)
class(Days.Age.Anova)
#4g
days<-unlist(Days.Age.Anova)
F.p<-days[c(7,9)]
names(F.p)<-c("F","p")
F.p
###############################################################################################################