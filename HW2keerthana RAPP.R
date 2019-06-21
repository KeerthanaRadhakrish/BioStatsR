#
#HWk2
#Keerthana Radhakrishnan
##
foo1<-c(e1=1,e2=pi,e3=10)
names(foo1)
#or
e1=1
e2=pi
e3=10
foo1<-c(e1,e2,e3)
foo1
#or
foo1<-c(1,pi,10)
names(foo1)<-c("e1","e2","e3")
##
foo1
##
foo1[c(1,3)]
##
foo1[c("e1","e3")]
##
foo2<-c(names(foo1))
foo2
##
foo3<-rep(foo2,4)
foo3
names(foo3)<-month.abb
attr(foo3,"new_attr")<-"foo3 is created from foo2"
attr(foo3,"new_attr")
##
foo4<-attributes(foo3)
foo4
typeof(foo4)
##
foo5<-seq(2,12,2)
foo5
##
foo6<-foo3[foo5]
#(or)
foo6<-foo3[seq(2,12,2)]
attributes(foo6)
##
foo7<-unname(foo6)
foo7
attributes(foo7)
##
foo8<-c(foo1,foo7)
foo8
names(foo8)
typeof(foo8)
##
foo9<-rnorm(100,5,6)
hist(foo9)
sd(foo9)
mean(foo9)
##
example <- c(seq(1, 10, by=0.5), NA, 0.6)
example
foo10<-example>2
foo10
##
sum(example>2,na.rm=T)
##
sum(example,na.rm=T)
median(example,na.rm=T)
sum(example>5.25,na.rm=T)
##
is.na(example)
sum(is.na(example))
##
f <- c(3.01, 3.001, 3.0001, 3.00001)
any (f == 3.001)
log_1<- c(as.logical(f == 3.001))
log_1
sum_log_1<-sum(log_1)
sum_log_1
sum_log_1>0
sum_log_1<0
length(which(f==3.001))>0
##
bar1 <- c(2, 5, 7, 10, 20)
logical_1<-as.logical(bar1>5)
num_1<-as.integer(logical_1)
##
logical_2<-as.logical(bar1==10 |bar1== 20)
num_2<-as.integer(logical_2)
num_1
num_2
(num_1 & num_2)
#or
which(num_1 & num_2)
num_1 | num_2
#or
which(num_1 | num_2)
num_1 & !num_2
#or
which(num_1 & !num_2)
##
gender_char <- c("M", "F", "F", "M", "F")
gender<-factor(gender_char)
gender
##
mode(gender)
class(gender)
##
levels(gender)
##
nlevels(gender)
##
as.character(gender)
##
vec1 <- 1:6
vec1
##
mat1<-matrix(vec1,3,2)
#(or)
mat1<-matrix(vec1,3,2,byrow = TRUE)
mat1
##
nrow(mat1)
ncol(mat1)
dim(mat1)
##
dimnames(mat1) <- list(c("a","b","c"), c( "I"," II"))
dimnames(mat1)
mat1
#(or)
rownames<-c("a","b","c")
colnames<-c("I"," II")
mat1
##
mat2<-t(mat1)
mat2
##
mat3<-mat1[c(1,3),]
mat3
##
mat4<-cbind(mat2,mat3)
mat4
##
mat4[2,c(1,3)]
##
vec2 <- rep(c("A","B","C"), 3:5)
vec2
dim(vec2)<-c(3,2,2)
array1<-vec2
array1
#(or)
array1[3,2,2]
dimnames(vec2) <- list(c("1", "2","3"), c("l", "2"), c("l", "2"))
vec2                                                   
