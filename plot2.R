library(lubridate)
library(dplyr)

t <- tbl_df(read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?"))
t <- mutate(t, DateTime = dmy(Date) + hms(Time))  # Add a datetime column combining the seperate date and time columns
d <- filter(t, DateTime >= ymd("2007-02-01"), DateTime < ymd("2007-02-03"))

plot(d$DateTime, d$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png,"plot2.png")
dev.off()
