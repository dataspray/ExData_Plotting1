library(lubridate)
library(dplyr)

t <- tbl_df(read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?"))
t <- mutate(t, DateTime = dmy(Date) + hms(Time))  # Add a datetime column combining the seperate date and time columns
d <- filter(t, DateTime >= ymd("2007-02-01"), DateTime < ymd("2007-02-03"))

plot(d$DateTime, d$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
points(d$DateTime, d$Sub_metering_2, type="l", col = "red")
points(d$DateTime, d$Sub_metering_3, type="l", col = "blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1, lwd=2)
       
dev.copy(png,"plot3.png")
dev.off()
