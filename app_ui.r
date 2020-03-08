library("shiny")

page_one <- tabPanel(
  titlePanel("Sample Users"),
  tags$div(
    tags$p("The Facebook Ads Simulator explores the
      different types of politcal ads users of different backgrounds might
      see depending on their age, gender, location, and political orientation.
      This app uses real, current, politcal ads shown to users on Facebook.
      Look at some of our sample users on this page or make your own
      user on the page titled \"Custom Users\". This was created
      by students at the University of Washington using ProPublica's
      \"Facebook Political Ads\" database.")
  ),
  tags$br(),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "sample_var",
        label = "Pick a Charicature",
        choices = c(
          "18 year old female liberal from California who likes Bernie Sanders",
          "50 year old male conservative from Texas who likes Donald Trump"
        )
      ),
    ),

    # Display the map and table in the main panel
    # Use stylesheet and fit images
    mainPanel(
      tags$style("img {display: block;width: 100%;}"),
      tags$link(
        rel = "stylesheet",
        href = "https://projects.propublica.org/facebook-ads/styles.css",
        type = "text/css",
        media = "all"
      ),
      uiOutput(outputId = "sample_feed")
    ),
  )
)

page_two <- tabPanel(
  titlePanel("Custom User"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = "custom_age",
        label = "Age",
        min = 0,
        max = 100,
        value = 20,
        step = 5
      ),
      selectInput(
        inputId = "custom_gender",
        label = "Gender",
        choices = c("man", "women")
      ),
      selectInput(
        inputId = "custom_po",
        label = "Political Orientation",
        choices = c(
          "very conservative", "conservative", "moderate",
          "liberal", "very liberal"
        )
      ),
      selectInput(
        inputId = "custom_region",
        label = "Location",
        choices = state.name
      )
    ),

    # Display the map and table in the main panel
    # Use stylesheet and fit images
    mainPanel(
      tags$style("img {display: block;width: 100%;}"),
      tags$link(
        rel = "stylesheet",
        href = "https://projects.propublica.org/facebook-ads/styles.css",
        type = "text/css",
        media = "all"
      ),
      uiOutput(outputId = "custom_feed")
    ),
  )
)


app_ui <- navbarPage(
  "Facebook Political Ads Simulator",
  page_one,
  page_two
)
