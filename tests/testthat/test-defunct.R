context("defunct")
test_that("plot.hagis.complexities() returns an error", {
  data(P_sojae_survey)
  complexities <- calculate_complexities(
    x = P_sojae_survey,
    cutoff = 60,
    control = "susceptible",
    sample = "Isolate",
    gene = "Rps",
    perc_susc = "perc.susc"
  )
  expect_error(
    plot(complexities))
})

test_that("plot.hagis.diversities() returns an error", {
  data(P_sojae_survey)
  rps <- summarize_gene(
    x = P_sojae_survey,
    cutoff = 60,
    control = "susceptible",
    sample = "Isolate",
    gene = "Rps",
    perc_susc = "perc.susc"
  )
  expect_error(
    plot(rps))
})

