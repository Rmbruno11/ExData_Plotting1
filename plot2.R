
plot2 <- function() {
        
        # Reading Data from file
        library(data.table)
        data <- fread("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
        
        # Subsetting Data
        date_from <- as.Date("2007-02-01")
        date_to <- as.Date("2007-02-02") 
        data <- data[as.Date(data$Date, format="%d/%m/%Y")>=date_from & as.Date(data$Date, format="%d/%m/%Y")<=date_to,]
        data <- data[, date_time:= strptime(paste(Date,Time, sep =" "), format="%d/%m/%Y %H:%M:%OS")]
        data <- data[,list(Date,Time,Global_active_power,date_time)]
        
        # Open PNG device
        png(file="plot2.png", width = 480, height = 480)
        # Create plot
        plot(data$date_time, data$Global_active_power, type="l", xlab="", ylab = "Global Active Power (kilowatts)")
        # close device / save file
        dev.off()
        print("plot2.png saved in work directory")
}

## Sys.setlocale("LC_TIME", "C") ## This fixed "spanish day names" problem