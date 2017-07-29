install.packages("ggmap")
library(ggmap)

geocodeQueryCheck()

#get the name of the states
states<-read.csv("states.csv")
#get rid of two states
states<-states[states$name != "Micronesia",]
states<-states[states$name != "Northern Marianas",]
states<-states[states$name != "Palau",]
states<-states[states$name != "Alaska",]
states<-states[states$name != "American Samoa",]
states<-states[states$name != "Guam",]
states<-states[states$name != "Marshall Islands",]
states<-states[states$name != "Northern Marianas",]
states<-states[states$name != "Hawaii",]


#turn it into character
states$name<-as.character(states$name)

#get the longitude and latitude of the states,
for (i in 1:nrow(states)) {
  latlon = geocode(states[i,1])
  states$lon[i] = as.numeric(latlon[1])
  states$lat[i] = as.numeric(latlon[2])
}

#save and save to states table, next time no need to requery google
write.csv(states, "limited_states.csv", row.names = FALSE)

#read car accidents information
location_table<- dbGetQuery(jdbcConnection, "select * from GHAO.car_accident_distribution")

#load sqldf for query
library(sqldf)

#convert states shorts to formal names.(table is saved word, can't be used in sqldf)
new_table<-sqldf("select a.CLM_FOLDER_CR_DT as time, b.name as state, b.lon as lon, b.lat as lat from location_table as a, states as b where a.LIC_PLATE_ST_CD=b.short")

#save new_table for next use
write.csv(new_table, "geo_distribution.csv", row.names = FALSE)
new_table<-read.csv("geo_distribution.csv")

#get static map, 'device' fits the graph better 
usa<- as.numeric(geocode("United States"))
usa_map_file <-get_googlemap(center=usa, scale=2, zoom=3, maptype="roadmap", size=c(640,640))
usa_map_draw<-ggmap(usa_map_file, extent="device")

#using get_map()
usa_map_getmap <-get_map(location="usa", zoom=4, scale=2, maptype="roadmap", source="google")
ggmap(usa_map_getmap, extent="device")

#aggregate the data in Sep, 2015
#convert the time into character format
new_table$time<-as.character(new_table$time)
typeof(new_table$time)

#for exmaple, visualize the accident in Sep 2015
data_sep_2015<-sqldf('select * from new_table where new_table.time between "2015-09-13 0:00:00" and "2015-09-13 23:59:59"')
data_sep_2015<-sqldf("select count(a.state) as number_collision, a.lon, a.lat from data_sep_2015 as a group by a.state")

write.csv(data_sep_2015, "data_sep_2015.csv", row.names = FALSE)

#combine the map with data
circle_scale_amt <- 0.02
usa_map_draw+
  geom_point(aes(x=lon, y=lat), data=data_sep_2015, col="red", alpha=0.4, size=data_sep_2015$number_collision*circle_scale_amt)+
  scale_size_continuous(range=range(data_sep_2015$number_collision))


#heat map
usa_map_draw + geom_density2d(data = data_sep_2015, aes(x = lon, y = lat), size = 0.3) + 
  stat_density2d(data = data_sep_2015, 
                 aes(x = lon, y = lat, fill = ..level.., alpha = ..level..), size = 0.01, 
                 bins = 18, geom = "polygon") + scale_fill_gradient(low = "green", high = "red") + 
  scale_alpha(range = c(0, 0.3), guide = FALSE)


#line graph
#aggregate by day, see all the states