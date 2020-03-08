library(dplyr)
library(stringr)
library(shiny)
source("scripts/expand_targets.r")
source("scripts/target.r")

# check if there is access to full data
df <- tryCatch(
  {
    read.csv("data/fbpac-ads-en-US.csv", stringsAsFactors = FALSE)
  },
  error = function(e) {
    message("full dataset unavailable, using sampled data instead")
    return(read.csv("data/sampled-facebook-ads.csv", stringsAsFactors = FALSE))
  }
)
# prepare data
df <- df %>% select(id, html, targets)
df <- expand_targets(df)
df$Region[!is.na(df$State)] <- df %>%
  filter(!is.na(df$State)) %>%
  pull(State)
df$Region[df$Region == "the United States"] <- NA
df <- df %>% select(html, MinAge, MaxAge, Gender, Segment, Region, Interest)

# build sample users
rep_l <- list(
  age = 50,
  gender = "man",
  political_orientation = "conservative",
  region = "Texas",
  interest = "Donald Trump"
)

dem_l <- list(
  age = 18,
  gender = "women",
  political_orientation = "liberal",
  region = "California",
  interest = "Bernie Sanders"
)

wrap_content <- function(content) {
  paste0(
    "<div class = \"ad\"><div class = \"message\"><div>",
    content,
    "</div></div></div>"
  )
}

dem <- "18 year old female liberal from California who likes Bernie Sanders"

# responsive content
app_server <- function(input, output) {
  output$sample_feed <- renderUI({
    if (input$sample_var == dem) {
      actor <- dem_l
    } else {
      actor <- rep_l
    }
    actor <- lapply(target(actor, df), wrap_content)
    actor <- lapply(actor, HTML)
    return(actor)
  })
  output$custom_feed <- renderUI({
    custom_actor <- list(
      age = input$custom_age,
      gender = input$custom_gender,
      political_orientation = input$custom_po,
      region = input$custom_region,
      interest = NA
    )
    custom_actor <- lapply(target(custom_actor, df), wrap_content)
    custom_actor <- lapply(custom_actor, HTML)
    return(custom_actor)
  })
}
