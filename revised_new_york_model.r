#read the new data set from undergroundweather
new_table<-read.csv("new_york_city_climate_sep.csv")
address_info<-read.csv("cleaned_address_info.csv")
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


#add dummy variables
#DM1 is rain or not
#DM2 is fog or not
#DM3 is thunderstorm or not
#DM4 is rain, fog, or not
#DM5 is rain, thunderstorm or not
#DM6 is fog, thunderstorm or not
#DM7 is rain, fog, thunderstorm or not
new_table$DM1<-NA
new_table$DM2<-NA
new_table$DM3<-NA
new_table$DM4<-NA
new_table$DM5<-NA
new_table$DM6<-NA
new_table$DM7<-NA

#update the dummy variables
new_table<-sqldf(c("update new_table set DM1 = 1 
                   where Events like '%Rain%' and 
                   Events not like '%Fog%' and
                   Events not like '%Tunderstorm%'", 
                   "select * from new_table"))

new_table<-sqldf(c("update new_table set DM2 = 1 
                   where Events like '%Fog%' and 
                   Events not like '%Rain%' and
                   Events not like '%Tunderstorm%'", 
                   "select * from new_table"))

new_table<-sqldf(c("update new_table set DM3 = 1 
                   where Events like '%Thunderstorm%' and 
                   Events not like '%Fog%' and
                   Events not like '%Rain%'", 
                   "select * from new_table"))

new_table<-sqldf(c("update new_table set DM4 = 1 
                   where Events like '%Rain%' and 
                   Events like '%Fog%' and
                   Events not like '%Tunderstorm%'", 
                   "select * from new_table"))

new_table<-sqldf(c("update new_table set DM5 = 1 
                   where Events like '%Rain%' and 
                   Events like '%Tunderstorm%' and
                   Events not like '%Fog%'", 
                   "select * from new_table"))

new_table<-sqldf(c("update new_table set DM6 = 1 
                   where Events like '%Fog%' and 
                   Events like '%Tunderstorm%' and
                   Events not like '%Rain%'", 
                   "select * from new_table"))

new_table<-sqldf(c("update new_table set DM7 = 1 
                   where Events like '%Rain%' and 
                   Events like '%Tunderstorm%' and
                   Events like '%Fog%'", 
                   "select * from new_table"))


new_table<-sqldf(c("update new_table set DM1 = 0 where DM1 is NULL", 
                   "select * from new_table"))

new_table<-sqldf(c("update new_table set DM2 = 0 where DM2 is NULL", 
                   "select * from new_table"))

new_table<-sqldf(c("update new_table set DM3 = 0 where DM3 is NULL", 
                   "select * from new_table"))

new_table<-sqldf(c("update new_table set DM4 = 0 where DM4 is NULL", 
                   "select * from new_table"))

new_table<-sqldf(c("update new_table set DM5 = 0 where DM5 is NULL", 
                   "select * from new_table"))

new_table<-sqldf(c("update new_table set DM6 = 0 where DM6 is NULL", 
                   "select * from new_table"))

new_table<-sqldf(c("update new_table set DM7 = 0 where DM7 is NULL", 
                   "select * from new_table"))

#turn dummy variables into integers
new_table$DM1<-as.integer(new_table$DM1)
new_table$DM2<-as.integer(new_table$DM2)
new_table$DM3<-as.integer(new_table$DM3)
new_table$DM4<-as.integer(new_table$DM4)
new_table$DM5<-as.integer(new_table$DM5)
new_table$DM6<-as.integer(new_table$DM6)
new_table$DM7<-as.integer(new_table$DM7)

#clean up the date in new_table
typeof(new_table$EDT)
new_table$EDT<-as.character(new_table$EDT)
new_table$EDT<-as.character(as.Date(new_table$EDT, format="%Y-%m-%d"))

#prepare for the model
New_York_accidents<-sqldf("select CLM_FOLDER_CR_DT, count(CLM_FOLDER_CR_DT) as number_accident
                          from address_info as a
                          where a.city='New York'
                          group by a.CLM_FOLDER_CR_DT")

typeof(New_York_accidents$CLM_FOLDER_CR_DT)
New_York_accidents$CLM_FOLDER_CR_DT<-as.character(New_York_accidents$CLM_FOLDER_CR_DT)

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
                   New_York_complex$DM1+
                   New_York_complex$DM2+
                   New_York_complex$DM3+
                   New_York_complex$DM4+
                   New_York_complex$DM5+
                   New_York_complex$DM6+
                   New_York_complex$DM7, data=New_York_complex)

fit_New_York<-lm(New_York_complex$number_accident~New_York_complex$PrecipitationIn, data=New_York_complex)


summary(fit_New_York)

#save the final data set
write.csv(New_York_complex, "new_york_complex.csv",  row.names = FALSE)