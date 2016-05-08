#Read in data from results.dat
data<-read.table("results.dat", header=TRUE, sep=" ")

#Convert to busy time
data.busy<-100 - data$IDLE;

#Calculate utilisation - NOTE: mpstat already gives us idle time as a % so to calculate the Ui we simply inverse the idle and divide by 100.
data.ui <-data.busy/100

#Summary
summary(data.ui)

#Calculate throughput = tasks completed/time
data.x0<-data$C0/10;

#Summary
summary(data.x0)

#Calculate service demand = utilisation/throughput
data.di<-data.ui/data.x0

#Summary
summary(data.di)

#Calculate residence time
data.r<-data$N/data.x0

#Summary
Summary(data.r)

png("NvsUi.png");
	#Build plot N vs Ui
	plot(data$N, data.ui, type="l", xlab="Number of concurrent users", ylab="CPU Utilisation")
dev.off();

png("NvsDi.png");
	#Build plot N vs Di
	plot(data$N, data.di, type="l", xlab="Number of concurrent users", ylab="Service Demand (Sec per transaction)");
dev.off();

png("NvsX0.png");
	#Build plot N vs X0
	plot(data$N, data.x0, type="l", xlab="Number of concurrent users", ylab="Throughput (Tps)");
dev.off();

png("RvsN.png");
	#Build plot N vs R
	plot(data$N, data.r, type="l", xlab="Number of concurrent users", ylab="Residence Time (Sec)");
dev.off();



