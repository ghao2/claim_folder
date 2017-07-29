data_table<-read.csv('data_sep_15.csv')

data_table$FrontBumper<-0
data_table$LeftFrontFogLamp<-0
data_table$RightFrontFogLamp<-0
data_table$LeftHeadLamp<-0
data_table$RightHeadLamp<-0
data_table$Radiator<-0
data_table$ACCONDENSER<-0
data_table$HOOD<-0
data_table$FrontSuspension<-0
data_table$RearSuspension<-0
#data_table$FrontBodayBottom<-0
#data_table$RightFrontStabilizerBar<-0
data_table$SteeringGear<-0
#data_table$KnuckleSteering<-0
#data_table$SteeringRack<-0
data_table$RightFrontTieRod<-0
#data_table$ABS<-0
data_table$Roof<-0
data_table$RightFender<-0
data_table$LeftFender<-0
data_table$RightFrontWheel<-0
data_table$LeftFrontWheel<-0
data_table$RightSideMarker<-0
data_table$LeftSideMarker<-0
data_table$RightRocker<-0
data_table$LeftRocker<-0
data_table$Battery<-0
data_table$Engine<-0
data_table$RightCowl<-0
data_table$LeftCowl<-0
data_table$Windshield<-0
data_table$LeftHingePillar<-0
data_table$RrightFrontDoor<-0
data_table$LeftFrontDoor<-0
#data_table$LicenseLamp<-0
data_table$LeftAirBag<-0
#data_table$SteeringWheel<-0
data_table$LeftFrontSeat<-0
data_table$RightFrontSeat<-0
data_table$LeftRearSeat<-0
data_table$RightRearDoor<-0
data_table$LeftRearDoor<-0
data_table$RightQuarter<-0
data_table$LeftQuarter<-0
#data_table$LeftFuelDoor<-0
#data_table$FuelSystem<-0
data_table$RightRearwheel<-0
data_table$LeftRearwheel<-0
data_table$RearGlass<-0
data_table$Trunk<-0
data_table$RearGate<-0
data_table$LeftTailLamp<-0
data_table$RightTailLamp<-0
data_table$RightTailPipe<-0
data_table$RearBumper<-0
data_table$Grille<-0
#data_table$RightFuelDoor<-0
data_table$RightAirBag<-0
data_table$Fan<-0
data_table$RightRearSeat<-0
data_table$LeftTailPipe<-0
data_table$RearSill<-0
data_table$FuelTank<-0
#data_table$LeftRearBodySide<-0
#data_table$RightRearBodySide<-0
data_table$RearBody<-0


library(sqldf)

#update according to key words

#1, FrontBumper
data_table<-sqldf(c("update data_table set FrontBumper = 1 where LINE_DESC like '%FRT%BUMPER%'", 
                   "select * from data_table"))

data_table<-sqldf(c("update data_table set FrontBumper = 1 where LINE_DESC like '%FRONT%BUMPER%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set FrontBumper = 1 where LINE_DESC like '%BUMPERS%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set FrontBumper = 1 where LINE_DESC like '%FRT%BMPR%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set FrontBumper = 1 where LINE_DESC like '%BUMPER%FRONT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set FrontBumper = 1 where LINE_DESC like '%FRT%BODY%AIR%DEFLECTOR%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set FrontBumper = 1 where LINE_DESC like '%FRT%BODY%APRON%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set FrontBumper = 1 where LINE_DESC like '%FRONT%APRON%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set FrontBumper = 1 where LINE_DESC like '%FRT%APRON%'", 
                    "select * from data_table"))

#2, LeftFrontFogLamp
data_table<-sqldf(c("update data_table set LeftFrontFogLamp = 1 where LINE_DESC like '%L%FRT%FOG%LAMP%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftFrontFogLamp = 1 where LINE_DESC like '%FOG%LAMPS%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftFrontFogLamp = 1 where LINE_DESC like '%LAMP%ASSEMBLY,FOG%LT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftFrontFogLamp = 1 where LINE_DESC like '%L%FOG%LAMP%'", 
                    "select * from data_table"))

#3, RightFrontFogLamp
data_table<-sqldf(c("update data_table set RightFrontFogLamp = 1 where LINE_DESC like '%R%FOG%LAMP%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightFrontFogLamp = 1 where LINE_DESC like '%FOG%LAMPS%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightFrontFogLamp = 1 where LINE_DESC like '%LAMP%FOG%RT%'", 
                    "select * from data_table"))

#4, LeftHeadLamp
data_table<-sqldf(c("update data_table set LeftHeadLamp = 1 where LINE_DESC like '%HEADLAMP%LT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftHeadLamp = 1 where LINE_DESC like '%HEADLAMPS%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftHeadLamp = 1 where LINE_DESC like '%L%FRONT%COMBINATION%LAMP%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftHeadLamp = 1 where LINE_DESC like '%L%FRT%LAMP%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftHeadLamp = 1 where LINE_DESC like '%FRONT%LAMPS%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftHeadLamp = 1 where LINE_DESC like '%L%FRT%LAMP%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftHeadLamp = 1 where LINE_DESC like '%L%HEADLAMP%'", 
                    "select * from data_table"))

#5, RightHeadLamp
data_table<-sqldf(c("update data_table set RightHeadLamp = 1 where LINE_DESC like '%HEADLAMP%RT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightHeadLamp = 1 where LINE_DESC like '%R%FRONT%COMBINATION%LAMP%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightHeadLamp = 1 where LINE_DESC like '%R%FRT%LAMP%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightHeadLamp = 1 where LINE_DESC like '%HEADLAMPS%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightHeadLamp = 1 where LINE_DESC like '%FRONT%LAMPS%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightHeadLamp = 1 where LINE_DESC like '%RT%HEADLAMP%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightHeadLamp = 1 where LINE_DESC like '%R%HEADLAMP%'", 
                    "select * from data_table"))

#6, Radiator
data_table<-sqldf(c("update data_table set Radiator = 1 where LINE_DESC like '%RADIATOR%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set Radiator = 1 where LINE_DESC like '%COOLING%RADIATOR%'", 
                    "select * from data_table"))

#7, ACCONDENSER
data_table<-sqldf(c("update data_table set ACCONDENSER = 1 where LINE_DESC like '%A/C%CONDENSER%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set ACCONDENSER = 1 where LINE_DESC like '%A/C%'", 
                    "select * from data_table"))

#8, HOOD
data_table<-sqldf(c("update data_table set HOOD = 1 where LINE_DESC like '%HOOD%'", 
                    "select * from data_table"))

#9, FrontSuspension
data_table<-sqldf(c("update data_table set FrontSuspension = 1 where LINE_DESC like '%FRONT%SUSPENSION%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set FrontSuspension = 1 where LINE_DESC like '%FRT%SUSP%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set FrontSuspension = 1 where LINE_DESC like '%FRONT%STRUT%RT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set FrontSuspension = 1 where LINE_DESC like '%SUSP%FRONT%LT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set FrontSuspension = 1 where LINE_DESC like '%SUSP%FRONT%RT%'", 
                    "select * from data_table"))

#10, RearSuspension
data_table<-sqldf(c("update data_table set RearSuspension = 1 where LINE_DESC like '%REAR%SUSP%'", 
                    "select * from data_table"))

#11, FrontBodayBottom
#data_table<-sqldf(c("update data_table set FrontBodayBottom = 1 where LINE_DESC like '%FRONT%BODY%BOTTOM%'", 
#                    "select * from data_table"))

#12, RightFrontStabilizerBar
#data_table<-sqldf(c("update data_table set RightFrontStabilizerBar = 1 where LINE_DESC like '%FRT%STABILIZER%BAR%RT%'", 
#                    "select * from data_table"))

#13, SteeringGear
data_table<-sqldf(c("update data_table set SteeringGear = 1 where LINE_DESC like '%STEERING%GEAR%'", 
                    "select * from data_table"))


#14, KnuckleSteering
#data_table<-sqldf(c("update data_table set KnuckleSteering = 1 where LINE_DESC like '%KNUCKLE%STEERING%L/F%'", 
#                    "select * from data_table"))


#15, SteeringRack
#data_table<-sqldf(c("update data_table set SteeringRack = 1 where LINE_DESC like '%STEERING%RACK%'", 
#                    "select * from data_table"))

#16, RightFrontTieRod
data_table<-sqldf(c("update data_table set RightFrontTieRod = 1 where LINE_DESC like '%TIE%ROD%R%F%'", 
                    "select * from data_table"))


#17, ABS
#data_table<-sqldf(c("update data_table set ABS = 1 where LINE_DESC like '%ABS%SYSTEM%'", 
#                    "select * from data_table"))


#18, Roof
data_table<-sqldf(c("update data_table set Roof = 1 where LINE_DESC like '%ROOF%'", 
                    "select * from data_table"))


#19, RightFender
data_table<-sqldf(c("update data_table set RightFender = 1 where LINE_DESC like '%R%FENDER%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightFender = 1 where LINE_DESC like '%FENDER%RT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightFender = 1 where LINE_DESC like '%BODYSIDE%FRONT%RT%'", 
                    "select * from data_table"))

#20, LeftFender
data_table<-sqldf(c("update data_table set LeftFender = 1 where LINE_DESC like '%L%FENDER%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftFender = 1 where LINE_DESC like '%FENDER%FRONT%LT'", 
                    "select * from data_table"))


#21, RightFrontWheel
data_table<-sqldf(c("update data_table set RightFrontWheel = 1 where LINE_DESC like '%WHEEL%FRONT%RT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightFrontWheel = 1 where LINE_DESC like '%RIGHT%FRONT%TIRE%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightFrontWheel = 1 where LINE_DESC like '%FRONT%WHEEL%RT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightFrontWheel = 1 where LINE_DESC like '%RT%FT%TIRE%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightFrontWheel = 1 where LINE_DESC like '%FRONT%BRAKE%RT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightFrontWheel = 1 where LINE_DESC like '%R%FRT%WHEELHOUSE%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightFrontWheel = 1 where LINE_DESC like '%TIRE,RT%FT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightFrontWheel = 1 where LINE_DESC like '%R%FRONT%WHEELHOUSE%'", 
                    "select * from data_table"))

#22, LeftFrontWheel
data_table<-sqldf(c("update data_table set LeftFrontWheel = 1 where LINE_DESC like '%FRONT%WHEEL%LT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftFrontWheel = 1 where LINE_DESC like '%TIRE%LT%FT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftFrontWheel = 1 where LINE_DESC like '%WHEEL%LT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftFrontWheel = 1 where LINE_DESC like '%LT%FRONT%WHEEL%ALLOY%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftFrontWheel = 1 where LINE_DESC like '%WHEEL%FRONT%LT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftFrontWheel = 1 where LINE_DESC like '%TIRE%LF%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftFrontWheel = 1 where LINE_DESC like '%LEFT%FRONT%TIRE%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftFrontWheel = 1 where LINE_DESC like '%LF%TIRE%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftFrontWheel = 1 where LINE_DESC like '%L%FRONT%WHEELHOUSE%'", 
                    "select * from data_table"))

#23, RightSideMarker
data_table<-sqldf(c("update data_table set RightSideMarker = 1 where LINE_DESC like '%SIDE%MARKER%RT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightSideMarker = 1 where LINE_DESC like '%RT%SIDE%MARKER%'", 
                    "select * from data_table"))


#24, LeftSideMarker
data_table<-sqldf(c("update data_table set LeftSideMarker = 1 where LINE_DESC like '%SIDE%MARKER%LT%'", 
                    "select * from data_table"))


#25, RightRocker
data_table<-sqldf(c("update data_table set RightRocker = 1 where LINE_DESC like '%R%ROCKER%'", 
                    "select * from data_table"))


#26, LeftRocker
data_table<-sqldf(c("update data_table set LeftRocker = 1 where LINE_DESC like '%L%ROCKER%'", 
                    "select * from data_table"))


#27, Battery
data_table<-sqldf(c("update data_table set Battery = 1 where LINE_DESC like '%BATTERY%'", 
                    "select * from data_table"))

#28, Engine
data_table<-sqldf(c("update data_table set Engine = 1 where LINE_DESC like '%ENGINE%'", 
                    "select * from data_table"))


#29, RightCowl
data_table<-sqldf(c("update data_table set RightCowl = 1 where LINE_DESC like '%R%COWL%'", 
                    "select * from data_table"))


#30, LeftCowl
data_table<-sqldf(c("update data_table set LeftCowl = 1 where LINE_DESC like '%L%COWL%'", 
                    "select * from data_table"))


#31, Windshield
data_table<-sqldf(c("update data_table set Windshield = 1 where LINE_DESC like '%FRONT%GLASS%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set Windshield = 1 where LINE_DESC like '%W/SHIELD%GLASS%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set Windshield = 1 where LINE_DESC like '%WINDSHIELD%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set Windshield = 1 where LINE_DESC like '%WIPER%BLADE%'", 
                    "select * from data_table"))

#32, LeftHingePillar
data_table<-sqldf(c("update data_table set LeftHingePillar = 1 where LINE_DESC like '%L%HINGE%PILLAR%'", 
                    "select * from data_table"))


#33, RrightFrontDoor
data_table<-sqldf(c("update data_table set RrightFrontDoor = 1 where LINE_DESC like '%R%FRONT%DOOR%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RrightFrontDoor = 1 where LINE_DESC like '%R%FRT%DOOR%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RrightFrontDoor = 1 where LINE_DESC like '%R%FRT%REAR%VIEW%MIRROR%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RrightFrontDoor = 1 where LINE_DESC like '%FRONT%DOOR%RT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RrightFrontDoor = 1 where LINE_DESC like '%R%REAR%LWR%HINGE%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RrightFrontDoor = 1 where LINE_DESC like '%DOOR%FRONT%RT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RrightFrontDoor = 1 where LINE_DESC like '%FRT%DOOR%RT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RrightFrontDoor = 1 where LINE_DESC like '%MIRROR%RT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RrightFrontDoor = 1 where LINE_DESC like '%R%FRT%BELT%'", 
                    "select * from data_table"))

#34, LeftFrontDoor
data_table<-sqldf(c("update data_table set LeftFrontDoor = 1 where LINE_DESC like '%L%FRONT%DOOR%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftFrontDoor = 1 where LINE_DESC like '%L%FRT%REAR%VIEW%MIRROR%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftFrontDoor = 1 where LINE_DESC like '%L%FRT%HINGE%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftFrontDoor = 1 where LINE_DESC like '%L%FRT%WIND%DEFLECTOR%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftFrontDoor = 1 where LINE_DESC like '%L%FRT%DOOR%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftFrontDoor = 1 where LINE_DESC like '%L%FRT%MIRROR%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftFrontDoor = 1 where LINE_DESC like '%FRONT%DOOR%LT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftFrontDoor = 1 where LINE_DESC like '%DOOR%FRONT%LT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftFrontDoor = 1 where LINE_DESC like '%LT%MIRROR%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftFrontDoor = 1 where LINE_DESC like '%L%FRT%BELT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftFrontDoor = 1 where LINE_DESC like '%MIRROR%LT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftFrontDoor = 1 where LINE_DESC like '%L%FRT%OTR%HANDLE%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftFrontDoor = 1 where LINE_DESC like '%FRT%DOOR%HANDLE%LT%'", 
                    "select * from data_table"))


#35, LicenseLamp
#data_table<-sqldf(c("update data_table set LicenseLamp = 1 where LINE_DESC like '%LICENSE%LAMP%'", 
#                    "select * from data_table"))

#data_table<-sqldf(c("update data_table set LicenseLamp = 1 where LINE_DESC like '%LAMP%LICENSE%LT%'", 
#                    "select * from data_table"))


#36, LeftAirBag
data_table<-sqldf(c("update data_table set LeftAirBag = 1 where LINE_DESC like '%AIR%BAG%MODULE-DRIVER%FRONT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftAirBag = 1 where LINE_DESC like '%L%AIR%BAG%SIDE%IMPACT%SENSOR%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftAirBag = 1 where LINE_DESC like '%AIRBAG SENSOR,FRONT%LT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftAirBag = 1 where LINE_DESC like '%L%FRT%AIR%BAG%'", 
                    "select * from data_table"))

#38, LeftFrontSeat
data_table<-sqldf(c("update data_table set LeftFrontSeat = 1 where LINE_DESC like '%L%FRT%SEAT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftFrontSeat = 1 where LINE_DESC like '%L%FRT%SEAT%BELT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftFrontSeat = 1 where LINE_DESC like '%SEATBELT,FRONT%LT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftFrontSeat = 1 where LINE_DESC like '%L%AIR%BAG%SIDE%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftFrontSeat = 1 where LINE_DESC like '%UPR%STEERING%COLUMN%COVER%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftFrontSeat = 1 where LINE_DESC like '%STEERING%WIPER%SWITCH%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftFrontSeat = 1 where LINE_DESC like '%STEERING%WHEEL%'", 
                    "select * from data_table"))

#39, RightFrontSeat
data_table<-sqldf(c("update data_table set RightFrontSeat = 1 where LINE_DESC like '%RT%FLOOR%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightFrontSeat = 1 where LINE_DESC like '%FRT%SEATBELT%RT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightFrontSeat = 1 where LINE_DESC like '%R%FRT%SEAT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightFrontSeat = 1 where LINE_DESC like '%SEATBELT,FRONT%RT%'", 
                    "select * from data_table"))

#40, LeftRearSeat
data_table<-sqldf(c("update data_table set LeftRearSeat = 1 where LINE_DESC like '%L%REAR%BODY%FLOOR%PAN%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftRearSeat = 1 where LINE_DESC like '%L%REAR%BELT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftRearSeat = 1 where LINE_DESC like '%L%REAR%SEAT%'", 
                    "select * from data_table"))

#41, RightRearDoor
data_table<-sqldf(c("update data_table set RightRearDoor = 1 where LINE_DESC like '%R%REAR%DOOR%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightRearDoor = 1 where LINE_DESC like '%DOOR%REAR%RT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightRearDoor = 1 where LINE_DESC like '%RR%DOOR%RT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightRearDoor = 1 where LINE_DESC like '%R%REAR%BELT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightRearDoor = 1 where LINE_DESC like '%RR%DOOR%OUTER%RT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightRearDoor = 1 where LINE_DESC like '%REAR%DOOR%RT%'", 
                    "select * from data_table"))

#42, LeftRearDoor
data_table<-sqldf(c("update data_table set LeftRearDoor = 1 where LINE_DESC like '%L%REAR%DOOR%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftRearDoor = 1 where LINE_DESC like '%REAR%DOOR%LT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftRearDoor = 1 where LINE_DESC like '%DOOR%REAR%LT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftRearDoor = 1 where LINE_DESC like '%L%QUARTER%GLASS%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftRearDoor = 1 where LINE_DESC like '%LFT%QTR%GLASS%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftRearDoor = 1 where LINE_DESC like '%RR%DOOR%LT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftRearDoor = 1 where LINE_DESC like '%BACK%DOOR%LT%'", 
                    "select * from data_table"))

#43, RightQuarter
data_table<-sqldf(c("update data_table set RightQuarter = 1 where LINE_DESC like '%R%QUARTER%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightQuarter = 1 where LINE_DESC like '%QUARTERPANEL%RT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightQuarter = 1 where LINE_DESC like '%QUARTER%RT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightQuarter = 1 where LINE_DESC like '%REAR%VENT%GLASS%R%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightQuarter = 1 where LINE_DESC like '%R%QTR%GLASS%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightQuarter = 1 where LINE_DESC like '%QTR%RT%'", 
                    "select * from data_table"))


#44, LeftQuarter
data_table<-sqldf(c("update data_table set LeftQuarter = 1 where LINE_DESC like '%L%QUARTER%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftQuarter = 1 where LINE_DESC like '%LT%QUARTER%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftQuarter = 1 where LINE_DESC like '%QTR%LT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftQuarter = 1 where LINE_DESC like '%QUARTER%LT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftQuarter = 1 where LINE_DESC like '%LT%QTR%'", 
                    "select * from data_table"))

#45, LeftFuelDoor
#data_table<-sqldf(c("update data_table set LeftFuelDoor = 1 where LINE_DESC like '%L%FUEL%DOOR%'", 
#                    "select * from data_table"))

#data_table<-sqldf(c("update data_table set LeftFuelDoor = 1 where LINE_DESC like '%FUEL%FILLER%LT%'", 
#                    "select * from data_table"))

#data_table<-sqldf(c("update data_table set LeftFuelDoor = 1 where LINE_DESC like '%FUEL%DOOR%'", 
#                    "select * from data_table"))

#46, FuelSystem
#data_table<-sqldf(c("update data_table set FuelSystem = 1 where LINE_DESC like '%FUEL%SYSTEM%'", 
#                    "select * from data_table"))

#47, RightRearwheel
data_table<-sqldf(c("update data_table set RightRearwheel = 1 where LINE_DESC like '%RIGHT%REAR%TIRE%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightRearwheel = 1 where LINE_DESC like '%RR%TIRE%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightRearwheel = 1 where LINE_DESC like '%WHEEL%REAR%RT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightRearwheel = 1 where LINE_DESC like '%REAR%WHEEL%RT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightRearwheel = 1 where LINE_DESC like '%R%REAR%WHEELHOUSE%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightRearwheel = 1 where LINE_DESC like '%TIRE%RR%'", 
                    "select * from data_table"))

#48, LeftRearwheel
data_table<-sqldf(c("update data_table set LeftRearwheel = 1 where LINE_DESC like '%LEFT%REAR%WHEEL%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftRearwheel = 1 where LINE_DESC like '%LR%TIRE%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftRearwheel = 1 where LINE_DESC like '%REAR%RAILROAD%WHEELS%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftRearwheel = 1 where LINE_DESC like '%TIRE%LR%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftRearwheel = 1 where LINE_DESC like '%L%REAR%WHEEL%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftRearwheel = 1 where LINE_DESC like '%LT%REAR%WHEEL%'", 
                    "select * from data_table"))

#49, RearGlass
data_table<-sqldf(c("update data_table set RearGlass = 1 where LINE_DESC like '%LIFTGATE%GLASS%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RearGlass = 1 where LINE_DESC like '%BACK%GLASS%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RearGlass = 1 where LINE_DESC like '%BACK%WINDOW%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RearGlass = 1 where LINE_DESC like '%REAR%GLASS%'", 
                    "select * from data_table"))

#50, Trunk
data_table<-sqldf(c("update data_table set Trunk = 1 where LINE_DESC like '%LUGGAGE%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set Trunk = 1 where LINE_DESC like '%DECK%LID%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set Trunk = 1 where LINE_DESC like '%TRUNK%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set Trunk = 1 where LINE_DESC like '%LID,REAR%DECK%'", 
                    "select * from data_table"))

#51, RearGate
data_table<-sqldf(c("update data_table set RearGate = 1 where LINE_DESC like '%REAR%GATE%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RearGate = 1 where LINE_DESC like '%LIFTGATE%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RearGate = 1 where LINE_DESC like '%TAILGATE%'", 
                    "select * from data_table"))

#52, LeftTailLamp
data_table<-sqldf(c("update data_table set LeftTailLamp = 1 where LINE_DESC like '%TAILLAMP%LT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftTailLamp = 1 where LINE_DESC like '%REAR%LAMPS%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftTailLamp = 1 where LINE_DESC like '%L%REAR%COMBINATION%LAMP%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftTailLamp = 1 where LINE_DESC like '%LT%TAIL%LAMP%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftTailLamp = 1 where LINE_DESC like '%TAIL%LAMPS%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftTailLamp = 1 where LINE_DESC like '%PARKLAMP%LT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftTailLamp = 1 where LINE_DESC like '%L%PARK%LAMP%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftTailLamp = 1 where LINE_DESC like '%L%TAIL%LAMP%'", 
                    "select * from data_table"))

#53, RightTailLamp
data_table<-sqldf(c("update data_table set RightTailLamp = 1 where LINE_DESC like '%TAILLAMP%RT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightTailLamp = 1 where LINE_DESC like '%REAR%LAMPS%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightTailLamp = 1 where LINE_DESC like '%R%REAR%COMBINATION%LAMP%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftTailLamp = 1 where LINE_DESC like '%RT%TAIL%LAMP%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftTailLamp = 1 where LINE_DESC like '%TAIL%LAMPS%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftTailLamp = 1 where LINE_DESC like '%PARKLAMP%RT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftTailLamp = 1 where LINE_DESC like '%R%TAIL%LAMP%'", 
                    "select * from data_table"))

#54, RightTailPipe
data_table<-sqldf(c("update data_table set RightTailPipe = 1 where LINE_DESC like '%R%EXHAUST%TAILPIPE%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightTailPipe = 1 where LINE_DESC like '%PIPE,EXHAUST%RT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightTailPipe = 1 where LINE_DESC like '%R%REAR%EXHAUST%'", 
                    "select * from data_table"))

#55, RearBumper
data_table<-sqldf(c("update data_table set RearBumper = 1 where LINE_DESC like '%REAR%BUMPER%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RearBumper = 1 where LINE_DESC like '%BUMPER%REAR%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RearBumper = 1 where LINE_DESC like '%RR%BUMPER%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RearBumper = 1 where LINE_DESC like '%BUMPER,REAR%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RearBumper = 1 where LINE_DESC like '%RR%BMPR%'", 
                    "select * from data_table"))

#56, Grille
data_table<-sqldf(c("update data_table set Grille = 1 where LINE_DESC like '%GRILLE%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set Grille = 1 where LINE_DESC like '%GRILL%'", 
                    "select * from data_table"))

#57, RightFuelDoor
#data_table<-sqldf(c("update data_table set RightFuelDoor = 1 where LINE_DESC like '%FUEL%FILLER %RT%'", 
#                    "select * from data_table"))

#data_table<-sqldf(c("update data_table set RightFuelDoor = 1 where LINE_DESC like '%FUEL%DOOR%'", 
#                    "select * from data_table"))

#58, RightAirBag
data_table<-sqldf(c("update data_table set RightAirBag = 1 where LINE_DESC like '%AIR BAG MODULE-PASSENGER FRONT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightAirBag = 1 where LINE_DESC like '%AIRBAG%SENSOR,FRONT%RT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightAirBag = 1 where LINE_DESC like '%R%FRT%AIR%BAG%'", 
                    "select * from data_table"))

#59, Fan
data_table<-sqldf(c("update data_table set Fan = 1 where LINE_DESC like '%FAN%'", 
                    "select * from data_table"))

#60, RightRearSeat
data_table<-sqldf(c("update data_table set RightRearSeat = 1 where LINE_DESC like '%BUCKLE,RR%SEATBELT%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RightRearSeat = 1 where LINE_DESC like '%R%REAR%SEAT%'", 
                    "select * from data_table"))

#61, LeftTailPipe
data_table<-sqldf(c("update data_table set LeftTailPipe = 1 where LINE_DESC like '%L%EXHAUST%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set LeftTailPipe = 1 where LINE_DESC like '%L%REAR%EXHAUST%'", 
                    "select * from data_table"))


#62, RearSill
data_table<-sqldf(c("update data_table set RearSill = 1 where LINE_DESC like '%REAR%SILL%'", 
                    "select * from data_table"))

#63, FuelTank
data_table<-sqldf(c("update data_table set FuelTank = 1 where LINE_DESC like '%FUEL%TANK%'", 
                    "select * from data_table"))

#64, LeftRearBodySide
#data_table<-sqldf(c("update data_table set LeftRearBodySide = 1 where LINE_DESC like '%L%REAR%BODY%SIDE%'", 
#                    "select * from data_table"))

#65, RightRearBodySide
#data_table<-sqldf(c("update data_table set RightRearBodySide = 1 where LINE_DESC like '%R%REAR%BODY%SIDE%'", 
#                    "select * from data_table"))

#data_table<-sqldf(c("update data_table set RightRearBodySide = 1 where LINE_DESC like '%BODYSIDE%REAR%RT%'", 
#                    "select * from data_table"))

#66, RearBody
data_table<-sqldf(c("update data_table set RearBody = 1 where LINE_DESC like '%REAR%BODY%PANEL%'", 
                    "select * from data_table"))

data_table<-sqldf(c("update data_table set RearBody = 1 where LINE_DESC like '%PANEL,REAR%BODY%'", 
                    "select * from data_table"))

#save to csv file
write.csv(data_table, file='new_sep_15.csv', row.names = FALSE)




#convert the data into final format

#step one(can jump to step two directly)

unique_folders<-sqldf("select distinct b1.DL_CLM_FOLDER_ID from data_table b1, data_table b2 where b1.DL_CLM_FOLDER_ID=b2.DL_CLM_FOLDER_ID and b1.LeftFrontFogLamp!=b2.LeftFrontFogLamp")

#step two(insert colum names as variable)
col_num<-NCOL(data_table)

for (i in 6:col_num)
{
  #fetch a colum name
  col_name<-colnames(data_table)[i]
  
  #use sprintf() to wrap the sql statement
  sql<-sprintf("update data_table set %s = 1 where DL_CLM_FOLDER_ID in (select distinct b1.DL_CLM_FOLDER_ID from data_table b1, data_table b2 where b1.DL_CLM_FOLDER_ID=b2.DL_CLM_FOLDER_ID and b1.%s!=b2.%s)", col_name, col_name, col_name)
  
  data_table<-sqldf(c(sql, "select * from data_table"))

}

#extract only the necessary columns and return distinct rows
data_table_final<-data_table[, c(1,6:col_num)]

data_table_final<-sqldf("select distinct * from data_table_final")

new_col_num<-NCOL(data_table_final)
data_table_final<-data_table_final[, c(2:new_col_num)]

#save to csv file
write.csv(data_table_final, file='final_sep_15.csv', row.names = FALSE)

#reduced version
data_table_reduce<-data_table_final[, c(1:15)]

write.csv(data_table_reduce, file='reduce_sep_15.csv', row.names = FALSE)




