plot2 <- function() {
        data <- read.table("household_power_consumption.txt", sep=";")
        data <- data[2:nrow(data),]
        
        data <- data[(data$V1 == "1/2/2007" | data$V1 == "2/2/2007"),]
        
        data$V1 <- as.character(data$V1)
        
        data$V1 <- as.Date(data$V1, "%d/%m/%Y")
        
        data$V2 <- as.character(data$V2)
        
        data[,10] <- paste(data$V1, data$V2, sep=" ")
        
        labels <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3", "Date_Time")
        names(data) <- labels
        
        
        data$Global_active_power <- as.character(data$Global_active_power)
        data$Global_active_power <- as.numeric(data$Global_active_power)
        
        data$Date_Time <- as.POSIXct(strftime(data$Date_Time, "%Y/%m/%d %H:%M:%S"), format="%Y/%m/%d %H:%M:%S")
        
        plot(data$Date_Time, data$Global_active_power, col="black", ylab = "Global Active Power (kilowatts)", pch = ".", xlab = " ")
        lines(data$Date_Time, data$Global_active_power, col="black", lwd = 2)
        
        dev.copy(png, file = "plot2.png")
        dev.off()
        

        
}