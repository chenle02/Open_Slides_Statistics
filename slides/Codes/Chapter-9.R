#! /usr/bin/Rscript
setwd("/home/lechen/Dropbox/Teaching/svn_teaching/2020_Spring_Math362/lectures/Codes")



# Section 9.1
png("T-Statistics.png")
t <- seq(-10,10,0.01)
a <- 5
plot(t,a/(a+t^2),type = "l")
abline(v= 0,lty=2)
abline(h= 0.2,lty=2)
abline(v= sqrt(20),lty=2)
abline(v= -sqrt(20),lty=2)
polygon(c(-12,-sqrt(20),-sqrt(20),-12),
        c(0,0,0.2,0.2),
        col=rgb(1, 0, 0,0.5), 
        border=NA)
polygon(c(12,sqrt(20),sqrt(20),12),
        c(0,0,0.2,0.2),
        col=rgb(1, 0, 0,0.5), 
        border=NA)
dev.off()


# Case Study 9.2.3
n=12
m=12
x=c(21,23,13,22,7,17,19,11,2,30,15,43)
y=c(21,21,14,31,19,19,11,29,20,27,27,24)
sum(x)
sum(x*x)
sum(y)
sum(y*y)
mean(x)
mean(y)
var(x)
var(y)
(mean(x)-mean(y))/sqrt(var(x)/n+var(y)/m)
th=var(x)/var(y)
(th+n/m)^2/(1/(n-1) * th^2 +1/(m-1) *(n/m)^2 )


