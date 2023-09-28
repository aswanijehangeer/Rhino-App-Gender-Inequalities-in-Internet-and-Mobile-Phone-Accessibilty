box::use(
  plotly[plotlyOutput, renderPlotly, plot_ly, add_annotations, layout, config],
  shiny[h1, moduleServer, NS, tagList],
)

box::use(
  app/logic/data_import[digital_data],
  app/logic/hover_text_function[generate_hover_text]
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  
  tagList(
    h1("Shiny App: Gender Inequalities in Internet and Mobile Phone Accessibility"),
    plotlyOutput(ns("scatter_plot"), height = "800px", width = "1000px")
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$scatter_plot <- renderPlotly({
      plot_ly(digital_data, 
              x = ~mobile_phone_access,
              y = ~internet_access, 
              mode = "markers",
              text = generate_hover_text(digital_data),
              hoverinfo = "text",
              marker = list(
                size = 10,
                color = ifelse(digital_data$mobile_phone_access < 0 & digital_data$internet_access < 0, "red", "skyblue")
              )) |> 
        add_annotations(
          text = "Women have more\n access than men",
          x = -0.13,
          y = -0.1,
          showarrow = FALSE,
          font = list(size = 12, color = "red")) |> 
        add_annotations(
          text = "Pakistan",
          x = 0.68,
          y = 0.68,
          showarrow = FALSE,
          font = list(size = 15, color = "skyblue")) |> 
        layout(title = 
                 list(text = "<b>Women surpass men in internet and mobile access in 6 out of 100 countries .</b><br><i>Men, however, had more access compared to women for both technologies in 74 countries.</i>",
                      font = list(size = 16)),
               xaxis = list(title = "Gender Gap: Mobile Phone Access", 
                            tickformat = ".0%"),
               yaxis = list(title = "Gender Gap: Internet Access", 
                            tickformat = ".0%")) |> 
        config(displayModeBar = FALSE)
    })
  })
}
