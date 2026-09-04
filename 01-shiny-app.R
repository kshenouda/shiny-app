install.packages('shiny')
library(shiny)
library(bslib)

# Define UI for app that draws the histogram
ui = page_sidebar(
  # App title
  title = 'Hello World!',
  # Sidebar panel for inputs
  sidebar = sidebar(
    # Input: slider to adjust number of bins in histogram
    sliderInput(
      inputId = 'bins',
      label = 'Number of bins: ',
      min = 5,
      max = 50,
      value = 30
    )
  ),
  # Output: Histogram
  plotOutput(outputId = 'distPlot')
)

# Define server logic needed to build a histogram
server = function(input, output) {
  # Histogram of Old Faithful Geyser Data with requested number of bins
  # The code that generates the histogram is wrapped in a call to
  # renderPlot to indicate that:
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$bins) change
  # 2. Its output type is a plot
  output$distPlot = renderPlot({
    x = faithful$waiting
    bins = seq(min(x), max(x), length.out = input$bins + 1)
    hist(x, breaks = bins, col = '#007bc2', border = 'red',
         xlab = 'Waiting time to next eruption (in mins)',
         main = 'Histogram of Waiting Times')
  })
}

# End the app with a call to shiny-app
shinyApp(ui=ui, server=server)
# runApp('shiny-app.R')
