
##Plot 3
##Loading downloaded data and transform date and time
df <- read.table("household_power_consumption.txt", header = T, sep = ";", as.is = T)
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df <- transform(df, datetime = as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
library(dplyr)
dat <- filter(df, (Date == "2007-02-01") | (Date == "2007-02-02"))

#Converting to numeric variables
dat$Sub_metering_1 <- as.numeric(dat$Sub_metering_1)
dat$Sub_metering_2 <- as.numeric(dat$Sub_metering_2)
dat$Sub_metering_3 <- as.numeric(dat$Sub_metering_3)

#Plotting
with(dat, {
  plot(datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "") 
  lines(datetime, Sub_metering_2, type = "l", col = "red")
  lines(datetime, Sub_metering_3, type = "l", col = "blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"),
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.75)
})
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
