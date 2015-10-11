# Read in data from file
poweruse<-read.table("household_power_consumption.txt",header = TRUE, sep=";",stringsAsFactors = FALSE)

#  Separate out data for the request dates
powerdays <-subset(poweruse, Date %in% c("1/2/2007","2/2/2007"))

# Convert needed columns to numeric so that it can be plotted
powerdays$Global_active_power<-as.numeric(powerdays$Global_active_power)
powerdays$Sub_metering_1<-as.numeric(powerdays$Sub_metering_1)
powerdays$Sub_metering_2<-as.numeric(powerdays$Sub_metering_2)
powerdays$Sub_metering_3<-as.numeric(powerdays$Sub_metering_3)
powerdays$Voltage<-as.numeric(powerdays$Voltage)

# Set area up for multiple plots
par(mfcol=c(2,2), mar = c(4,4,2,1))

# Set up data for X axis
X_ticks<-c(0,(nrow(powerdays)/2),nrow(powerdays))
x_label <-c("Thu","Fri","Sat")

# And now the plotting thickens
plot(powerdays$Global_active_power, typ='l',ylab = "Global Active Power (kilowatts)",xlab="",xaxt = "n")
axis(1,at=x_ticks,labels=x_label)

#  Plot me a course (or 3), Sulu

plot(powerdays$Sub_metering_1, typ='l',ylab = "Energy sub metering",xaxt = "n")
lines(powerdays$Sub_metering_2,col="red")
lines(powerdays$Sub_metering_3,col="blue")
axis(1,at=x_ticks,labels=x_label)
legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1, cex = .5)

plot(powerdays$Voltage, typ='l',ylab = "Voltage",xlab="datetime",xaxt = "n")
axis(1,at=x_ticks,labels=x_label)

plot(powerdays$Global_reactive_power, typ='l',ylab = "Global_reactive_power",
     xlab="datetime",xaxt = "n")
axis(1,at=x_ticks,labels=x_label)

dev.copy(png, file = "plot4.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!