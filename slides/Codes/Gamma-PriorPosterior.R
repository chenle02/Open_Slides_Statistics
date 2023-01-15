#! /usr/bin/Rscript
setwd("/home/lechen/Dropbox/Teaching/svn_teaching/2020_Spring_Math362/lectures/Codes")
x <- seq(0, 4, length = 1025)
plot(x,dgamma(x, shape = 88, rate = 50),
     type="l")
dev.off()

pdf=cbind(dgamma(x, shape = 88,rate = 50),
          dgamma(x, shape = 88+92,rate = 100),
          dgamma(x, shape = 88+92+72, rate =150))
matplot(x,pdf,
        type="l",
        lty = c(1,2,4),
        xlab = "theta", ylab = "PDF",
        lwd = 3 # Line width
)
legend(2, 3.5, # Position of legend
       c("Prior Gamma(88,50)",
         "Posterior1 Beta(180,100)",
         "Posterior2 Beta(252,150)"),
       col = 1:3, lty = c(1,2,4),
       ncol = 1, # Number of columns
       cex = 1, # Fontsize
       lwd=3 # Line width
)
dev.off()

## The following codes save the figure in a pdf file.
pdf("GammaPriorPosterior.pdf")
pdf=cbind(dgamma(x,88,rate = 50),
          dgamma(x,88+92,100),
          dgamma(x,88+92+72,150))
matplot(x,pdf,
        type="l",
        lty = c(1,2,4),
        xlab = "theta", ylab = "PDF",
        lwd = 3 # Line width
)
legend(2, 3.5, # Position of legend
       c("Prior Gamma(88,50)",
         "Posterior1 Beta(180,100)",
         "Posterior2 Beta(252,150)"),
       col = 1:3, lty = c(1,2,4),
       ncol = 1, # Number of columns
       cex = 1, # Fontsize
       lwd = 3 # Line width
)
dev.off()
system(paste("pdfcrop GammaPriorPosterior GammaPriorPosterior"))


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


