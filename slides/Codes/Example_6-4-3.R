#! /usr/bin/Rscript
setwd("/home/lechen/Dropbox/Teaching/svn_teaching/2020_Spring_Math362/lectures/Codes")


PlotPoissonTable <- function(n=14,lambda=3.2,png_filename,TableTitle) {
  library(gridExtra) 
  library(grid)
  library(gtable)
  x=seq(0,n,1)
  # qpois(0.90,lambda)
  options("scipen"=999, "digits"=4)
  tb = cbind(x,
             round(dpois(x,lambda),4),
             round(ppois(x,lambda),4),
             round(1-ppois(x,lambda),4),
             round(c(1,(1-ppois(x,lambda))[1:n]),4))
  colnames(tb) <- c("k",
                    "P(X=k)",
                    "P(X<= k)",
                    "P(X>k)",
                    "P(X>=k)")
  rownames(tb) <-x
  table <- tableGrob(tb,rows = NULL)
  title <- textGrob(TableTitle,
                    gp=gpar(fontsize=12))
  footnote <- textGrob(paste("Poisson lambda=",lambda), 
                       x=0, hjust=0,
                       gp=gpar( fontface="italic"))
  padding <- unit(0.2,"line")
  table <- gtable_add_rows(table, 
                           heights = grobHeight(title) + padding,
                           pos = 0)
  table <- gtable_add_rows(table, 
                           heights = grobHeight(footnote)+ padding)
  table <- gtable_add_grob(table, list(title, footnote),
                           t=c(1, nrow(table)), l=c(1,2), 
                           r=ncol(table))
  png(png_filename)
  # grid.newpage()
  grid.draw(table)
  dev.off()
}

PlotPoissonTable(14,3.2,"Example_6-4-3_1.png","Finding critical region")
PlotPoissonTable(20,4.8,"Example_6-4-3_2.png","Computing power of test")