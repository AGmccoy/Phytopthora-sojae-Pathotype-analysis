
# test plot.hagis.gene.summary ----------------------------------------------
context("plot.hagis.gene.summary")
test_that("plot.hagis.gene.summary() returns a ggplot2 object", {
  Ps <- system.file("extdata", "practice_data_set.csv", package = "hagis")
  Ps <- read.csv(Ps)
  rps <- summarize_gene(x = Ps,
                       cutoff = 60,
                       control = "susceptible",
                       sample = "Isolate",
                       gene = "Rps",
                       perc_susc = "perc.susc")

  rps_count <- plot(rps, type = "count")
  expect_doppelganger("Count_summary", rps_count)
  
  rps_perc <- plot(rps, type = "percentage")
  expect_doppelganger("Perc_summary", rps_perc)
  
  rps_perc_blue <- plot(rps, type = "percentage", color = "blue")
  expect_doppelganger("Perc_summary_blue", rps_perc_blue)
})

test_that("plot.rps.summary errors if an invalid type is given", {
  expect_error(plot(rps, type = "orange"))
})
