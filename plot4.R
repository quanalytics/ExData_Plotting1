data <- read.table("household_power_consumption.txt", na.strings = "?", sep = ";", header = TRUE)
data[,1] <- as.Date(data[,1],"%d/%m/%Y")
start <- as.Date("2007-02-01")
end <- as.Date("2007-02-02")

dates <- data$Date
times <- data$Time
date_time <-paste(dates, times, sep = " ")
data$timeline <- strptime(date_time,"%Y-%m-%d %H:%M:%S")

data_sub <- subset(data, Date >= start & Date <= end)

png(filename = "plot4.png", width = 480, height = 480, units = "px")

par(mfrow = c(2,2))

plot(data_sub$timeline, as.numeric(data_sub$Global_active_power), xlab = " ", ylab = "Global Active Power", type = "l")

plot(data_sub$timeline, data_sub$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

plot(data_sub$timeline, data_sub$Sub_metering_1, ylab = "Energy sub metering", xlab = " ", type = "l")
lines(data_sub$timeline, data_sub$Sub_metering_2, type = "l", col = "red")
lines(data_sub$timeline, data_sub$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")

plot(data_sub$timeline, data_sub$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

dev.off()