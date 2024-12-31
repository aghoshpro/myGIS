# define 3 data sets
xdata <- c(1,2,3,4,5,6,7)
y1 <- c(1,4,9,16,25,36,49)
y2 <- c(1, 5, 12, 21, 34, 51, 72)
y3 <- c(1, 6, 14, 28, 47, 73, 106 )

# plot the first curve by calling plot() function
# First curve is plotted
plot(xdata, y1, type="o", col="blue", pch="o", lty=1, ylim=c(0,110), ylab="y" )

# Add second curve to the same plot by calling points() and lines()
# Use symbol '*' for points.
points(xdata, y2, col="red", pch="*")
lines(xdata, y2, col="red",lty=2)

# Add Third curve to the same plot by calling points() and lines()
# Use symbol '+' for points.
points(xdata, y3, col="dark red",pch="+")
lines(xdata, y3, col="dark red", lty=3)

# Adding a legend inside box at the location (2,40) in graph coordinates.
# Note that the order of plots are maintained in the vectors of attributes.
legend(1,100,legend=c("y1","y2","y3"), col=c("blue","red","black"),
       pch=c("o","*","+"),lty=c(1,2,3), ncol=1)