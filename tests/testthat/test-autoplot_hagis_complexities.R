
# test autoplot.hagis.rps.summary ----------------------------------------------
context("autoplot.hagis.complexities()")
test_that("autoplot.hagis.complexities() returns a ggplot2 object", {
  Ps <- system.file("extdata", "practice_data_set.csv", package = "hagis")
  Ps <- read.csv(Ps)
  complexities <- calculate_complexities(x = Ps,
                                         cutoff = 60,
                                         control = "susceptible",
                                         sample = "Isolate",
                                         Rps = "Rps",
                                         perc_susc = "perc.susc")
  complexities_count <- autoplot(complexities, type = "count")
  expect_doppelganger("Count_complexities",
                              complexities_count)
  
  complexities_perc <- autoplot(complexities, type = "percentage")
  expect_doppelganger("Perc_complexities",
                              complexities_perc)
  
  complexities_perc_blue <- autoplot(complexities, type = "percentage",
                                     color = "blue")
  expect_doppelganger("Perc_complexities_blue",
                              complexities_perc_blue)
})

test_that("autoplot.hagis.complexities errors if an invalid type is given", {
          expect_error(autoplot(complexities, type = "orange"))
  })

