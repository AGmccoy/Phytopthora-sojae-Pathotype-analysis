
# test calculate diversities ---------------------------------------------------
context("calculate_diversities()")
data(P_sojae_survey)
diversities <- calculate_diversities(x = P_sojae_survey,
                                     cutoff = 60,
                                     control = "susceptible",
                                     sample = "Isolate",
                                     gene = "Rps",
                                     perc_susc = "perc.susc")

test_that("calculate_diversities() works properly", {
  expect_s3_class(diversities, "hagis.diversities")
  expect_length(diversities, 9)
  expect_named(diversities, c("individual_pathotypes",
                              "table_of_pathotypes",
                              "number_of_samples",
                              "number_of_pathotypes",
                              "Simple",
                              "Gleason",
                              "Shannon",
                              "Simpson",
                              "Evenness"))
})

test_that("calculate_diversities() stops if lacking all params", {
  Ps <-
    system.file("extdata", "practice_data_set.csv", package = "hagis")
  Ps <- read.csv(Ps)
  expect_error(calculate_diversities(
    x = "y",
    cutoff = 60,
    control = "susceptible",
    sample = "Isolate",
    gene = "Rps",
    perc_susc = "perc.susc"
  ), regexp = "You have failed to provide all necessary inputs")
  expect_error(calculate_diversities(
    x = Ps,
    cutoff = "sixty",
    control = "susceptible",
    sample = "Isolate",
    gene = "Rps",
    perc_susc = "perc.susc"
  ), regexp = "You have failed to provide all necessary inputs")
  expect_error(calculate_diversities(
    x = Ps,
    cutoff = 60,
    control = NULL,
    sample = "Isolate",
    gene = "Rps",
    perc_susc = "perc.susc"
  ), regexp = "You have failed to provide all necessary inputs")
  expect_error(calculate_diversities(
    x = Ps,
    cutoff = 60,
    control = "susceptible",
    sample = NULL,
    gene = "Rps",
    perc_susc = "perc.susc"
  ), regexp = "You have failed to provide all necessary inputs")
  expect_error(calculate_diversities(
    x = Ps,
    cutoff = 60,
    control = "susceptible",
    sample = "isolate",
    gene = NULL,
    perc_susc = "perc.susc"
  ), regexp = "You have failed to provide all necessary inputs")
  expect_error(calculate_diversities(
    x = Ps,
    cutoff = 60,
    control = "susceptible",
    sample = "isolate",
    gene = "Rps",
    perc_susc = 60
  ), regexp = "You have failed to provide all necessary inputs")
})

context("print.hagis.diversities()")
test_that("print.hagis.diversities() returns a proper summary", {
  x <- utils::capture.output(print(diversities))
  expect_type(x, "character")
  expect_equal(x[[2]], "hagis Diversities")
  expect_equal(x[[4]], "Number of Samples 21")
  expect_equal(x[[5]], "Number of Pathotypes 19 ")
  expect_equal(x[[8]], "Simple   0.9047619 ")
  expect_equal(x[[9]], "Gleason  5.912257 ")
  expect_equal(x[[10]], "Shannon  2.912494 ")
  expect_equal(x[[11]], "Simpson  0.9433107 ")
  expect_equal(x[[12]], "Evenness  0.9891509 ")
  expect_equal(x[[13]], "")
})

context("pander.hagis.diversities")
test_that("pander.hagis.diversities returns a proper table of indices and
          caption",
          {
            x <- utils::capture.output(pander::pander(diversities))
            expect_equal(
              head(x),
              c(
                "",
                "-------------------------------------------------",
                " Simple   Gleason   Shannon   Simpson   Evenness ",
                "-------- --------- --------- --------- ----------",
                " 0.9048    5.912     2.912    0.9433     0.9892  ",
                "-------------------------------------------------"
              )
            )
          })

