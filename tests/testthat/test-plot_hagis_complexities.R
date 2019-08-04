
# test plot.hagis.gene.summary ----------------------------------------------
context("plot.hagis.complexities()")
test_that("plot.hagis.complexities() returns a ggplot2 object", {
  Ps <-
    system.file("extdata", "practice_data_set.csv", package = "hagis")
  Ps <- read.csv(Ps)
  complexities <- calculate_complexities(
    x = Ps,
    cutoff = 60,
    control = "susceptible",
    sample = "Isolate",
    gene = "Rps",
    perc_susc = "perc.susc"
  )
  complexities_count <- plot(complexities, type = "count")
  expect_doppelganger("count_complexities",
                      complexities_count)
  
  complexities_perc <- plot(complexities, type = "percentage")
  expect_doppelganger("perc_complexities",
                      complexities_perc)
  
  complexities_perc_blue <- plot(complexities, type = "percentage",
                                 color = "blue")
  expect_doppelganger("perc_complexities_blue",
                      complexities_perc_blue)
  
  complexities_perc_desc_blue <-
    plot(complexities,
         type = "percentage",
         color = "blue",
         order = "descending")
  expect_doppelganger("perc_complexities_desc_blue",
                      complexities_perc_desc_blue)
  
  complexities_perc_asc_blue <-
    plot(complexities,
         type = "percentage",
         color = "blue",
         order = "ascending")
  expect_doppelganger("perc_complexities_asc_blue",
                      complexities_perc_asc_blue)

  expect_error(plot(complexities, type = "orange"),
               regexp = "You have entered an invalid `type`.")
})
