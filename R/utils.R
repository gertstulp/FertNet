# Function needed to correct alter-alter-ties when duplicate was mentioned
# All connections with specified alter will be removed from alter-alter ties
# used in `fix_errors()`
remove_alter <- function(ties, alter) {
  if(ties == alter) {
    ties_out <- ""
  } else if(startsWith(ties, paste0(alter, ", "))) {
    ties_out <- sub(paste0(alter, ", "), replacement = "", x = ties)
  } else {
    ties_out <- gsub(paste0(", ", alter, ","), replacement = ",", x = ties)
  }
  return(ties_out)
}

# Function to replace labels with "14: ..." (`relabel$label_orig`)
# by manually checked and created labels in (`label_rec` and `label_new`)
# used in `create_relation_labels()`
replace_label <- function(relationship, old_lab, new_lab) {
  if( relationship %in% old_lab ) {
    return( new_lab[ min(which(relationship == old_lab)) ] )
  } else {
    return( relationship )
  }
}

# Function to add primary relationship to alter/node attributes dataframe
# used in `create_nw()` and `create_alter_attr()`
primary_relationship <- function(string_names) {

  # For a full description of this process, please see Buijs, V. L., & Stulp, G. (2022).
  # Friends, family, and family friends: Predicting friendships of Dutch women.
  # Social Networks, 70, 25-35. https://doi.org/10.1016/j.socnet.2021.10.008.
  # and https://doi.org/10.34894/EZCDOA

  vect_rel <- unlist(
    strsplit(gsub(" ","", string_names),
             split = "[, ]") # Regular expression split on comma
  )
  # Start with 5, because "2, 5" means parent of partner
  if(5 %in% vect_rel) { "In-law" }
  else if(1 %in% vect_rel) { "Partner" }
  else if(2 %in% vect_rel) { "Parent" }
  else if(3 %in% vect_rel) { "Sibling" }
  else if(4 %in% vect_rel) { "Kin" }
  else if(6 %in% vect_rel) { "Partner's friends" }
  else if(7 %in% vect_rel) { "Primary school" }
  else if(8 %in% vect_rel) { "High-school" }
  else if(9 %in% vect_rel) { "College" }
  else if(10 %in% vect_rel) { "Work" }
  else if(11 %in% vect_rel) { "Social activity" }
  else if(12 %in% vect_rel) { "Mutual acquaintance" }
  else if(13 %in% vect_rel) { "Neighbourhood" }
  else if(14 %in% vect_rel) { "Other" }
  else if(15 %in% vect_rel) { "Other: Via family" }
  else if(16 %in% vect_rel) { "Other: Via children" }
  else if(17 %in% vect_rel) { "Other: Roommate" }
  else if(18 %in% vect_rel) { "Other: Caregiver" }
  else if(19 %in% vect_rel) { "Other: Ex partner" }
  else if(20 %in% vect_rel) { "Other: Via ex partner" }
  else if(21 %in% vect_rel) { "Other: Traveling" }
  else if(22 %in% vect_rel) { "Other: Via internet" }
  else if(23 %in% vect_rel) { "Other: Friend" }
  else { NA_character_ }

}
