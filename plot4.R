#Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

library(dplyr)

#4 sources by type, which 4 decreases/increase from 1999-2008

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coal_scc<-SCC%>%
  filter(grepl("coal",Short.Name),ignore.case=TRUE)

df_coal<-NEI%>%
  filter(SCC %in% coal_scc$SCC)

summary<-df_coal%>%
  group_by(year)%>%
  summarize(total_emission=sum(Emissions,na.rm=TRUE))

png("plot4.png",width=480,height=480)

plot(summary$year, summary$total_emission,
     type = "b",                     # points + lines
     pch = 18,                       # diamond shape
     col = "blue",                   # blue points/line
     xlab = "Year",
     ylab = "Total Emissions",
     main = "Coal Combustion Emissions Trend",
     xaxt = "n",                     # turn off default x-axis
     yaxt = "n")                     # turn off default y-axis

# custom x-axis (your 4 years)
axis(1, at = summary$year, labels = summary$year)

# custom y-axis (your emission values)
axis(2, at = summary$total_emission, labels = summary$total_emission)
dev.off()
