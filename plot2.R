plot2 <- function() {
        data <- read.table("household_power_consumption.txt", sep=";")
        data2 <- data[2:nrow(data),]
        labels <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "sub_metering_2", "sub_metering_3")
        names(data2) <- labels
        data2$Date <- as.character(data2$Date)
        data2 <- data2[(data2$Date == "1/2/2007" | data2$Date == "2/2/2007"),]
        data2$Global_active_power <- as.character(data2$Global_active_power)
        data2$Global_active_power <- as.numeric(data2$Global_active_power)
        
        data2$Date <- as.Date(data2$Date, "%d/%m/%Y")
        
        data2$Time <- as.character(data2$Time)
        
        data2[,10] <- paste(data2$Date, data2$Time, sep=" ")
        
        
        labels <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "sub_metering_2", "sub_metering_3", "Date_Time")
        names(data2) <- labels
        
        data2$Date_Time <- as.POSIXct(strftime(data2$Date_Time, "%Y-%m-%d %H:%M:%S"), format="%Y-%m-%d %H:%M:%S")
        
        plot(data2$Date_Time, data2$Global_active_power, col="black", ylab = "Global Active Power (kilowatts)", pch = ".", xlab = " ")
        lines(data2$Date_Time, data2$Global_active_power, col="black", ylab = "Global Active Power (kilowatts)", xlab = " ", pch = ".", lwd = 2)
              
        
        dev.copy(png, file = "plot2.png")
        dev.off()
        
        ##strftime(data2$Date, "%a")
        
        ##strftime(c, "%a %H:%M:%S")
        
}