library(shiny)
library(bslib)
library(bsicons)

# Define UI
ui = page_sidebar(
  title = 'My Shiny App',
  sidebar = sidebar(
    p('Shiny is available on CRAN, so you can install it in the usual way from your R console:'),
    pre('install.packages("shiny")')
    ),
  card(
   card_header('Introducing Shiny'),
   card_body('Shiny is a package from Posit that maeks it incredibly easy to build interactive 
              web applications with R. For an introduction aand live examples, visit the
              Shiny homepage (https://shiny.posit.co).'),
   card_image('https://www.worldbank.org/content/dam/photos/780x439/2021/apr/Shiny-logo.png'),
   card_footer('Shiny is a product of Posit.'),
  )
  
  #value_box(
  #  title = 'Value Box',
  #  value = 100,
  #  showcase = bsicons::bs_icon('bar-chart'),
  #  theme = 'teal'
  #),
  #card('Card'),
  #card('Another Card')
)

#ui = page_fluid(
#  layout_sidebar(
#    sidebar = sidebar('Sidebar'),
#    'Main contents'
#  )
#)

# Define server logic
server = function(input, output) {
  
}

# Run the app
shinyApp(ui=ui, server=server)