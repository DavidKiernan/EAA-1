#Read in data from results.dat
data<-read.table("results.dat", header=TRUE, sep=" ")

#Convert to utilisation
data.busy<-100 - data$IDLE

#Calculate throughput
data.throughput<-data$C0/5;

#Calculate service demand
data.servicedemand<-data.util/data.throughput

#Calculate interactive response time R = M/X0 - Z
#data.response = data$M/data.throughput - Z;

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



