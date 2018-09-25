#Data Reshaping
#combining two vectors into a data frame using the cbind

sport <- c("Hockey","Baseball", "Football")
league <- c("NHL", "MLB", "NFL")
trophy <- c("Stanly Cup", "Commissioner's Trophy", "Vince Lombardi Trophy")

trophies1 <- cbind(sport, league, trophy)
trophies2 <- data.frame(sport = c("Basketball", "Golf"), league = c("NBA", "PGA"), trophy = c("Larry O'Brien Championship Trophy", "Wanamaker Trophy"))

trophies <- rbind(trophies1, trophies2)

cbind(Sport = sport, Association = league, Prize = trophy)

#three commonly used functions for joins are merger in R, join plyr and the merging functionality in data.table

#merge in base r has a built-in function, called merge, to merge two data.frames

download.file(url = "http://www.jaredlander.com/data/US_Foreign_Aid.zip", destfile = "data/ForeignAid.zip")
unzip("data/ForeignAid.zip", exdir = "data")

library(stringr)
require(stringr)
theFiles<- dir("data/", pattern = "\\.csv")
for (a in theFiles) {
    nameToUse <- str_sub(string = a, start = 12, end = 18)
    temp <- read.table(file = file.path("data", a), header = TRUE, sep = ",", stringsAsFactors = FALSE)
    assign(x = nameToUse, value = temp)
}
class(Aid_00s)
colnames(Aid_00s)
colnames(Aid_90s)

#merge
Aid90s00s <- merge(x = Aid_90s, y = Aid_00s, by.x = c("Country.Name", "Program.Name"), by.y = c("Country.Name", "Program.Name"))
colnames(Aid90s00s)

#plyr join
require(plyr)
Aid90s00sJoin <- join(x = Aid_90s, y = Aid_00s, by=c("Country.Name", "Program.Name"))
colnames(Aid90s00sJoin)

#The eight data.frames containing foreign assistance data can be combined into one data.frame
frameNames <- str_sub(string = theFiles, start = 12, end = 18)
frameList <- vector("list", length(frameNames))
names(frameList) <- frameNames

for (a in frameNames) {
    frameList[[a]] <- eval(parse(text = a)) 
}
head(frameList[2])
head(frameList[["Aid_00s"]])
#Hvaing all the data in the list, helps in iterating  through the list
#rather than using a loop, we can use the Reduce function to speed up the operation

allAid <- Reduce(function(...){
    join(...,by = c("Country.Name", "Program.Name"))
}, frameList)
dim(allAid)


#reshape2
#Melting data (going from column orientation to row orientation)
#Casting data (going from row orientation to column orientation)

head(Aid_00s)

#The dollar amount for a country-program aid information for year is stored in separate columns
#To make it easier for graphing the table will be melted to store the dollar information in just one column

#melt
require(reshape2)
melt00 <- melt(Aid_00s, id.vars = c("Country.Name", "Program.Name"), variable.name = "Year", value.name = "Dollars")
tail(melt00, 10)

#The id.vars argument specifies which columns uniquelt identify a row

require(scales)
#strip the "FY" out of the year column and convert it in numeric
melt00$Year <- as.numeric(str_sub(melt00$Year, start = 3, end = 6))
#aggregate the data so we have yearly numbers by program
meltAgg <- aggregate(Dollars ~ Program.Name + Year, data = melt00, sum, na.rm=TRUE)

#just keep the first 10 characters of program name then it will fit in the plot
meltAgg$Program.Name <- str_sub(meltAgg$Program.Name, start = 1, end = 10)

#plot
library(ggplot2)
require(ggplot2)
ggplot(meltAgg, aes(x = Year, y = Dollars)) + geom_line(aes(group=Program.Name)) + facet_wrap( ~ Program.Name) 

#dcast
#The data we melted can be casted back into the wide format using the function dcast

cast00 <- dcast(melt00, Country.Name + Program.Name ~ Year, value.var = "Dollars" )
head(cast00)
