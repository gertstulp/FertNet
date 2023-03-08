#' Produces tidy dataset of social networks and fertility data (LISS: wj18a_EN_1.0p.sav) with network data as listcolumns
#'
#' @param add_question_text Add question text as variable attributes? (default: FALSE)
#' @param tidygraph_col Should a variable `tidygraph` be created that includes tidygraph object for each respondent? (default: FALSE)
#' @param background_vars Should respondent background variables be added? Requires presence of avars_201802_EN_1.0p.sav (default: FALSE)
#' @param remove_timing_vars Should variables on timing of survey responses be removed? (default: FALSE)
#'
#' @return Tibble of social networks and fertility data (LISS: wj18a_EN_1.0p.sav) with network data as listcolumns
#'
#' @examplesIf file.exists("wj18a_EN_1.0p.sav")
#' produce_data()
#' produce_data(TRUE, TRUE, TRUE, TRUE)
#'
#' @export
produce_data <- function(add_question_text = FALSE,
                         tidygraph_col = FALSE,
                         background_vars = FALSE,
                         remove_timing_vars = FALSE) {

  data <- read_data() |>
    translate() |>
    change_column_types() |>
    fix_errors() |>
    create_relation_labels() |>
    create_nw()

  # This create the question text as label-attributes for each column
  if(add_question_text) {
    # `var_labels_lookup` is defined in var_labels_lookup.R
    for(i in names(data)) {
      attributes(data[[i]])$label <- names(var_labels_lookup)[match(i, var_labels_lookup)]
    }
  }

  if(tidygraph_col) {
    data <- data |> create_tidygraph()
  }

  if(background_vars) {
    data <- merge(x = data, y = get_background_vars(),
                  by = "nomem_encr", all.x = TRUE)
  }

  if(remove_timing_vars) {
    data <- data |> remove_timing_vars()
  }

  return(data)
}
