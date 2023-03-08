#' Reads-in social networks and fertility data (LISS: wj18a_EN_1.0p.sav)
#'
#' @param file Path to file wj18a_EN_1.0p.sav (or renamed variant)
#'
#' @return Tibble of social networks and fertility data
#'
#' @examplesIf file.exists("wj18a_EN_1.0p.sav")
#' read_data("wj18a_EN_1.0p.sav")
#'
#' @export
read_data <- function(file = "wj18a_EN_1.0p.sav") {

  data <- haven::read_sav(file, user_na = TRUE)

  if( ncol(data) != 546 ) {
    stop("Number of columns not 546; are you sure you have the right dataset?")
  }
  if( nrow(data) != 758 ) {
    stop("Number of rows not 758; are you sure you have the right dataset?")
  }
  # `eng_LISS_lookup` defined in eng_LISS_lookup.R
  if( !all(names(data) %in% eng_LISS_lookup)) {
    stop("Not all required variables in dataset; are you sure you have the right dataset?")
  }

  return(data)
}
