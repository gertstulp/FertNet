#' Produces corrected relationship labels for social networks and fertility data (LISS: wj18a_EN_1.0p.sav)
#'
#' @param data Tibble which is the result of `fix_errors(change_column_types(translate(read_data())))`
#'
#' @return Tibble in which data on relationship labels are corrected and improved
#'
#' @examplesIf file.exists("wj18a_EN_1.0p.sav")
#' read_data() |> translate() |> change_column_types() |>
#' fix_errors() |> create_relation_labels()
#'
#' @export
create_relation_labels <- function(data) {

  # For a full description of this process, please see Buijs, V. L., & Stulp, G. (2022).
  # Friends, family, and family friends: Predicting friendships of Dutch women.
  # Social Networks, 70, 25–35. https://doi.org/10.1016/j.socnet.2021.10.008.
  # and https://doi.org/10.34894/EZCDOA

  # data.frame `relabel` is defined in relation_label_lookup.R
  # `vars_relation` is defined in var_types.R ,
  # `replace_label` is defined in utils.R

  # Creates 25 new variables with recoded labels
  for(i in vars_relation) {
    data[paste0(i, "_rec")] <- as.character(
      lapply(data[[i]],
             function(x) replace_label(x, relabel$label_orig, relabel$label_rec)
             )
      )
    data[paste0(i, "_new")] <- as.character(
      lapply(data[[i]],
             function(x) replace_label(x, relabel$label_orig, relabel$label_new)
             )
    )
  }
  return(data)
}
