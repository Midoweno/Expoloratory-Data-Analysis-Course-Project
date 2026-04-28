NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore<-NEI[NEI$fips=="24510",]

row1999<-baltimore[baltimore$year==1999,]
row2002<-baltimore[baltimore$year==2002,]
row2005<-baltimore[baltimore$year==2005,]
row2008<-baltimore[baltimore$year==2008,]

df<-data.frame(
  year=c(1999,2002,2005,2008),
  emissions=c(sum(row1999$Emissions),
              sum(row2002$Emissions),
              sum(row2005$Emissions),
              sum(row2008$Emissions))
)
png("plot2.png",width=480,height=480)
plot(df$year,df$emissions,
     ylab="Total Emissions",
     xlab="Year",
     xaxt="n",
     color="blue",
     pch=17,
     main="Baltimore City Total Emissions per Year",
     cex=2)
##axis cannot be an arg in plot()
axis(1,
     at=c(1999,2002,2005,2008),
     labels=c("1999","2002","2005","2008"))
dev.off()