data <- read.csv("./household_power_consumption.txt", sep=";")
data$Date <- as.character(data$Date)
#subsetting the data to the dates which we want
data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]


library(lubridate)
data$Time <- as.character(data$Time)
#converting the date and time to the proper format so axis can be reflected as the day
data$DateTime <- dmy_hms(paste(data$Date, data$Time, sep="/"))

#when we read the data in, all the tables are in factors instead of the appropriate class
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

plot(data$DateTime, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=" ")

dev.copy(png, file = "plot2.png") ## Copy my plot to a PNG file
dev.off() 