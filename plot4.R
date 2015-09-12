library(lubridate)
library(dplyr)
t <- tbl_df(read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")) 
t <- mutate(t, DateTime = dmy(Date) + hms(Time))  # Add a datetime column combining the seperate date and time columns
d <- filter(t, DateTime >= ymd("2007-02-01"), DateTime < ymd("2007-02-03"))

par(mfrow=c(2, 2), oma=c(0,0,0,0) + 0.1, mar = c(5,5,0,0) + 0.1) # 2 rows, 2 columns. Tight margins

# top left plot
plot(d$DateTime, d$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# top right plot
plot(d$DateTime, d$Voltage, type="l", ylab="Voltage", xlab="datetime")

# bottom left plot
plot(d$DateTime, d$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
points(d$DateTime, d$Sub_metering_2, type="l", col = "red")
points(d$DateTime, d$Sub_metering_3, type="l", col = "blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),
        lty=1,lwd=2,pt.cex=0.75,cex=0.75,bty = "n")

# bottom right plot
plot(d$DateTime, d$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

dev.copy(png,"plot4.png")
dev.off()
