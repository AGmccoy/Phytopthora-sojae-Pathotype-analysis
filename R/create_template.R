#' Create a Phytophtora Template to Enter Data for Use with hagis

#' Creates a template  'CSV' file for the user to enter observation data into to
#' use for analysis This helps ensure that data are properly formatted for use
#' with \pkg{hagis}.
#'
#' @param filename A file path and filename for the template, defaults to
#' "Phytopthora_template.csv" in your current working directory. If user
#' provides a filename with no extension, a ".csv" extension will be supplied.
#'
#' @examples
#' \donttest{
#' # Create a template in user's home subdirectory called "P_sojae_analysis.csv"
#' write_template("~/P_sojae_analysis")
#' }
#'
#' @export write_template
#'
write_template <- function(filename = NULL) {
  # CRAN NOTE avoidance
  Phytophthora_template <- NULL # nocov
  
  if (is.null(filename)) {
    filename <- "Phytopthora_template.csv"
  }
  
  # ensure that the file out name ends in .csv if specified otherwise by user &
  # that file path exists
  if (!is.null(filename)) {
    if (!dir.exists(dirname(path.expand(filename)))) {
      stop(
        call. = FALSE,
        "The directory you have specified, `",
        dirname(path.expand(filename)),
        "`, does not exist.\n",
        "Please provide a valid directory."
      )
    }
    if (tools::file_ext(basename(filename)) != "csv") {
      filename <- paste0(filename, ".csv")
    }
  }
  
  # check if file already exists before creating
  if (file.exists(filename)) {
    message(
      "The file you have specified already exists,\n",
      "this will overwrite it with a blank template.\n",
      "Do you understand and wish to proceed (Y/n)?\n"
    )
    
    answer <-
      readLines(con = getOption("hagis_connection"), n = 1)
    
    answer <- toupper(answer)
    
    if (answer != "Y" & answer != "YES") {
      stop("Your new template was not created.",
           call. = FALSE)
    }
  }
  
  load(system.file("extdata", "Phytophthora_template.rda",  # nocov start
                   package = "hagis"))  # nocov end
  
  readr::write_csv(x = Phytophthora_template, path = filename)
}
