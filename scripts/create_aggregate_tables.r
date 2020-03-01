library(dplyr)
library(tidyr)
library(jsonlite)

source("expand_targets.r")

create_aggregate_tables <- function(df) {
  df <- expand_targets(df)

  by_target_age <- sample %>%
    filter(!is.na(Age)) %>%
    group_by(Age) %>%
    summarise(total = n())

  by_target_region <- sample %>%
    filter(!is.na(Region)) %>%
    group_by(Region) %>%
    summarise(total = n()) %>%
    arrange(-total)
}
