#! /usr/bin/Rscript

setwd("/home/lechen/Dropbox/Teaching/svn_teaching/2020_Spring_Math362/lectures/Codes")

# Example 11.3.4
# Read data first
Input <- ("
x     yA    yB   
0     100   100 
100   250   203
200   304   214
300   403   295
400   446   330
500   482   324
")
Data = read.table(textConnection(Input),
                  header=TRUE)
Data

#fit the first model ...
DataA <- data.frame(x = Data$x,yA = Data$yA)
fitA <- lm(yA~x, DataA)
summary(fitA)


#fit the second model ...
DataB <- data.frame(x = Data$x,yB = Data$yB)
fitB <- lm(yB~x, DataB)
summary(fitB)


# Now compute t-score and p-value
sA <- summary(fitA)$coefficients
sA
sB <- summary(fitB)$coefficients
sB
db <- (sA[2,1]-sB[2,1]) # difference of beta_1's
db
sd <- sqrt(sB[2,2]^2+sA[2,2]^2) # standard deviation
sd
df <- (fitA$df.residual+fitB$df.residual) # degrees of freedom
df
td <- db/sd # t-score
pv <- 2*pt(-abs(td), df) # two-sided p-value
print(paste("t-score is ", round(td,3), 
            "and p-value is", round(pv,3)))



