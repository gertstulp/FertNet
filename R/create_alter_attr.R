#' Create dataframe of alter attributes based on social networks and fertility data (LISS: wj18a_EN_1.0p.sav)
#'
#' @param data Tibble which is the result of `create_relation_labels(fix_errors(change_column_types(translate(read_data()))))`
#'
#' @return Tibble with variable `alter_attr` which includes a dataframe with alter attributes for each respondent
#'
#' @examplesIf file.exists("wj18a_EN_1.0p.sav")
#' data <- read_data() |> translate() |>
#' change_column_types() |> fix_errors() |> create_relation_labels()
#' create_alter_attr(data[1, ])
#'
#' @export
create_alter_attr <- function(data) {

  # as.vector(...) needed because otherwise list is provided
  alter_attr <- data.frame(
    names_a = 1:25,
    sex_a = as.vector(data[vars_sex], "character"),
    age_a = as.vector(data[vars_age], "character"),
    education_a = factor(
      as.vector(data[vars_education], "character"),
      levels = c(
        "Primary education, or has not yet completed any education",
        "Secondary school or comparable",
        "Intermediate professional education or comparable",
        "Higher professional education or comparable",
        "University or higher or comparable"),
      ordered = TRUE),
    closeness_a = factor(
      as.vector(data[vars_closeness], "character"),
      levels = c(
        "Not at all close",
        "Not close",
        "A bit close",
        "Close",
        "Very close"),
      ordered = TRUE),
    contact_f2f_a = factor(
      as.vector(data[vars_contact_f2f], "character"),
      levels = c(
        "A few times a year or less",
        "About once a month",
        "Several times a month",
        "Several times a week",
        "Daily"),
      ordered = TRUE),
    contact_other_a = factor(
      as.vector(data[vars_contact_other], "character"),
      levels = c(
        "A few times a year or less",
        "About once a month",
        "Several times a month",
        "Several times a week",
        "Daily"),
      ordered = TRUE),
    # for original labels, uncomment below code
    # relation_orig_a = as.vector(data[vars_relation], "character"),
    relation_a = as.vector(data[vars_relation_new], "character"),
    friend_a = as.vector(data[vars_friend], "character"),
    has_child_a = as.vector(data[vars_has_child], "character"),
    num_child_a = as.vector(data[vars_num_child], "character"),
    age_child_a = as.vector(data[vars_age_child], "character"),
    happiness_child_a = as.vector(data[vars_happiness_child], "character"),
    childwish_a = as.vector(data[vars_childwish], "character"),
    childfree_a = as.vector(data[vars_childfree], "character"),
    help_child_a = as.vector(data[vars_help_child], "character"),
    talk_child_a = as.vector(data[vars_talk_child], "character")
  )

  # Code below creates new variables based on relation to alter
    alter_attr$primary_relation_a = as.character(
      lapply(alter_attr$relation_a, function(x) primary_relationship(x))
    )
  return(alter_attr)
}
