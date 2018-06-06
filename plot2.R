library("data.table")

df <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

# format as numeric
df[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# date format
df[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# select 2007-02-01 and 2007-02-02
df <- df[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot2.png", width=480, height=480)

plot(x = df[, dateTime]
     , y = df[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()