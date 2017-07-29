#read the new data set from undergroundweather
new_table<-read.csv("new_york_city_climate_sep.csv")

#transform a new data table from undergroundweather

#add 3 new columns
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


#clean up the date in new_table
typeof(new_table$EDT)
new_table$EDT<-as.character(new_table$EDT)
new_table$EDT<-as.character(as.Date(new_table$EDT, format="%Y-%m-%d"))

#prepare for the model
typeof(New_York_accidents$CLM_FOLDER_CR_DT)
New_York_accidents$CLM_FOLDER_CR_DT<-as.character(New_York_accidents$CLM_FOLDER_CR_DT)
New_York_accidents<-sqldf("select CLM_FOLDER_CR_DT, count(CLM_FOLDER_CR_DT) as number_accident
                         from address_info as a
                              where a.city='New York'
                              group by a.CLM_FOLDER_CR_DT")

#in this case, we can directly use new_table
New_York_complex<-sqldf("select * 
                       from new_table as a left join New_York_accidents as b 
                            on a.EDT=b.CLM_FOLDER_CR_DT")

#set the number_accident 0 if it is NA
New_York_complex<-sqldf(c("update New_York_complex set number_accident = 0 where number_accident is NULL", "select * from New_York_complex"))

#set numeric values
New_York_complex$PrecipitationIn<-as.numeric(New_York_complex$PrecipitationIn)
typeof(New_York_complex$PrecipitationIn)

#select variables, build up the model for New_York
fit_New_York<-lm(New_York_complex$number_accident~New_York_complex$Mean.TemperatureF+
                       New_York_complex$Min.VisibilityMiles+
                       New_York_complex$Max.Wind.SpeedMPH+
                       New_York_complex$CloudCover+
                       New_York_complex$fog+
                       New_York_complex$rain, data=New_York_complex)

fit_New_York<-lm(New_York_complex$number_accident~New_York_complex$PrecipitationIn, data=New_York_complex)


summary(fit_New_York)

#save the final data set
write.csv(New_York_complex, "new_york_complex.csv",  row.names = FALSE)