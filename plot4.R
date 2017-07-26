
plot4 <- function() {
        
        # Reading Data from file
        library(data.table)
        data <- fread("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
        
        # Subsetting Data
        date_from <- as.Date("2007-02-01")
        date_to <- as.Date("2007-02-02") 
        data <- data[as.Date(data$Date, format="%d/%m/%Y")>=date_from & as.Date(data$Date, format="%d/%m/%Y")<=date_to,]
        data <- data[, date_time:= strptime(paste(Date,Time, sep =" "), format="%d/%m/%Y %H:%M:%OS")]
       
        # Open PNG device
        png(file="plot4.png", width = 480, height = 480)
        # Create plots
        # Set rows y cols
        par(mfrow = c(2,2))
        
        #Plot 1
        plot(data$date_time, data$Global_active_power, type="l", xlab="", ylab = "Global Active Power")
        
        #Plot 2
        plot(data$date_time, data$Voltage, type="l", xlab="datetime", ylab = "Voltage")
        
        #Plot 3
        plot(data$date_time, data$Sub_metering_1, type="n", xlab= "", ylab ="Energy sub metering")
        lines(data$date_time, data$Sub_metering_1)
        lines(data$date_time, data$Sub_metering_2, col="red")
        lines(data$date_time, data$Sub_metering_3, col="blue")
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), col=c("black","red","blue"))
        
        #Plot 4
        plot(data$date_time, data$Global_reactive_power, type="l", xlab="datetime")
        
        
        # close device / save file
        dev.off()
        print("plot4.png saved in work directory")
}