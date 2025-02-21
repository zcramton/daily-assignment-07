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

#Prepare libraries
library(tidyverse)
library(dplyr)
library(ggplot2)

# Read-in and store NY-Times data
url <- 'https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties-recent.csv'
covid <- read_csv(url)

# Question 1
  
# Find the most recent date
max_date <- max(covid$date)
most_recent_data <- filter(covid, date == max_date)
  
# Get the 6 states with the most cases
top_6_states <- most_recent_data %>%
  arrange(desc(cases)) %>% 
  slice(1:6) %>% 
  pull(state)

# Filter data to the top 6 states
top_6_states_data <- covid %>% 
  filter(state %in% top_6_states)

# Set up a gg plot
ggplot(top_6_states_data, aes(x = date, y = cases, group = state, color = state)) +
  geom_line() +
  labs(
    title = "Cumulative Case Counts: COVID-19 Pandemic",
    caption = "Based on NY-Times COVID-19 Data.",
    x = "Date",
    y = "Number of Cases",
    color = "State"
    ) +
  facet_wrap(~state) + 
  theme_linedraw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) + 
  scale_x_date(date_breaks = "1 month", date_labels = "%b")
