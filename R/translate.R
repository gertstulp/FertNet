#' Translate LISS variable names of social networks and fertility data (LISS: wj18a_EN_1.0p.sav) into sensible English names
#'
#' @param data Tibble which is the result of `read_data()`
#'
#' @return Tibble with sensible column names
#'
#' @examplesIf file.exists("wj18a_EN_1.0p.sav")
#' read_data() |> translate()
#'
#' @export
translate <- function(data) {

  # `eng_LISS_lookup` can be found in eng_LISS_lookup.R
  names(data) <- names(eng_LISS_lookup)[match(names(data), eng_LISS_lookup)]

  return(data)

}
