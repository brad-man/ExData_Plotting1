# Read in data from file
poweruse<-read.table("household_power_consumption.txt",header = TRUE, sep=";",stringsAsFactors = FALSE)

#  Separate out data for the request dates
powerdays <-subset(poweruse, Date %in% c("1/2/2007","2/2/2007"))

# Convert Global Active Power to numeric so that it can be plotted
powerdays$Global_active_power<-as.numeric(powerdays$Global_active_power)

#Set margins for appearances sake
par(mar = c(4,4,2,2))

#Histogram it up
hist(powerdays$Global_active_power,breaks = 12,col = 'red', main = "Global Active Power",xlab = "Global Active Power (kilowatts", ylim = c(0,1200))

dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!