###
##Hwk 5
## Keerthana Radhakrishnan

library(MASS)  
head(painters)

## extreme function
extreme <- function (vec){ 
  extreme_logical = abs(vec-mean(vec))>2*sd(vec) 
  extreme_value = vec[extreme_logical] 
  if (length(extreme_value) >0) { 
    cat("The Extreme Values Are:", "\n", extreme_value, "\n") 
    return(extreme_value) 
  } 
  else{ 
    cat("There are no extreme values", "\n") 
    return(NULL) 
  } 
}

##mean.sd
mean.sd = function(dat, varname){ 
  c(mean(dat[[varname]]), sd(dat[[varname]]))
}
mean.sd(painters, "Composition")
mean.sd(painters, "Drawing")

##modified mean.sd function
mean.sd = function(dat, varname){ 
  if (!is.element(varname, colnames(dat))) 
    stop ("No such variable.") 
  if (!is.numeric(dat[[varname]])) 
    stop ("The variable must be numeric.") 
  c(mean(dat[[varname]]), sd(dat[[varname]])) 
  }

###mean.sd.table
mean.sd.table = function(dat, varlist){ 
  r =mean.sd(dat, varlist[[1]]) 
  if (length(varlist) == 1){ 
    r= matrix(r, nrow=T)} 
  else{
    for (index in 2:length(varlist)){ 
      oneRow = mean.sd(dat, varlist[[index]]) 
      r = rbind(r, oneRow) 
    } 
  } 
  rownames(r) = varlist 
    colnames(r) = c("mean", "sd") 
    return(r) 
}

###ANOVA
ANOVA <- function(dat=quine, outcome="Days", x){
  Formula <- paste(outcome, x, sep="~") 
  r <- anova(lm(Formula, data = dat)) 
  result <- data.frame(Outcome = outcome,
                       X = x, 
                       F = round(r[["F value"]][1],2), 
                       P = round(r[["Pr(>F)"]][1],5)) 
  return(result)
} 

###ANOVA_list
ANOVA_list <- function(dat=quine, outcome, xlist){ 
    r <- data.frame()  
      for(i in 1:length(xlist)){ 
          result = ANOVA(x=xlist[i]) 
            r <-rbind(r, result) 
      } 
      return(r) 
} 

###area of triangle
Area <- function(cal,a){
  if (cal=="T") return((sqrt(3)/4)*(a^2)) 
    else if (cal=="S") return(a^2) 
    else if (cal=="P") return((1/4)*sqrt(5*(5+2*sqrt(5)))*(a^2))
}

##Area2
Area2 <- function(cal_list, a){ 
    result <- list() 
      for (i in 1:length(cal_list)){ 
          result <- c(result, list(Area(cal_list[i],a)))  
      }  
      names(result) <- cal_list + return(result) 
}

