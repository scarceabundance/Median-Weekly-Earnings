##### Load necessary packages #####
library(ggplot2)
library(dplyr)
library(readxl)
library(wesanderson)

##### Loading the Excel Tables ######
BLSHA_PEarnings <- read_excel("C:/Users/AGabrielClay/Desktop/personal projects/Unemployment Charawcteristic tables/Household Data Annual Averagessss.xlsx", 
                              sheet = "Percent_Earnings")
View(BLSHA_PEarnings)
# check your work

##### Strucutre of Data #####
str(BLSHA_PEarnings)
# or
ls.str(BLSHA_PEarnings)

##### PERCENT CHANGE IN EARNINGS/WORKERS #####
##### Earnings #####

ggplot(BLSHA_PEarnings, aes(fill=Race, y=Percent_Change, x="Period"), alpha("black", 0.5)) + 
  geom_col(position="dodge", width = 6, color="black")+
  facet_grid(~ Gender)+ 
  labs(title = "Percent Change in Median Weekly Earnings",
       subtitle = "(2016 - 2017)",
       caption = "Data: U.S. Bureau of Labor Statistics, Current Population Survey (CPS)")

