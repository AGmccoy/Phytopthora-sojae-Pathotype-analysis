
# test summarize Rps -----------------------------------------------------------
context("Test that calculate_diversity() works as expected")
test_that("calculate_diversity() works properly", {
  Ps <- system.file("extdata", "practice_data_set.csv", package = "hagis")
  Ps <- read.csv(Ps)
  rps <- summarize_rps(x = Ps,
                       cutoff = 60,
                       control = "susceptible",
                       sample = "Isolate",
                       Rps = "Rps",
                       perc_susc = "perc.susc")
  testthat::expect_s3_class(rps, "hagis.rps.summary")
  testthat::expect_length(rps, 3)
  testthat::expect_named(rps, c("Rps",
                                "N_susc",
                                "percent_pathogenic"
  ))
})

test_that("summarize_rps() stops if lacking all params", {
  Ps <-
    system.file("extdata", "practice_data_set.csv", package = "hagis")
  Ps <- read.csv(Ps)
  testthat::expect_error(summarize_rps(
    cutoff = 60,
    control = "susceptible",
    sample = "Isolate",
    Rps = "Rps",
    perc_susc = "perc.susc"
  ))
  testthat::expect_error(summarize_rps(
    x = Ps,
    control = "susceptible",
    sample = "Isolate",
    Rps = "Rps",
    perc_susc = "perc.susc"
))
  testthat::expect_error(summarize_rps(
    x = Ps,
    cutoff = 60,
    sample = "Isolate",
    Rps = "Rps",
    perc_susc = "perc.susc"
))
  testthat::expect_error(summarize_rps(
    x = Ps,
    cutoff = 60,
    control = "susceptible",
    Rps = "Rps",
    perc_susc = "perc.susc"
))
  testthat::expect_error(summarize_rps(
    x = Ps,
    cutoff = 60,
    control = "susceptible",
    sample = "isolate",
    perc_susc = "perc.susc"
))
  testthat::expect_error(summarize_rps(
    x = Ps,
    cutoff = 60,
    control = "susceptible",
    sample = "isolate",
    Rps = "Rps",
))
})
