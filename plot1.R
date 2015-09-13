library(lubridate, dplyr)

t <- tbl_df(read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?"))
t <- mutate(t, DateTime = dmy(Date) + hms(Time))  # Add a datetime column combining the seperate date and time columns
d <- filter(t, DateTime >= ymd("2007-02-01"), DateTime < ymd("2007-02-03"))

hist(d$Global_active_power,right=FALSE,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",xaxt="n")
axis(1, at=seq(0,5,by=2))  # add x labels
dev.copy(png,"plot1.png")
dev.off()
