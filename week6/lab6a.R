#This is the collection of CPU
cpu <- c(55,56,98,100,15,12,33,45,32,67,82,19,25)
cpuBusy <- (100 - cpu)

#Save as PNG
  #plot(cpu, type='b', xlab="Time", ylab="CPU Idle Time", main="My first CPU graph in R")
#Save as PNG
plot(cpuBusy, type='b', xlab="Time", ylab="CPU Busy Time", main="My second CPU graph in R")

#Can we predict a trend in CPU usage? - Linear Model
#Independent variable
x <- c(rep(1:length(cpuBusy)))
y <- lm(cpuBusy ~ x)

abline(y, col="red") 



