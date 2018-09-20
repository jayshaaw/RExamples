#Writing R Function
hello <- function()
{
    print("Hello, World!")
    
}
hello()
sprintf("Hello, %s", "Jared")

hello.person <- function(first, last)
{
    print(sprintf("Hello, %s %s", "Jared", "Lander"))
}
hello.person(Jared, Lander)

#default arguments
hello.person1 <- function(first, last="Doe") {
    print(sprintf("Hello %s %s", first, last))
}
hello.person1("Jared")

#Extra Arguments
hello.person2 <- function(first, last, ...){
    print(sprintf("Hello %s %s", first, last))
}
hello.person2("John", "Doe", "Extra")

#Return Value
double.num <- function(x)
{
    x*2
}
double.num(5)
#Explicit return
double.num1 <- function(x)
{
    return(x * 2)
}
double.num1(5)

#do.call function - allows us to specify the name of a function either as a character or as an object
#and provide arguments as a list
do.call(hello.person2, args = list(first="Jared", last="Lander"))
do.call("hello.person2", args = list(first="Jared", last="Lander"))

run.this <- function(x, func=mean){
    do.call(func, args = list(x))
}
run.this(1:4)
