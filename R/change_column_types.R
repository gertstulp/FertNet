#' Change column types for social networks and fertility data (LISS: wj18a_EN_1.0p.sav)
#'
#' @param data Tibble which is the result of `translate(read_data())`
#'
#' @return Tibble with corrected column types and updated labels
#'
#' @examplesIf file.exists("wj18a_EN_1.0p.sav")
#' read_data() |> translate() |> change_column_types()
#'
#' @export
change_column_types <- function(data) {

  # `vars_num`, `vars_char`, and `vars_fct` are defined in var_types.R

  # Transform numeric variables into numeric variables (and strip attributes)
  data[ , vars_num ] <- sapply(data[ , vars_num ], as.numeric)

  # Transforms alter-relationship & alter-ties variables into character variables
  # strip SPSS-labels
  data[ , vars_char ] <- sapply(data[ , vars_char ], as.character)

  # Transforms non-numeric, non-character labelled SPSS-variables into factors
  data[ , vars_fct ] <- sapply(data[ , vars_fct ],
                               function(x) as.character(haven::as_factor(x)))

  # Replace pesky curly quote by normal quote in entire dataset
  data[ , c(vars_char, vars_fct) ] <- data.frame(
    lapply(data[ , c(vars_char, vars_fct) ], function(x) { gsub("\u2019", "'", x) })
  )

  # Transform factors that have ordering in them
  data$relationship_duration <- factor(
    data$relationship_duration,
    levels = c("Less than 1 year", "Between 1 and 2 years",
               "Between 2 and 3 years", "Between 3 and 4 years",
               "Between 4 and 5 years", "More than 5 years"),
    ordered = TRUE)

  data$cohabitation_form <- factor(
    data$cohabitation_form,
    levels = c("No formal cohabitation form", "Cohabitation contract",
               "Registered partnership", "Marriage"),
    ordered = TRUE)

  data$childwish <- factor(
    data$childwish,
    levels = c("Absolutely not", "Probably not", "I don't know",
               "Probably so", "Absolutely so"),
    ordered = TRUE)

  data$when_childwish <- factor(
    data$when_childwish,
    levels = c("I am currently expecting a child", "As soon as possible",
               "Within two years", "Between two and three years from now",
               "Between three and four years from now",
               "Between four and five years from now",
               "In five years or more",
               "It doesn't really matter to me when I have children",
               "I'm not sure yet"),
    ordered = TRUE)

  data$happiness_children <- factor(
    data$happiness_children,
    levels = c("People without children are much happier than people with children",
               "People without children are slightly happier than people with children",
               "People with and without children are equally happy",
               "People with children are slightly happier than people without children",
               "People with children are much happier than people without children",
               "I don't know"),
    ordered = TRUE)

  data$pressure_friends <- factor(
    data$pressure_friends,
    levels = c("Completely disagree", "Disagree", "Slightly disagree",
               "Do not agree or disagree", "Agree slightly", "Agree",
               "Completely agree", "I don't know"),
    ordered = TRUE)

  data$pressure_parents <- factor(
    data$pressure_parents,
    levels = c("Completely disagree", "Disagree", "Slightly disagree",
               "Do not agree or disagree", "Agree slightly", "Agree",
               "Completely agree", "I don't know", "Not applicable"),
    ordered = TRUE)

  data$happiness_children_network <- factor(
    data$happiness_children_network,
    levels = c("I think people without children are much happier than those with children",
               "I think people without children are slightly happier than those with children",
               "I think people with and those without children are equally happy",
               "I think people with children are a bit happier than those without children",
               "I think people with children are much happier than those without children"),
    ordered = TRUE)

  return(data)
}
