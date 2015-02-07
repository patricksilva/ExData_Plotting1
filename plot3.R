require(sqldf)
file <- c("./data/household_power_consumption.txt")
subset <- read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )

Sys.setlocale("LC_TIME","English")

png(file="plot3.png")

plot(
     as.POSIXct(paste(subset$Date,subset$Time), format = "%d/%m/%Y %H:%M:%S"),
     subset[ , 7],
     type="l",
     xlab="",
     ylab="Energy sub metering"
)
lines(as.POSIXct(paste(subset$Date,subset$Time), format = "%d/%m/%Y %H:%M:%S"),
      subset[ , 8],
      type="l",
      xlab="",
      ylab="",
      col="red"
)
lines(as.POSIXct(paste(subset$Date,subset$Time), format = "%d/%m/%Y %H:%M:%S"),
      subset[ , 9],
      type="l",
      xlab="",
      ylab="",
      col="blue"
)


dev.off()
