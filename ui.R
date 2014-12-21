# This ui.R code is part of the Coursera's Developing Data Products assignment 
#to build Shiny app
# This app utilizes dataset state.x77 that comes with R which contains Facts of US states.
# This project basically provides list of states in the drop down
# Allows user to select a state from the drop down and click submit button to get the facts 
# related to the selected state. Once user clicks the submit button, the data from the state.x77 
# dataset will be filtered and displayed in the UI.

library(shiny)     
shinyUI(
        pageWithSidebar(
                # Application title
                headerPanel("US State Facts and Figures"),
                sidebarPanel(
                        uiOutput("choose_state"),
                        submitButton('Submit')
                ),
                mainPanel(                        
                        h3('You entered'),
                        verbatimTextOutput("inputValue"),
                        h3('Facts of US state '),
                        h3(textOutput("selected.state")),
                        tableOutput("state.facts")
                )
        )
)