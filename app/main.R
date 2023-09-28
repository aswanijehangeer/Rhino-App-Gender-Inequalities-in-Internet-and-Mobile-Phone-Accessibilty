box::use(
  shiny[bootstrapPage, div, moduleServer, NS, renderUI, tags, uiOutput],
)

box::use(
  app/view/scatter_plot,
)


#' @export
ui <- function(id) {
  ns <- NS(id)
  
  bootstrapPage(
    scatter_plot$ui(ns("scatter_plot")),
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    scatter_plot$server("scatter_plot")
  })
}