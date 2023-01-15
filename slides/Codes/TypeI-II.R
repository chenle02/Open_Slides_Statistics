#! /usr/bin/Rscript
setwd("/home/lechen/Dropbox/Teaching/svn_teaching/2020_Spring_Math362/lectures/Codes")

PlotErrorFigure <- function(shift = 3.33, TwoSided = TRUE, FileName ) {
  
  png(FileName) # PNG File to save the plot.
  x <- seq(-4, 4, length=1000)
  hx <- dnorm(x, mean=0, sd=1)
  
  if (TwoSided){ # Determine the tile of the plot
    Title <- expression(paste(H['1'],": ", mu,"!=",  mu['0']))
  } else {
    Title <- expression(paste(H['1'],": ", mu,">",  mu['0']))
  }
  
  plot(x, hx, type="n", xlim=c(-4, 8), ylim=c(0, 0.5),  ylab = "", xlab = "",
       main= Title, axes=FALSE)
  axis(1, at = c(-qnorm(.025), 0, -4), 
       labels = expression("Cr. Value", 0, -infinity ))
  
  # shift = qnorm(1-0.025, mean=0, sd=1)*1.7 
  xfit2 <- x + shift
  yfit2 <- dnorm(xfit2, mean=shift, sd=1)
  
  # Print null hypothesis area
  col_null = "#DDDDDD"
  polygon(c(min(x), x, max(x)), c(0,hx,0), col=col_null)
  lines(x, hx, lwd=2)
  
  # The alternative hypothesis area
  ## The red - underpowered area
  lb <- min(xfit2)
  ub <- round(qnorm(.975),2)
  col1 = "#CC2222"
  i <- xfit2 >= lb & xfit2 <= ub
  polygon(c(lb,xfit2[i],ub), c(0,yfit2[i],0), col=col1)
  
  ## The green area where the power is
  col2 = "#22CC22"
  i <- xfit2 >= ub
  polygon(c(ub,xfit2[i],max(xfit2)), c(0,yfit2[i],0), col=col2)
  
  # Outline the alternative hypothesis
  lines(xfit2, yfit2, lwd=2)
    axis(1, at = (c(ub, max(xfit2))), labels=c("", expression(infinity)), 
       col=col2, lwd=1, lwd.tick=FALSE)
  
  # Now draw the type I error. 
  ## The right part.
  lines(x, hx, lwd=2)
  i <- x >= ub
  polygon(c(ub,x[i],max(x)), c(0,hx[i],0), col="blue")
  ## The left part in case of two sided test.
  if(TwoSided){
    i <- x <= -ub
    polygon(c(min(x),x[i],-ub), c(0,hx[i],0), col="blue")  
  }

  # Line at the P-value
  abline(v=ub, lwd=2, col="#000088", lty="dashed")
  
  # Put legend
  legend("topright", inset=.02, title="Color",
         c(expression(paste("Type I error: ", alpha)),
           expression(paste("Type II error: ", beta)), 
           "Power of test"), 
         fill=c("blue", col1, col2), horiz=FALSE)
  dev.off()
}

PlotErrorFigure(3,TRUE, "Type-I-II-TwoSided-3.png")
PlotErrorFigure(3,FALSE, "Type-I-II-OneSided-3.png")

PlotErrorFigure(2,TRUE, "Type-I-II-TwoSided-2.png")
PlotErrorFigure(2,FALSE, "Type-I-II-OneSided-2.png")

PlotErrorFigure(4,TRUE, "Type-I-II-TwoSided-4.png")
PlotErrorFigure(4,FALSE, "Type-I-II-OneSided-4.png")
