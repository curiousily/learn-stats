attach(mtcars)
plot(wt, mpg, pch=20, xlab="Car Weight", ylab="Miles Per Gallon")
abline(lm(mpg~wt), col="red")
