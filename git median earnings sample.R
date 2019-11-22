##### Load necessary packages #####
library(ggplot2)
library(dplyr)
library(readxl)
library(wesanderson)
library(usethis)

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

ggplot(BLSHA_PEarnings, aes(fill=Race, y=Percent_Change, x=Period), alpha("black", 0.5)) + 
  geom_col(position="dodge", width = 6, color="black")+
  facet_grid(~ Gender)+ 
  labs(title = "Percent Change in Median Weekly Earnings",
       subtitle = "(2016 - 2017)",
       caption = "Data: U.S. Bureau of Labor Statistics, Current Population Survey (CPS)")

##### Changing Plot Detail #####
##### Changing color palette #####

g <- ggplot(BLSHA_PEarnings, aes(fill=Race, y=Percent_Change, x=Period), alpha("black", 0.5)) + 
  geom_col(position="dodge", width = 6, color="black")+
  facet_grid(~ Gender)+ 
  labs(title = "Percent Change in Median Weekly Earnings (by Race & Gender)",
       subtitle = "(2016 - 2017)",
       caption = "Data: U.S. Bureau of Labor Statistics, Current Population Survey (CPS)") +
  theme(panel.grid.major = element_line(linetype = "dotted"), legend.background = element_rect(
    fill = "lemonchiffon", colour = "grey50", size = 1), 
    strip.background = element_rect(fill = "grey20", color = "grey80", size = 1),
    strip.text = element_text(colour = "white")
  )
p <- g + scale_fill_manual(values = wes_palette("Chevalier1")) +
  guides(fill = guide_legend(ncol = 2, byrow = TRUE, reverse = TRUE))

p
