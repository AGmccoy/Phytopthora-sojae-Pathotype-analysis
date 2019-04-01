
# test calculate diversities ---------------------------------------------------
context("Test that calculate_diversity() works as expected")
test_that("calculate_diversity() works properly", {
  Ps <- system.file("extdata", "practice_data_set.csv", package = "hagis")
  Ps <- read.csv(Ps)
  diversities <- calculate_diversities(x = Ps,
                                       cutoff = 60,
                                       control = "susceptible",
                                       sample = "Isolate",
                                       Rps = "Rps",
                                       perc_susc = "perc.susc")
  testthat::expect_s3_class(diversities, "hagis.diversities")
  testthat::expect_length(diversities, 8)
  testthat::expect_named(diversities, c("table_of_pathotypes",
                                        "number_of_isolates",
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
  testthat::expect_error(calculate_diversities(
    x = "y",
    cutoff = 60,
    control = "susceptible",
    sample = "Isolate",
    Rps = "Rps",
    perc_susc = "perc.susc"
  ), regexp = "You have failed to provide all necessary inputs")
  testthat::expect_error(calculate_diversities(
    x = Ps,
    cutoff = "sixty",
    control = "susceptible",
    sample = "Isolate",
    Rps = "Rps",
    perc_susc = "perc.susc"
  ), regexp = "You have failed to provide all necessary inputs")
  testthat::expect_error(calculate_diversities(
    x = Ps,
    cutoff = 60,
    control = NULL,
    sample = "Isolate",
    Rps = "Rps",
    perc_susc = "perc.susc"
  ), regexp = "You have failed to provide all necessary inputs")
  testthat::expect_error(calculate_diversities(
    x = Ps,
    cutoff = 60,
    control = "susceptible",
    sample = NULL,
    Rps = "Rps",
    perc_susc = "perc.susc"
  ), regexp = "You have failed to provide all necessary inputs")
  testthat::expect_error(calculate_diversities(
    x = Ps,
    cutoff = 60,
    control = "susceptible",
    sample = "isolate",
    Rps = NULL,
    perc_susc = "perc.susc"
  ), regexp = "You have failed to provide all necessary inputs")
  testthat::expect_error(calculate_diversities(
    x = Ps,
    cutoff = 60,
    control = "susceptible",
    sample = "isolate",
    Rps = "Rps",
    perc_susc = 60
  ), regexp = "You have failed to provide all necessary inputs")
})
