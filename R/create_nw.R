#' Create dataframes of alter attributes and edgelists and store them in list-columns for social networks and fertility data (LISS: wj18a_EN_1.0p.sav)
#'
#' @param data Tibble which is the result of `create_relation_labels(fix_errors(change_column_types(translate(read_data()))))`
#'
#' @return Tibble with list-columns containing alter attributes and edgelists
#'
#' @examplesIf file.exists("wj18a_EN_1.0p.sav")
#' read_data() |> translate() |> change_column_types() |>
#' fix_errors() |> create_relation_labels() |> create_nw()
#'
#' @export
create_nw <- function(data) {

  # `vars_alter_attr` and `vars_alter_ties` are defined in var_types.R

  # This creates variable `alter_attr` (list-column) with dataframe in each cell
  data$alter_attr <- lapply(1:nrow(data),
                            function(x) create_alter_attr(data[x, ]) )
  # This creates variable `edgelist` (list-column) with matrix in each cell
  data$edgelist <- lapply(1:nrow(data),
                          function(x) create_edgelist(data[x, ], vars_alter_ties) )
  # pmap is much faster, but creates extra dependency
  # purrr::pmap(., function(...) create_node_attr(c(...)))
  # purrr::pmap(data, function(...) create_edgelist(c(...), vars = vars_edgelist))

  # removes all variables on alter attributes and edge ties which is
  # already stored in variables `alter_attr` and `edgelist`
  data <- data[ , names(data)[!(names(data) %in% c(vars_alter_attr, vars_alter_ties))]]

  return(data)

}

