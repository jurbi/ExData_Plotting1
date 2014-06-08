hpc <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, na.string="?", stringsAsFactors=F)
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