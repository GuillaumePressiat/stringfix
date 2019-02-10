
library(stringr)
library(shiny)

shiny::shinyUI(shiny::fluidPage(

  # Application title
  shiny::titlePanel("Transcoder"),
  shiny::div(style="display:inline-block",
                selectInput("qu", label = h3("Choose sign"),
              choices = list("Single quote" = '\'', "Double quote" = '\"', 'None' = '¨'),
              selected = '\'')),
  shiny::div(style="display:inline-block",
             shiny::selectInput("sepi", label = h3("Separator (line)"),
              choices = list("`, ` : comma space" = ', ', "` ` : space" = ' ', "`,` : comma" = ','),
              selected = ', ')),
  shiny::tabsetPanel(

    shiny::tabPanel("Transcode lines",
                    shiny::fluidRow(
                      shiny::column(12,
                                    shiny::selectInput("type", label = h3("Choose return type"),
                                      choices = list("List" = 'List', "SQL %Like%" = 'SQL', "Pipe R" = 'Pipe'),
                                      selected = 'List'),

                                    shiny::h3('Enter line'),
                                    shiny::textInput("listi", "Clic, ctrl + A to select + ctrl V to paste", "F072, G430, G431, G432, G433, G438, G439, G440, G441, G442, G443, G444, G448, G932, G971, R51", width = "500px"),
                                    shiny::verbatimTextOutput('ll2'),
                                    shiny::h6('- tip : triple clic + ctrl c to copy'))
             )),

    shiny::tabPanel("Transcode columns",
                    shiny::fluidRow(
                      shiny::column(12,
                                    shiny::selectInput("type2", label = h3("Choose return type"),
                       choices = list("List" = 'List', "SQL %Like%" = 'SQL', "Pipe R" = 'Pipe'),
                       selected = 'List'),
                       shiny::h3('Enter a column'),
                       shiny::textAreaInput("listi2", "Clic, ctrl + A to select + ctrl V to paste", "BGBA001\nBGDA001\nBGDA002\nBGDA003\nBGDA004\nBGDA005\nBGDA006\nBGDA007\nBGDA008\nBGFA002\nBGFA003\nBGFA004", width = "150px", height = "250px"),
                       shiny::verbatimTextOutput('ll3'),
                       shiny::h6('- tip : triple clic + ctrl c to copy'))
  )),

  shiny::tabPanel(HTML("line 	&#x21D4;  column"),
                  shiny::fluidRow(
                    shiny::column(12,
                                  shiny::selectInput("type3", label = h3("Choose transcode direction"),
                       choices = list("column > line" = "column > line", "line > column" = "line > column"),
                       selected = "column > line"),
                       shiny::h3('Enter a column'),
                       shiny::textAreaInput("listi3",
                  "Clic, ctrl + A to select + ctrl V to paste",
                  "BGBA001\nBGDA001\nBGDA002\nBGDA003\nBGDA004\nBGDA005\nBGDA006\nBGDA007\nBGDA008\nBGFA002\nBGFA003",
                  width = "500px", height = "250px"),
                  shiny::verbatimTextOutput('ll4'),
                  shiny::h6('- tip : triple clic + ctrl c to copy'))
  ))
)))
