library(shiny)
library(ggplot2)
library(datasets)
library(MASS)
library(dplyr)
library(tibble)

# Define where to read the data and how to read them
# data1 = mtcars
# data <- data1 %>% rownames_to_column("Car_Brand")

data2 = Aids2

# Define a server for the Shiny app
shinyServer(function(input, output) {
    
    dataInput <- reactive({
        subset(data2, subset=(data2$state == c(input$state))&(data2$T.categ == c(input$transmission_type)))
    })
    
    output$trans_type = renderUI({
        selectInput("transmission_type", "Type of transmission:", choices=c(levels(unique(data2$T.categ))), multiple=TRUE)
    })
    
    output$state_select = renderUI({
        selectInput("state", "Choose a state:", choices=c(levels(unique(data2$state))),multiple=TRUE)
    })
    
    # Fill in the spot we created for a plot
    output$plot1 <- renderPlot({
        
        # Render the plot
        ggplot(
            dataInput(),
            aes(
                x=state,
                y=age,
                group=T.categ,
                colour=as.factor(T.categ)
            )
        ) + geom_jitter() + labs(
            x='state',
            y='age',
            title=paste('AIDs in Australia by transmission type'),
            colour='Transmission type'
        )
    })
})

