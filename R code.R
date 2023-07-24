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

# Frequencies of variables that need recoding based on summary()
freq(data1$relationship)

# Recode relationship status
data1 <- data1 %>% 
  mutate(relationship = ifelse(relationship > 3, NA, relationship))

# Recode the 'iden' outlier values to NAs
data1 <- data1 %>%
  mutate_at(
    vars(iden1, iden2, iden3, iden5),
    ~ ifelse(. < 1 | . > 7, NA, .))

# Get frequencies for select variables to verify changes
data1 %>% 
  select(att3, att4, att5) %>% 
  mutate_all(as.factor) %>% 
  freq()

# Get frequencies for all variables to verify them
data1 %>% 
  select(att3, att4, att5) %>% 
#  mutate_all(as.factor) %>% 
  freq()

# create variable lists for documentation and computation of averages
list_persis <- c("att4", "att5", "att6")
list_identi <- c("iden1", "iden2", "iden3")
list_socint <- c("off2", "off3", "off4")
list_overus <- c("over1", "over3", "over4")
list_selfde <- c("self1", "self2", "self6")
