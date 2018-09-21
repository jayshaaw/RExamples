#Loops
#For Loop
for (x in 1:10) {
    print(x)
}

fruit <- c("apple", "banana","mango")
fruit
fruitLength <- rep(NA, length(fruit))
fruitLength
names(fruitLength) <- fruit

for (a in fruit) {
    fruitLength[a] <- nchar(a)
}

fruitLength1 <- nchar(fruit)
names(fruitLength1) <- fruit
fruitLength1

#While Loop
x <- 1
while (x <= 5) {
    print(x)
    x <- x+ 1
}

#Controlling Loop
for(i in 1:10){
    if (i == 3) {
        next()
    }
print(i)
}

for (j in 1:10) {
    if (j == 4) {
        break()
    }
    print(j)
}
