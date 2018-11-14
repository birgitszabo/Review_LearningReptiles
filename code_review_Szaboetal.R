##############################################################
#                            Data                            #
##############################################################

setwd("~/Documents/MacquarieUni/Macquarie/Meta-Analysis/Analysis/Review/Review_LearningReptiles")
raw<-read.csv("data/DiscriptiveAllReptiles_final.csv", as.is=TRUE)
str(raw)
raw<-as.data.frame(unclass(raw))


