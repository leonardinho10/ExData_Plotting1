data <- read.csv("./household_power_consumption.txt", sep=";")
data$Date <- as.character(data$Date)
#subsetting the data to the dates which we want
data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]


library(lubridate)
data$Time <- as.character(data$Time)
#converting the date and time to the proper format so axis can be reflected as the day
data$DateTime <- dmy_hms(paste(data$Date, data$Time, sep="/"))

#when we read the data in, all the tables are in factors instead of the appropriate class
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

#plotting the three lines
plot(data$DateTime, data$Sub_metering_1, type="l", xlab=" ", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
#specifying the legend
legend("topright",lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png") ## Copy my plot to a PNG file
dev.off() 
