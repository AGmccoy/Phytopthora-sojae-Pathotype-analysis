
# test autoplot.hagis.rps.summary ----------------------------------------------
context("Test that autoplot.hagis.rps.summary() works as expected")
test_that("autoplot.hagis.rps.summary() returns a ggplot2 object", {
  Ps <- system.file("extdata", "practice_data_set.csv", package = "hagis")
  Ps <- read.csv(Ps)
  rps <- summarize_rps(x = Ps,
                       cutoff = 60,
                       control = "susceptible",
                       sample = "Isolate",
                       Rps = "Rps",
                       perc_susc = "perc.susc")
  expect_s3_class(autoplot(rps), c("gg", "ggplot"))
})
