##HWK 6
##KEERTHANA RADHAKRISHNAN

##1
charvar <- c(rep("A", 3), rep("B", 4), NA, rep("C", 2))
max.freq<-charvar[max(table(charvar))]
charvar[is.na(charvar)] <- max.freq
charvar

##2
set.seed(91765)
mat <- matrix(rnorm(20), 4)
dim(mat)
mat
#for loop
var<-rep(NA,4)
for(i in 1:nrow(mat)){
  var[i]<-var(mat[i,])
}
#apply function
apply(mat,1,var)
#if one element missing
mat[1,1] <- NA 
mat
##for loop
var<-rep(NA,4)
for(i in 1:nrow(mat)){
  var[i]<-var(mat[i,],na.rm=T)
}
var
##apply
apply(mat,1,var,na.rm=T)

##3
require(tidyverse)
mtcars
tibb<-as.tibble(rownames_to_column(mtcars))%>%
  select(car=rowname,everything())
tibb
mt<-tibb%>%
  select(car,gear,mpg)
mt
table(mt$gear)
#for gear=3
mt %>%
  group_by(gear)%>%
  filter(gear==3) %>%
  arrange(desc(mpg))%>%
  slice(row_number(1:2))
#for gear=4
mt %>%
  group_by(gear)%>%
  filter(gear==4) %>%
  arrange(desc(mpg))%>%
  slice(row_number(1:2))
#for gear=5
mt %>%
  group_by(gear)%>%
  filter(gear==5) %>%
  arrange(desc(mpg))%>%
  slice(row_number(1:2))

##4
library(MASS)
cutpt <- quantile(painters$Drawing, seq(0, 1, by=0.2)) 
cutpt
painters$DrawingCat <- cut(painters$Drawing, cutpt, labels=1:5, include.lowest=T)  
table(painters$DrawingCat)
##using tapply function
painters<-as.tibble(painters)
tapply(painters$Drawing, painters$DrawingCat, min)
tapply(painters$Drawing, painters$DrawingCat, max)
## using split and sapply functions
paNew <- split(painters,painters$DrawingCat)
sapply(1:length(paNew),function(i)max(paNew[[i]]$Drawing))
sapply(1:length(paNew),function(i)min(paNew[[i]]$Drawing))
rownames()
##using tapply function gives numbers as names to the result when split and sapply functions are used, there are no names given

##5
library(MASS)
painters
df<-painters[,c("Composition","Drawing","Colour","Expression")]
result<-lapply(df,function(x)lm(x ~ painters$School))
result
result[[1]]
result[[2]]
coefficients(result[[1]])
###function to find coefficients of each component
func<-function(vec,x){
  coefficients(vec[[x]])
}
func(result,"Drawing")
func(result,"Composition")
func(result,"Colour")
func(result,"Expression")
#####################################