library("data.table")


df <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

# format as numeric
df[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
# data format
df[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Select  2007-02-01 and 2007-02-02
df <- df[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

hist(df[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Blue")

dev.off()