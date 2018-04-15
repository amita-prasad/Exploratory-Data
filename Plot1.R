Getting full dataset 
2 data_full <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?",  
                        3                       nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"') 
4 data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y") 
5 

6 ## Subsetting the data 
7 data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 
8 rm(data_full) 
9 

10 ## Converting dates 
11 datetime <- paste(as.Date(data$Date), data$Time) 
12 data$Datetime <- as.POSIXct(datetime) 
13 

14 ## Plot 1 
15 hist(data$Global_active_power, main="Global Active Power",  
        16      xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red") 
17 

18 ## Saving to file 
19 dev.copy(png, file="plot1.png", height=480, width=480) 
20 dev.off() 
