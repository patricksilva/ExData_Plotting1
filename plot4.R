require(sqldf)
file <- c("./data/household_power_consumption.txt")
subset <- read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )

Sys.setlocale("LC_TIME","English")

png(file="plot4.png", width = 480, height = 480, units = "px")

subset$DateTime <- as.POSIXct(paste(subset$Date,subset$Time), format = "%d/%m/%Y %H:%M:%S")

par(mfcol = c(2,2))

# plot 1
{
        plot(
                subset$DateTime,
                subset$Global_active_power,
                type="l",
                xlab="",
                ylab="Global Active Power"
        )
}
# plot 2
{
        plot(
             subset$DateTime,
             subset[ , 7],
             type="l",
             xlab="",
             ylab="Energy sub metering"
        )
        lines(subset$DateTime,
              subset[ , 8],
              type="l",
              xlab="",
              ylab="",
              col="red"
        )
        lines(subset$DateTime,
              subset[ , 9],
              type="l",
              xlab="",
              ylab="",
              col="blue"
        )
        legend("topright",
               legend=paste("Sub_metering_",c(1,2,3)),
               col=c("black","red","blue"),
               lwd=.75,
               cex=.75
        )
}

# plot 3
{
        
}
# plot 4
{
        
}
dev.off()
