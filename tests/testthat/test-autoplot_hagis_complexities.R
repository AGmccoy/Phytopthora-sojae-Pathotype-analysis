
# test autoplot.hagis.rps.summary ----------------------------------------------
context("Test that autoplot.hagis.complexities() works as expected")
test_that("autoplot.hagis.complexities() returns a ggplot2 object", {
  Ps <- system.file("extdata", "practice_data_set.csv", package = "hagis")
  Ps <- read.csv(Ps)
  complexities <- calculate_complexities(x = Ps,
                                         cutoff = 60,
                                         control = "susceptible",
                                         sample = "Isolate",
                                         Rps = "Rps",
                                         perc_susc = "perc.susc")
  expect_s3_class(autoplot(complexities,
                           type = "frequency"), c("gg", "ggplot"))
  expect_s3_class(autoplot(complexities,
                           type = "distribution"), c("gg", "ggplot"))
})
