hpc <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, na.string="?", stringsAsFactors=F)
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), "%Y-%m-%d %H:%M:%S")
hpc <- hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02", ]

# open the png device for output
png("plot4.png")

# display is two over two
par(mfrow=c(2, 2))

# create the plots
with(hpc, {
     plot(DateTime, Global_active_power, 
               type="l", 
               xlab="", 
               ylab="Global Active Power")
     
     plot(DateTime, Voltage, 
          type="l", 
          xlab="datetime",
          ylab="Voltage")
     
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
                 lty=1, bty="n", cex=.95)
          par(new=FALSE)
     })
     
     plot(DateTime, Global_reactive_power, 
          type="l", 
          xlab="datetime",
          ylab="Global_reactive_power")
})

# close the graphics device
dev.off()

