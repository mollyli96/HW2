# ===================================================================
# Title: HW02
# Description:
#   This script performs cleaning tasks and transformations on 
#   various columns of the raw data file.
# Input(s): court picture 
# Output(s): txt files; csv files, pdf
# Author: Molly Li
# Date: 03-01-2018
# ===================================================================

#load packages
library(ggplot2)
library(dplyr)
library(tibble)
library("jpeg")
library("grid")

#read data
stephen <- read.csv("data/stephen-curry.csv", stringsAsFactors = FALSE)
klay <- read.csv("data/klay-thompson.csv", stringsAsFactors = FALSE)
kevin <- read.csv("data/kevin-durant.csv", stringsAsFactors = FALSE)
draymond <- read.csv("data/draymond-green.csv", stringsAsFactors = FALSE)
andre <- read.csv("data/andre-iguodala.csv", stringsAsFactors = FALSE)

# scatterplot
klay_scatterplot <- ggplot(data = klay) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag))


# court image (to be used as background of plot)
court_file <- download.file("https://raw.githubusercontent.com/ucb-stat133/stat133-spring-2018/master/images/nba-court.jpg",
              '/Users/XuewenLi/desktop/133/hw02/images/nba-court.jpeg')


# create raste object
court_image <- rasterGrob(readJPEG( '/Users/XuewenLi/desktop/133/hw02/images/nba-court.jpeg'), width = unit(1, "npc"), height = unit(1, "npc"))

#4.1) Shot charts of each player (10 pts)

#example
klay_shot_chart <- ggplot(data = klay) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') + 
  theme_minimal()



# andre-iguodala-shot-chart.pdf 

andre_shot_chart <- ggplot(data = andre) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') + 
  theme_minimal()

pdf(file = "images/andre-iguodala-shot-chart.pdf ", width = 6.5, height = 5)
plot(andre_shot_chart)
dev.off()



# draymond-green-shot-chart.pdf 
draymond_shot_chart <- ggplot(data = draymond) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') + 
  theme_minimal()

pdf(file = "images/draymond-green-shot-chart.pdf ", width = 6.5, height = 5)
plot(draymond_shot_chart)
dev.off()

# kevin-durant-shot-chart.pdf 
kevin_shot_chart <- ggplot(data = kevin) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart:Kevin Durant (2016 season)') + 
  theme_minimal()

pdf(file = "images/kevin-durant-shot-chart.pdf ", width = 6.5, height = 5)
plot(kevin_shot_chart)
dev.off()

# klay-thompson-shot-chart.pdf 
klay_shot_chart <- ggplot(data = klay) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') + 
  theme_minimal()

pdf(file = "images/klay-thompson-shot-chart.pdf", width = 6.5, height = 5)
plot(klay_shot_chart)
dev.off()

# stephen-curry-shot-chart.pdf

stephen_shot_chart <- ggplot(data = stephen) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') + 
  theme_minimal()

pdf(file = "images/stephen-curry-shot-chart.pdf", width = 6.5, height = 5)
plot(stephen_shot_chart)
dev.off()

# 4.2) Facetted Shot Chart (10 pts)?????
igdtc <- rbind(andre,draymond,kevin,klay,stephen)
gsw_shot_charts <- ggplot(igdtc) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: GSW (2016 season)') + 
  theme_minimal()+
  facet_wrap(~name)

pdf(file = "images/stephen-curry-shot-chart.pdf", width = 8, height = 7)
plot(gsw_shot_charts)
dev.off()



