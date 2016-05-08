#Read in data from results.dat
data<-read.table("results.dat", header=TRUE, sep=" ")

#Convert to busy time
data.busy<-100 - data$IDLE;

#Calculate utilisation = busy/time
data.util<-data.busy/100

#Calculate throughput = tasks completed/time
data.throughput<-data$C0/10;

#Calculate service demand = utilisation/throughput
data.servicedemand<-data.util/data.throughput

#Calculate residence time
data.residence<-data$N/data.throughput

png("NvsUi");
	#Build plot N vs Ui
	plot(data$N, data.util, type="l", xlab="Number of concurrent users", ylab="CPU Utilisation")
dev.off();

png("NvsDi");
	#Build plot N vs Di
	plot(data$N, data.servicedemand, type="l");
dev.off();

png("NvsX0");
	#Build plot N vs Di
	plot(data$N, data.throughput, type="l");
dev.off();



