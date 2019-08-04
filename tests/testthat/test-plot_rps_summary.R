
# test plot.hagis.gene.summary ----------------------------------------------
context("plot.hagis.gene.summary")
test_that("plot.hagis.gene.summary() returns a ggplot2 object", {
  Ps <-
    system.file("extdata", "practice_data_set.csv", package = "hagis")
  Ps <- read.csv(Ps)
  rps <- summarize_gene(
    x = Ps,
    cutoff = 60,
    control = "susceptible",
    sample = "Isolate",
    gene = "Rps",
    perc_susc = "perc.susc"
  )
  
  rps_count <- plot(rps, type = "count")
  expect_doppelganger("count_summary", rps_count)
  
  rps_perc <- plot(rps, type = "percentage")
  expect_doppelganger("perc_summary", rps_perc)
  
  rps_perc_blue <- plot(rps, type = "percentage", color = "blue")
  expect_doppelganger("perc_summary_blue", rps_perc_blue)
  
  rps_perc_desc_blue <-
    plot(rps,
         type = "percentage",
         color = "blue",
         order = "descending")
  expect_doppelganger("perc_summary_des_blue", rps_perc_desc_blue)
  
  rps_perc_asc_blue <-
    plot(rps,
         type = "percentage",
         color = "blue",
         order = "ascending")
  expect_doppelganger("perc_summary_asc_blue", rps_perc_asc_blue)

  expect_error(plot(rps, type = "orange"),
               regexp = "You have entered an invalid `type`.")
})
