#' Get respondent background variables (LISS: avars_201802_EN_1.0p.sav) for social networks and fertility data (LISS: wj18a_EN_1.0p.sav)
#'
#' @param file Path to file avars_201802_EN_1.0p.sav (or renamed variant)
#'
#' @return Tibble of data with background variables for social networks and fertility data
#'
#' @examplesIf file.exists("avars_201802_EN_1.0p.sav")
#' get_background_vars()
#'
#' @export
get_background_vars <- function(file = "avars_201802_EN_1.0p.sav") {

  data <- haven::read_sav(file)

  # `eng_LISS_lookup_bck` can be found in eng_LISS_lookup.R
  names(data) <- names(eng_LISS_lookup_bck)[match(names(data), eng_LISS_lookup_bck)]

  # Transform numeric variables into numeric variables (and strip attributes)
  vars_num <- c("nomem_encr", "nohouse_encr", "wave", "birthyear", "age",
                "age_head_hh", "number_hh_members", "children_at_home",
                "gross_income", "net_income", "net_income2",
                "gross_income_imp", "net_income_imp", "gross_income_hh",
                "net_income_hh")

  data[ , vars_num ] <- sapply(data[ , vars_num ], as.numeric)

  # Transforms alter-relationship & alter-ties variables into character variables
  # strip SPSS-labels
  vars_char <- c("sex", "lives_with_partner", "civil_status", "living_situation",
                 "primary_occ", "participates", "recruitment", "simpc")

  data[ , vars_char ] <- sapply(data[ , vars_char ],
                                function(x) as.character(haven::as_factor(x)))

  # Transforms non-numeric, non-character labelled SPSS-variables into factors
  vars_fct <- c("age_cat", "position_hh", "type_dwelling", "urban",
                "gross_income_cat", "net_income_cat", "educ_no_degree",
                "educ_degree", "educ_CBS", "origin")

  data[ , vars_fct ] <- lapply(data[ , vars_fct ],
                               function(x) haven::as_factor(x, ordered = TRUE))

  # `var_labels_lookup_bck` is defined in var_labels_lookup.R
  for(i in names(data)) {
    attributes(data[[i]])$label <- names(var_labels_lookup_bck)[match(i, var_labels_lookup_bck)]
  }

  return(data)
}
