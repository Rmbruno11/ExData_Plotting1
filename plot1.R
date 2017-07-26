
plot1 <- function() {
        
        # Reading Data from file
        data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
        
        # Subsetting Data
        date_from <- as.Date("2007-02-01")
        date_to <- as.Date("2007-02-02") 
        data <- data[as.Date(data$Date, format="%d/%m/%Y")>=date_from & as.Date(data$Date, format="%d/%m/%Y")<=date_to,]
        
        # Open PNG device
        png(file="plot1.png", width = 480, height = 480)
        # Create plot
        hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", main ="Global Active Power", col = "red")
        # close device / save file
        dev.off()
        print("plot1.png saved in work directory")
}