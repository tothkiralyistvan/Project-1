# Placeholder for the R code associated with this project.
# To be replaced later on with updated code.

# Libraries
library(haven)
library(tidyverse)
library(janitor)
library(sjmisc)
library(sjstats)
library(psych)
library(summarytools)
library(skimr)

# Read in data
data1 <- read_sav("location")

# Explore data
View(data1)
names(data1)
summary(data1)

# Frequencies of variables that need recoding based on summary()
freq(data1$age)

# Recode age
data1 <- data1 %>% 
  mutate(age = ifelse(age < 18 | age > 74, NA, age))
