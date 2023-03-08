#' Fixes reporting errors and inconsistencies in social networks and fertility data (LISS: wj18a_EN_1.0p.sav)
#'
#' @param data Tibble which is the result of `change_column_types(translate(read_data())`
#'
#' @return Tibble in which data errors are fixed and data worries are flagged
#'
#' @examplesIf file.exists("wj18a_EN_1.0p.sav")
#' read_data() |> translate() |> change_column_types() |> fix_errors()
#'
#' @export
fix_errors <- function(data) {

  ### ENTIRE DATASET ###
  # change "Omitted" into NA
  data[data ==  "Omitted"] <- NA

  ### VARIABLE birthyear_partner ###
  # change 999 values in birthyear partner to NA
  data$birthyear_partner[data$birthyear_partner == 999] <- NA
  # fix likely input errors
  data$birthyear_partner[data$birthyear_partner == 73] <- 1973
  data$birthyear_partner[data$birthyear_partner == 81] <- 1981
  data$birthyear_partner[data$birthyear_partner == 1897] <- 1987

  ### VARIABLE num_children ###
  data$num_children[data$num_children == "missing"] <- NA
  # turn to numeric, because only numbers chosen
  data$num_children <- as.numeric(data$num_children)

  ### VARIABLE num_children_biol ###
  # turn to numeric, because only numbers chosen
  data$num_children_biol <- as.numeric(data$num_children_biol)

  ### VARIABLE names_network ###
  data$names_network[data$names_network == "Alle namen komen uit het geheugen, en ik het niet gebruik gemaakt van een lijst met contacten"] <- "I drew all names from memory, and I did not use a list of contacts"
  data$names_network[data$names_network == "Ik heb gebruikt gemaakt van mijn mobiele telefoon"] <- "I made use of my mobile phone"
  data$names_network[data$names_network == "Ik heb gebruik gemaakt van mijn email"] <- "I made use of my email"
  data$names_network[data$names_network == "Ik heb gebruik gemaakt van Facebook"] <- "I made use of Facebook"
  data$names_network[data$names_network == "5:even gekeken in mijn messenger lijst, maar was in principe niet nodig. Ik wilde belangrijke mensen niet missen"] <- "I drew all names from memory, and I did not use a list of contacts"
  data$names_network[data$names_network == "5:WhatsApp"] <- "I made use of my mobile phone"
  data$names_network[data$names_network == "5:mijn geheugen en facebook"] <- "I made use of Facebook"
  data$names_network[data$names_network == "5:facebook5"] <- "I made use of Facebook"
  data$names_network[data$names_network == "5:alles: Facebook, email, telefoonboek"] <- "I made use of Facebook"
  data$names_network[data$names_network == "5:Watts app"] <- "I made use of my mobile phone"
  data$names_network[data$names_network == "5:Mijn eigen geheugen"] <- "I drew all names from memory, and I did not use a list of contacts"
  data$names_network[data$names_network == "5:verzonen"] <- "I drew all names from memory, and I did not use a list of contacts"
  data$names_network[data$names_network == "5:vriende kring"] <- "I drew all names from memory, and I did not use a list of contacts"
  data$names_network[data$names_network == ""] <- NA

  ### ERRORS FIXED BASED ON COMMENTS ###
  # see https://dataverse.nl/api/access/datafile/106315 for further information

  # makes new variable based on important information disclosed in comments
  phone <- c(808709, 813705, 817694, 822418, 857757, 863275, 867241, 876165, 884335)
  data$remove_resp <- ifelse(data$nomem_encr %in% phone, "survey on phone/ipad", "keep")
  data$remove_resp[data$nomem_encr == 881655] <- "25 alters too many"


  data$num_child_alter13[data$nomem_encr == 839886] <- "2"
  data$num_child_alter14[data$nomem_encr == 839886] <- "2"

  data$age_alter14[data$nomem_encr == 815560] <- "18-"
  data$age_alter16[data$nomem_encr == 815560] <- "18-"
  data$age_alter17[data$nomem_encr == 815560] <- "18-"
  data$age_alter20[data$nomem_encr == 815560] <- "18-"
  data$age_alter21[data$nomem_encr == 815560] <- "18-"

  data$age_alter4[data$nomem_encr == 822900] <- "18-"
  data$age_alter25[data$nomem_encr == 822900] <- "18-"

  data$age_alter15[data$nomem_encr == 827145] <- "18-"
  data$age_alter16[data$nomem_encr == 827145] <- "18-"

  data$age_alter4[data$nomem_encr == 832040] <- "18-"

  data$age_alter2[data$nomem_encr == 870217] <- "18-"
  data$age_alter3[data$nomem_encr == 870217] <- "18-"
  data$relation_alter2[data$nomem_encr == 870217] <- "4"
  data$relation_alter3[data$nomem_encr == 870217] <- "4"

  data$age_alter3[data$nomem_encr == 887640] <- "18-"
  data$age_alter4[data$nomem_encr == 887640] <- "18-"
  data$relation_alter3[data$nomem_encr == 887640] <- "4"
  data$relation_alter4[data$nomem_encr == 887640] <- "4"

  data$has_child_alter17[data$nomem_encr == 817800] <- "Does not have (a) child(ren) and is not expecting a child"
  data$num_child_alter17[data$nomem_encr == 817800] <- NA
  data$age_child_alter17[data$nomem_encr == 817800] <- NA
  data$happiness_child_alter17[data$nomem_encr == 817800] <- NA

  data$childfree_alter15[data$nomem_encr == 826809] <- "I don't know whether person wishes to remain childless"

  data$childfree_alter25[data$nomem_encr == 829724] <- "I don't know whether person wishes to remain childless"

  data$childfree_alter20[data$nomem_encr == 842053] <- "I don't know whether person wishes to remain childless"

  data$childfree_alter15[data$nomem_encr == 868435] <- "I don't know whether person wishes to remain childless"

  data$childfree_alter24[data$nomem_encr == 869122] <- "I don't know whether person wishes to remain childless"
  data$help_child_alter19[data$nomem_encr == 869122] <- "Could not ask for help in caring for child"
  data$talk_child_alter2[data$nomem_encr == 869122] <- "Do not discuss having children with this person"

  data$childfree_alter24[data$nomem_encr == 870672] <- "I don't know whether person wishes to remain childless"

  data$childfree_alter20[data$nomem_encr == 896472] <- "I don't know whether person wishes to remain childless"

  data$remove_resp[data$nomem_encr == 808712] <- "whatsapp included in  personal contact"

  data$which_alters_known_alter14[data$nomem_encr == 809582] <- "15, 22, 23"

  table(data$has_child_alter13)

  data$has_child_alter13[data$nomem_encr == 811135] <- "Does not have (a) child(ren) and is not expecting a child"
  data$has_child_alter22[data$nomem_encr == 811135] <- "Does not have (a) child(ren) and is not expecting a child"
  data$num_child_alter13[data$nomem_encr == 811135] <- NA
  data$num_child_alter22[data$nomem_encr == 811135] <- NA
  data$age_child_alter13[data$nomem_encr == 811135] <- NA
  data$age_child_alter22[data$nomem_encr == 811135] <- NA
  data$happiness_child_alter13[data$nomem_encr == 811135] <- NA
  data$happiness_child_alter22[data$nomem_encr == 811135] <- NA
  data$childwish_alter13[data$nomem_encr == 811135] <- "Wishes to have children"
  data$childfree_alter22[data$nomem_encr == 811135] <- "Prefers to remain childless"

  data$relation_alter5[data$nomem_encr == 811282] <- "14: Via familie"
  data$relation_alter16[data$nomem_encr == 811282] <- "14: Via familie"
  data$relation_alter17[data$nomem_encr == 811282] <- "14: Via familie"
  data$relation_alter22[data$nomem_encr == 811282] <- "14: Via familie"
  data$relation_alter23[data$nomem_encr == 811282] <- "14: Via familie"
  data$relation_alter24[data$nomem_encr == 811282] <- "12, 14: Via familie"

  data$alter7[data$nomem_encr == 815173] <- ""
  data$sex_alter7[data$nomem_encr == 815173] <- NA
  data$age_alter7[data$nomem_encr == 815173] <- ""
  data$relation_alter7[data$nomem_encr == 815173] <- ""
  data$closeness_alter7[data$nomem_encr == 815173] <- NA
  data$education_alter7[data$nomem_encr == 815173] <- NA
  data$contact_f2f_alter7[data$nomem_encr == 815173] <- NA
  data$contact_other_pers_alter7[data$nomem_encr == 815173] <- NA
  data$friend_alter7[data$nomem_encr == 815173] <- NA
  data$has_child_alter7[data$nomem_encr == 815173] <- NA
  data$num_child_alter7[data$nomem_encr == 815173] <- NA
  data$age_child_alter7[data$nomem_encr == 815173] <- NA
  data$happiness_child_alter7[data$nomem_encr == 815173] <- NA
  data$childwish_alter7[data$nomem_encr == 815173] <- NA
  data$childfree_alter7[data$nomem_encr == 815173] <- NA
  data$help_child_alter7[data$nomem_encr == 815173] <- NA
  data$talk_child_alter7[data$nomem_encr == 815173] <- NA
  data$which_alters_known_alter1[data$nomem_encr == 815173] <- remove_alter(data$which_alters_known_alter1[data$nomem_encr == 815173], "7")
  data$which_alters_known_alter2[data$nomem_encr == 815173] <- remove_alter(data$which_alters_known_alter2[data$nomem_encr == 815173], "7")
  data$which_alters_known_alter3[data$nomem_encr == 815173] <- remove_alter(data$which_alters_known_alter3[data$nomem_encr == 815173], "7")
  data$which_alters_known_alter4[data$nomem_encr == 815173] <- remove_alter(data$which_alters_known_alter4[data$nomem_encr == 815173], "7")
  data$which_alters_known_alter5[data$nomem_encr == 815173] <- remove_alter(data$which_alters_known_alter5[data$nomem_encr == 815173], "7")
  data$which_alters_known_alter6[data$nomem_encr == 815173] <- remove_alter(data$which_alters_known_alter6[data$nomem_encr == 815173], "7")

  data$remove_resp[data$nomem_encr == 815173] <- "removed duplicate alter"

  data$relation_alter8[data$nomem_encr == 816452] <- 8

  data$relation_alter13[data$nomem_encr == 818963] <- 5

  data$which_alters_known_alter8[data$nomem_encr == 821145] <- "9, 10, 11, 24"
  data$which_alters_known_alter9[data$nomem_encr == 821145] <- "10, 11, 24"
  data$which_alters_known_alter10[data$nomem_encr == 821145] <- "11, 24"
  data$which_alters_known_alter11[data$nomem_encr == 821145] <- "24"

  data$relation_alter8[data$nomem_encr == 822479] <- 4

  data$remove_resp[data$nomem_encr == 822860] <- "forgot partner as alter"

  data$age_child_alter24[data$nomem_encr == 822924] <- "Between 6 and 12 months"

  data$age_alter8[data$nomem_encr == 831747] <- "50+"
  data$age_alter11[data$nomem_encr == 831747] <- "50+"

  data$remove_resp[data$nomem_encr == 831892] <- "parents of adult children not considered parents"

  data$relation_alter8[data$nomem_encr == 835183] <- 4

  data$relation_alter4[data$nomem_encr == 837594] <- NA

  data$childwish_alter7[data$nomem_encr == 840460] <- "Wishes to have children"

  data$has_child_alter16[data$nomem_encr == 844924] <- "Does have (a) child(ren) or is expecting a child"
  data$has_child_alter17[data$nomem_encr == 844924] <- "Does have (a) child(ren) or is expecting a child"
  data$has_child_alter18[data$nomem_encr == 844924] <- "Does have (a) child(ren) or is expecting a child"

  data$num_child_alter16[data$nomem_encr == 844924] <- "3"
  data$num_child_alter17[data$nomem_encr == 844924] <- "3"
  data$num_child_alter18[data$nomem_encr == 844924] <- "More than 5"
  data$age_child_alter16[data$nomem_encr == 844924] <- "Older than 5 years"
  data$age_child_alter17[data$nomem_encr == 844924] <- "Older than 5 years"
  data$age_child_alter18[data$nomem_encr == 844924] <- "Older than 5 years"

  data$remove_resp[data$nomem_encr == 847976] <- "probably on phone"

  data$relation_alter2[data$nomem_encr == 853521] <- 7

  data$alter20[data$nomem_encr == 860049] <- ""
  data$sex_alter20[data$nomem_encr == 860049] <- NA
  data$age_alter20[data$nomem_encr == 860049] <- ""
  data$relation_alter20[data$nomem_encr == 860049] <- ""
  data$closeness_alter20[data$nomem_encr == 860049] <- NA
  data$education_alter20[data$nomem_encr == 860049] <- NA
  data$contact_f2f_alter20[data$nomem_encr == 860049] <- NA
  data$contact_other_pers_alter20[data$nomem_encr == 860049] <- NA
  data$friend_alter20[data$nomem_encr == 860049] <- NA
  data$has_child_alter20[data$nomem_encr == 860049] <- NA
  data$num_child_alter20[data$nomem_encr == 860049] <- NA
  data$age_child_alter20[data$nomem_encr == 860049] <- NA
  data$happiness_child_alter20[data$nomem_encr == 860049] <- NA
  data$childwish_alter20[data$nomem_encr == 860049] <- NA
  data$childfree_alter20[data$nomem_encr == 860049] <- NA
  data$help_child_alter20[data$nomem_encr == 860049] <- NA
  data$talk_child_alter20[data$nomem_encr == 860049] <- NA
  data$which_alters_known_alter1[data$nomem_encr == 860049] <- remove_alter(data$which_alters_known_alter1[data$nomem_encr == 860049], "20")
  data$which_alters_known_alter2[data$nomem_encr == 860049] <- remove_alter(data$which_alters_known_alter2[data$nomem_encr == 860049], "20")
  data$which_alters_known_alter3[data$nomem_encr == 860049] <- remove_alter(data$which_alters_known_alter3[data$nomem_encr == 860049], "20")
  data$which_alters_known_alter4[data$nomem_encr == 860049] <- remove_alter(data$which_alters_known_alter4[data$nomem_encr == 860049], "20")
  data$which_alters_known_alter5[data$nomem_encr == 860049] <- remove_alter(data$which_alters_known_alter5[data$nomem_encr == 860049], "20")
  data$which_alters_known_alter6[data$nomem_encr == 860049] <- remove_alter(data$which_alters_known_alter6[data$nomem_encr == 860049], "20")
  data$which_alters_known_alter7[data$nomem_encr == 860049] <- remove_alter(data$which_alters_known_alter7[data$nomem_encr == 860049], "20")
  data$which_alters_known_alter8[data$nomem_encr == 860049] <- remove_alter(data$which_alters_known_alter8[data$nomem_encr == 860049], "20")
  data$which_alters_known_alter9[data$nomem_encr == 860049] <- remove_alter(data$which_alters_known_alter9[data$nomem_encr == 860049], "20")
  data$which_alters_known_alter10[data$nomem_encr == 860049] <- remove_alter(data$which_alters_known_alter10[data$nomem_encr == 860049], "20")
  data$which_alters_known_alter11[data$nomem_encr == 860049] <- remove_alter(data$which_alters_known_alter11[data$nomem_encr == 860049], "20")
  data$which_alters_known_alter12[data$nomem_encr == 860049] <- remove_alter(data$which_alters_known_alter12[data$nomem_encr == 860049], "20")
  data$which_alters_known_alter13[data$nomem_encr == 860049] <- remove_alter(data$which_alters_known_alter13[data$nomem_encr == 860049], "20")
  data$which_alters_known_alter14[data$nomem_encr == 860049] <- remove_alter(data$which_alters_known_alter14[data$nomem_encr == 860049], "20")
  data$which_alters_known_alter15[data$nomem_encr == 860049] <- remove_alter(data$which_alters_known_alter15[data$nomem_encr == 860049], "20")
  data$which_alters_known_alter16[data$nomem_encr == 860049] <- remove_alter(data$which_alters_known_alter16[data$nomem_encr == 860049], "20")
  data$which_alters_known_alter17[data$nomem_encr == 860049] <- remove_alter(data$which_alters_known_alter17[data$nomem_encr == 860049], "20")
  data$which_alters_known_alter18[data$nomem_encr == 860049] <- remove_alter(data$which_alters_known_alter18[data$nomem_encr == 860049], "20")
  data$which_alters_known_alter19[data$nomem_encr == 860049] <- remove_alter(data$which_alters_known_alter19[data$nomem_encr == 860049], "20")

  data$remove_resp[data$nomem_encr == 860049] <- "removed duplicate alter"

  data$alter9[data$nomem_encr == 860922] <- ""
  data$sex_alter9[data$nomem_encr == 860922] <- NA
  data$age_alter9[data$nomem_encr == 860922] <- ""
  data$relation_alter9[data$nomem_encr == 860922] <- ""
  data$closeness_alter9[data$nomem_encr == 860922] <- NA
  data$education_alter9[data$nomem_encr == 860922] <- NA
  data$contact_f2f_alter9[data$nomem_encr == 860922] <- NA
  data$contact_other_pers_alter9[data$nomem_encr == 860922] <- NA
  data$friend_alter9[data$nomem_encr == 860922] <- NA
  data$has_child_alter9[data$nomem_encr == 860922] <- NA
  data$num_child_alter9[data$nomem_encr == 860922] <- NA
  data$age_child_alter9[data$nomem_encr == 860922] <- NA
  data$happiness_child_alter9[data$nomem_encr == 860922] <- NA
  data$childwish_alter9[data$nomem_encr == 860922] <- NA
  data$childfree_alter9[data$nomem_encr == 860922] <- NA
  data$help_child_alter9[data$nomem_encr == 860922] <- NA
  data$talk_child_alter9[data$nomem_encr == 860922] <- NA
  data$which_alters_known_alter1[data$nomem_encr == 860922] <- remove_alter(data$which_alters_known_alter1[data$nomem_encr == 860922], "9")
  data$which_alters_known_alter2[data$nomem_encr == 860922] <- remove_alter(data$which_alters_known_alter2[data$nomem_encr == 860922], "9")
  data$which_alters_known_alter3[data$nomem_encr == 860922] <- remove_alter(data$which_alters_known_alter3[data$nomem_encr == 860922], "9")
  data$which_alters_known_alter4[data$nomem_encr == 860922] <- remove_alter(data$which_alters_known_alter4[data$nomem_encr == 860922], "9")
  data$which_alters_known_alter5[data$nomem_encr == 860922] <- remove_alter(data$which_alters_known_alter5[data$nomem_encr == 860922], "9")
  data$which_alters_known_alter6[data$nomem_encr == 860922] <- remove_alter(data$which_alters_known_alter6[data$nomem_encr == 860922], "9")
  data$which_alters_known_alter7[data$nomem_encr == 860922] <- remove_alter(data$which_alters_known_alter7[data$nomem_encr == 860922], "9")
  data$which_alters_known_alter8[data$nomem_encr == 860922] <- remove_alter(data$which_alters_known_alter8[data$nomem_encr == 860922], "9")
  data$has_child_alter24[data$nomem_encr == 860922] <- "Does have (a) child(ren) or is expecting a child"
  data$has_child_alter25[data$nomem_encr == 860922] <- "Does have (a) child(ren) or is expecting a child"

  data$remove_resp[data$nomem_encr == 860922] <- "removed duplicate alter"

  data$num_child_alter2[data$nomem_encr == 865341] <- "3"

  data$when_childwish[data$nomem_encr == 867355] <- "I am currently expecting a child"

  data$has_child_alter3[data$nomem_encr == 869845] <- "Does not have (a) child(ren) and is not expecting a child"
  data$num_child_alter3[data$nomem_encr == 869845] <- NA
  data$age_child_alter3[data$nomem_encr == 869845] <- NA
  data$happiness_child_alter3[data$nomem_encr == 869845] <- NA

  data$ideal_family_size[data$nomem_encr == 870370] <- 2
  data$when_childwish[data$nomem_encr == 870370] <- "I am currently expecting a child"

  data$age_alter2[data$nomem_encr == 870700] <- "18-"
  data$age_alter3[data$nomem_encr == 870700] <- "18-"
  data$age_alter6[data$nomem_encr == 870700] <- "18-"
  data$age_child_alter5[data$nomem_encr == 870700] <- "I don't know"

  data$has_child_alter24[data$nomem_encr == 873617] <- "Does not have (a) child(ren) and is not expecting a child"
  data$num_child_alter24[data$nomem_encr == 873617] <- NA
  data$age_child_alter24[data$nomem_encr == 873617] <- NA
  data$happiness_child_alter24[data$nomem_encr == 873617] <- NA

  data$alter20[data$nomem_encr == 875836] <- ""
  data$sex_alter20[data$nomem_encr == 875836] <- NA
  data$age_alter20[data$nomem_encr == 875836] <- ""
  data$relation_alter20[data$nomem_encr == 875836] <- ""
  data$closeness_alter20[data$nomem_encr == 875836] <- NA
  data$education_alter20[data$nomem_encr == 875836] <- NA
  data$contact_f2f_alter20[data$nomem_encr == 875836] <- NA
  data$contact_other_pers_alter20[data$nomem_encr == 875836] <- NA
  data$friend_alter20[data$nomem_encr == 875836] <- NA
  data$has_child_alter20[data$nomem_encr == 875836] <- NA
  data$num_child_alter20[data$nomem_encr == 875836] <- NA
  data$age_child_alter20[data$nomem_encr == 875836] <- NA
  data$happiness_child_alter20[data$nomem_encr == 875836] <- NA
  data$childwish_alter20[data$nomem_encr == 875836] <- NA
  data$childfree_alter20[data$nomem_encr == 875836] <- NA
  data$help_child_alter20[data$nomem_encr == 875836] <- NA
  data$talk_child_alter20[data$nomem_encr == 875836] <- NA
  data$which_alters_known_alter1[data$nomem_encr == 875836] <- remove_alter(data$which_alters_known_alter1[data$nomem_encr == 875836], "20")
  data$which_alters_known_alter2[data$nomem_encr == 875836] <- remove_alter(data$which_alters_known_alter2[data$nomem_encr == 875836], "20")
  data$which_alters_known_alter3[data$nomem_encr == 875836] <- remove_alter(data$which_alters_known_alter3[data$nomem_encr == 875836], "20")
  data$which_alters_known_alter4[data$nomem_encr == 875836] <- remove_alter(data$which_alters_known_alter4[data$nomem_encr == 875836], "20")
  data$which_alters_known_alter5[data$nomem_encr == 875836] <- remove_alter(data$which_alters_known_alter5[data$nomem_encr == 875836], "20")
  data$which_alters_known_alter6[data$nomem_encr == 875836] <- remove_alter(data$which_alters_known_alter6[data$nomem_encr == 875836], "20")
  data$which_alters_known_alter7[data$nomem_encr == 875836] <- remove_alter(data$which_alters_known_alter7[data$nomem_encr == 875836], "20")
  data$which_alters_known_alter8[data$nomem_encr == 875836] <- remove_alter(data$which_alters_known_alter8[data$nomem_encr == 875836], "20")
  data$which_alters_known_alter9[data$nomem_encr == 875836] <- remove_alter(data$which_alters_known_alter9[data$nomem_encr == 875836], "20")
  data$which_alters_known_alter10[data$nomem_encr == 875836] <- remove_alter(data$which_alters_known_alter10[data$nomem_encr == 875836], "20")
  data$which_alters_known_alter11[data$nomem_encr == 875836] <- remove_alter(data$which_alters_known_alter11[data$nomem_encr == 875836], "20")
  data$which_alters_known_alter12[data$nomem_encr == 875836] <- remove_alter(data$which_alters_known_alter12[data$nomem_encr == 875836], "20")
  data$which_alters_known_alter13[data$nomem_encr == 875836] <- remove_alter(data$which_alters_known_alter13[data$nomem_encr == 875836], "20")
  data$which_alters_known_alter14[data$nomem_encr == 875836] <- remove_alter(data$which_alters_known_alter14[data$nomem_encr == 875836], "20")
  data$which_alters_known_alter15[data$nomem_encr == 875836] <- remove_alter(data$which_alters_known_alter15[data$nomem_encr == 875836], "20")
  data$which_alters_known_alter16[data$nomem_encr == 875836] <- remove_alter(data$which_alters_known_alter16[data$nomem_encr == 875836], "20")
  data$which_alters_known_alter17[data$nomem_encr == 875836] <- remove_alter(data$which_alters_known_alter17[data$nomem_encr == 875836], "20")
  data$which_alters_known_alter18[data$nomem_encr == 875836] <- remove_alter(data$which_alters_known_alter18[data$nomem_encr == 875836], "20")
  data$which_alters_known_alter19[data$nomem_encr == 875836] <- remove_alter(data$which_alters_known_alter19[data$nomem_encr == 875836], "20")
  data$has_child_alter2[data$nomem_encr == 875836] <- "Does have (a) child(ren) or is expecting a child"
  data$has_child_alter3[data$nomem_encr == 875836] <- "Does have (a) child(ren) or is expecting a child"
  data$has_child_alter10[data$nomem_encr == 875836] <- "Does have (a) child(ren) or is expecting a child"
  data$has_child_alter11[data$nomem_encr == 875836] <- "Does have (a) child(ren) or is expecting a child"
  data$has_child_alter12[data$nomem_encr == 875836] <- "Does have (a) child(ren) or is expecting a child"
  data$has_child_alter17[data$nomem_encr == 875836] <- "Does have (a) child(ren) or is expecting a child"

  data$remove_resp[data$nomem_encr == 875836] <- "removed duplicate alter"

  data$alter22[data$nomem_encr == 877185] <- ""
  data$sex_alter22[data$nomem_encr == 877185] <- NA
  data$age_alter22[data$nomem_encr == 877185] <- ""
  data$relation_alter22[data$nomem_encr == 877185] <- ""
  data$closeness_alter22[data$nomem_encr == 877185] <- NA
  data$education_alter22[data$nomem_encr == 877185] <- NA
  data$contact_f2f_alter22[data$nomem_encr == 877185] <- NA
  data$contact_other_pers_alter22[data$nomem_encr == 877185] <- NA
  data$friend_alter22[data$nomem_encr == 877185] <- NA
  data$has_child_alter22[data$nomem_encr == 877185] <- NA
  data$num_child_alter22[data$nomem_encr == 877185] <- NA
  data$age_child_alter22[data$nomem_encr == 877185] <- NA
  data$happiness_child_alter22[data$nomem_encr == 877185] <- NA
  data$childwish_alter22[data$nomem_encr == 877185] <- NA
  data$childfree_alter22[data$nomem_encr == 877185] <- NA
  data$help_child_alter22[data$nomem_encr == 877185] <- NA
  data$talk_child_alter22[data$nomem_encr == 877185] <- NA
  data$which_alters_known_alter1[data$nomem_encr == 877185] <- remove_alter(data$which_alters_known_alter1[data$nomem_encr == 877185], "22")
  data$which_alters_known_alter2[data$nomem_encr == 877185] <- remove_alter(data$which_alters_known_alter2[data$nomem_encr == 877185], "22")
  data$which_alters_known_alter3[data$nomem_encr == 877185] <- remove_alter(data$which_alters_known_alter3[data$nomem_encr == 877185], "22")
  data$which_alters_known_alter4[data$nomem_encr == 877185] <- remove_alter(data$which_alters_known_alter4[data$nomem_encr == 877185], "22")
  data$which_alters_known_alter5[data$nomem_encr == 877185] <- remove_alter(data$which_alters_known_alter5[data$nomem_encr == 877185], "22")
  data$which_alters_known_alter6[data$nomem_encr == 877185] <- remove_alter(data$which_alters_known_alter6[data$nomem_encr == 877185], "22")
  data$which_alters_known_alter7[data$nomem_encr == 877185] <- remove_alter(data$which_alters_known_alter7[data$nomem_encr == 877185], "22")
  data$which_alters_known_alter8[data$nomem_encr == 877185] <- remove_alter(data$which_alters_known_alter8[data$nomem_encr == 877185], "22")
  data$which_alters_known_alter9[data$nomem_encr == 877185] <- remove_alter(data$which_alters_known_alter9[data$nomem_encr == 877185], "22")
  data$which_alters_known_alter10[data$nomem_encr == 877185] <- remove_alter(data$which_alters_known_alter10[data$nomem_encr == 877185], "22")
  data$which_alters_known_alter11[data$nomem_encr == 877185] <- remove_alter(data$which_alters_known_alter11[data$nomem_encr == 877185], "22")
  data$which_alters_known_alter12[data$nomem_encr == 877185] <- remove_alter(data$which_alters_known_alter12[data$nomem_encr == 877185], "22")
  data$which_alters_known_alter13[data$nomem_encr == 877185] <- remove_alter(data$which_alters_known_alter13[data$nomem_encr == 877185], "22")
  data$which_alters_known_alter14[data$nomem_encr == 877185] <- remove_alter(data$which_alters_known_alter14[data$nomem_encr == 877185], "22")
  data$which_alters_known_alter15[data$nomem_encr == 877185] <- remove_alter(data$which_alters_known_alter15[data$nomem_encr == 877185], "22")
  data$which_alters_known_alter16[data$nomem_encr == 877185] <- remove_alter(data$which_alters_known_alter16[data$nomem_encr == 877185], "22")
  data$which_alters_known_alter17[data$nomem_encr == 877185] <- remove_alter(data$which_alters_known_alter17[data$nomem_encr == 877185], "22")
  data$which_alters_known_alter18[data$nomem_encr == 877185] <- remove_alter(data$which_alters_known_alter18[data$nomem_encr == 877185], "22")
  data$which_alters_known_alter19[data$nomem_encr == 877185] <- remove_alter(data$which_alters_known_alter19[data$nomem_encr == 877185], "22")
  data$which_alters_known_alter20[data$nomem_encr == 877185] <- remove_alter(data$which_alters_known_alter20[data$nomem_encr == 877185], "22")
  data$which_alters_known_alter21[data$nomem_encr == 877185] <- remove_alter(data$which_alters_known_alter21[data$nomem_encr == 877185], "22")

  data$remove_resp[data$nomem_encr == 877185] <- "removed duplicate alter"

  data$which_alters_known_alter22[data$nomem_encr == 878146] <- "23, 25"
  data$which_alters_known_alter23[data$nomem_encr == 878146] <- "25"

  data$remove_resp[data$nomem_encr == 882009] <- "all forms contact in  personal contact"

  data$which_alters_known_alter11[data$nomem_encr == 886151] <- "12, 13, 14, 22"
  data$which_alters_known_alter12[data$nomem_encr == 886151] <- "13, 14, 22"
  data$which_alters_known_alter13[data$nomem_encr == 886151] <- "14, 22"

  data$contact_f2f_alter2[data$nomem_encr == 890093] <- "A few times a year or less"
  data$contact_f2f_alter5[data$nomem_encr == 890093] <- "A few times a year or less"
  data$contact_f2f_alter6[data$nomem_encr == 890093] <- "A few times a year or less"
  data$contact_f2f_alter8[data$nomem_encr == 890093] <- "A few times a year or less"
  data$contact_f2f_alter9[data$nomem_encr == 890093] <- "A few times a year or less"

  # This is different from original file, which included wrong id (8822009)
  data$remove_resp[data$nomem_encr == 890093] <- "all forms contact in  personal contact, but some changes made based on comment"

  data$has_child_alter1[data$nomem_encr == 890643] <- "Does have (a) child(ren) or is expecting a child"

  data$has_child_alter9[data$nomem_encr == 891409] <- "Does not have (a) child(ren) and is not expecting a child"
  data$has_child_alter12[data$nomem_encr == 891409] <- "Does not have (a) child(ren) and is not expecting a child"
  data$num_child_alter9[data$nomem_encr == 891409] <- NA
  data$num_child_alter12[data$nomem_encr == 891409] <- NA
  data$age_child_alter9[data$nomem_encr == 891409] <- NA
  data$age_child_alter12[data$nomem_encr == 891409] <- NA
  data$happiness_child_alter9[data$nomem_encr == 891409] <- NA
  data$happiness_child_alter12[data$nomem_encr == 891409] <- NA

  data$has_child_alter19[data$nomem_encr == 897924] <- "Does not have (a) child(ren) and is not expecting a child"
  data$num_child_alter19[data$nomem_encr == 897924] <- NA
  data$age_child_alter19[data$nomem_encr == 897924] <- NA
  data$happiness_child_alter19[data$nomem_encr == 897924] <- NA

  data$relation_alter18[data$nomem_encr == 803454] <- "11"

  data$relation_alter6[data$nomem_encr == 805819] <- "4"

  data$relation_alter3[data$nomem_encr == 806152] <- "4"
  data$relation_alter4[data$nomem_encr == 806152] <- "4"

  data$relation_alter22[data$nomem_encr == 813308] <- "14: via familie"

  data$relation_alter13[data$nomem_encr == 811871] <- "14: via kinderen"

  data$relation_alter18[data$nomem_encr == 812182] <- "11"
  data$relation_alter19[data$nomem_encr == 812182] <- "11"

  data$relation_alter12[data$nomem_encr == 819482] <- "4"

  data$relation_alter18[data$nomem_encr == 820193] <- "4"

  data$relation_alter2[data$nomem_encr == 821707] <- "4"
  data$relation_alter3[data$nomem_encr == 821707] <- "4"
  data$relation_alter4[data$nomem_encr == 821707] <- "4"

  data$relation_alter14[data$nomem_encr == 826159] <- "4"

  data$relation_alter19[data$nomem_encr == 831509] <- "14: via kinderen"

  data$age_alter25[data$nomem_encr == 832423] <- "18-"
  data$relation_alter25[data$nomem_encr == 832423] <- "4"

  data$relation_alter1[data$nomem_encr == 833786] <- "4"
  data$relation_alter2[data$nomem_encr == 833786] <- "4"

  data$age_alter1[data$nomem_encr == 834219] <- "18-"
  data$relation_alter1[data$nomem_encr == 834219] <- "4"

  # this deviates from original correction, which used erroneous nomem_encr
  data$relation_alter9[data$nomem_encr == 836892] <- "14: via familie"

  data$relation_alter21[data$nomem_encr == 838549] <- "9"
  data$relation_alter22[data$nomem_encr == 838549] <- "9"
  data$relation_alter23[data$nomem_encr == 838549] <- "9"
  data$relation_alter24[data$nomem_encr == 838549] <- "9"

  data$relation_alter21[data$nomem_encr == 840460] <- "12"

  data$relation_alter3[data$nomem_encr == 850665] <- "14: via kinderen"

  data$relation_alter21[data$nomem_encr == 858395] <- "14: via ex"
  data$relation_alter22[data$nomem_encr == 858395] <- "14: via ex"

  data$relation_alter2[data$nomem_encr == 860867] <- "4"

  data$relation_alter7[data$nomem_encr == 861550] <- "12, 13"

  data$relation_alter15[data$nomem_encr == 869083] <- "4"

  data$relation_alter2[data$nomem_encr == 870700] <- "4"
  data$relation_alter3[data$nomem_encr == 870700] <- "4"

  data$relation_alter5[data$nomem_encr == 875057] <- "4"
  data$relation_alter6[data$nomem_encr == 875057] <- "4"

  data$relation_alter25[data$nomem_encr == 876165] <- "14: via kinderen"

  data$relation_alter13[data$nomem_encr == 878836] <- "12"
  data$relation_alter25[data$nomem_encr == 878836] <- "12"

  data$relation_alter6[data$nomem_encr == 882574] <- "4"

  data$relation_alter14[data$nomem_encr == 884335] <- "14:overige"

  data$relation_alter4[data$nomem_encr == 889395] <- "1"
  data$relation_alter5[data$nomem_encr == 889395] <- "2"

  data$relation_alter19[data$nomem_encr == 890917] <- "4"

  data$relation_alter1[data$nomem_encr == 894563] <- "4"
  data$relation_alter2[data$nomem_encr == 894563] <- "4"

  data$relation_alter20[data$nomem_encr == 895120] <- "14: hulpverlener"
  data$relation_alter24[data$nomem_encr == 895120] <- "14: hulpverlener"

  data$relation_alter16[data$nomem_encr == 896380] <- "4"

  data$relation_alter2[data$nomem_encr == 896420] <- "14: overige"

  data$remove_resp[data$nomem_encr == 899462] <- "problematic alter relations"

  ### CREATE VARIABLE alters_reported ###
  # These are IDs of respondents that did not list 25 alters,
  # this information could only be identified from the original alter names
  # variables which were not disclosed to researchers for reasons of privacy
  alters_reported_v <- c(`834219` = 1, `806719` = 7, `822192` = 7,
                         `820913` = 7, `870819` = 7, `867156` = 7,
                         `850665` = 8, `869418` = 9, `831481` = 12,
                         `830533` = 12, `868820` = 14, `867721` = 14,
                         `811383` = 24)

  data$alters_reported <- ifelse(
    data$nomem_encr %in% names(alters_reported_v),
    alters_reported_v[ match(data$nomem_encr, names(alters_reported_v)) ],
    25
  )

  ### CREATE VARIABLE ties_missing ###
  # Important to know about respondents that did not report any tie
  data$ties_missing <- rowSums(data[vars_alter_ties] == "")

  ### CREATE VARIABLES on alter attributes missing ###
  # Create counts of number of missing on alter attribute
  # questions that should have no missings

  # `vars_age`, `vars_relation`, `vars_closeness`, `vars_contact_f2f, and
  # `vars_contact_other` defined in `var_types.R`

  data$age_missing <- rowSums(data[vars_age] == "")
  data$relation_missing <- rowSums(is.na(data[vars_relation]))
  data$closeness_missing <- rowSums(is.na(data[vars_closeness]))
  data$contact_f2f_missing <- rowSums(is.na(data[vars_contact_f2f]))
  data$contact_other_missing <- rowSums(is.na(data[vars_contact_other]))

  vars_missing <- c("age_missing", "relation_missing", "closeness_missing",
                    "contact_f2f_missing", "contact_other_missing")
  data$total_missing <- rowSums(data[ , vars_missing])
  # Divide by 275 (11 * 25) because there are 11 alter questions that all needed
  # 25 answers. For 5 binary alter variables, missing values were impossible.
  # For 6 other alter attributes, questions were not assessed for all alters.
  data$perc_missing_alter_attr <- (data$total_missing/275) * 100

  ### CREATE VARIABLE notes ###
  # This creates a variable `notes` that reports potential data worries
  # of respondents
  data$notes <- vector(length = nrow(data), "character")

  for(i in 1:nrow(data)) {
    temp_char <- vector("character")
    if(data$remove_resp[i] != "keep") {
      temp_char <- c(temp_char, data$remove_resp[i])
    }
    if(data$alters_reported[i] < 25) {
      temp_char <- c(temp_char, "alters reported < 25")
    }
    if(data$ties_missing[i] == 25) {
      temp_char <- c(temp_char, "all alter-ties missing")
    }
    if(data$perc_missing_alter_attr[i] > 10) {
      temp_char <- c(temp_char, "> 10% missing on alter attributes")
    }
    if(length(temp_char) == 0) {
      temp_char <- "no concerns"
    }
    data$notes[i] <- paste0(temp_char, collapse = ' & ')
  }

  # Remove temporary variables
  data <- data[ , which(!(names(data) %in% c("remove_resp" , vars_missing)))]

  return(data)
}
