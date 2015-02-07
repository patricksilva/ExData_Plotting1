require(sqldf)
file <- c("./data/household_power_consumption.txt")
subset <- read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )


