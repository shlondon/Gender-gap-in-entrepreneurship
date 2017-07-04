library(markdown)
library(shiny)
library(xlsx)
library(foreign)
library(ggplot2)
library(psych)

source("funciones.R")
bdu1 <<- basedatos("GEM APS Key Indicators 2001 - 2015.xls")
bdu3 <<- read.csv("base_datos_sin_NA.csv")
bdu3 <<-bdu3[,-1]

shinyUI(fluidPage(
  titlePanel("Gender gap in entrepreneurship"),
  tabsetPanel(type = "tabs",
              tabPanel("Graphical gender gap in TEA",
                       sidebarLayout(sidebarPanel(width=3,selectInput(inputId = "pais",
                                                              label = "Choose a country",
                                                              choices = nombre_paises()),
                                                  sliderInput(inputId = "tamlinea",
                                                              label = "Choose the thickness of the lines",
                                                              min = 0,
                                                              max = 10,
                                                              value = 1,
                                                              step = 1,
                                                              format="$#,##0", locale="us", animate=TRUE),
                                                  sliderInput(inputId = "rangex",
                                                              label = "Choose the x-axis scale",
                                                              min = 0,
                                                              max = 10,
                                                              value = 0,
                                                              step = 1,
                                                              format="$#,##0", locale="us", animate=TRUE),
                                                  sliderInput(inputId = "rangey",
                                                              label = "Choose the y-axis scale",
                                                              min = 0,
                                                              max = 10,
                                                              value = 0,
                                                              step = 1,
                                                              format="$#,##0", locale="us", animate=TRUE)
                                                  ),
                                     mainPanel(plotOutput("distPlot")))
                       ),
              tabPanel("Graphic gender disparity in the TEA",
                       sidebarLayout(sidebarPanel(width=3,selectInput(inputId = "pais2",
                                                              label = "Choose a country",
                                                              choices = nombre_paises()),
                                                  sliderInput(inputId = "tamlinea2",
                                                              label = "Thickness line in each of the charts",
                                                              min = 0,
                                                              max = 10,
                                                              value = 1,
                                                              step = 1,
                                                              format="$#,##0", locale="us", animate=TRUE),
                                                  sliderInput(inputId = "rangex2",
                                                              label = "Choose the scale of the x-axis in each of the graphs",
                                                              min = 0,
                                                              max = 2,
                                                              value = 0,
                                                              step = 0.01,
                                                              format="$#,##0", locale="us", animate=TRUE),
                                                  sliderInput(inputId = "rangey2",
                                                              label = "Choose the scale of the y-axis in each of the graphs",
                                                              min = 0,
                                                              max = 2,
                                                              value = 0,
                                                              step = 0.01,
                                                              format="$#,##0", locale="us", animate=TRUE)),
                                     mainPanel(plotOutput("disparidad")))
                       ),
              tabPanel("Multivariate binomial logistic regression models",
                       sidebarLayout(sidebarPanel(width=3,
                                                  selectInput(inputId = "pais3",
                                                              label = "Choose a country",
                                                              choices = nombre_paises() ),
                                                  selectInput("dependent", "Dependent Variable:", names(bdu3)[1:5]),
                                                  checkboxInput("interaccion",
                                                                label = "Interaction with the gender variable",
                                                                value = FALSE),
                                                  uiOutput("independent")),
                                     mainPanel(verbatimTextOutput("Resumen3")))
              ),
              tabPanel("Multivariate graphs",
                       plotOutput("grafico_multivariado"),

                       hr(),

                       fluidRow(
                         column(3,
                                selectInput(inputId = "pais4",
                                            label = "Choose a country",
                                            choices = nombre_paises())),
                         column(4, offset = 1,
                                selectInput("dependent2", "Dependent Variable:", names(bdu3)[1:5]),
                                uiOutput("independent2")),
                         column(4,
                                sliderInput("col","Choose the number of columns for your chart",
                                            min = 1,max = 20,
                                            value = 2)))
                       ),
              tabPanel("Documentacion",
                       sidebarLayout(
                         sidebarPanel(
                           p(img(src="GEM-logo.png", heigth=200,width=350)),
                           p("El proposito del proyecto Global Entrepreneurship
                              Monitor, GEM, es examinar el papel que tiene
                             el emprendimiento como fuerza impulsora del
                             crecimiento economico a lo largo del mundo. El
                             proyecto aspira a capturar informacion sobre el
                             desarrollo de todas las actividades que conduzcan
                             a la creacion de nuevos negocios en los diferentes
                             paises. Para mayor informacion sobre este proyecto
                             consultar el sitio oficial http://www.gemconsortium.org")
                         ),
                         mainPanel(
                           includeMarkdown("Documentacion.md")
                         )
                       ))
              )

  )
  )


