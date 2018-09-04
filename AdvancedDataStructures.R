#Advanced Data Structure
#data.frame is just like an Excel spreedsheet like rows and columns
#Each column is variable and each row is an observation
x <- 1:10
y <- 11:20
z <- c("Baseball", "Footy", "Soccer", "Cricket", "Basketball")
df <- data.frame(x,y,z)
df
df <- data.frame(First = x, Second = y, Sport = z)
df
nrow(df)
ncol(df)
dim(df)
names(df)
names(df) [2]
rownames(df)
rownames(df) <- c("one", "two", "three", "four", "five", "six", "seven","eight", "nine", "ten")
rownames(df)
rownames(df) [3]
rownames(df) <- NULL
df
head(df)
head(df, n=7)
tail(df,4 )
class(df)
df$First #$ operator is same as the square brackets
df [3]
# row 3 through 5 column 1 through 2
df [3:5, 1:2]
df [3:5, 1] #since one column was selected it was returned as a vector and hence column name not printed
#To access an entire row, specify that row while not specifying any column
df [1,]
df [1, 1:2]
df [,c("First", "Sport")]
df [, "Sport"]
class(df[,"Sport"]) #just the sport column and this returns a factor vector
df["Sport"] #just the sport column and this returns a one column data.frame
class(df["Sport"])
#To ensure that data frame is returned instead of factor vector when using single brackets
# there is thrid arugument:drop=FALSE
df[, "Sport", drop=FALSE]
#List
#list can store any number of items of any type
list(1,2,3)
list(c(1,2,3))
list1 <- list(c(1,2,3), 4:7)
df
list(df, 1:10)
list2 <- list(df, 1:10, list1)
list2
list2 [3][1]
names(list2) <- c("data.frame", "vector", "list")
list2
list2 ["data.frame"]
emptyList <- vector(mode = "list", length = 3)
emptyList [1] <- 1
emptyList
length(list2)
list2
df1 <- data.frame(z)
df2 <- data.frame(df1, xy = 1:10, yz=c("1,2,3")) 
df2
df2[3]
names(df2) <-c("a", "b", "C")
df2
df2$b
#Matrices
#This is similar to a data.frame in that is is rectangular with rows and columns excep
#that every single element, regardless of the column, must be the same type, most commonly all numerics
m1 <- matrix(1:10, nrow = 5)
m1
m2 <- matrix(21:30, ncol = 2)
m2
nrow(m1)
ncol(m2)
dim(m2)
dim(m1)
m1 + m2
m1*m2
m3 <- matrix(1, nrow = 5, ncol = 2)
m3
m4 <- matrix(2, nrow = 5, ncol = 2)
m4
m3*m4
m1==m2
t(m1) #transpose
m1
m2
m1 %*% t(m2) #matrix multiplication - no of column on left of matrix to be same as the number of rows of the right of matrix

#Arrays
#An array is essentially a multidimentional vector.
#It must all be of the same type and individual elements are accessed in a similar fashion using the square barckets
#The first element is the row index, the second is the column index and the remaining elements are for outer dimension

a1 <- array(1:10, dim = c(1,2,3)) #dimension 1 row X 2 column X 3
a1
a2 <- array(10:20, dim = c (2,2,2))
a2

#The main difference between an array and a matrix is that matrices are restricted to two dimensions while arrays can have a arbitrary number

#Summary: Vector, factor vector, data frames, list, matrices, arrays
    
