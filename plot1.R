
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
# Plot 1
# ============================================================================= #

png("plot1.png", width = 480, height = 480)
hist(house$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "Red")
dev.off()








