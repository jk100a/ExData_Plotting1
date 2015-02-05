# read in the whole data table
data_whole <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = F)

# convert the dates
data_whole$Date <- as.Date(data_whole$Date, format = "%d/%m/%Y")

# subset the data table
data <- subset(data_whole, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# convert the weekdays
datentime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(datentime)

# create plot2
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#save to PNG file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()