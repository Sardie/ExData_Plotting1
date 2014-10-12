plot1 <- function() {
        data <- read.table("household_power_consumption.txt", sep=";")
        data <- data[2:nrow(data),]
        labels <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
        names(data) <- labels
        data$Date <- as.character(data$Date)
        data <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
        data$Global_active_power <- as.character(data$Global_active_power)
        data$Global_active_power <- as.numeric(data$Global_active_power)
        hist(data$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
        
        dev.copy(png, file = "plot1.png")
        
        dev.off()
        
}