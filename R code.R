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
