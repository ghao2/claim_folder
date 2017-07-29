#get the address info from oracle
address_info<- dbGetQuery(jdbcConnection, "select * from car_accident_customer_address")

#load needed packages
install.packages("plyr")
install.packages("zipcode")
library(plyr)
library(zipcode)

#load the dataset 'zipcode'
data("zipcode")

#save it
write.csv(zipcode, file = "zipcode.csv", row.names = FALSE)

#write the zipcode into oracle
dbWriteTable(jdbcConnection,'zipcode',zipcode)

#re-extract useful information from cleaned data
address_info<- dbGetQuery(jdbcConnection, "select * 
                          from car_accident_customer_address a NATURAL JOIN car_accident_zipcode b")

#use clean.zipcodes() function, actually, this function can handle things like 02201-9998
#and convert it into things like 02201
address_info$CORRECT_ZIPCODE<- clean.zipcodes(address_info$CORRECT_ZIPCODE)

#merge the info
address_info<- merge(address_info, zipcode, by.x='CORRECT_ZIPCODE', by.y='zip')

#save it
write.csv(address_info, file = "cleaned_zipcode_city.csv", row.names = FALSE)

#load the climate data
new_table<-read.csv("Pennsylvania_Sep_cities.csv")

#write it into oracle, not success because the format of the column name
dbWriteTable(jdbcConnection,'climate_data',new_table)

#write R code to clean Area, we only want the city names.
#Here, the ^ represents the beginning and $ the end of the string, while . stands for 
#any character and * defines a repetition (zero to any). 
num_row<-NROW(new_table)

#first way of cleaning on a column
new_table$Area<-sub(", Pennsylvania", "", new_table$Area)

typeof(new_table[1, 1])

#second way of cleaning on a column
new_table$Area<-as.character(new_table$Area)

for (i in 1:num_row)
{
  new_table[i, 1]<-sub(", Pennsylvania", "", new_table[i, 1])
}

#add new columns fog, rain, and thunderstorm to new_table, with NA value
new_table$fog<-NA
new_table$rain<-NA
new_table$thunderstorm<-NA

#update the values for these three columns
#if there is a certain event on that day, it is a 1, otherwise it is a zero
new_table<-sqldf(c("update new_table set fog = 1 where Events like '%Fog%'", 
                   "select * from new_table"))

new_table<-sqldf(c("update new_table set rain = 1 where Events like '%Rain%'", 
                   "select * from new_table"))

new_table<-sqldf(c("update new_table set thunderstorm = 1 where Events like '%Thunderstorm%'", 
                   "select * from new_table"))

new_table<-sqldf(c("update new_table set fog = 0 where Events not like '%Fog%'", 
                   "select * from new_table"))

new_table<-sqldf(c("update new_table set rain = 0 where Events not like '%Rain%'", 
                   "select * from new_table"))

new_table<-sqldf(c("update new_table set thunderstorm = 0 where Events not like '%Thunderstorm%'", 
                   "select * from new_table"))

#set them into integer value
new_table$fog<-as.integer(new_table$fog)
new_table$rain<-as.integer(new_table$rain)
new_table$thunderstorm<-as.integer(new_table$thunderstorm)


#join the climate and address tables
library(sqldf)
library(tcltk)

#clean up the date in new_table
typeof(new_table$EDT)
new_table$EDT<-as.character(new_table$EDT)

#convert the date into format like '2015-09-01', becareful %Y is 4 digit year, %y is 2 digit year.
new_table$EDT<-as.character(as.Date(new_table$EDT, format="%m/%d/%y"))

#save new_table
write.csv(new_table, file = "climate_clean_date.csv", row.names = FALSE)

#clean up the date in address_info
typeof(address_info$CLM_FOLDER_CR_DT)
address_info$CLM_FOLDER_CR_DT<-as.character(address_info$CLM_FOLDER_CR_DT)
temp_date_time<-as.data.frame(strsplit(address_info$CLM_FOLDER_CR_DT, ' '))
temp_date_time<-t(temp_date_time)
temp_date_time<-as.data.frame(temp_date_time)
address_info$CLM_FOLDER_CR_DT<-temp_date_time$V1

#save address_info table
write.csv(address_info, file = "cleaned_address_info.csv", row.names = FALSE)

address_climate<-sqldf("select * from address_info as a, new_table as b 
                       where a.city=b.Area and a.CLM_FOLDER_CR_DT=b.EDT")

#save the final data
write.csv(address_climate, file = "address_climate.csv", row.names = FALSE)