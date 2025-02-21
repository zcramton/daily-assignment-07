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
url <- 'https://raw.githubusercontent.com/nytimes/covid-19-data/refs/heads/master/us-states.csv'
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
  filter(state %in% top_6_states) %>% 
  group_by(state, date) %>% 
  summarize(state_cases = sum(cases, na.rm = TRUE))

# Set up a gg plot
top_6_states_plot = ggplot(top_6_states_data, aes(x = date, y = state_cases, group = state, color = state)) +
  geom_line() +
  labs(
    title = "Cumulative Case Counts: COVID-19 Pandemic",
    caption = "Based on NY-Times COVID-19 Data.",
    x = "Date",
    y = "Number of Cases",
    color = "State"
    ) +
  facet_wrap(~state) + 
  theme_bw() +
  theme(
        axis.text.x = element_text(angle = 45, hjust = 1), 
        legend.position = "none"
        ) + 
  scale_x_date(date_breaks = "8 month", date_labels = "%b %y")

# Echo plot to dev env
top_6_states_plot

# Save the top_6_states_plot as an image
ggsave(top_6_states_plot, 
       file = "images\\top_6_state_cases_plot.jpg", 
       width = 10,
       height = 6,
       units = c("in")
       )

