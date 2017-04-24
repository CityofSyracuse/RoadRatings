setwd("S:/Data Research/DPW/weighted street selection")
DPW.StreetSelection <- 
  read.csv("DPW_RoadSelection_Unspervised.csv")

library("cluster")
library("factoextra")
library("ggplot2")

DPW.StreetSelection[is.na(DPW.StreetSelection)] <- 2

streetCluster <- kmeans(DPW.StreetSelection[,3:8], 3, nstart = 20)
streetCluster
streetCluster$withinss

table(streetCluster$cluster)

streetCluster$cluster <- as.factor(streetCluster$cluster)
ggplot(DPW.StreetSelection, aes(Petal.Length, Petal.Width, color = iris$cluster)) + geom_point()