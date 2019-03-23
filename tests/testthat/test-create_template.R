context("create_template")

# If input is no, ask don't proceed --------------------------------------------
test_that("create_template() stops if 'no'", {
  file.remove(list.files(tempdir(), pattern = ".csv", full.names = TRUE))
  
  f <- file()
  options(hagis_connection = f)
  ans <- "no"
  write(ans, f)
  t <- file.path(tempdir(), "test")
  expect_length(list.files(tempdir(), pattern = ".csv"), 0)
  options(hagis_connection = stdin())
  close(f)
})

# If input is yes, create a 'csv' file with proper extension --------------------
test_that("create_template() creates a proper template", {
  f <- file()
  options(hagis_connection = f)
  ans <- "yes"
  write(ans, f)
  t <- file.path(tempdir(), "test")
  write_template(filename = t)
  expect_length(list.files(tempdir(), pattern = ".csv"), 1)
  u <- read.csv(
    file.path(tempdir(), "test.csv"),
    col_types = readr::cols(
      Isolate = readr::col_character(),
      Line = readr::col_character(),
      Rps = readr::col_character(),
      Total = readr::col_character(),
      `HR (1)` = readr::col_character(),
      `Lesion (2)` = readr::col_character(),
      `Lesion to cotyledon (3)` = readr::col_character(),
      `Dead (4)` = readr::col_character(),
      total.susc = readr::col_character(),
      total.resis = readr::col_character(),
      perc.susc = readr::col_character(),
      perc.resis = readr::col_character()
    )
  )
  expect_equal(ncol(u), 12)
  expect_named(
    u,
    c(
      "Isolate",
      "Line",
      "Rps",
      "Total",
      "HR (1)",
      "Lesion (2)",
      "Lesion to cotyledon (3)",
      "Dead (4)",
      "total.susc",
      "total.resis",
      "perc.susc",
      "perc.resis"
    )
  )
  options(hagis_connection = stdin())
  close(f)
})
