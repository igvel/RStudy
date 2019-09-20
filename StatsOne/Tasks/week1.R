#1
install.packages("car")

#2
library(car)

#3
search()

#4
?data.frame

#5
numbers = 1:10
words = c("One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten")
nw = data.frame(number=numbers, word=words)
nw
attributes(nw)

#6
nw[8,1]

#7
nw[8,2]

#8
a=matrix(1:10,2,5)
a

#9
x=1:6
y=5:10
rbind(x,y)

#10
cbind(x,y)
