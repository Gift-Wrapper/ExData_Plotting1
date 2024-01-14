##Load data frame

library("dplyr")
Exdata <- read.delim("household_power_consumption.txt", sep = ";", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                                                                                 "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
                                                                                 "Sub_metering_3"))

Exdata <- Exdata %>% mutate_at(c('Global_active_power', 'Global_reactive_power', 'Voltage', 'Global_intensity', 'Sub_metering_1',
                                 'Sub_metering_2'), as.numeric)


##Limit data frame to 2-1 and 2-2

Exdatatrim <- Exdata %>%
  filter(Date == "1/2/2007" | Date == "2/2/2007")

##Changing Dates from 'Character' to 'Date'

Exdatatrim$Date <- as.Date(Exdatatrim$Date, format = "%d/%m/%y")

##Putting Sub_metering values into Time Series

Sub1 <- ts(Exdatatrim$Sub_metering_1, frequency = 60)
Sub2 <- ts(Exdatatrim$Sub_metering_2, frequency = 60)
Sub3 <- ts(Exdatatrim$Sub_metering_3, frequency = 60)

##Making PNG and plotting graph

png(filename = "D:/argor/Documents/EXData_Plotting1/plot3.png", bg = "white")

plot.ts(Sub1, xlab = "Time (Hours)", ylab = "Energy sub metering", col = "black")
lines(Sub2, col = "red")
lines(Sub3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))

dev.off()