#Control Statements
#If else
1==1
as.numeric(TRUE)
as.numeric(FALSE)

toCheck <- 1
if (toCheck == 1) {
    print("Hello")
}
1 < 1
check.bool <- function(x){
    if (x == 1) {
        print("X is 1")
    } else {
        print("x is not 1")
    }
    {
        print()
    }
}
check.bool(1)

#Switch
use.switch <- function(x)
{
    switch (x,
        a = "first",
        b = "second",
        c = "third",
        "other"
    )
}
use.switch("a")
use.switch(1)
use.switch(5)
is.null(use.switch(5))

#ifelse
ifelse(1==1, TRUE, FALSE)
ifelse(1==1, 2*34, "zero")

#Compound Test
a <- c(1,2,1,4)
b <- c(1,2,1,4)
ifelse(a == 1 & b == 1, "True", "False")
