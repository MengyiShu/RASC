library(shiny)
# Define UI for random distribution app ----
ui <- fluidPage(

  # App title ----
  titlePanel("Select your barcode and cells here"),

  # Sidebar layout with input and output definitions ----
  sidebarLayout(

    # Sidebar panel for inputs ----
    sidebarPanel(
      # Input: Select a pathway file ----
      fileInput("file1", "Upload your GMT File",
                multiple = FALSE,
                accept = c("gmt",
                           "text/comma-separated-values,text/plain",
                           ".gmt")),
      br(),

      # Input: Select a scRNA file ----
      fileInput("file2", "Upload your CSV File",
                multiple = FALSE,
                accept = c("text/csv",
                           "text/comma-separated-values,text/plain",
                           ".csv")),
      br(),
      # Input: first row of the cell
      textInput(inputId = "row1",label = "Please enter the start line of cell"),

      # br() element to introduce extra vertical spacing ----
      br(),
      # Input: last row  of the cell
      textInput(inputId = "row2",label = "Please enter the end line of cell"),

      # br() element to introduce extra vertical spacing ----
      br(),

      # Input: Text for the name of the pathway
      textInput(inputId = "Pathway",label = "Please enter the pathway you want to compare"),

      # br() element to introduce extra vertical spacing ----
      br()


    ),

    # Main panel for displaying outputs ----
    mainPanel(

      # Output: Tabset w/ plot, summary, and table ----
      tabsetPanel(type = "tabs",
                  tabPanel("Plot", plotOutput("plot"))
      )

    )
  )
)




server <-function(input,output){
  output$PathwayComparison <- renderPlot({
    title <-"Comparison of cells in the pathway"
    expr <- fread(input$file1)
    pathways <-load_AUCell_genesets(input$file1,ignore_cols=2)
    exprs <- load_expression(expr)
    pathway_scores <- AUCell_batch(counts(exprs), genesets = c(pathways), num_batches=20)
    Plot <- PlotPathwayScores(pathway_scores,input$row1,input$row2,input$Pathway)



  })
}

shinyApp(ui = ui, server = server)
