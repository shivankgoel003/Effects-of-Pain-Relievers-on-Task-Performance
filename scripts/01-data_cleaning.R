#### Preamble ####
# Purpose: Clean the cyberattack dataset for analysis on cyber breaches
# Author: Shivank Goel
# Date: 22 March 2024 
# Contact: shivankg.goel@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(janitor)
library(lubridate)
library(readxl)
library(arrow)
library(dplyr)

library(stringr)  

#### Clean data ####

# Reading dataset
df  <- read.csv("data/raw_data/STA305 Dataset.csv")

# Reshape data for repeated anova measure 
clean_data_long <- df %>%
  pivot_longer(
    cols = c(game_before, game_after, cards_before, cards_after),
    names_to = c(".value", "Time"),
    names_sep = "_"
  )



# Numeric value of time begore /after as 0/1 fr making plots
clean_data_long <- clean_data_long %>%
  mutate(Time_numeric = factor(Time, levels = c("before", "after"), labels = c(0, 1)))

clean_data_long <- clean_data_long %>%
  mutate(Time_numeric = as.numeric(as.character(Time_numeric)))


clean_data_long <- clean_data_long %>%
  select(name, drug, dosage_level, Time, Time_numeric, game, cards, location, age, age_group)


clean_data_long <- clean_data_long %>%
  rename(
    Name = name,
    Drug = drug,
    DosageLevel = dosage_level,
    Time = Time,
    TimeNumeric = Time_numeric,
    GameScore = game,
    CardScore = cards,
    Location = location,
    Age = age,
    AgeGroup = age_group
  )


<<<<<<< HEAD
# Saving cleaned data
write.csv(clean_data_long, file = "data/analysis_data/clean_data.csv", row.names = FALSE)

=======
>>>>>>> Vanshika
