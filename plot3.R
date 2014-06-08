hpc <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, na.string="?", stringsAsFactors=F)
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), "%Y-%m-%d %H:%M:%S")
hpc <- hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02", ]

# open png device for output
png(file="plot3.png")

# create the plot
with(hpc, {
     yrange <- range(c(Sub_metering_1, Sub_metering_2, Sub_metering_3))
     
     plot(DateTime, Sub_metering_1, type="l", 
          xlab="", ylab="Energy sub metering",
          ylim=yrange)
     par(new=TRUE) 
     
     plot(DateTime, Sub_metering_2, type="l", col="red", ylim=yrange, xlab="", ylab="")
     par(new=TRUE)
     plot(DateTime, Sub_metering_3, type="l", col="blue", ylim=yrange, xlab="", ylab="")
     
     legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
            col=c("black", "red", "blue"),
            lty=1, bty="o")
     par(new=FALSE)
})

#close the png device
dev.off()