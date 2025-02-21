# Zachary Cramton
# 20 Feburary 2025
# ESS 330 - Daily Assignment 07
# This is the R script for assignment 07 where the COVID-19 data from 
# assignment 06 will be visualized.

## COVID-19 Data

### Data

# We are going to practice some data wrangling skills using a real-world 
# data set about COVID cases curated and maintained by the New York Times. The
# data are archived on a GitHub repo [here](https://github.com/nytimes/covid-19-data). 

# Read-in and store NY-Times data
library(tidyverse)
library(dplyr)
url = 'https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties-recent.csv'
covid = read_csv(url)

# Find the most recent date
max_date <- max(covid$date)
most_recent_data <- filter(covid, date == max_date)

# Get the 5 counties with the most cases
top_6_states_cases <- most_recent_data %>%
  arrange(desc(cases)) %>% 
  slice(1:6)

top_6_state_cases


