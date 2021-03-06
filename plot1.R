
##Plot 1
#Loading downloaded data and transform date and time
df <- read.table("household_power_consumption.txt", header = T, sep = ";", as.is = T)
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df <- transform(df, datetime = as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
library(dplyr)
dat <- filter(df, (Date == "2007-02-01") | (Date == "2007-02-02"))

#Converting to numeric variables
dat$Global_active_power <- as.numeric(dat$Global_active_power)

#Plotting
hist(dat$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", main = ("Global Active Power"))
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()


