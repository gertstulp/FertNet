#' Remove variables related to timing of giving answers in survey
#'
#' @param data Tibble sent within function `produce_data()`
#'
#' @return Tibble without timing variables
#'
#' @export
remove_timing_vars <- function(data) {

  # `time_vars` is defined in var_types.R

  data <- data[ , !colnames(data) %in% time_vars ]

  return(data)
}
