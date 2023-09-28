box::use(
  readxl[read_xlsx], 
  janitor[clean_names],
  dplyr[rename],
  
)

# Importing the dataset (In app/static/data)

#' @export
digital_data <- read_xlsx("app/static/data/digital_access_dataset.xlsx")

# Cleaning Names

#' @export
digital_data <- digital_data |> 
  clean_names() |> 
  rename(internet_access = gender_gap_in_internet_access_percent_difference,
         mobile_phone_access = gender_gap_in_mobile_phone_access_percent_difference)
