if(!file.exists("household_power_consumption.txt")){
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                  destfile = "household_power_consumption.zip",method = "curl")
    unzip("household_power_consumption.zip")
}
hpc <- read.delim("household_power_consumption.txt",header = TRUE, sep = ";", 
                  colClasses = c("character","character","double","double","double","double","double","double","numeric"),
                  na.strings = "?")
hpc$DateTime <- strptime(paste(hpc$Date,hpc$Time,sep = " "),format = "%d/%m/%Y %H:%M:%S")

subhpc<-subset(hpc,Date == "1/2/2007" | Date =="2/2/2007")
# open PNG
png("plot4.png", width = 480,height = 480)

par(mfrow=c(2,2))

# first plot
plot(subhpc$DateTime,subhpc$Global_active_power, ylab = "Global Active Power",xlab="",type = "n")
lines(subhpc$DateTime,subhpc$Global_active_power)

# second plot
plot(subhpc$DateTime,subhpc$Voltage, ylab = "Voltage",xlab="datetime",type = "n")
lines(subhpc$DateTime,subhpc$Voltage)

# third plot
plot(subhpc$DateTime,subhpc$Sub_metering_1, ylab = "Energy sub metering",xlab="",type = "n")
lines(subhpc$DateTime,subhpc$Sub_metering_1, col="black")
lines(subhpc$DateTime,subhpc$Sub_metering_2, col="red")
lines(subhpc$DateTime,subhpc$Sub_metering_3, col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),
       lty = 1, bty = "n")

# fourth plot
plot(subhpc$DateTime,subhpc$Global_reactive_power, ylab = "Global_reactive_power",xlab="datetime",type = "n")
lines(subhpc$DateTime,subhpc$Global_reactive_power)

dev.off()