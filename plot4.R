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
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

#for the 2X2 graphs
par(mfrow=c(2,2))
#plotting the first graph
plot(data$DateTime, data$Global_active_power, type="l", xlab=" ", ylab="Global Activ Power")

#plotting the second graph
plot(data$DateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")


#plotting the third graph
plot(data$DateTime, data$Sub_metering_1, type="l", xlab=" ", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
#specifying the legend
legend("topright", box.lty= 0, lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plotting the last graph
plot(data$DateTime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")


dev.copy(png, file = "plot4.png") ## Copy my plot to a PNG file
dev.off() 

