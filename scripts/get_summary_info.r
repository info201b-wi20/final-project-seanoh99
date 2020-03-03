library(dplyr)

## requires entities df
get_summary_info <- function(df) {
  observations <- nrow(df)
  
  biggest_advertiser <- df %>%
    filter(advertiser != "") %>%
    group_by(advertiser) %>%
    summarise(total = n()) %>%
    filter(total == max(total)) %>%
    pull(advertiser)
  
  biggest_funder <- df %>%
    filter(paid_for_by != "") %>%
    group_by(paid_for_by) %>%
    summarise(total = n()) %>%
    filter(total == max(total)) %>%
    pull(paid_for_by)

  political_count <- df %>%
    filter(!is.na(political)) %>%
    nrow()
  non_political_count <- df %>%
    filter(!is.na(not_political)) %>%
    nrow()
  return(
    list(
      observations = observations,
      advertiser = biggest_advertiser,
      funder = biggest_funder,
      political_percentage = political_count / (political_count + non_political_count) * 100
    )
  )
}

## Code is problematic, I'll fix later -Michael
## most_advertised_org <- df %>%
##  filter(!is.na(Organization)) %>%
##  group_by(Organization) %>%
##  summarise(total = n()) %>%
##  filter(total == max(total)) %>%
##  pull(Organization)

##most_advertised_person <- df %>%
##  filter(!is.na(Person)) %>%
##  group_by(Person) %>%
##  summarise(total = n()) %>%
##  filter(total == max(total)) %>%
##  pull(Person)
