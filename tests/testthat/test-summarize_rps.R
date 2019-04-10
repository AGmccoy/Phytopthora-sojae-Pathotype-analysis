
# test summarize Rps -----------------------------------------------------------
context("summarize_rps()")
test_that("summarize_rps() works properly", {
  Ps <- system.file("extdata", "practice_data_set.csv", package = "hagis")
  Ps <- read.csv(Ps)
  rps <- summarize_rps(x = Ps,
                       cutoff = 60,
                       control = "susceptible",
                       sample = "Isolate",
                       Rps = "Rps",
                       perc_susc = "perc.susc")
  expect_s3_class(rps, "hagis.rps.summary")
  expect_length(rps, 3)
  expect_named(rps, c("Rps",
                      "N_susc",
                      "percent_pathogenic"
  ))
})

test_that("summarize_rps() ", {
  Ps <-
    system.file("extdata", "practice_data_set.csv", package = "hagis")
  Ps <- read.csv(Ps)
  expect_error(summarize_rps(
    x = "y",
    cutoff = 60,
    control = "susceptible",
    sample = "Isolate",
    Rps = "Rps",
    perc_susc = "perc.susc"
  ), regexp = "You have failed to provide all necessary inputs")
  expect_error(summarize_rps(
    x = Ps,
    cutoff = "sixty",
    control = "susceptible",
    sample = "Isolate",
    Rps = "Rps",
    perc_susc = "perc.susc"
  ), regexp = "You have failed to provide all necessary inputs")
  expect_error(summarize_rps(
    x = Ps,
    cutoff = 60,
    control = NULL,
    sample = "Isolate",
    Rps = "Rps",
    perc_susc = "perc.susc"
  ), regexp = "You have failed to provide all necessary inputs")
  expect_error(summarize_rps(
    x = Ps,
    cutoff = 60,
    control = "susceptible",
    sample = NULL,
    Rps = "Rps",
    perc_susc = "perc.susc"
  ), regexp = "You have failed to provide all necessary inputs")
  expect_error(summarize_rps(
    x = Ps,
    cutoff = 60,
    control = "susceptible",
    sample = "isolate",
    Rps = NULL,
    perc_susc = "perc.susc"
  ), regexp = "You have failed to provide all necessary inputs")
  expect_error(summarize_rps(
    x = Ps,
    cutoff = 60,
    control = "susceptible",
    sample = "isolate",
    Rps = "Rps",
    perc_susc = 60
  ), regexp = "You have failed to provide all necessary inputs")
})
