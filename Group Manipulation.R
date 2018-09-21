#Group Manipulation

#Apply function has variants tapply, lapply, mapply 

#Apply must be used on a matrix - all of the elements must be of the same type 
#whether they are character, numeric or logical
#If used on other object then they will converted into matrix first
#The first arugument is the object we are working with, second argument is the margin to apply the function over
#1 being rows and 2 being columns and third argument is the function we want to apply

theMatrix <- matrix(1:9, nrow = 3)
rowSum <- apply(theMatrix, 1, sum)
rowSum
colSum <- apply(theMatrix, 2, sum)
colSum
rowSums(theMatrix)
colSums(theMatrix)

#using the NA arguments
theMatrix[2,1] <- NA
apply(theMatrix, 1, sum)
apply(theMatrix, 1, sum, na.rm = TRUE)

#lapply
#lapply works by applying a function to each element of a list and returning the results as a list
theList <- list(a = matrix(1:9, nrow = 3), b = 1:5, c= matrix(1:4, nrow = 2), d = 5)
lapply(theList, sum)

#sapply is same as the lappy except it return the results as a vector
sapply(theList, sum)

#mapply
#mapply applies function to each element of multiple lists
firstList <- list(a = matrix(1:16, 4), b = matrix(1:16, 4), c=1:5)
secondList <- list(a = matrix(1:16, 4), b = matrix(1:16, 8), c=15:1)
mapply(identical, firstList, secondList)

simpleFunc <- function(x,y) {
    nrow(x) + nrow(y)
}

mapply(simpleFunc, firstList, secondList)

#aggregate
library(ggplot2)
require(ggplot2)
data("diamonds")
head(diamonds)

aggregate(price ~ cut, diamonds, mean) #the left side represents a varaible that we want to make calculation on
aggregate(price ~ cut + color, diamonds, mean)

#cbind can be used to combine two variables
aggregate(cbind(price, carat) ~ cut, diamonds, mean)
aggregate(cbind(price, carat) ~ cut + color, diamonds, mean)

#apply, lapply, sapply, mapply