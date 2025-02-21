# Zachary Cramton
# 20 Feburary 2025
# ESS 330 - Daily Assignment 07
# This is the R script for assignment 07 where the COVID-19 data from 
# assignment 06 will be visualized.

## COVID-19 Data

### Data

# We are going to practice some data wrangling skills using a real-world 
# dataset about COVID cases curated and maintained by the New York Times. The
# data are archived on a GitHub repo [here](https://github.com/nytimes/covid-19-data). 
```
{r, eval = FALSE}
https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties-recent.csv


# Read-in and store NY-Times data
```{r, message=FALSE, warning=FALSE}
library(tidyverse)
url = 'https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties-recent.csv'
covid = read_csv(url)
head(covid, 5)
```
