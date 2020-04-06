# Solution Exercise 1
# Author: Lionel Fillatre

# Pie Chart from Iris data frame
data("iris") # load iris dataset
speciesTable <- table(iris$Species)
speciesTable
pieLabels <- paste(names(speciesTable), "\n", speciesTable, sep="")
pie(speciesTable, labels = pieLabels, 
    main="Pie Chart of Species\n with sample size")

# Barplot
barplot(speciesTable,
        legend = names(speciesTable),
        col = c("lightblue", "mistyrose","lavender"),
        border = "dark blue"
        )
title(main = "Barplot of Species\n with sample size")

# Histogram
op <- par(mfrow = c (2, 2))
hist (iris$Petal.Length,
      main = "Histogram of Petal Length",
      col = "blue1",
      breaks = 20,
      border = "pink"
      )
hist(iris$Petal.Width)
hist(iris$Sepal.Length)
hist(iris$Sepal.Width)

# Edcf
op <- par(mfrow = c (2, 1))
Fn <- ecdf(iris$Petal.Length) # compute the ecdf
t <- seq(min(iris$Petal.Length), max(iris$Petal.Length),length.out=100) 
plot(t,Fn(t),main = "Petal Length ecdf") # values of the ecdf at points t

Fn <- ecdf(iris$Sepal.Width) # compute the ecdf
t <- seq(min(iris$Sepal.Width), max(iris$Sepal.Width),length.out=100) 
plot(t,Fn(t),main = "Sepal Width ecdf") # values of the ecdf at points t


# Percentile
op <- par (mfrow = c (2, 2))
p <- seq(0,1,by=.1)
y <- quantile(iris$Petal.Length,  probs = p)
plot(p,y, 
     type = "p", 
     main = "Petal Length Percentile",
     xlab = "Fraction",
     ylab = "Percentile",
     pch=2
     )
y <- quantile(iris$Petal.Width,  probs = p)
plot(p,y)
y <- quantile(iris$Sepal.Length,  probs = p)
plot(p,y)
y <- quantile(iris$Sepal.Width,  probs = p)
plot(p,y)

# Boxplot
op <- par (mfrow = c (1, 1))
boxplot(iris[,1:4])

