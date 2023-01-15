#! /usr/bin/Rscript
setwd("/home/lechen/Dropbox/Teaching/svn_teaching/2020_Spring_Math362/lectures/Codes")

# Case Study 10.3.3
x=seq(0,10,0.1)
plot(x,dchisq(x,3),type = "l")
abline(v=0.47,col = "gray60")
text(0.47,0,"0.47")
title("Chi Square distribution
      of freedom 3")
pchisq(0.47,3)

png("Figure_10-3-4.png")
plot(x,dchisq(x,3),type = "l")
abline(v=0.47,col = "gray60")
title("Chi Square distribution of freedom 3")
text(0.47,0,"0.47")
dev.off()


# Example 10.3.1
x=seq(0,10,0.1)
plot(x,dchisq(x,2),type = "l")
abline(v=1.84,col = "gray60")
text(1.84,0,"1.84")
title("Chi Square distribution
      of freedom 2")
pchisq(1.84,2)

png("Figure_Example-10-3-1.png")
x=seq(0,10,0.1)
plot(x,dchisq(x,2),type = "l")
abline(v=1.84,col = "gray60")
text(1.84,0,"1.84")
title("Chi Square distribution
      of freedom 2")
dev.off()


# Case Study 10.4.1
1-pchisq(6.401,3)

# Case Study 10.4.2
1-pchisq(25.98,6)

# Case Study 10.5.1
1-pchisq(45.37,4)

# Case Study 10.5.2
1-pchisq(4.57,1)
