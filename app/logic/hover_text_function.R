#' @export

generate_hover_text <- function(data) {
  note <- "<b><i>NOTE:</i></b> <i>Positive values indicate male access exceeds female access</i>"
  
  paste(
    "<b><span style='font-size: 16px;'>", data$country, "</span></b><br>",
    "Gender Gap: Internet Access: <b>", scales::percent(data$internet_access, accuracy = 0.1), "</b><br>",
    "Gender Gap: Mobile Phones Access: <b>", scales::percent(data$mobile_phone_access, accuracy = 0.1), "</b><br><br>",
    note
  )
}