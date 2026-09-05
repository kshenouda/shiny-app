library(shiny)
library(bslib)

# Define UI
ui = page_sidebar(
  title = 'censusVis',
  sidebar = sidebar(
    helpText('Create demographic maps with information from the 2010 US Census.'),
    selectInput(
      'select', 
      'Choose a variable to display',
      choices = list('Percent White', 'Percent Black',
                     'Percent Hispanic', 'Percent Asian'),
      selected = 'Percent White'
    ),
    sliderInput(
      'slider',
      'Range of interest:',
      min = 0, max = 100,
      value = c(0, 100)
    )
  ),
  textOutput('selected_input'),
  textOutput('min_max')
)

# Define server logic
server = function(input, output) {
  output$selected_input = renderText({
    paste('You have selected', input$select)
  })
  output$min_max = renderText({
    paste('You have chosen a range that goes from', input$slider[1], 'to', input$slider[2])
  })
}

# Run the app
shinyApp(ui, server)