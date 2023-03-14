# FertNet is a very niche package tailored to the processing of one dataset
# this is why most functions do not have tests, below some tests for functions
# that *may* be useful outside this package, and that have less documentation
test_that("remove alter at start", {
  expect_equal(remove_alter(c("7, 13, 14, 16, 17, 18, 19, 21"), "7"),
               c("13, 14, 16, 17, 18, 19, 21"))
})

test_that("remove alter when not present", {
  expect_equal(remove_alter(c("13, 14, 16, 17, 18, 19, 21"), "7"),
               c("13, 14, 16, 17, 18, 19, 21"))
})

test_that("remove alter when in middle present", {
  expect_equal(remove_alter(c("5, 6, 7, 13"), "6"),
               c("5, 7, 13"))
})

test_that("remove alter when last", {
  expect_equal(remove_alter(c("5, 6, 7, 13, 20"), "20"),
               c("5, 6, 7, 13"))
})

test_that("replace label generic case", {
  expect_equal(replace_label(c("b"),
                             c("a", "b", "c", "d"),
                             c("A", "B", "C", "D")),
               c("B"))
})

test_that("replace label original categorie", {
  expect_equal(replace_label(c("5"),
                             relabel$label_orig,
                             relabel$label_rec),
               c("5"))
})

test_that("replace label other categorie", {
  expect_equal(replace_label(c("14:moeders zijn vriendinnen"),
                             relabel$label_orig,
                             relabel$label_rec),
               c("14: via familie"))
})

test_that("replace label multiple standard categories", {
  expect_equal(replace_label(c("11, 12"),
                             relabel$label_orig,
                             relabel$label_rec),
               c("11, 12"))
})

test_that("replace label multiple with other", {
  expect_equal(replace_label(c("6, 12, 14:Kroegkennis"),
                             relabel$label_orig,
                             relabel$label_rec),
               c("6, 11, 12"))
})

test_that("primary relationship partner", {
  expect_equal(primary_relationship(c("1")),
               "Partner")
})

test_that("primary relationship partner from multiple", {
  expect_equal(primary_relationship(c("1, 2, 4")),
               "Partner")
})

test_that("primary relationship higher category", {
  expect_equal(primary_relationship(c("22, 23, 24")),
               "Other: Via internet")
})

test_that("primary relationship parent-in-law", {
  expect_equal(primary_relationship(c("2, 5")),
               "In-law")
})
