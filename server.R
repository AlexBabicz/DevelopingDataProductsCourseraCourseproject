library(fpp3)
library(dplyr)
library(tidyr)
library(tibble)
library(ggplot2)
library(shiny)
library(shinythemes)

Australian_Tourism_Data <- tourism %>%
    aggregate_key((State/Region) * Purpose, Trips = sum(Trips))

# Forecasts take a lot of time, so all corresponding functions are out-commented

# fit_Australian_Tourism_Data <- Australian_Tourism_Data %>%
#     filter(year(Quarter) <= 2015) %>%
#     model(base = ETS(Trips)) %>%
#     reconcile(
#         bu = bottom_up(base),
#         ols = min_trace(base, method = "ols"),
#         mint = min_trace(base, method = "mint_shrink"),
#     )

# fc_Australian_Tourism_Data <- fit %>%
#     forecast(h = "2 years")

tourism_data_summary <- as.data.frame(tourism) %>% 
    group_by(State) %>% 
    summarise(Sum_of_trips = sum(Trips))

Tourism_data_100 <- tourism
Tourism_data_100$Quarter <- as.character(Tourism_data_100$Quarter)


shinyServer(function(input, output) {
    
    output$tourism_data_summary <- renderTable(
        tourism_data_summary,
        filter = "top",
        options = list(
            pageLength = 5
        )
    )
    
    output$tourism_data <- renderTable(
        sample_n(Tourism_data_100, 100),
        filter = "top",
        options = list(
            pageLength = 5
        )
    )
    
    output$boxplot <- renderPlot({
        ggplot(tourism, aes(x=State, y=Trips, color = State)) + 
            geom_boxplot()+
            labs(x="Australian state/region", y="Quarterly number of trips")+
            ggtitle("Quarterly number of trips in the 8 different australian states/regions")+
            theme_bw()+
            theme(plot.title = element_text(hjust = 0.5))
    })
    output$down_boxplot <- downloadHandler(
        filename=function(){
            paste0("Boxplot of australian tourism data", ".", input$DownloadType)
        },
        content=function(file){
            if(input$DownloadType == "png")
                png(file)
            else
                pdf(file)
            boxplot_australian_tourism <- ggplot(tourism, aes(x=State, y=Trips, color = State)) + 
                geom_boxplot()+
                labs(x="Australian state/region", y="Quarterly number of trips")+
                ggtitle("Quarterly number of trips in the 8 different australian states/regions")+
                theme_bw()+
                theme(plot.title = element_text(hjust = 0.5))
            print(boxplot_australian_tourism)
            dev.off()
        }
    )
    
    output$Trend_and_Season_features <- renderPlot({
        tourism %>%
            features(Trips, feat_stl) %>%
            ggplot(aes(x = trend_strength, y = seasonal_strength_year,
                       col = Purpose)) +
            geom_point() +
            facet_wrap(vars(State))+
            labs(y = "Seasonal strength",
                 x = "Trend strength",
                 title = "Scatterplot of seasonal and trend strength",
                 subtitle = "for all Australien states/regions between 1998 and 2017")+
            theme_bw()+
            theme(plot.title = element_text(hjust = 0.5),
                  plot.subtitle = element_text(hjust = 0.5))
    })
    output$down_Trend_and_Season_features_plot <- downloadHandler(
        filename=function(){
            paste0("Scatterplot of seasonal and trend strength for australian tourism data", ".", input$DownloadType)
        },
        content=function(file){
            if(input$DownloadType == "png")
                png(file)
            else
                pdf(file)
            Trend_and_Season_features <- tourism %>%
                features(Trips, feat_stl) %>%
                ggplot(aes(x = trend_strength, y = seasonal_strength_year,
                           col = Purpose)) +
                geom_point() +
                facet_wrap(vars(State))+
                labs(y = "Seasonal strength",
                     x = "Trend strength",
                     title = "Scatterplot of seasonal and trend strength",
                     subtitle = "for all Australien states/regions between 1998 and 2017")+
                theme_bw()+
                theme(plot.title = element_text(hjust = 0.5),
                      plot.subtitle = element_text(hjust = 0.5))
            print(Trend_and_Season_features)
            dev.off()
        }
    )
    
    output$Time_series_plot <- renderPlot({
        tourism %>%
            #filter(State == "New South Wales") %>% 
            group_by(State) %>% 
            summarise(Total_Regional_Trips = sum(Trips)) %>% 
            autoplot(Total_Regional_Trips) +
            labs(title = "Total quarterly for each state/region",
                 subtitle = "in Australia between 1998 and 2017",
                 y = "Total quarterly trips within the state/region",
                 x = "")+
            theme_bw()+
            theme(plot.title = element_text(hjust = 0.5),
                  plot.subtitle = element_text(hjust = 0.5))
    })
    output$down_time_series_plot <- downloadHandler(
        filename=function(){
            paste0("Timeseries plot australian tourism data", ".", input$DownloadType)
        },
        content=function(file){
            if(input$DownloadType == "png")
                png(file)
            else
                pdf(file)
            g1 <- tourism %>%
                #filter(State == "New South Wales") %>% 
                group_by(State) %>% 
                summarise(Total_Regional_Trips = sum(Trips)) %>% 
                autoplot(Total_Regional_Trips) +
                labs(title = "Total quarterly for each state/region",
                     subtitle = "in Australia between 1998 and 2017",
                     y = "Total quarterly trips within the state/region",
                     x = "")+
                theme_bw()+
                theme(plot.title = element_text(hjust = 0.5),
                      plot.subtitle = element_text(hjust = 0.5))
            print(g1)
            dev.off()
        }
    )

    output$Seasonal_plot <- renderPlot({
        tourism %>%
            filter(State == input$State) %>% 
            group_by(State) %>% 
            summarise(Total_Regional_Trips = sum(Trips)) %>% 
            gg_season(Total_Regional_Trips, labels = "both") +
            labs(y = "Total quarterly trips",
                 title = paste0("Combined Australian Tourism for ", input$State),
                 subtitle = "- Seasonal plot -")+
            theme_bw()+
            theme(plot.title = element_text(hjust = 0.5),
                  plot.subtitle = element_text(hjust = 0.5))
    })
    output$down_seasonal_plot <- downloadHandler(
        filename=function(){
            paste0("Seasonal plot for ",input$State,".",input$DownloadType)
        },
        content=function(file){
            if(input$DownloadType == "png")
                png(file)
            else
                pdf(file)
            g2 <- tourism %>%
                filter(State == input$State) %>% 
                group_by(State) %>% 
                summarise(Total_Regional_Trips = sum(Trips)) %>% 
                gg_season(Total_Regional_Trips, labels = "both") +
                labs(y = "Total quarterly trips",
                     title = paste0("Combined Australian Tourism for ", input$State),
                     subtitle = "- Seasonal plot -")+
                theme_bw()+
                theme(plot.title = element_text(hjust = 0.5),
                      plot.subtitle = element_text(hjust = 0.5))
            print(g2)
            dev.off()
        }
    )
    output$Seasonal_subseries_plot <- renderPlot({
        tourism %>%
            filter(State == input$State) %>% 
            group_by(State) %>% 
            summarise(Total_Regional_Trips = sum(Trips)) %>% 
            gg_subseries(Total_Regional_Trips) +
            labs(y = "Total quarterly trips",
                 x = "",
                 title = paste0("Combined Australian Tourism for ", input$State),
                 subtitle = "- Seasonal suubseries plot -")+
            theme_bw()+
            theme(plot.title = element_text(hjust = 0.5),
                  plot.subtitle = element_text(hjust = 0.5))
    })
    output$down_seasonal_subseries_plot <- downloadHandler(
        filename=function(){
            paste0("Seasonal subseries plot for ",input$State,".",input$DownloadType)
        },
        content=function(file){
            if(input$DownloadType == "png")
                png(file)
            else
                pdf(file)
            g3 <- tourism %>%
                filter(State == input$State) %>% 
                group_by(State) %>% 
                summarise(Total_Regional_Trips = sum(Trips)) %>% 
                gg_subseries(Total_Regional_Trips) +
                labs(y = "Total quarterly trips",
                     x = "",
                     title = paste0("Combined Australian Tourism for ", input$State),
                     subtitle = "- Seasonal suubseries plot -")+
                theme_bw()+
                theme(plot.title = element_text(hjust = 0.5),
                      plot.subtitle = element_text(hjust = 0.5))
            print(g3)
            dev.off()
        }
    )
    output$STL_Decomposition <- renderPlot({
        tourism %>%
            filter(State == input$State) %>% 
            group_by(State) %>% 
            summarise(Total_Regional_Trips = sum(Trips)) %>% 
            model(
                STL(Total_Regional_Trips,
                    robust = TRUE)) %>%
            components() %>%
            autoplot() + 
            labs(y = "",
                 x = "",
                 title = paste0("STL decomposition for ", input$State))+
            theme_bw()+
            theme(plot.title = element_text(hjust = 0.5),
                  plot.subtitle = element_text(hjust = 0.5))
    })
    output$down_STL_decomposition_plot <- downloadHandler(
        filename=function(){
            paste0("Visual STL decomposition for ",input$State,".",input$DownloadType)
        },
        content=function(file){
            if(input$DownloadType == "png")
                png(file)
            else
                pdf(file)
            g4 <- tourism %>%
                filter(State == input$State) %>% 
                group_by(State) %>% 
                summarise(Total_Regional_Trips = sum(Trips)) %>% 
                model(
                    STL(Total_Regional_Trips,
                        robust = TRUE)) %>%
                components() %>%
                autoplot() + 
                labs(y = "",
                     x = "",
                     title = paste0("STL decomposition for ", input$State))+
                theme_bw()+
                theme(plot.title = element_text(hjust = 0.5),
                      plot.subtitle = element_text(hjust = 0.5))
            print(g4)
            dev.off()
        }
    )
    
    # output$Regional_fc <- renderPlot({
    #     fc_Australian_Tourism_Data %>%
    #         filter(is_aggregated(State), !is_aggregated(Purpose)) %>%
    #         autoplot(
    #             Australian_Tourism_Data %>% filter(year(Quarter) >= 2011),
    #             level = NULL
    #         ) +
    #         labs(y = "Total trips ('000)") +
    #         facet_wrap(vars(State), scales = "free_y")
    # })
    # output$down_Regional_fc_plot <- downloadHandler(
    #     filename=function(){
    #         paste0("2 year forecast by region ", ".",input$DownloadType)
    #     },
    #     content=function(file){
    #         if(input$DownloadType == "png")
    #             png(file)
    #         else
    #             pdf(file)
    #         g5 <- fc_Australian_Tourism_Data %>%
    #             filter(is_aggregated(State), !is_aggregated(Purpose)) %>%
    #             autoplot(
    #                 Australian_Tourism_Data %>% filter(year(Quarter) >= 2011),
    #                 level = NULL
    #             ) +
    #             labs(y = "Total trips ('000)") +
    #             facet_wrap(vars(State), scales = "free_y")
    #         print(g5)
    #         dev.off()
    #     }
    # )
    # 
    # output$Purpose_fc <- renderPlot({
    #     fc_Australian_Tourism_Data %>%
    #         filter(is_aggregated(State), !is_aggregated(Purpose)) %>%
    #         autoplot(
    #             Australian_Tourism_Data %>% filter(year(Quarter) >= 2011),
    #             level = NULL
    #         ) +
    #         labs(y = "Total trips ('000)") +
    #         facet_wrap(vars(Purpose), scales = "free_y")
    # })
    # output$down_Purpose_fc_plot <- downloadHandler(
    #     filename=function(){
    #         paste0("2 year forecast by purpose ", ".",input$DownloadType)
    #     },
    #     content=function(file){
    #         if(input$DownloadType == "png")
    #             png(file)
    #         else
    #             pdf(file)
    #         g6 <- fc_Australian_Tourism_Data %>%
    #             filter(is_aggregated(State), !is_aggregated(Purpose)) %>%
    #             autoplot(
    #                 Australian_Tourism_Data %>% filter(year(Quarter) >= 2011),
    #                 level = NULL
    #             ) +
    #             labs(y = "Total trips ('000)") +
    #             facet_wrap(vars(Purpose), scales = "free_y")
    #         print(g6)
    #         dev.off()
    #     }
    # )
    # 
    # output$accuracy_table <- renderTable({
    #     Accuracy <- fc_Australian_Tourism_Data %>%
    #         filter(is_aggregated(State), is_aggregated(Purpose)) %>%
    #         accuracy(
    #             data = Australian_Tourism_Data,
    #             measures = list(me = ME, rmse = RMSE, mase = MASE, mape = MAPE, acf1 = ACF1)
    #         ) %>%
    #         group_by(.model) %>%
    #         summarise(ME = mean(me),
    #                   RMSE = mean(rmse), 
    #                   MASE = mean(mase), 
    #                   MAPE = mean(mape),
    #                   ACF1 = mean(acf1))
    #     Accuracy
    # })
})
