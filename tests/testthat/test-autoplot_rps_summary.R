
# test plot.hagis.gene.summary ----------------------------------------------
test_that("autoplot.hagis.gene.summary() returns a ggplot2 object", {
  data(P_sojae_survey)
  rps <- summarize_gene(
    x = P_sojae_survey,
    cutoff = 60,
    control = "susceptible",
    sample = "Isolate",
    gene = "Rps",
    perc_susc = "perc.susc"
  )

  rps_count <- autoplot(rps, type = "count")
  vdiffr::expect_doppelganger("count_summary", rps_count)

  rps_perc <- autoplot(rps, type = "percentage")
  vdiffr::expect_doppelganger("perc_summary", rps_perc)

  rps_perc_blue <-
    autoplot(rps, type = "percentage", color = "blue")
  vdiffr::expect_doppelganger("perc_summary_blue", rps_perc_blue)

  rps_perc_desc_blue <-
    autoplot(rps,
             type = "percentage",
             color = "blue",
             order = "descending")
  vdiffr::expect_doppelganger("perc_summary_des_blue", rps_perc_desc_blue)

  rps_perc_asc_blue <-
    autoplot(rps,
             type = "percentage",
             color = "blue",
             order = "ascending")
  vdiffr::expect_doppelganger("perc_summary_asc_blue", rps_perc_asc_blue)

  rps_count_asc_blue <-
    autoplot(rps,
             type = "count",
             color = "blue",
             order = "ascending")
  vdiffr::expect_doppelganger("count_summary_asc_blue", rps_count_asc_blue)

  expect_error(autoplot(rps, type = "orange"),
               regexp = "You have entered an invalid `type`.")
})
