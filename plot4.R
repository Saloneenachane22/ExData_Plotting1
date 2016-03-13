#Set your working directory
setwd("./R/Exploratory Data Analysis/ExData_Plotting1")

#Load the data into R
HHPwrC <- read.table("data/household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")

#Consider the data only for 1st and 2nd February,2007
HHPwrC_2days <- subset(HHPwrC,Date == "1/2/2007" | Date == "2/2/2007",select = Date:Sub_metering_3)

#Convert Date & Time variables To Date/Time classes
DateTime <- strptime(paste(HHPwrC_2days$Date,HHPwrC_2days$Time),format = "%d/%m/%Y %H:%M:%S")

#Creating the 4th plot
png("plot4.png",height = 480,width = 480)

par(mfcol = c(2,2))
#1st graph of 4th plot
with(HHPwrC_2days,plot(DateTime,Global_active_power,type = "l",xlab = "",ylab = "Global Active Power"))

#2nd graph of 4th plot
SMrange <- with(HHPwrC_2days,range(Sub_metering_1,Sub_metering_2,Sub_metering_3))
with(HHPwrC_2days,plot(DateTime,Sub_metering_1,type = "l",ylim = SMrange,xlab = "",ylab = "Energy sub metering"))
with(HHPwrC_2days,lines(DateTime,Sub_metering_2,type = "l",col = "red"))
with(HHPwrC_2days,lines(DateTime,Sub_metering_3,type = "l",col = "blue"))
legend("topright",col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1 ,cex = 0.9,lwd = 2,bty = "n")

#3rd graph of 4th plot
with(HHPwrC_2days,plot(DateTime,Voltage,type = "l",xlab = "datetime",ylab = "Voltage"))

#4th graph of 4th plot
with(HHPwrC_2days,plot(DateTime,Global_reactive_power,type = "l",xlab = "datetime"))

dev.off()