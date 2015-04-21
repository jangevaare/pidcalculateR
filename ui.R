library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("PID-calculator"),

  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("temp1", "Equilibrium temperature 1 (F):",
		min = 32,
		max = 212,
		value = 145),
    
	sliderInput("temp2", "Equilibrium temperature 2 (F):",
		min = 32,
		max = 212,
		value = 150),

	sliderInput("duty1", "Duty 1 (%):",
		min = 0,
		max = 100,
		value = 10),

	sliderInput("duty2", "Duty 2 (%):",
		min = 0,
		max = 100,
		value = 15),

	sliderInput("deadtime", "Deadtime (seconds):",
    	min = 0,
    	max = 1200,
    	value = 120),

	sliderInput("time", "Seconds to equilibrium temperature 2, including deadtime",
		min = 0,
		max = 2400,
		value = 1320),
                  
	radioButtons("action", "Select level of action",
		choices = list(
			"Aggressive"=1, 
			"Moderate"=2,
			"Conservative"=3),
		selected = 1)),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("plot")
    )
  )
))