#' Create dataframe of edgelist based on social networks and fertility data (LISS: wj18a_EN_1.0p.sav)
#'
#' @param data Tibble which is the result of `create_relation_labels(fix_errors(change_column_types(translate(read_data()))))`
#' @param vars Vector with variable names of 25 variables describing alter-alter-ties
#'
#' @return Tibble with variable `edgelist` which includes a dataframe with edgelist for each respondent
#'
#' @examplesIf file.exists("wj18a_EN_1.0p.sav")
#' data <- read_data() |> translate() |> change_column_types() |>
#' fix_errors() |> create_relation_labels()
#' create_edgelist(data[1, vars_alter_ties])
#'
#' @export
create_edgelist <- function(data = NULL, vars = NULL) {
  data <- data[vars]

  # Checks whether all 25 variables are empty, meaning no information
  # was given on alter-alter relationships
  if( sum(data[vars] == "") == 25 ) {
    NA
  } else {
    edgelist <- NULL

    for(i in 1:25) {
      if( data[vars[i]] != "" ) {
        alters_index <- paste("c(", data[vars[i]], ")", sep = "")
        edgelist <- rbind(edgelist, cbind(i, eval(parse(text = alters_index))) )
      }
    }
    colnames(edgelist) <- c("from", "to")
    edgelist
  }
}
