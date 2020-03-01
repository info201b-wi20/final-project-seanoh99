library(dplyr)
library(tidyr)
library(jsonlite)

expand_targets <- function(df) { # ex. expand(sample_of_df)
  l <- lapply(df[, "targets"], function(x) {
    tryCatch(
      {
        fromJSON(x)
      },
      error = function(e) NA
    )
  })
  l <- lapply(l, function(x) {
    tryCatch(
      {
        spread(x, key = target, value = segment)
      },
      error = function(e) data.frame()
    )
  })
  names(l) <- df$id
  df_to_join <- bind_rows(l2, .id = "id")
  df <- full_join(df, df_to_join)
  return(df)
}
