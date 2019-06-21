##
##KEERTHANA RADHAKRISHNAN 
## ASSIGNMENT 1

####QUESTION 1

calcircle<-function(S,r) {
  if(toupper(S)=="AC")return(pi * r^2)  
  else if(toupper(S)=="CC")return(2 * pi * r)  
  else if(toupper(S)=="VS")return((4/3) * pi * r^3)
  else if(toupper(S)=="AS")return(4 * pi * r^2) else print("your method is not supported")
}

####QUESTION 2

calcircle2<-function(list1,r){
  for(i in list1) {
    if(toupper(i)=="AC") {
      print(pi*r^2)
    }else if(toupper(i)=="CC"){
      print(2*pi*r)
    }else if(toupper(i)=="VS"){
      print(4/3)*pi*r^3
    }else if(toupper(i)=="AS"){
      print(4*pi*r^2)
    } 
  }
}

####QUESTION 3

load("patient_num.RData") 
patient_num
table1<-function(patient_num,varlist) {
  mean<-sapply(patient_num[,varlist],mean,na.rm=T)
  median<-sapply(patient_num[,varlist],median,na.rm=T)
  sd<-sapply(patient_num[,varlist],sd,na.rm=T)
  N<-sapply(patient_num[,varlist],function(x)sum(is.na(x)))
  N_miss<-sapply(patient_num[,varlist],function(x)sum(!is.na(x)))
  print(t(rbind(mean,median,sd,N,N_miss)))
}

####QUESTION 4

risk<-function(){
  dice<-c(1:6)
  win<-0
  one.one<-0
  loss<-0
  total<-0
  
  for(at1 in dice){
    for(at2 in dice){
      for(at3 in dice){
        attack<-c(at1,at2,at3)
        att.high<-max(attack)
        att.low<-median(attack)
        
        for(d1 in dice){
          for(d2 in dice){
            defend<-c(d1,d2)
            def.high<-max(defend)
            def.low<-min(defend)
            
            if((att.high<=def.high) & (att.low<=def.low)){
              loss<-loss+1
            } 
            if((att.high>def.high)& (att.low>def.low)){
              win<-win+1
            }
            if( ((att.high >def.high) & (att.low <=def.low)) |
                ((att.high <=def.high) & (att.low>def.low)) ) {
              one.one=one.one + 1
            }
            total=total+1
          }
          
        }
        
      }
    }
  }
  print(paste("attacker loses:",loss/total))
  print(paste("attacker gets one: ",one.one/total))
  print(paste("attacker win: ",win/total))
  
}
risk()
risk()
#######################################################################