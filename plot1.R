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

##PNG making and Plotting

png(filename = "D:/argor/Documents/EXData_Plotting1/plot1.png", bg = "white")

GAP <- Exdatatrim$Global_active_power

plot1 <- hist(GAP, main = "Global Active Power", xlab = "Global Active Power (Kilowatts)",
     col = "#FF2D00")

dev.off()
