require(sqldf)
file <- c("./data/household_power_consumption.txt")
subset <- read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )

Sys.setlocale("LC_TIME","English")

png(file="plot2.png")

plot(
     as.POSIXct(paste(subset$Date,subset$Time), format = "%d/%m/%Y %H:%M:%S"),
     subset$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)"
)

dev.off()
