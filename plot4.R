plot4 <- function() {
        data <- read.table("household_power_consumption.txt", sep=";")
        data <- data[2:nrow(data),]
        
        data <- data[(data$V1 == "1/2/2007" | data$V1 == "2/2/2007"),]
        
        data$V1 <- as.character(data$V1)
        
        data$V1 <- as.Date(data$V1, "%d/%m/%Y")
        
        data$V2 <- as.character(data$V2)
        
        data[,10] <- paste(data$V1, data$V2, sep=" ")
        
        labels <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3", "Date_Time")
        names(data) <- labels
        
        
        data$Sub_metering_1 <- as.character(data$Sub_metering_1)
        data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
        data$Sub_metering_2 <- as.character(data$Sub_metering_2)
        data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
        data$Sub_metering_3 <- as.character(data$Sub_metering_3)
        data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
        
        data$Global_active_power <- as.character(data$Global_active_power)
        data$Global_active_power <- as.numeric(data$Global_active_power)
        
        data$Global_reactive_power <- as.character(data$Global_reactive_power)
        data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
        
        data$Voltage <- as.character(data$Voltage)
        data$Voltage <- as.numeric(data$Voltage)
        
        data$Date_Time <- as.POSIXct(strftime(data$Date_Time, "%Y/%m/%d %H:%M:%S"), format="%Y/%m/%d %H:%M:%S")
        
        par(new=F, mfrow = c(2,2), bg="white")
        
        plot(data$Date_Time, data$Global_active_power, col="black", ylab = "Global Active Power (kilowatts)", pch = ".", xlab = " ", bg="white")
        lines(data$Date_Time, data$Global_active_power, col="black", lwd = 2)
        
        plot(data$Date_Time, data$Voltage, col="black", ylab = "Voltage", pch = ".", xlab = "datetime", bg="white")
        lines(data$Date_Time, data$Voltage, col="black", lwd = 1)
        
        
        plot(data$Date_Time, data$Sub_metering_1, col="black", ylim=c(0,40), ylab = "Energy sub metering", pch = ".", xlab = " ", bg="white")
        lines(data$Date_Time, data$Sub_metering_1, col="black", lwd = 1)
        par(new=T)
        plot(data$Date_Time, data$Sub_metering_2, col="red", ylim=c(0,40), ylab = "Energy sub metering", pch = ".", xlab = " ", bg="white")
        lines(data$Date_Time, data$Sub_metering_2, col="red", lwd = 1)
        par(new=T)
        plot(data$Date_Time, data$Sub_metering_3, col="blue", ylim=c(0,40), ylab = "Energy sub metering", pch = ".", xlab = " ", bg="white")
        lines(data$Date_Time, data$Sub_metering_3, col="blue", lwd = 1)
        
        legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
        
        par(new=F)
        
        plot(data$Date_Time, data$Global_reactive_power, col="black", ylab = "Global_reactive_power", pch = ".", xlab = "datetime", bg="white")
        lines(data$Date_Time, data$Global_reactive_power, col="black", lwd = 1)
        
        par(bg="white")
        
        dev.copy(png, file = "plot4.png")
        dev.off()
        
        
        
}
