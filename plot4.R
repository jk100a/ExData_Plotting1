# read in the whole data table
data_whole <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = F)

# convert the dates
data_whole$Date <- as.Date(data_whole$Date, format = "%d/%m/%Y")

# subset the data table
data <- subset(data_whole, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# convert the weekdays
datentime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(datentime)

# create plot4
par(mfrow = c(2, 2))
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Engery Sub Metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Reactive Power")

#save to PNG file
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()