1 + 1
3*7
4/2
x <- 1
x
y=2
y
x + y
x <- y
x
y
assign("j", 5)
j
rm(j)
j
class(x)
z <- "stringZ"
z
class(z)
a <- date()
a
class(a)
is.numeric(a)
b <- TRUE
class(b)
Xfactor <- factor("data")
class(Xfactor)
Xfactor
z
nchar(a)
nchar(z)
date1 <- as.Date("2018-08-27")
class(date1)
as.numeric(date1)
date2 <- as.POSIXct("2018-08-27 17:50")
date2
#lubridate and chron package used to manipulate data
#using functions such as as.numeric and as.Date does not merely change 
#formatting but actually changes the underlying data 
TRUE * 1
FALSE * 1
is.logical(TRUE)
2==3
2!=3
2 <= 3
#Vectors - Vectors do not have dimension
#Vector - there is no such thing as row vector or column vector
 v <- c(1,2,3,4,5,6)
v 
class(v)
v * 2
v - 2
v/2
v ^ 2
sqrt(v)
u <- 1:10
u
10:1
-2:2
u <- 1:10
v <- 11:20
u + v
u/v
length(u)
length(v)
length( u * v)
u*v
u + c(1,2)
u
v
#The shorter vector gets recycled, in order, until they have been
#matched up with every element of the longer vector
any(u*2 == v)
all(u < y)
w <- c("hockey", "football", "baseball", "basketball")
nchar(w)
w[1]
w[1:3]
p = 1:3
p
names(p) <- c("one", "two", "three")
p
as.factor(p)
p
p1 <- as.factor(p)
p1
as.numeric(p1)
p2 <- as.factor(w)
p2
as.numeric(p2)
factor(p2,levels = c("football", "basketball", "hockey", "baseball"), ordered = TRUE)

