library(tidyverse)
library(haven)
nfhs <- read_dta("IAHR52FL.dta")

#Q 3:
  #subset the data so that you only keep the variables between "hhid" and "shstruc". 
  #How many variables are you left with now?
new_df <- nfhs %>%
  select(hhid:shstruc)
  #196 variables left in new_df

#Q 4 
  #Plot the distribution of the number of listed household members for the entire sample 
ggplot(data = nfhs, mapping = aes(x = hv009)) + 
  geom_histogram( binwidth = 1, fill = "pink", col = "black") +
  xlab("Number of Household Members")

#Create a new data frame that contains only urban households
urban_households_df <- nfhs %>%
  select(hhid:shstruc) %>%
  filter(hv025 == 1)

#Q 5
  #Create a boxplot plot that shows the distribution of household size by type of urban area. 
urban_households_df <- as_factor(urban_households_df)


ggplot(data = urban_households_df) +
  geom_boxplot(mapping = aes(x=hv026, y= hv009)) +
  xlab("Type of Urban Areas") +
  ylab("Household Size")

#Q 6
  #Find the means and medians of the number of household members by type of urban area. 
urban_households_df %>%
  group_by(hv026) %>%
  summarise(median(hv009))

urban_households_df %>%
  group_by(hv026) %>%
  summarise(mean(hv009))      
            