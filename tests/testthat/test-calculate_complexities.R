
# test calculate complexities --------------------------------------------------
context("Test that calculate_complexities() works as expected")
test_that("calculate_complexities() works properly", {
  Ps <-
    system.file("extdata", "practice_data_set.csv", package = "hagis")
  Ps <- read.csv(Ps)
  complexities <- calculate_complexities(
    x = Ps,
    cutoff = 60,
    control = "susceptible",
    sample = "Isolate",
    Rps = "Rps",
    perc_susc = "perc.susc"
  )
  testthat::expect_s3_class(complexities, "hagis.complexities")
  testthat::expect_length(complexities, 2)
  testthat::expect_named(complexities,
                         c("grouped_complexities",
                           "indvidual_complexities"))
  
  # test summary.hagis.complexities
  testthat::expect_length(summary(complexities), 3)
  testthat::expect_equal(summary(complexities)[[1]], 8.714286,
                         tolerance = 1e-3)
  testthat::expect_equal(summary(complexities)[[2]], 2.003568,
                         tolerance = 1e-3)
  testthat::expect_equal(summary(complexities)[[3]], 0.4372144,
                         tolerance = 1e-3)
  testthat::expect_named(summary(complexities), c("mean", "sd", "se"))
})

test_that("calculate_complexities() stops if lacking all params", {
  Ps <-
    system.file("extdata", "practice_data_set.csv", package = "hagis")
  Ps <- read.csv(Ps)
  testthat::expect_error(calculate_complexities(
    x = "y",
    cutoff = 60,
    control = "susceptible",
    sample = "Isolate",
    Rps = "Rps",
    perc_susc = "perc.susc"
  ), regexp = "You have failed to provide all necessary inputs")
  testthat::expect_error(calculate_complexities(
    x = Ps,
    cutoff = "sixty",
    control = "susceptible",
    sample = "Isolate",
    Rps = "Rps",
    perc_susc = "perc.susc"
  ), regexp = "You have failed to provide all necessary inputs")
  testthat::expect_error(calculate_complexities(
    x = Ps,
    cutoff = 60,
    control = NULL,
    sample = "Isolate",
    Rps = "Rps",
    perc_susc = "perc.susc"
  ), regexp = "You have failed to provide all necessary inputs")
  testthat::expect_error(calculate_complexities(
    x = Ps,
    cutoff = 60,
    control = "susceptible",
    sample = NULL,
    Rps = "Rps",
    perc_susc = "perc.susc"
  ), regexp = "You have failed to provide all necessary inputs")
  testthat::expect_error(calculate_complexities(
    x = Ps,
    cutoff = 60,
    control = "susceptible",
    sample = "isolate",
    Rps = NULL,
    perc_susc = "perc.susc"
  ), regexp = "You have failed to provide all necessary inputs")
  testthat::expect_error(calculate_complexities(
    x = Ps,
    cutoff = 60,
    control = "susceptible",
    sample = "isolate",
    Rps = "Rps",
    perc_susc = 60
  ), regexp = "You have failed to provide all necessary inputs")
})
