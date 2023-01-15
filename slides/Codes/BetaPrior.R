#!/usr/bin/env Rscript

setwd("/home/lechen/Dropbox/Teaching/svn_teaching/2020_Spring_Math362/lectures/Codes")
x <- seq(0, 1, length = 1025)
plot(x,dbeta(x,4,102),
     type="l")
plot(x,dbeta(x,7,193),
     type="l")
dev.off()

pdf=cbind(dbeta(x,4,102),dbeta(x,7,193))
matplot(x,pdf,
        type="l",
        lty = 1:2,
        xlab = "theta", ylab = "PDF",
        lwd = 2 # Line width
        )
legend(0.2, 25, # Position of legend
       c("Beta(4,102)", "Beta(7,193)"), 
       col = 1:2, lty = 1:2,
       ncol = 1, # Number of columns 
       cex = 1.5, # Fontsize
       lwd=2 # Line width
       )
abline(v=0.07,col="blue", lty=1,lwd=1.5)
text(0.07, -0.5, "0.07") 
abline(v=0.035,col="black", lty=3,lwd=2)
text(0.035,1, "0.035") 
dev.off()

## The following codes save the figure in a pdf file.
pdf("BetaPrior.pdf")
pdf=cbind(dbeta(x,4,102),dbeta(x,7,193))
matplot(x,pdf,
        type="l",
        lty = 1:2,
        xlab = "theta", ylab = "PDF",
        lwd = 2 # Line width
)
legend(0.2, 25, # Position of legend
       c("Beta(4,102)", "Beta(7,193)"), 
       col = 1:2, lty = 1:2,
       ncol = 1, # Number of columns 
       cex = 1.5, # Fontsize
       lwd=2 # Line width
)
abline(v=0.07,col="blue", lty=1,lwd=1.5)
text(0.07, -0.5, "0.07") 
abline(v=0.035,col="black", lty=3,lwd=2)
text(0.035, 1, "0.035") 
dev.off()
system(paste("pdfcrop BetaPrior.pdf BetaPrior.pdf"))


## The following codes save the figure in a pdf file.
pdf("BetaPriorPosterior.pdf")
x <- seq(0, 0.1, length = 1025)
pdf=cbind(dbeta(x,7,193),dbeta(x,9,201))
matplot(x,pdf,
        type="l",
        lty = 1:2,
        xlab = "theta", ylab = "PDF",
        lwd = 2 # Line width
)
legend(0.04, 25, # Position of legend
       c("Posterior Beta(9,201)", "Prior Beta(7,193)"), 
       col = 1:2, lty = 1:2,
       ncol = 1, # Number of columns 
       cex = 1.5, # Fontsize
       lwd=2 # Line width
)
abline(v=0.07,col="blue", lty=1,lwd=1.5)
text(0.07, -0.5, "0.07") 
abline(v=0.035,col="black", lty=3,lwd=2)
text(0.035, 1, "0.035") 
dev.off()
system(paste("pdfcrop BetaPriorPosterior BetaPriorPosterior"))
