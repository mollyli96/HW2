# ===================================================================
# Title: HW02
# Description:
#   This script performs cleaning tasks and transformations on 
#   various columns of the raw data file.
# Input(s): 5 data files downloaded
# Output(s): txt files
# Author: Molly Li
# Date: 03-01-2018
# ===================================================================
  

curry <- read.csv("data/stephen-curry.csv", stringsAsFactors = FALSE)
thompson <- read.csv("data/klay-thompson.csv", stringsAsFactors = FALSE)
durant <- read.csv("data/kevin-durant.csv", stringsAsFactors = FALSE)
green <- read.csv("data/draymond-green.csv", stringsAsFactors = FALSE)
iguodala <- read.csv("data/andre-iguodala.csv", stringsAsFactors = FALSE)

## 2.1) Download the data
#Done

## 2.2) Data Dictionary (10 pts)
#Done


## 3) Data Preparation (20 pts)

library(ggplot2)
library(dplyr)
library(tibble)

#Add a column name to each imported data frame, that contains the name of the corresponding player
iguodala <- mutate(iguodala, name = "Andre Iguodala")
green <- mutate(green, name = "Graymond Green")
durant <-  mutate(durant, name = "Kevin Durant")
thompson <-  mutate(thompson, name = "Klay Thompson")
curry <- mutate(curry, name = "Stephen Curry")

#Change the original values of shot_made_flag to more descriptive values: replace "n" with "missed shot", and "y" with "made shot".

#iguodala
iguodala$shot_made_flag[iguodala$shot_made_flag=="n"]="missed shot"
iguodala$shot_made_flag[iguodala$shot_made_flag=="y"]="made shot"

#green
green$shot_made_flag[green$shot_made_flag=="n"]="missed shot"
green$shot_made_flag[green$shot_made_flag=="y"]="made shot"

#durant
durant$shot_made_flag[durant$shot_made_flag=="n"]="missed shot"
durant$shot_made_flag[durant$shot_made_flag=="y"]="made shot"

#thompson
thompson$shot_made_flag[thompson$shot_made_flag=="n"]="missed shot"
thompson$shot_made_flag[thompson$shot_made_flag=="y"]="made shot"

#curry
curry$shot_made_flag[curry$shot_made_flag=="n"]="missed shot"
curry$shot_made_flag[curry$shot_made_flag=="y"]="made shot"



#Add a column minute that contains the minute number where a shot occurred.
iguodala <- mutate(iguodala, minute =((iguodala$period-1) *12 + (12-iguodala$minutes_remaining)))
green <- mutate(green, minute =((green$period-1) *12 + (12-green$minutes_remaining)))
durant <- mutate(durant, minute =((durant$period-1) *12 + (12-durant$minutes_remaining)))
thompson <- mutate(thompson, minute =((thompson$period-1) *12 + (12-thompson$minutes_remaining)))
curry <- mutate(curry, minute =((curry$period-1) *12 + (12-curry$minutes_remaining)))

#Use sink() to send the summary() 
#output of each imported data frame into individuals text files

sink(file = 'output/andre-iguodala-summary.txt')
summary(iguodala)
sink()

sink(file = 'output/draymond-green-summary.txt')
summary(green)
sink()

sink(file = 'output/kevin-durant-summary.txt')
summary(durant)
sink()

sink(file = 'output/klay-thompson-summary.txt')
summary(thompson)
sink()

sink(file = 'output/stephen-curry-summary.txt')
summary(curry)
sink()

#Use the row binding function rbind() to stack 
#the tables into one single data frame (or tibble object).
assembled_table <- rbind(iguodala,green, durant,thompson,curry)
assembled_table

#Export (i.e. write) the assembled table as a CSV 
#file shots-data.csv inside the folder data/
#Use a relative path for this operation.

sink(file = 'data/shots-data.csv')
str(assembled_table)
sink()

#Use sink() to send the summary() output of 
#the assembled table. Send this output to
#a text file named shots-data-summary.txt
#nside the output/ folder. Use a relative 
#path when exporting the R output.

sink(file = 'output/shots-data-summary.txt')
summary(assembled_table)
sink()

