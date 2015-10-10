# Read in data from file
poweruse<-read.table("household_power_consumption.txt",header = TRUE, sep=";",stringsAsFactors = FALSE)

#  Separate out data for the request dates
powerdays <-subset(poweruse, Date %in% c("1/2/2007","2/2/2007"))

# Convert Sub metering to numeric so that it can be plotted
powerdays$Sub_metering_1<-as.numeric(powerdays$Sub_metering_1)
powerdays$Sub_metering_2<-as.numeric(powerdays$Sub_metering_2)
powerdays$Sub_metering_3<-as.numeric(powerdays$Sub_metering_3)

# Set up data for X axis
X_ticks<-c(0,(nrow(powerdays)/2),nrow(powerdays))
x_label <-c("Thu","Fri","Sat")

#Set margins for appearances sake
par(mar = c(2,4,1,2))

#  Plot me a course (or 3), Sulu

plot(powerdays$Sub_metering_1, typ='l',ylab = "Energy sub metering",xaxt = "n")
lines(powerdays$Sub_metering_2,col="red")
lines(powerdays$Sub_metering_3,col="blue")
axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1)

dev.copy(png, file = "plot3.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
