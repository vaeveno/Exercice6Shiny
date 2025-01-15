#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)


# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("Application hybride 1&4&5"),
    
    fluidRow(
      column(3,
             fluidRow(h1("Voici ma question :", align="center",style="background-color:darkgrey")),
             wellPanel(
                       textInput("nom", "Quel est ton nom ?"),
                       textOutput("salutation")),style="background-color:darkgrey"
             )
    ,
    
      column(3,
             h1("‎ ‎ ‎ ‎ Le Deuxième"),
             h1("‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ Challenge"),
             h1("‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎  du Curseur :")
             ),
    column(2,
           sliderInput("curseurx", label = "Si x est ", min = 1, max = 100, value = 30 ),
           strong("alors x * y est : "),
           strong(textOutput("le_texte"))

    ),
    column(2,
           sliderInput("curseury", label = "Si y est ", min = 1, max = 100, value = 5 )
           )

    ,style="background-color:lightgrey"),
    
    fluidRow(
      column(12,
             h1("Sélection, résumé et graphique des données :"),
            )
    ),
    fluidRow(
      column(3,
             p("Sélection du tableau de données"),
             selectInput("dataset", "Dataset", choices = c("economics", "faithfuld", "seals")),
               
             verbatimTextOutput("summary")),
      
      column (9,
              plotOutput("graphe"))
    ),
    fluidRow(
      column(3,
             p("‎"),
             imageOutput("uca", height = 55),
             p("‎"),
             em("Les données sont extraites du package ggplot2."),
             p("‎"),
             em("Mise en page et fusion des application des exercices 1, 4 et 5 par Valentin Eveno."))
    )
)
