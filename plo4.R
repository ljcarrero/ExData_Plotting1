# Changing Locale to English

user_lang <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English")

# Reading data and cleaning from empty values

data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
data <- data[complete.cases(data), ]

# Converting strings in Date and Time to Date type an Time type

data[[1]]<-as.Date(data[[1]],"%d/%m/%Y")
data<-data[data$Date>=as.Date("2007-02-01")&data$Date<=as.Date("2007-02-02"),]
data[[2]]<-paste(as.character(data[[1]]),as.character(data[[2]],sep=" "))
data[[2]]<-strptime(data[[2]],format="%Y-%m-%d %H:%M:%S")

# Building the file and plotting

png(filename = "plot4.png",width = 480, height = 480,bg = "transparent")

par(mfrow=c(2,2))

plot(data[[2]],as.numeric(as.character(data[[3]])),type = "l",xlab="", ylab="Global Active Power")

plot(data[[2]],as.numeric(as.character(data[[5]])),type = "l",xlab="datetime", ylab="Voltage")

plot(data[[2]],as.numeric(as.character(data[[7]])),type = "l",xlab="", ylab="Energy sub metering")
points(data[[2]],as.numeric(as.character(data[[8]])),type = "l",col="RED")
points(data[[2]],as.numeric(as.character(data[[9]])),type = "l",col="BLUE")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , lty=1,bty='n', col=c('black', 'red', 'blue'))

plot(data[[2]],as.numeric(as.character(data[[4]])),type = "l",xlab="datetime", ylab="Global_reactive_power")

dev.off()

# Changing back locale

Sys.setlocale("LC_TIME", user_lang)