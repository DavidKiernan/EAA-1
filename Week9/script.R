data<-read.table("mpstat-data-2016-04-04-12:32:16.dat", header=TRUE);
#plot(data$X.usr, type="b", xlab="Time", ylab="CPU USR");

#Get util time
data.util<-(100 - data$X.idle);
plot(data.util, type="b", xlab="Time", ylab="CPU USR");

data.summary<-summary(data.util);
data.sd<-sd(data.util);
