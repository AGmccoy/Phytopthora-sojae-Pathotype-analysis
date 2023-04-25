
# test plot.hagis.gene.summary ----------------------------------------------
test_that("auto.plot.hagis.complexities() returns a ggplot2 object", {
  data(P_sojae_survey)
  complexities <- calculate_complexities(
    x = P_sojae_survey,
    cutoff = 60,
    control = "susceptible",
    sample = "Isolate",
    gene = "Rps",
    perc_susc = "perc.susc"
  )
  complexities_count <- autoplot(complexities, type = "count")
  vdiffr::expect_doppelganger("count_complexities",
                      complexities_count)

  complexities_perc <- autoplot(complexities, type = "percentage")
  vdiffr::expect_doppelganger("perc_complexities",
                      complexities_perc)

  complexities_perc_blue <-
    autoplot(complexities, type = "percentage",
             color = "blue")
  vdiffr::expect_doppelganger("perc_complexities_blue",
                      complexities_perc_blue)

  complexities_perc_desc_blue <-
    autoplot(complexities,
             type = "percentage",
             color = "blue",
             order = "descending")
  vdiffr::expect_doppelganger("perc_complexities_desc_blue",
                      complexities_perc_desc_blue)

  complexities_perc_asc_blue <-
    autoplot(complexities,
             type = "percentage",
             color = "blue",
             order = "ascending")
  vdiffr::expect_doppelganger("perc_complexities_asc_blue",
                      complexities_perc_asc_blue)

  complexities_count_asc_blue <-
    autoplot(complexities,
             type = "count",
             color = "blue",
             order = "ascending")
  vdiffr::expect_doppelganger("count_complexities_asc_blue",
                      complexities_count_asc_blue)

  expect_error(autoplot(complexities, type = "orange"),
               regexp = "You have entered an invalid `type`.")
})
