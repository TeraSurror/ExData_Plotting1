library(data.table)

# Load Dataset
path <- getwd()
power_consumption <- fread(file.path(path, "household_power_consumption.txt"), na.strings = "?")

# Change Date Column to Date Type
power_consumption[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filter Dates for 2007-02-01 and 2007-02-02
power_consumption <- power_comsumption[(Date >= "2007-02-01") & (Date <= "2007-02-02")]


######### Generate Plots #########

png("plot1.png", width=480, height=480)


# Plot 1
hist(power_consumption$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")


