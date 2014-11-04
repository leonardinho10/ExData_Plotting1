data <- read.csv("./household_power_consumption.txt", sep=";")
data$Date <- as.character(data$Date)
#subsetting the data to the dates which we want
data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

#when we read the data in, all the tables are in factors instead of the appropriate class
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
#plotting of the histogram
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file
dev.off() 