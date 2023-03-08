#' Create tidygraph objects from social networks and fertility data (LISS: wj18a_EN_1.0p.sav)
#'
#' @param data Tibble which is the result of `produce_data()`
#'
#' @return Tibble with variable `tidygraph` that includes tidygraph objects for all respondents
#'
#' @examplesIf file.exists("wj18a_EN_1.0p.sav")
#' produce_data() |> create_tidygraph()
#'
#' @export
create_tidygraph <- function(data) {

  # code from https://r-pkgs.org/dependencies-in-practice.html
  if (!requireNamespace("tidygraph", quietly = TRUE)) {
    stop(
      "Package \"tidygraph\" must be installed to use this function.",
      call. = FALSE
    )
  }
  data$tidygraph <- lapply(
    1:nrow(data),
    function(x)
      if ( is.na(data$edgelist[x]) ) {
        NA
      } else {
        tidygraph::tbl_graph(data$alter_attr[[x]],
                             as.data.frame(data$edgelist[x]),
                             directed = FALSE)
      }
  )
  return(data)

}
