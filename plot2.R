
# read file from internet
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
hpc <- read.csv(unz(temp, "household_power_consumption.txt"), 
                sep=";", header=TRUE, na.string="?", stringsAsFactors=F)
unlink(temp)

# convert variables to true date and datetime
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), "%Y-%m-%d %H:%M:%S")
hpc <- hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02", ]

#open png device for output
png(file="plot2.png")

# create the plot
with(hpc, plot(DateTime, Global_active_power, 
               type="l", xlab="", 
               ylab="Global Active Power (kilowatts)", ))

#turn png device off
dev.off()