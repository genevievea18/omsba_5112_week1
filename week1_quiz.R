library(tidyverse)
library(haven)
nfhs <- read_dta("IAHR52FL.dta")

#Q 3:
  #subset the data so that you only keep the variables between "hhid" and "shstruc". 
  #How many variables are you left with now?
new_df <- nfhs %>%
  select(hhid:shstruc)
  #196 variables left in new_df


