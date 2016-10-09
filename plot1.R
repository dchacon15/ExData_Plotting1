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

png("plot1.png", width = 480,height = 480)
hist(subhpc$Global_active_power, main = "Global Active Power",xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.off()