#! /usr/bin/Rscript
setwd("/home/lechen/Dropbox/Teaching/svn_teaching/2020_Spring_Math362/lectures/Codes")

# Draw F density
x=seq(0,5,0.01)
pdf= cbind(df(x, df1 = 1, df2 = 1),
           df(x, df1 = 2, df2 = 1),
           df(x, df1 = 5, df2 = 2),
           df(x, df1 = 10, df2 = 1),
           df(x, df1 = 100, df2 = 100))
matplot(x,pdf, type = "l")
title("F with various dgrs of freedom")

# F distribution
pf(5.41,df1 = 3, df2 = 5)
qf(0.95,df1 = 3, df2 = 5)

# t-distribution
alpha = 0.01
qt(1-alpha, df = 3)

1-pt(4.541, df =3)

# Chi Square distr.
pchisq(1.145, df = 5)
pchisq(15.086, df = 5)

qchisq(0.05, df = 5)
qchisq(0.99, df = 5)

# Draw Student t-density
x=seq(-5,5,0.01)
pdf= cbind(dt(x, df = 1),
           dt(x, df = 2),
           dt(x, df = 5),
           dt(x, df = 100))
matplot(x,pdf, type = "l")
title("Student's t-distributions")



# Example 7.5.1
n=seq(45,60,1)
l=qchisq(0.025,n-1)
u=qchisq(0.975,n-1)
e=(n-1)* (1/l-1/u)
m=cbind(n,l,u,e)
colnames(m) = c("n", 
                "chi(0.025,n-1)", 
                "chi(0.975,n-1)", 
                "error")
m

# HW 7.5.6
n=seq(1,12,1)
p=pchisq(2*(n-1),df = n-1 )
m=cbind(n,p)
colnames(m) = c("n", "Prob.")
m

# HW 7.5.8
qchisq(0.025, df = 18)
