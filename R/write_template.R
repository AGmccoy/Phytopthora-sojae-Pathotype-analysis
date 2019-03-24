
#' Write a Template for Data Entry for Use With \pkg{hagis} to Local Disk

#' Writes a template 'CSV' format file for the user to enter observation data
#'  into for use in analysis This helps ensure that data are properly formatted
#'  for \pkg{hagis}.
#'
#' @param filename A file path and filename for the template, defaults to
#' "Phytophthora_template.csv" in your current working directory. If user
#' provides a filename with no extension, a ".csv" extension will be supplied.
#'
#' @examples
#' \donttest{
#' # Create a template in the R session tempdir() called "P_sojae_analysis.csv"
#' write_template(file.path(tempdir(), "P_sojae_analysis"))
#' }
#'
#' @author Adam H. Sparks, adamhsparks@@gmail.com
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
  
  Pt <- data.frame("sample" = as.character(),
                   "phenotype" = as.character(),
                   "gene" = as.character(),
                   "total" = as.integer(),
                   "hr" = as.integer(),
                   "lesion" = as.integer(),
                   "lesion_to_cotyledon" = as.integer(),
                   "dead" = as.integer()
  )
  
  utils::write.csv(x = Pt,
                   file = filename,
                   row.names = FALSE)
}
