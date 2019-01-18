#' Create a Phytophtora Template to Enter Data for Use with hagis

#' Creates a template  'CSV' file for the user to enter observation data into to
#' use for analysis This helps ensure that data are properly formatted for use
#' with \pkg{hagis}.
#' 
#' @param file A file path and filename for the template, defaults to
#' "Phytopthora_template.csv" in your current working directory.
#' 
#' @examples 
#' \donttest{
#' # Create a template in user's home subdirectory called "P_sojae_analysis"
#' write_template("~/P_sojae_analysis")
#' }
#' 
#' @export write_template
#' 
write_template <- function(file = NULL) {
  
  if (is.null(file)) {
    file <- "Phytopthora_template.csv"
  }
  
  # ensure that the file out name ends in .csv if specified otherwise by user
  if (!is.null(file)) {
   x <- basename(file)
     file <- paste0(x, ".csv")
   }
  
  load(system.file("extdata", "Phytophthora_template.rda",  # nocov start
                   package = "hagis"))  # nocov end
  
  readr::write_csv(x = Phytophthora_template, path = file)
}
