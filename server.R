# This server.R code is part of the Coursera's Developing Data Products assignment 
#to build Shiny app
# This app utilizes dataset state.x77 that comes with R which contains Facts of US states.
# This project basically provides list of states in the drop down
# Allows user to select a state from the drop down and click submit button to get the facts 
# related to the selected state. Once user clicks the submit button, the data from the state.x77 
# dataset will be filtered and displayed in the UI.

library(datasets)

shinyServer(
        function(input, output) {
                
                # Drop-down selection box for which data set
                output$choose_state <- renderUI({
                        selectInput("state.names", "Select US State", as.list(row.names(state.x77)))
                })
                
                output$inputValue <- renderPrint({input$state.names})
                output$selected.state <- renderPrint({input$state.names})
                output$state.facts <- renderTable({
                        # If missing input, return to avoid error later in function
                        if(is.null(input$state.names))
                                return()
                        as.data.frame(state.x77[input$state.names,])
                })

        }
)