SampleData <- read.csv("SampleData.csv")
SampleData
sd1 <- read.table(file = "SampleData.csv", header = TRUE, sep = ",")
sd1
class(SampleData)
class(sd1)
head(sd1)

#One often unknown argument that is helpful to use is stringAsFactors.
#Setting this to FALSE precent characters column from being converted to factor column
#This saves computation time and keeps the columns as character data, which are easier to work with

#R Binary Files
#RData files is used to pass around R objects like variables and functions
#Lets use the sd1 data.frame to save as a RData file
sd1
save(sd1, file = "RDataFile.rdata")
rm(sd1)
head(sd1)
load("RDataFile.rdata")
head(sd1)

#Data included with R
#R and some packages comes with data included, so we can easily have data to use
#ggplot2, for instance, comes with a dataset about diamonds. It can be loaded using the data function

require(ggplot2)
data(diamonds)
head(diamonds)

#To find a list of available data, simply type data() into the console

