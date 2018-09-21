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
head(frameList[1])
head(frameList[["Aid_00s"]])
#Hvaing all the data in the list, helps in iterating  through the list
#rather than using a loop, we can use the Reduce function to speed up the operation

allAid <- Reduce(function(){
    join(by = c("Country.Name", "Program.Name"))
}, frameList)
