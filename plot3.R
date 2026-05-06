library(ggplot2)
library(dplyr)

#4 sources by type, which 4 decreases/increase from 1999-2008

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore<-NEI[NEI$fips=="24510",]

df_summary<-baltimore%>%
  group_by(year,type)%>%
  summarize(total_emisions=sum(Emissions,na.rm=TRUE))

png("plot3.png",width=480,height=480)
ggplot(df_summary,aes(x=year,y=total_emisions,color=type))+geom_line()+geom_point()+labs(title="Emissions Trends in Baltimore by Source Type")
dev.off()
#so remember with df_summary above, we are able to group by year and type
#so you don't need to manually do it, dplyr has that library
#that enables you to compute summaries while grouped by year and type it'll 
#automatically groups each year and type and get sum of that