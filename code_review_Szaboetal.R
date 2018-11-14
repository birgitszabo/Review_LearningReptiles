##############################################################
#                            Data                            #
##############################################################

setwd("~/Documents/MacquarieUni/Macquarie/Meta-Analysis/Analysis/Review/Review_LearningReptiles")
raw<-read.csv("data/DiscriptiveAllReptiles_final.csv", as.is=TRUE)
str(raw)
raw<-as.data.frame(unclass(raw))

##############################################################
#                            Plot                            #
##############################################################

# create table including number of studies for each order and year class
studies<-aggregate(raw$order.1,list(raw$year.class,raw$order.1),length)
studies_table<-xtabs(studies$x~studies$Group.2+studies$Group.1)
# calculate cummulative sums
year_sums<-cumsum(colSums(studies_table))

# save plot as tiff
tiff('figures/order_comp_studies.tiff', width=1000, height=1000, pointsize=30, compression = 'none')

# increase line width and increase right margin to include axis lable in plot
par(lwd = 2, mar = c(5,5,1,5))
# barplot, linewidth 2, horizontal axis labels, greyscale for order, no x-axis
x <- barplot(studies_table, lwd = 2, las = 2, col = c("grey31","grey55","grey77","grey94"), 
             xaxt = "n", ylim = c(0,40))
# left y-axis label
mtext("Number of studies", side = 2, line = 3)
# x-axis,  length -1:9 (-1: to asure that it meets the y-axis on the left),
# no tick marks and no lables
axis(1, lwd = 2, at = -1:9, lwd.ticks = 0, labels = FALSE)
# x-axis lables position and angle
text(x = x-.23, y=-3.5, colnames(studies_table), xpd = TRUE, srt = 35)

# Plot cummulative sums as line on top of barplot
par(new = TRUE, lwd = 2, mar = c(5,5,1,5))
# lineplot, no axes, no annotation, linewidth 3
plot(x = x, y = year_sums, type = "l", axes = FALSE, ann = FALSE, lwd = 3, ylim = c(5,145))
# right hand y-axis, lables horizontal
axis(4, at = seq(0,150,10), lwd = 2, las = 2)
# right y-axis label
mtext("Cumulative number of studies", side = 4, line = 3, las = 3)
# legend of the barplot, with no box around the text
legend(x = 0.5, y = 155, legend = rownames(studies_table), 
       fill=c("grey31","grey55","grey77","grey94"), border = 1, bty = 'n')
# end plotting
dev.off()


