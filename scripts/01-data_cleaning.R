#### Preamble ####
# Purpose: Clean the cyberattack dataset for analysis on cyber breaches
# Author: Shivank Goel
# Date: 22 March 2024 
# Contact: shivankg.goel@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(tidyr)
library(janitor)
library(lubridate)
library(readxl)
library(arrow)
library(dplyr)

library(stringr)  

#### Clean data ####

# Reading dataset
df  <- read.csv("data/raw_data/STA305 Dataset.csv")


df_long_game <- df %>%
  pivot_longer(
    cols = c(game_before, game_after),
    names_to = "time",
    values_to = "game_score"
  ) %>%
  mutate(
    # Convert "game_before" => "Before", "game_after" => "After"
    time = ifelse(time == "game_before", "Before", "After")
  )


df_long_cards <- df %>%
  pivot_longer(
    cols = c(cards_before, cards_after),
    names_to = "time",
    values_to = "cards_score"
  ) %>%
  mutate(
    time = ifelse(time == "cards_before", "Before", "After")
  )


# Saving cleaned data
write.csv(df, file = "data/analysis_data/clean_data.csv", row.names = FALSE)

