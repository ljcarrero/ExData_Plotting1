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

png(filename = "plot2.png",width = 480, height = 480,bg = "transparent")
plot(data[[2]],as.numeric(as.character(data[[3]])),type = "l",xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

# Changing back locale

Sys.setlocale("LC_TIME", user_lang)