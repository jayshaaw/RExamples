require(ggplot2)
data("diamonds")
head(diamonds)

#Base Hitogram
hist(diamonds$carat, main = "Carat Histogram", xlab = "Carat")
head(diamonds,n = 40)

#Base Scatterplot - two variables in comaprison with each other
plot(price ~ carat, data = diamonds) #The ~ separating price and carat indicates plot against two variables 
plot(diamonds$carat, diamonds$price)

#Boxplots
boxplot(diamonds$carat)

#ggplot2
ggplot(data = diamonds) + geom_histogram(aes(x = carat))

ggplot(data = diamonds) + geom_density(aes(x = carat), fill="grey50")

#ggplot is previous name which was updated and named to ggplot2

ggplot(diamonds, aes(x = carat, y = price)) + geom_point()

g <- ggplot(diamonds, aes(x = carat, y = price)) + geom_point()

g
g + geom_point(aes(color =color))

g + geom_point(aes(color =cut))

#ggplot2 also has the ability to make faceted plots or small multiples
#facet_wrap takes the levels of onen variable, cuts up the underlying data according to them, 
#makes a seperate pane for each set, and arranges them to fit in the plot
g + geom_point(aes(color = color)) + facet_wrap(~ color)

#facet_grid acts similarly but assigns all levels of a varaible to either a row or column

g + geom_point(aes(color = color)) + facet_grid(cut ~ clarity)

#facet_grid also works with histograms
ggplot(diamonds, aes(x = carat)) + geom_histogram() + facet_wrap(~color)
ggplot(diamonds, aes(x = carat)) + geom_histogram() + facet_grid(cut~color)

#ggplot2 boxplots and violins plot
ggplot(diamonds, aes(x = 1,y = carat)) + geom_boxplot()
ggplot(diamonds, aes(x = cut,y = carat)) + geom_boxplot()

#violin plots are similar to boxplots except that the boxes are curved, giving a sense of the density of the data
ggplot(diamonds, aes(x = cut, y = carat)) + geom_violin()

#ggplot2 line graphs
head(economics, n = 35)
ggplot(economics, aes(x = date, y = pop)) + geom_line()

#lubridate package had convenient functions for manipulating dates
library(lubridate)
require(lubridate)

economics$year <- year(economics$date)
economics$month <- month(economics$date, label = TRUE )

#subset the data - which function retunrs the indices of observations where the tested condition are true
econ2000 <- economics[which(economics$year >= 2000),]

#scales package for better axis formatting
require(scales)

a <- ggplot(econ2000, aes(x = month, y = pop))
a <- a + geom_line(aes(color = factor(year), group=year))
a <- a + scale_color_discrete(name = "Year")
a <- a + scale_y_continuous(labels = comma)
a <- a + labs(title="Population Growth", x="Month", y="Population")

#Themes - they can used to easily change the way the graph looks
require(ggthemes)
g2 <- ggplot(diamonds, aes(x = carat, y = price)) + geom_point(aes(color = color))

g2 + theme_classic()
g2 + theme_economist()
g2 + theme_excel()
g2 + theme_tufte()
g2 + theme_wsj()

#packages used - ggplot2, lubridate, scales, ggthemes