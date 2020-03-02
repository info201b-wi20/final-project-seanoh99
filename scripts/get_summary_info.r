library(dplyr)

## requires entities df
get_summary_info <- function(df) {
  observations <- nrow(df)

  biggest_advertiser <- sample %>%
    filter(advertiser != "") %>%
    group_by(advertiser) %>%
    summarise(total = n()) %>%
    filter(total == max(total)) %>%
    pull(advertiser)

  biggest_funder <- sample %>%
    filter(paid_for_by != "") %>%
    group_by(paid_for_by) %>%
    summarise(total = n()) %>%
    filter(total == max(total)) %>%
    pull(paid_for_by)

  most_advertised_org <- sample %>%
    filter(!is.na(Organization)) %>%
    group_by(Organization) %>%
    summarise(total = n()) %>%
    filter(total == max(total)) %>%
    pull(Organization)

  most_advertised_person <- sample %>%
    filter(!is.na(Person)) %>%
    group_by(Person) %>%
    summarise(total = n()) %>%
    filter(total == max(total)) %>%
    pull(Person)

  return(
    list(
      observations = observations,
      advertiser = biggest_advertiser,
      funder = biggest_funder,
      advertised_org = most_advertised_org,
      advertised_person = most_advertised_person
    )
  )
}
