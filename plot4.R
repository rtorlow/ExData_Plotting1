
# ============================================================================= #
# load packages
# ============================================================================= #

require("data.table")
require("lubridate")
require("dplyr")

# ============================================================================= #
# load data
# ============================================================================= #

house <- fread("household_power_consumption.txt", 
               na.strings="?")[Date %in% c("1/2/2007","2/2/2007") , ]
# format date
house$Date <- dmy_hms(paste(house$Date, house$Time, sep="_"))
house$Time <- NULL

# ============================================================================= #
# Plot 4
# ============================================================================= #

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

# plot 1 of 4
plot(house$Date, house$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

# plot 2 of 4
plot(house$Date, house$Voltage, 
     xlab = "datetime",
     ylab = "Voltage",
     type = "l")

# plot 3 of 4
plot(house$Date, house$Sub_metering_1, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
lines(house$Date, house$Sub_metering_2, 
      col = "Red")
lines(house$Date, house$Sub_metering_3, 
      col = "Blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1,
       col=c("Black", "Red", "Blue"))

# plot 4 of 4
plot(house$Date, house$Global_reactive_power, 
     xlab = "datetime",
     ylab = "Global_reactive_power",
     type = "l")

dev.off()









