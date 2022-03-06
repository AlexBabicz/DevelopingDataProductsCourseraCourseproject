library(fpp3)
library(dplyr)
library(tidyr)
library(tibble)
library(ggplot2)
library(shiny)
library(shinythemes)

shinyUI(fluidPage(
    
    # Define the theme
    theme = shinythemes::shinytheme("paper"),
    
    # Titel and subtitle
    titlePanel("Visualization of australian tourism data"),
    h4("Data from 1998 to 2017"),
    h6("Data source and more information: https://otexts.com/fpp3/index.html"),
    # Define Layout with sidebar
    sidebarLayout(
        sidebarPanel(
            h4("Input"),
            selectInput(inputId="State", 
                        label="Choose the state/region for the seasonal plots and STL decomposition:", 
                        choices=c(sort(unique(tourism$State))), 
                        multiple=T, selectize=T), #Um Tippen zu ermöglichen
            radioButtons(inputId="DownloadType", 
                         label="Choose a fileformat for the download:", 
                         choices=list("png", "pdf")),
            submitButton("Confirm")
        ),
        mainPanel(
            tabsetPanel(
                type = "tabs",
                tabPanel("Data overview",
                         h4("Original dimensions of data:"),
                         h6("24.320 x 5"),
                         h4("Data summary:"),
                         tableOutput("tourism_data_summary"),
                         h4("100 random rows:"),
                         tableOutput("tourism_data")),
                tabPanel("Boxplot", 
                         plotOutput("boxplot"),
                         downloadButton(outputId="down_boxplot", label="download the plot")),
                tabPanel("Seasonal and trend strength", plotOutput("Trend_and_Season_features"),
                         downloadButton(outputId="down_Trend_and_Season_features_plot", label="download the plot")),
                tabPanel("Time Series plot", 
                         plotOutput("Time_series_plot"),
                         downloadButton(outputId="down_time_series_plot", label="download the plot")),
                tabPanel("Seasonal plot", plotOutput("Seasonal_plot"),
                         downloadButton(outputId="down_seasonal_plot", label="download the plot")),
                tabPanel("Seasonal subseries plot", plotOutput("Seasonal_subseries_plot"),
                         downloadButton(outputId="down_seasonal_subseries_plot", label="download the plot")),
                tabPanel("STL Decomposition", plotOutput("STL_Decomposition"),
                         downloadButton(outputId="down_STL_decomposition_plot", label="download the plot")),
                # Forecasts take a lot of time, so all corresponding functions are out-commented
                # tabPanel("Overall 2-year forecast", 
                #          plotOutput("Regional_fc"),
                #          downloadButton(outputId="down_Regional_fc_plot", label="download the plot"),
                #          plotOutput("Purpose_fc"),
                #          downloadButton(outputId="down_Purpose_fc_plot", label="download the plot"),
                #          br(),
                #          h4("Models:"),
                #          h6("base =base forecast"),
                #          h6("bu = botom-up"),
                #          h6("mint = Minimum Trace"),
                #          h6("ols = ordinary least squares"),
                #          h4("Accuracy:"),
                #          tableOutput("accuracy_table"))
            )
        )
    ),
))