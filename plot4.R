##Plot 4
#Loading downloaded data and transform date and time
df <- read.table("household_power_consumption.txt", header = T, sep = ";", as.is = T)
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df <- transform(df, datetime = as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
library(dplyr)
dat <- filter(df, (Date == "2007-02-01") | (Date == "2007-02-02"))

#Converting to numeric variables
dat$Global_active_power <- as.numeric(dat$Global_active_power)
dat$Global_reactive_power <- as.numeric(dat$Global_reactive_power)
dat$Voltage <- as.numeric(dat$Voltage)
dat$Global_active_power <- as.numeric(dat$Global_active_power)
dat$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
dat$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
dat$Sub_metering_3 <- as.numeric(df$Sub_metering_3)

#Plotting
par(mfrow = c(2,2), mar = c(4,4,2,1))
with(dat, {
  plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  plot(datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "") 
  lines(datetime, Sub_metering_2, type = "l", col = "red")
  lines(datetime, Sub_metering_3, type = "l", col = "blue")
  legend("topright", lty = 1, bty = "n", cex = 0.5, col = c("black", "red", "blue"),
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(datetime, Global_reactive_power, type = "l", xlab = "datetime")
})
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
