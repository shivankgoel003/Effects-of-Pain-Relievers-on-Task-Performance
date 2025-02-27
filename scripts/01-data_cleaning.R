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

#### Clean data ####

# Reading dataset
df  <- read.csv("data/raw_data/STA305 Dataset.csv")
df$name <- trimws(df$name)  # Removes extra spaces
df$drug_dosage <- trimws(df$drug_dosage)  # Cleans up drug_dosage

sum(is.na(df$name))  # Check for missing names before split


# Separate the 'drug_dosage' column into 'drug' and 'dosage_level'
df <- df %>%
  separate(drug_dosage, into = c("drug", "dosage_level"), sep = "_") %>%
  select(name, drug, dosage_level, everything())  # Reorder columns

sum(is.na(df$name))  # Check for missing names before split

# Saving cleaned data
write.csv(df, file = "data/analysis_data/clean_data.csv", row.names = FALSE)

