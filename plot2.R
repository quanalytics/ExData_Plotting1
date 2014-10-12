data <- read.csv2("household_power_consumption.txt")
data[,1] <- as.Date(data[,1],"%d/%m/%Y")
start <- as.Date("2007-02-01")
end <- as.Date("2007-02-02")
data_sub <- subset(data, Date >= start & Date <= end)

dates <- data_sub$Date
times <- data_sub$Time
date_time <-paste(dates, times)
timeline <- strptime(date_time,"%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(timeline, as.numeric(data_sub$Global_active_power), ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()