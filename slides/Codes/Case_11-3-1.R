#! /usr/bin/Rscript
setwd("/home/lechen/Dropbox/Teaching/svn_teaching/2020_Spring_Math362/lectures/Codes")


#fCase Study 11.3.1
# Loading data first
x <- c(3900,
       3350,
       3220,
       3220,
       2790,
       2780,
       2770,
       2290,
       2160,
       1890,
       1810,
       1800,
       1770,
       1700,
       1680,
       1510,
       1500,
       1410,
       1270,
       1200,
       1090)
y <- c(
  256.9,
  211.6,
  238.1,
  211.8,
  194.1,
  124.5,
  187.3,
  110.5,
  233.1,
  150.3,
  124.7,
  41.2,
  182.1,
  118.1,
  31.9,
  114.3,
  144.9,
  59.7,
  126.9,
  43.9,
  136.3)
# scatterplot
# Scatter plots can help visualize any linear relationships between the dependent (response) variable and independent (predictor) variables. Ideally, if you are having multiple predictor variables, a scatter plot is drawn for each one of them against the response, along with the line of best as seen below.
png("Case_11-3-1-Scatter.png")
scatter.smooth(x=x, y=y, main="Cigarette ~ Mortality")
dev.off()


png("Case_11-3-1-Outliers1.png")
r <- 1
par(mfrow=c(1, 2))  # divide graph area in 2 columns
boxplot(x, main="Cigarette", range=r, sub=paste("Outlier rows: ", boxplot.stats(x, coef=r)$out))  # box plot for 'Cigarette'
boxplot(y, main="Mortality", range=r, sub=paste("Outlier rows: ", boxplot.stats(y, coef=r)$out))  # box plot for 'Mortality'
dev.off()

png("Case_11-3-1-Outliers2.png")
r <- 1.5
par(mfrow=c(1, 2))  # divide graph area in 2 columns
boxplot(x, main="Cigarette", range=r, sub=paste("Outlier rows: ", boxplot.stats(x, coef=r)$out))  # box plot for 'Cigarette'
boxplot(y, main="Mortality", range=r, sub=paste("Outlier rows: ", boxplot.stats(y, coef=r)$out))  # box plot for 'Mortality'
dev.off()

png("Case_11-3-1-Density.png")
library(e1071)
par(mfrow=c(1, 2))  # divide graph area in 2 columns
plot(density(x), main="Density Plot: Cigarette", ylab="Frequency", 
     sub=paste("Skewness:", round(e1071::skewness(x), 2)))  # density plot for 'speed'
polygon(density(x), col="red")
plot(density(y), main="Density Plot: Mortality", ylab="Frequency", 
     sub=paste("Skewness:", round(e1071::skewness(y), 2)))  # density plot for 'dist'
polygon(density(y), col="red")
dev.off()

cor(x,y)

# Build the data frame 
CigMort <- data.frame("Cigarette" = x, "Mortality" = y)
# build linear regression model on the data
linearMod <- lm(Mortality ~ Cigarette, data=CigMort)  
print(linearMod)
summary(linearMod)

AIC(linearMod)
BIC(linearMod)



names(summary(linearMod))
summary(linearMod)$r.squared
summary(linearMod)$adj.r.squared

names(summary(linearMod))
summary(linearMod)$sigma
summary(linearMod)$fstatistic
f <- summary(linearMod)$fstatistic
pf(f[1], f[2], f[3], lower=FALSE)

AIC(linearMod)
BIC(linearMod)

# Plot the x -> E(Y|x)
png("EYX.png")
s <- summary(linearMod)$sigma
beta <- linearMod$coefficients
z <- seq(1000,4500,1) 
hatY <- beta[1]+beta[2]*z
w <- qt(0.975,19) * s * sqrt(1/21+(z-mean(x))^2/(sum((x-mean(x))^2)))
matplot(z,cbind(hatY,hatY+w,hatY-w),type = c("l","l","l"),lwd=c(3,4,4))
points(x, y, pch = 19)
abline(v=4200,col = "blue", lty = 4)
abline(h=208.71,col = "blue", lty = 4)
abline(h=327.66,col = "blue", lty = 4)
text(4200,50,4200)
text(1200,203,208.71)
text(1200,331,327.66)
dev.off()

# Future observations
png("EYX_Pred.png")
s <- summary(linearMod)$sigma
beta <- linearMod$coefficients
z <- seq(1000,4500,1) 
hatY <- beta[1]+beta[2]*z
w <- qt(0.975,19) * s * sqrt(1/21+(z-mean(x))^2/(sum((x-mean(x))^2)))
f <- qt(0.975,19) * s * sqrt(1+1/21+(z-mean(x))^2/(sum((x-mean(x))^2)))
matplot(z,cbind(hatY,hatY+w,hatY-w,hatY+f,hatY-f),
        type = c("l","l","l","l","l"),lwd=c(3,4,4,4,4))
points(x, y, pch = 19)
abline(v=4200,col = "blue", lty = 4)
abline(h=208.71,col = "blue", lty = 4)
abline(h=327.66,col = "blue", lty = 4)
text(4200,50,4200)
text(1200,208.71-5,208.71)
text(1200,327.66+5,327.66)
abline(h=153.76,col = "red", lty = 4)
abline(h=382.61,col = "red", lty = 4)
text(4200,50,4200)
text(1200,153.76-5,153.76)
text(1200,382.61+5,382.61)
dev.off()

png("diagnostic_plots.png")
# diagnostic plots
layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page
plot(linearMod)
dev.off()

# 95% C.I. for slope parameter beta_1
alpha <- 0.05
for (i in c(0,1)) {
  coef <- summary(linearMod)$coefficient
  df <- linearMod$df.residual
  lbd <- coef[i+1,1] - pt(1-alpha/2,df) * coef[i+1,2]
  ubd <- coef[i+1,1] + pt(1-alpha/2,df) * coef[i+1,2]
  print(paste("95% C.I. for the slope is beta_",i,
              " is (", round(lbd,3), ",", round(ubd,3),")"))
}

# 95% C.I. for intercept beta_0
alpha <- 0.05
i<- # for beta_0
coef <- summary(linearMod)$coefficient
df <- linearMod$df.residual
sd <- coef[2,2]
lbd <- coef[2,1] - pt(1-alpha/2,df) * coef[2,2]
ubd <- coef[2,1] + pt(1-alpha/2,df) * coef[2,2]
print(paste("95% C.I. for the slope is beta_1 (", 
            round(lbd,3), ",", round(ubd,3),")"))

