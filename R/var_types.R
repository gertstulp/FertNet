# Vector with names of variables that are associated with timing of response
# used in `remove_timing_vars()`
time_vars <- c(
  "time_partner", "time_sex_partner", "time_birthyear_partner",
  "time_relationship_duration", "time_cohabiting", "time_cohabitation_form",
  "time_has_children", "time_num_children", "time_num_children_biol",
  "time_num_children_partner", "time_childwish", "time_ideal_family_size",
  "time_strength_preference", "time_when_childwish", "time_discussed_childwish",
  "time_childwish_partner", "time_family_size_nl", "time_happiness_children",
  "time_alter1", "time_alter2", "time_alter3", "time_alter4", "time_alter5",
  "time_alter6", "time_alter7", "time_alter8", "time_alter9", "time_alter10",
  "time_alter11", "time_alter12", "time_alter13", "time_alter14",
  "time_alter15", "time_alter16", "time_alter17", "time_alter18",
  "time_alter19", "time_alter20", "time_alter21", "time_alter22",
  "time_alter23", "time_alter24", "time_alter25", "time_sex_alters",
  "time_age_alters", "time_relation_alters", "time_closeness_alters",
  "time_education_alters", "time_contact_f2f_alters", "time_contact_other_pers_alters",
  "time_friend_alters", "time_has_child_alters", "time_num_age_child_alters",
  "time_happiness_child_alters", "time_childwish_alters", "time_childfree_alters",
  "time_help_child_alters", "time_talk_child_alters", "time_alters_alters",
  "time_pressure", "time_happiness_children_network", "time_names_network"
)

# Vectors with variable names for different node/alter attributes
# used in `create_nw()`, some also in `create_relation_labels()` and
# `change_column_types()`
vars_alters            <- paste0("alter", c(1:25))
vars_sex               <- paste0("sex_alter", c(1:25))
vars_age               <- paste0("age_alter", c(1:25))
vars_relation          <- paste0("relation_alter", c(1:25))
vars_relation_rec      <- paste0("relation_alter", c(1:25), "_rec")
vars_relation_new      <- paste0("relation_alter", c(1:25), "_new")
vars_closeness         <- paste0("closeness_alter", c(1:25))
vars_education         <- paste0("education_alter", c(1:25))
vars_contact_f2f       <- paste0("contact_f2f_alter", c(1:25))
vars_contact_other     <- paste0("contact_other_pers_alter", c(1:25))
vars_friend            <- paste0("friend_alter", c(1:25))
vars_has_child         <- paste0("has_child_alter", c(1:25))
vars_num_child         <- paste0("num_child_alter", c(1:25))
vars_age_child         <- paste0("age_child_alter", c(1:25))
vars_happiness_child   <- paste0("happiness_child_alter", c(1:25))
vars_childwish         <- paste0("childwish_alter", c(1:25))
vars_childfree         <- paste0("childfree_alter", c(1:25))
vars_help_child        <- paste0("help_child_alter", c(1:25))
vars_talk_child        <- paste0("talk_child_alter", c(1:25))

# One vector with all variable names of alter/node attributes
# used in `create_nw()`
vars_alter_attr <- c(vars_alters, vars_sex, vars_age,
                     vars_relation, vars_relation_rec, vars_relation_new,
                     vars_closeness, vars_education, vars_contact_f2f,
                     vars_contact_other, vars_friend, vars_has_child,
                     vars_num_child, vars_age_child, vars_happiness_child,
                     vars_childwish, vars_childfree, vars_help_child,
                     vars_talk_child)

# Vector with names of 25 alter-alter-ties variables
# used in `change_column_types()` and `create_nw()`
vars_alter_ties <- paste0( "which_alters_known_alter", c(1:25) )

# Vector with names of numeric variables that are not labelled
# used in `change_column_types()`
vars_num <- c(
  "nomem_encr", "year_month_survey", "time_partner", "time_sex_partner",
  "birthyear_partner", "time_birthyear_partner", "time_relationship_duration",
  "time_cohabiting", "time_cohabitation_form", "time_has_children",
  "time_num_children", "time_num_children_biol", "time_num_children_partner",
  "time_childwish", "time_ideal_family_size", "time_strength_preference",
  "time_when_childwish", "time_discussed_childwish", "time_childwish_partner",
  "time_family_size_nl", "time_happiness_children", "time_alter1",
  "time_alter2", "time_alter3", "time_alter4", "time_alter5", "time_alter6",
  "time_alter7", "time_alter8", "time_alter9", "time_alter10",
  "time_alter11", "time_alter12", "time_alter13", "time_alter14",
  "time_alter15", "time_alter16", "time_alter17", "time_alter18",
  "time_alter19", "time_alter20", "time_alter21", "time_alter22",
  "time_alter23", "time_alter24", "time_alter25", "time_sex_alters",
  "time_age_alters", "time_relation_alters", "time_closeness_alters",
  "time_education_alters", "time_contact_other_pers_alters", "time_friend_alters",
  "time_has_child_alters", "time_num_age_child_alters", "time_happiness_child_alters",
  "time_childwish_alters", "time_childfree_alters", "time_help_child_alters",
  "time_talk_child_alters", "time_alters_alters", "time_pressure",
  "time_happiness_children_network", "time_names_network", "duration"
)

# Vector with names of variables that needs to be of class character
# used in `change_column_types()`
vars_char <- c(vars_relation, vars_alter_ties)

# Vector with names of variables that needs to be turned to factors
# used in `change_column_types()`
vars_fct <- c(
  "partner", "sex_partner", "relationship_duration", "cohabiting",
  "cohabitation_form", "has_children", "num_children", "num_children_biol",
  "has_children_partner", "childwish", "ideal_family_size", "strength_preference",
  "when_childwish", "discussed_childwish", "childwish_partner",
  "family_size_nl", "happiness_children", "alter1", "alter2", "alter3",
  "alter4", "alter5", "alter6", "alter7", "alter8", "alter9", "alter10",
  "alter11", "alter12", "alter13", "alter14", "alter15", "alter16",
  "alter17", "alter18", "alter19", "alter20", "alter21", "alter22",
  "alter23", "alter24", "alter25", "sex_alter1", "sex_alter2",
  "sex_alter3", "sex_alter4", "sex_alter5", "sex_alter6", "sex_alter7",
  "sex_alter8", "sex_alter9", "sex_alter10", "sex_alter11", "sex_alter12",
  "sex_alter13", "sex_alter14", "sex_alter15", "sex_alter16", "sex_alter17",
  "sex_alter18", "sex_alter19", "sex_alter20", "sex_alter21", "sex_alter22",
  "sex_alter23", "sex_alter24", "sex_alter25", "age_alter1", "age_alter2",
  "age_alter3", "age_alter4", "age_alter5", "age_alter6", "age_alter7",
  "age_alter8", "age_alter9", "age_alter10", "age_alter11", "age_alter12",
  "age_alter13", "age_alter14", "age_alter15", "age_alter16", "age_alter17",
  "age_alter18", "age_alter19", "age_alter20", "age_alter21", "age_alter22",
  "age_alter23", "age_alter24", "age_alter25", "closeness_alter1",
  "closeness_alter2", "closeness_alter3", "closeness_alter4", "closeness_alter5",
  "closeness_alter6", "closeness_alter7", "closeness_alter8", "closeness_alter9",
  "closeness_alter10", "closeness_alter11", "closeness_alter12",
  "closeness_alter13", "closeness_alter14", "closeness_alter15",
  "closeness_alter16", "closeness_alter17", "closeness_alter18",
  "closeness_alter19", "closeness_alter20", "closeness_alter21",
  "closeness_alter22", "closeness_alter23", "closeness_alter24",
  "closeness_alter25", "education_alter1", "education_alter2",
  "education_alter3", "education_alter4", "education_alter5", "education_alter6",
  "education_alter7", "education_alter8", "education_alter9", "education_alter10",
  "education_alter11", "education_alter12", "education_alter13",
  "education_alter14", "education_alter15", "education_alter16",
  "education_alter17", "education_alter18", "education_alter19",
  "education_alter20", "education_alter21", "education_alter22",
  "education_alter23", "education_alter24", "education_alter25",
  "contact_f2f_alter1", "contact_f2f_alter2", "contact_f2f_alter3",
  "contact_f2f_alter4", "contact_f2f_alter5", "contact_f2f_alter6",
  "contact_f2f_alter7", "contact_f2f_alter8", "contact_f2f_alter9",
  "contact_f2f_alter10", "contact_f2f_alter11", "contact_f2f_alter12",
  "contact_f2f_alter13", "contact_f2f_alter14", "contact_f2f_alter15",
  "contact_f2f_alter16", "contact_f2f_alter17", "contact_f2f_alter18",
  "contact_f2f_alter19", "contact_f2f_alter20", "contact_f2f_alter21",
  "contact_f2f_alter22", "contact_f2f_alter23", "contact_f2f_alter24",
  "contact_f2f_alter25", "time_contact_f2f_alters", "contact_other_pers_alter1",
  "contact_other_pers_alter2", "contact_other_pers_alter3", "contact_other_pers_alter4",
  "contact_other_pers_alter5", "contact_other_pers_alter6", "contact_other_pers_alter7",
  "contact_other_pers_alter8", "contact_other_pers_alter9", "contact_other_pers_alter10",
  "contact_other_pers_alter11", "contact_other_pers_alter12", "contact_other_pers_alter13",
  "contact_other_pers_alter14", "contact_other_pers_alter15", "contact_other_pers_alter16",
  "contact_other_pers_alter17", "contact_other_pers_alter18", "contact_other_pers_alter19",
  "contact_other_pers_alter20", "contact_other_pers_alter21", "contact_other_pers_alter22",
  "contact_other_pers_alter23", "contact_other_pers_alter24", "contact_other_pers_alter25",
  "friend_alter1", "friend_alter2", "friend_alter3", "friend_alter4",
  "friend_alter5", "friend_alter6", "friend_alter7", "friend_alter8",
  "friend_alter9", "friend_alter10", "friend_alter11", "friend_alter12",
  "friend_alter13", "friend_alter14", "friend_alter15", "friend_alter16",
  "friend_alter17", "friend_alter18", "friend_alter19", "friend_alter20",
  "friend_alter21", "friend_alter22", "friend_alter23", "friend_alter24",
  "friend_alter25", "has_child_alter1", "has_child_alter2", "has_child_alter3",
  "has_child_alter4", "has_child_alter5", "has_child_alter6", "has_child_alter7",
  "has_child_alter8", "has_child_alter9", "has_child_alter10",
  "has_child_alter11", "has_child_alter12", "has_child_alter13",
  "has_child_alter14", "has_child_alter15", "has_child_alter16",
  "has_child_alter17", "has_child_alter18", "has_child_alter19",
  "has_child_alter20", "has_child_alter21", "has_child_alter22",
  "has_child_alter23", "has_child_alter24", "has_child_alter25",
  "num_child_alter1", "num_child_alter2", "num_child_alter3", "num_child_alter4",
  "num_child_alter5", "num_child_alter6", "num_child_alter7", "num_child_alter8",
  "num_child_alter9", "num_child_alter10", "num_child_alter11",
  "num_child_alter12", "num_child_alter13", "num_child_alter14",
  "num_child_alter15", "num_child_alter16", "num_child_alter17",
  "num_child_alter18", "num_child_alter19", "num_child_alter20",
  "num_child_alter21", "num_child_alter22", "num_child_alter23",
  "num_child_alter24", "num_child_alter25", "age_child_alter1",
  "age_child_alter2", "age_child_alter3", "age_child_alter4", "age_child_alter5",
  "age_child_alter6", "age_child_alter7", "age_child_alter8", "age_child_alter9",
  "age_child_alter10", "age_child_alter11", "age_child_alter12",
  "age_child_alter13", "age_child_alter14", "age_child_alter15",
  "age_child_alter16", "age_child_alter17", "age_child_alter18",
  "age_child_alter19", "age_child_alter20", "age_child_alter21",
  "age_child_alter22", "age_child_alter23", "age_child_alter24",
  "age_child_alter25", "happiness_child_alter1", "happiness_child_alter2",
  "happiness_child_alter3", "happiness_child_alter4", "happiness_child_alter5",
  "happiness_child_alter6", "happiness_child_alter7", "happiness_child_alter8",
  "happiness_child_alter9", "happiness_child_alter10", "happiness_child_alter11",
  "happiness_child_alter12", "happiness_child_alter13", "happiness_child_alter14",
  "happiness_child_alter15", "happiness_child_alter16", "happiness_child_alter17",
  "happiness_child_alter18", "happiness_child_alter19", "happiness_child_alter20",
  "happiness_child_alter21", "happiness_child_alter22", "happiness_child_alter23",
  "happiness_child_alter24", "happiness_child_alter25", "childwish_alter1",
  "childwish_alter2", "childwish_alter3", "childwish_alter4", "childwish_alter5",
  "childwish_alter6", "childwish_alter7", "childwish_alter8", "childwish_alter9",
  "childwish_alter10", "childwish_alter11", "childwish_alter12",
  "childwish_alter13", "childwish_alter14", "childwish_alter15",
  "childwish_alter16", "childwish_alter17", "childwish_alter18",
  "childwish_alter19", "childwish_alter20", "childwish_alter21",
  "childwish_alter22", "childwish_alter23", "childwish_alter24",
  "childwish_alter25", "childfree_alter1", "childfree_alter2",
  "childfree_alter3", "childfree_alter4", "childfree_alter5", "childfree_alter6",
  "childfree_alter7", "childfree_alter8", "childfree_alter9", "childfree_alter10",
  "childfree_alter11", "childfree_alter12", "childfree_alter13",
  "childfree_alter14", "childfree_alter15", "childfree_alter16",
  "childfree_alter17", "childfree_alter18", "childfree_alter19",
  "childfree_alter20", "childfree_alter21", "childfree_alter22",
  "childfree_alter23", "childfree_alter24", "childfree_alter25",
  "help_child_alter1", "help_child_alter2", "help_child_alter3",
  "help_child_alter4", "help_child_alter5", "help_child_alter6",
  "help_child_alter7", "help_child_alter8", "help_child_alter9",
  "help_child_alter10", "help_child_alter11", "help_child_alter12",
  "help_child_alter13", "help_child_alter14", "help_child_alter15",
  "help_child_alter16", "help_child_alter17", "help_child_alter18",
  "help_child_alter19", "help_child_alter20", "help_child_alter21",
  "help_child_alter22", "help_child_alter23", "help_child_alter24",
  "help_child_alter25", "talk_child_alter1", "talk_child_alter2",
  "talk_child_alter3", "talk_child_alter4", "talk_child_alter5",
  "talk_child_alter6", "talk_child_alter7", "talk_child_alter8",
  "talk_child_alter9", "talk_child_alter10", "talk_child_alter11",
  "talk_child_alter12", "talk_child_alter13", "talk_child_alter14",
  "talk_child_alter15", "talk_child_alter16", "talk_child_alter17",
  "talk_child_alter18", "talk_child_alter19", "talk_child_alter20",
  "talk_child_alter21", "talk_child_alter22", "talk_child_alter23",
  "talk_child_alter24", "talk_child_alter25", "pressure_friends",
  "pressure_parents", "happiness_children_network", "names_network",
  "questions_difficult_survey", "questions_clear_survey", "questions_thinking_survey",
  "questions_interesting_survey", "questions_enjoy_survey", "start_date_survey",
  "start_time_survey", "end_date_survey", "end_time_survey"
)
