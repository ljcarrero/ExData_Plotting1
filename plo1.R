# Reading data and cleaning from empty values 

data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
data <- data[complete.cases(data), ]

# Converting date data to date format

data[[1]]<-as.Date(data[[1]],"%d/%m/%Y")
data<-data[data$Date>=as.Date("2007-02-01")&data$Date<=as.Date("2007-02-02"),]

# COnverting factor data to numeric

x<-data[[3]]
x<-as.numeric(as.character(x))

# Constructing the file with the plot

png(filename = "plot1.png",width = 480, height = 480,bg = "transparent")
hist(x,xlab="Global Active Power (kilowatts)",col="RED",main="Global Active Power")
dev.off()