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
