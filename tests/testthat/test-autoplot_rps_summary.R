
# test autoplot.hagis.rps.summary ----------------------------------------------
context("autoplot.hagis.rps.summary")
test_that("autoplot.hagis.rps.summary() returns a ggplot2 object", {
  Ps <- system.file("extdata", "practice_data_set.csv", package = "hagis")
  Ps <- read.csv(Ps)
  rps <- summarize_rps(x = Ps,
                       cutoff = 60,
                       control = "susceptible",
                       sample = "Isolate",
                       Rps = "Rps",
                       perc_susc = "perc.susc")

  rps_count <- autoplot(rps, type = "count")
  expect_doppelganger("Count_summary", rps_count)
  
  rps_perc <- autoplot(rps, type = "percentage")
  expect_doppelganger("Perc_summary", rps_perc)
  
  rps_perc_blue <- autoplot(rps, type = "percentage", color = "blue")
  expect_doppelganger("Perc_summary_blue", rps_perc_blue)
})

test_that("autoplot.rps.summary errors if an invalid type is given", {
  expect_error(autoplot(rps, type = "orange"))
})
