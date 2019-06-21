
## Assignment 2
## Keerthana Radhakrishnan

##Problem 1

load("Assignment2.RData")
GetMaxSBP<-function(sbp){
  sbp$newid<-str_extract(sbp$id, "\\-*\\d+\\.*\\d*")
  sbp$sex<-toupper(str_extract(sbp$id,"[M|m|F|f]+"))
  sbp$sbp[which(sbp$sbp>300)]<-NA
  newID.unique<-unique(sbp$newid)
  newID.unique
  newID <- character(length(newID.unique))
  Sex <- character(length(newID.unique))
  maxvisit <- integer(length(newID.unique))
  maxsbp <- integer(length(newID.unique))
  m<-1
  for(i in newID.unique ) { 
    variable <- sbp[sbp$newID == i,]
    newID[m] <- i
    if(nrow(variable)==1) {
      maxvisit[m] = 1
      if(is.na(max(variable$sbp)))
        maxsbp[m] <- NA
      else
        maxsbp[m] <- max(variable$sbp)
    } else if(nrow(variable)==2) {
      if(is.na(max(variable$sbp))) {
        if(nrow(variable[is.na(variable$sbp),]) == 2) {
          maxsbp[m] <- NA
          maxvisit[m] = 1
        } else {
          maxsbp[m] <- max(variable$sbp,na.rm = TRUE)
          maxvisit[m] <- variable[order(-variable$sbp),][1,]$visit
        }
      } else {
        maxsbp[m] <- max(variable$sbp)
        maxvisit[m] <- variable[order(-variable$sbp),][1,]$visit
      }
    } else {
      if(is.na(max(variable$sbp))) {
        if(nrow(variable[is.na(variable$sbp),]) == 3) {
          maxsbp[m] <- NA
          maxvisit[m] = 1
        } else {
          maxsbp[m] <- max(variable$sbp,na.rm = TRUE)
          maxvisit[m] <- variable[order(-variable$sbp),][1,]$visit
        }      
      } else {
        maxsbp[m] <- max(variable$sbp)
        maxvisit[m] <- variable[order(-variable$sbp),][1,]$visit
      }  
    }
    
    Sex[m] <- variable[order(-variable$sbp),][1,]$Sex
    maxvisit[m] <- variable[order(-variable$sbp),][1,]$visit
    m = m + 1
  }
  return ( data.frame(newID, Sex, maxvisit, maxsbp, stringsAsFactors=FALSE) )
}

GetMaxSBP(sbp)

############################################################################

# problem 2

require(tidyverse)

set.seed(1)
bigM <- 100000
gc <- c("goat1","goat2","car")
switch.and.win <- 0
for(m in 1:bigM) {
  
## randomly permute goats,cars
  arrangement <- sample(gc,length(gc))
  contestant.pick <- sample(arrangement,1)
  left.over <- arrangement[!(arrangement %in% contestant.pick)]
  monty.pick.possibilities <- left.over[left.over != "car"]
  monty.pick <- sample(monty.pick.possibilities,1)
  
  switch <- arrangement[!(arrangement %in% c(contestant.pick,monty.pick))]
  
  if(switch == "car") {
    switch.and.win = switch.and.win + 1
  }
}
prob <- switch.and.win / bigM
prob
##if monty doesnt know where the car is.
bigM <- 100000
gc <- c("goat1","goat2","car")
switch.and.win <- 0
for(m in 1:bigM) {
  arrangement <- sample(gc,length(gc))
  contestant.pick1 <- sample(arrangement,1)
  left.over1 <- arrangement[!(arrangement %in% contestant.pick1)]
  monty.pick.possibilities1<-left.over1
  monty.pick1 <- sample(monty.pick.possibilities1,1)
  
  switch <- arrangement[!(arrangement %in% c(contestant.pick1,monty.pick1))]
  if(switch=="car"){
    switch.and.win=switch.and.win + 1
  } else {
    switch.and.win = switch.and.win
  }
}

prob1 <- switch.and.win / bigM
prob1

## if the game has 12 curtains
set.seed(1)
bigM <- 100000
gc2 <- c("goat1","goat2","car","goat3","goat4","goat5","goat6","goat7","goat8","goat9","goat10","goat11")
switch.and.win <- 0
for(m in 1:bigM) {
  
  arrangement <- sample(gc2,length(gc2))
  contestant.pick2 <- sample(arrangement,1)
  left.over <- arrangement[!(arrangement %in% contestant.pick2)]
  monty.pick.possibilities2 <- left.over[left.over != "car"]
  monty.pick2 <- sample(monty.pick.possibilities2,10)
  
  switch <- arrangement[!(arrangement %in% c(contestant.pick2,monty.pick2))]
  
  if(switch == "car") {
    switch.and.win = switch.and.win + 1
  }
}
prob2<-switch.and.win / bigM
prob2

### opening 1+7 curtains
set.seed(1)
bigM <- 100000
gc2 <- c("goat1","goat2","car","goat3","goat4","goat5","goat6","goat7","goat8","goat9","goat10","goat11")
switch.and.win <- 0
for(m in 1:bigM) {
  
  arrangement <- sample(gc2,length(gc2))
  contestant.pick3 <- sample(arrangement,1)
  left.over3 <- arrangement[!(arrangement %in% contestant.pick3)]
  monty.pick.possibilities3 <- left.over3[left.over3 != "car"]
  monty.pick3 <- sample(monty.pick.possibilities3,8)
  
  switch <- arrangement[!(arrangement %in% c(contestant.pick3,monty.pick3))]
  
  if(switch == "car") {
    switch.and.win = switch.and.win + 1
  }
}

prob3<-switch.and.win / bigM
prob3

###################################################################################

#Problem 3

library(ggplot2)
View(mpg)
mpg
head(mpg)
mpg%>% 
  group_by(class)%>%
  filter(class=="compact")%>%
  arrange(desc(cty))%>%
  slice(row_number(1:3))%>%
  arrange(desc(hwy))

mpg%>%
  group_by(class)%>%
  filter(class=="2seater")%>%
  arrange(desc(cty))%>%
  slice(row_number(1:3))%>%
  arrange(desc(hwy))

mpg%>%
  group_by(class)%>%
  filter(class=="midsize")%>%
  arrange(desc(cty))%>%
  slice(row_number(1:3))%>%
  arrange(desc(hwy))

mpg%>%
  group_by(class)%>%
  filter(class=="minivan")%>%
  arrange(desc(cty))%>%
  slice(row_number(1:3))%>%
  arrange(desc(hwy))

mpg%>%
  group_by(class)%>%
  filter(class=="pickup")%>%
  arrange(desc(cty))%>%
  slice(row_number(1:3))%>%
  arrange(desc(hwy))

mpg%>%
  group_by(class)%>%
  filter(class=="subcompact")%>%
  arrange(desc(cty))%>%
  slice(row_number(1:3))%>%
  arrange(desc(hwy))

mpg%>%
  group_by(class)%>%
  filter(class=="suv")%>%
  arrange(desc(cty))%>%
  slice(row_number(1:3))%>%
  arrange(desc(hwy))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = cty, y = hwy,color=manufacturer)) +
  facet_wrap(~ class, nrow = 2)

## this ggplot consists of cty on x axis and hwy on y axis. the data is catergorized into class while different colors represent the manufacturer.
##through this plot, we can find the relationship between city miles per gallon and highway miles per gallon among different car models and different car types.
## we can see a positive relation between cty and hwy in all the classes and volkswagon has the highest hwy and cty.
#########################################################################################