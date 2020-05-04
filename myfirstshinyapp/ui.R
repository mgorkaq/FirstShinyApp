library(shiny)

# Define the overall UI
shinyUI(
    
    # Use a fluid Bootstrap layout
    fluidPage(
        
        # Give the page a title
        titlePanel("AID by transmission type in Australia"),
        
        # Generate a row with a sidebar
        sidebarLayout(
            
            # Define the sidebar with one input
            sidebarPanel(
                uiOutput('trans_type'),
                uiOutput('state_select'),
                hr(),
                helpText("Data from AID in Australia.", br(), "Select the type of transmission and the state to get the plot.")
            ),
            
            # Create a spot for the plot
            mainPanel(
                plotOutput("plot1")
            )
        )
    )
)
