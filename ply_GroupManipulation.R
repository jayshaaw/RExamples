#Ply
#The plyr package epitomizes the "split-apply-combine" method of data manipulation
#All the manipulation functions such as ddply, llply, ldply or others consists of 5 letters, with the last 3 always being ply
#The first letter indicates the type of input and the last 3 indicates the type of output

#ddply - data.frame to data.frame
#llply - list to list
#aaply - array/vector/matrix to array/vector/matrix
#dlply - data.frame to list
#daply - data.frame to array/vector/matrix
#d_ply - data.frame to none(used for side effects)
#ldply - list to data.frame
#laply - list to array/vector/matrix
#l_ply - list to none(used for side effects)
#adply - array/vector/matrix to data.frame
#alply - array/vector/matrix to list
#a_ply - array/vector/matrix to none(used for side effects)

?with
library(plyr)
require(plyr)
head(baseball) #baseball data set will be used to play around and manipulate data

#A common stats in baseball is On Base Percentage (OBP), which is calculated as 
#OBP = (H + BB + HBP)/(AB + BB + HBP + SF) H-Hits, BB - Bases on Balls, HBP - Times Hit by Pitch, AB - At Bats, SF - Sacrifice Flies

#Before 1954 sacrifice flies were counted as part of sacrifice hits, so for plater before 1954 sacrifice flies should be assumed 0
baseball$sf[baseball$year < 1954] <- 0

any(is.na(baseball$sf))
any(is.na(baseball$hbp))

baseball$hbp[is.na(baseball$hbp)] <- 0 
any(is.na(baseball$hbp))

#Only keep players with at least 50 at bats in a season
baseball <- baseball[baseball$ab >= 50,]

#calculate OBP
baseball$OBP <- with(baseball, (h + bb + hbp)/(ab +bb+hbp+sf))

obp <- function(data) {
    c(OBP = with(data, sum(h + bb + hbp) / sum(ab + bb + hbp + sf)))
}

tail(baseball)
careerOBP <- ddply(baseball, .variables = "id", .fun = obp)
careerOBP <- careerOBP[order(careerOBP$OBP, decreasing = TRUE),]

head(careerOBP, 10)

#data.table is a package that extends and enchances the functionality of data.frames
#data.table have an index like databases that allows faster value accessing, group by operation and joins

#data.table is not included here..

