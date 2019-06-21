##
##Hwk7
##KEERTHANA RADHAKRISHNAN

library(nycflights13)
View(flights)
nyc<-as.tibble(rownames_to_column(flights))
nyc
head(nyc) 
colnames(nyc)
#1 
##a
nyc%>%
  filter(arr_delay>=120)
##b
nyc%>%
  filter(dest=="HOU" | dest=="IAH")
##c
nyc%>%
  filter(carrier=="UA"|carrier=="AA"|carrier=="DL")
##d
nyc%>%
  filter(month %in% 7:9)
##e
nyc%>%
  filter(arr_delay>=120 & dep_delay<=0)
##f 
nyc%>%
  filter(dep_delay>=60,dep_delay - arr_delay >30 )
##g
nyc%>% 
  filter(between(dep_time,0000,600))

#2
##between() function helps to select objects within the variables and is a way of writing (x >= a) & (x <= b) which is easy to use.

#3
nyc%>%
  filter(is.na(dep_time))
## dep_delay, arr_time, arr_delay are missing.
## these rows might represents flights that were cancelled.

#4
##Anything to the power 0 (^0)= 1. therefore, NA^0 is considered as 1, not including it in the missing values.

#####################################################################################
##pg51

##1
arrange( filter(flights,is.na(dep_time)))
##2

arrange(flights,desc(dep_delay))
arrange(flights,dep_delay)

##3
arrange(flights, air_time)

#####################################################################################
#Pg54

##2.
select(flights,dep_time,dep_time,air_time)
## It returns the repeated variable only once.

##3
###one_of() function helps in avoiding repeated typing of the column names. The column names can be set up upfront and can be used within select( ) function to select those variables.
###By including inside one_of() function, one can use character names.

#####################################################################################
#Pg58

##2
transmute(flights, air_time, arr_time - dep_time)
## first, we expect both air_time and arr_time-dep_time to be equal.
## but, we see that both are not the same. In fact, the arr_time- dep_time is greater than the air_time.
## this can be corrected by converting arr_time and dep_time into minutes after midnight.
nyc%>%
  transmute(dep_hour = dep_time %/% 100, 
            dep_minute = dep_time %% 100,
            dep_mid= 60*dep_hour + dep_minute,
            arr_hour = arr_time %/% 100, 
            arr_minute = arr_time %% 100, 
            arr_mid= 60*arr_hour + arr_minute,
            air_time,
            arr_mid-dep_mid
)

##Although we convert the values to minutes after midnight, they are still not equal to airtime. one reason might be bacause of different time zones.

##3
nyc%>%
  select(dep_time,sched_dep_time,dep_delay)
## Our expectation would be that the sched_dep_time+dep_delay should be equal to dep_time.
nyc%>%
  transmute((sched_dep_time+dep_delay),dep_time)
