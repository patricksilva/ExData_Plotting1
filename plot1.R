require(sqldf)
file <- c("./data/household_power_consumption.txt")
subset <- read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )

png(file="plot1.png", width = 480, height = 480, units = "px", type="cairo-png", bg = "transparent")

hist(subset$Global_active_power, 
     col = "red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)"
)

dev.off()
