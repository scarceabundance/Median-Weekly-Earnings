##### Load necessary packages #####
library(ggplot2)
library(dplyr)
library(readxl)
library(wesanderson)
library(usethis)

##### Loading the Excel Tables ######

# % change in Earnings #
BLSHA_PEarnings <- read_excel("C:/Users/AGabrielClay/Desktop/personal projects/Unemployment Charawcteristic tables/Household Data Annual Averagessss.xlsx", 
                              sheet = "Percent_Earnings")
# Change in Earnings #
BLSHA_Earnings <- read_excel("C:/Users/AGabrielClay/Desktop/personal projects/Unemployment Charawcteristic tables/Household Data Annual Averagessss.xlsx", 
                             sheet = "Earnings")
# % change in workers #
BLSHA_PWorkers <- read_excel("C:/Users/AGabrielClay/Desktop/personal projects/Unemployment Charawcteristic tables/Household Data Annual Averagessss.xlsx", 
                             sheet = "Percent_Workers")
# Change in workers # 
BLSHA_Workers <- read_excel("C:/Users/AGabrielClay/Desktop/personal projects/Unemployment Charawcteristic tables/Household Data Annual Averagessss.xlsx", 
                            sheet = "Workers")


##### Strucutre of Data #####
str(BLSHA_PEarnings)
# or
ls.str(BLSHA_PEarnings)


##### PERCENT CHANGE IN EARNINGS/WORKERS #####
## same code can be used for all BLSHA objects in envrionment, simply change the "data = [object name]" argument in ggplot
## and aes arguments as needed

## EX:
## ggplot(data = BLSHA_Workers, aes(fill = ...)) 
## or
## ggplot(BLSHA_Workers, aes(fill= ... ))


##### % change in Earnings #####

ggplot(BLSHA_PEarnings, aes(fill=Race, y=Percent_Change, x=Period), alpha("black", 0.5)) + 
  geom_col(position="dodge", width = 6, color="black")+
  facet_grid(~ Gender)+ 
  labs(title = "Percent Change in Median Weekly Earnings",
       subtitle = "(2016 - 2017)",
       caption = "Data: U.S. Bureau of Labor Statistics, Current Population Survey (CPS)")

##### % change in workers #####

ggplot(BLSHA_PWorkers, aes(fill=Race, y=Percent_Change, x=Period), alpha("black", 0.5)) + 
  geom_col(position="dodge", width = 6, color="black")+
  facet_grid(~ Gender)+ 
  labs(title = "Percent Change in Workers",
       subtitle = "(2016 - 2017)",
       caption = "Data: U.S. Bureau of Labor Statistics, Current Population Survey (CPS)")

##### Changing Plot Detail #####
##### Changing color palette #####

g <- ggplot(BLSHA_PEarnings, aes(fill=Race, y=Change, x=Period), alpha("black", 0.5)) + 
  geom_col(position="dodge", width = 6, color="black")+
  facet_grid(~ Gender)+ 
  labs(title = "Percent Change in Median Weekly Earnings (by Race & Gender)",
       subtitle = "(2016 - 2017)",
       caption = "Data: U.S. Bureau of Labor Statistics, Current Population Survey (CPS)") +
  theme(panel.grid.major = element_line(linetype = "dotted"), legend.background = element_rect(
    fill = "lemonchiffon", colour = "grey50", size = 1), 
    strip.background = element_rect(fill = "grey20", color = "grey80", size = 1),
    strip.text = element_text(colour = "white", size = 13)
  )

p <- g + scale_fill_manual(values = wes_palette("Chevalier1")) +
  guides(fill = guide_legend(ncol = 2, byrow = TRUE, reverse = TRUE)) + 
  scale_y_continuous(quote("Change in dollars"))

p

