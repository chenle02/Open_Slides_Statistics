#! /usr/bin/Rscript
setwd("/home/lechen/Dropbox/Teaching/svn_teaching/2020_Spring_Math362/lectures/Codes")
png('Bernoulli.png')
p <- seq(0,1,0.01)
plot(p,p^2*(1-p),
     type="l",
     col="red")
title("Likelihood")
# add a vertical dotted (4) blue line
abline(v=0.67, col="blue", lty=4) 
# add some text
text(0.67,0.01, "2/3") 
dev.off() 

# Now this is the example for the geometric distribution.
# The following function draw the results
PlotResults <- function(p=0.3,pe=0.32,tb,file_name) {
  # Load several libraries to print table
  library(gridExtra) 
  library(grid)
  library(gtable)
  n = sum(tb[,2])
  colnames(tb) <- c("k",
                   "Observed frequency",
                   "Predicted frequency")
  table <- tableGrob(tb,rows = NULL)
  title <- textGrob(paste("MLE for Geom. Distr. of sample size n = ", n),gp=gpar(fontsize=12))
  if (is.numeric(p)) {
    p <- round(p,4)
  }
  footnote <- textGrob(paste("Real p  =", p, " and MLE for p = ", round(pe,4)), x=0, hjust=0,
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
  grid.newpage()
  grid.draw(table)
  
  pdf('temp.pdf')
  # grid.table(d) # Show the table
  grid.newpage()
  grid.draw(table)
  dev.off()
  system(paste("pdfcrop temp.pdf ", file_name))
}

# The example from the book.
library(pracma) # Load the library "Practical Numerical Math Functions"
k<-c(72, 35, 11, 6,2, 2) # observed freq.
a=1:6
pe=sum(k)/dot(k,a) # MLE for p.
f=a
for (i in 1:6) {
  f[i] = round((1-pe)^(i-1) * pe * sum(k),2)
}
# Initialize the table
d <-matrix(1:18, nrow = 6, ncol = 3)
# Now adding the column names
colnames(d) <- c("k",
                 "Observed freq.",
                 "Predicted freq.")
d[1:6,1]<-a
d[1:6,2]<-k
d[1:6,3]<-f
# pdf('temp.pdf')
grid.table(d) # Show the table
# dev.off()
# system("pdfcrop temp.pdf Geometric.pdf")
PlotResults("unknown",pe,d,"Geometric.pdf")

# Now let's generate random samples from a Geometric distribution with p=1/3 with the same size of the sample.
p = 1/3
n = 128
gdata<-rgeom(n, p)+1 # Generate random samples
g<- table(gdata) # Count frequency of your data.
g<- t(rbind(as.numeric(rownames(g)), g)) # Transpose and combine two columns. 
pe=n/dot(g[,1],g[,2]) # MLE for p.
f <- g[,1] # Initialize f
for (i in 1:nrow(g)) {
  f[i] = round((1-pe)^(i-1) * pe * n,2)
} # Compute the expected frequency
g<-cbind(g,f) # Add one columns to your matrix.
colnames(g) <- c("k",
                 "Observed freq.",
                 "Predicted freq.") # Specify the column names.
d_df <- as.data.frame(d) # One can use data frame to store data
d_df # Show data on your terminal
PlotResults(p,pe,g,"Geometric2.pdf") # Out put the results using a user defined function

# Try a large sample size.
p = 1/3
n = 300
gdata<-rgeom(n, p)+1
g<- table(gdata)
g<- t(rbind(as.numeric(rownames(g)), g))
pe=n/dot(g[,1],g[,2]) # MLE for p.
f <- g[,1]
for (i in 1:nrow(g)) {
  f[i] = round((1-pe)^(i-1) * pe * n,2)
}
g<-cbind(g,f)
colnames(g) <- c("k",
                 "Observed freq.",
                 "Predicted freq.")
d_df <- as.data.frame(d)
d_df
PlotResults(p,pe,g,"Geometric3.pdf")

# Try a large sample size.
p = 1/3
n = 3000
gdata<-rgeom(n, p)+1
as.data.frame(table(gdata))
g<- table(gdata)
g<- t(rbind(as.numeric(rownames(g)), g))
pe=n/dot(g[,1],g[,2]) # MLE for p.
f <- g[,1]
for (i in 1:nrow(g)) {
  f[i] = round((1-pe)^(i-1) * pe * n,2)
}
g<-cbind(g,f)
colnames(g) <- c("k",
                 "Observed freq.",
                 "Predicted freq.")
d_df <- as.data.frame(d)
d_df
PlotResults(p,pe,g,"Geometric4.pdf")


# Case Study 5.2.2
k<- rnbinom(100,12,0.391)
hist(k)

k<- rnbinom(100,10,0.5)
hist(k)


