
#' Calculate Total and Percent Resistant and Susceptible Reactions
#'
#' @description This function will calculate total percent resistant and
#'   susceptible reactions for each _Rps_ gene
#' @param x A `data.frame` containing the data. See Details below for more.
#'   Character. 
#'  
#' @details 
#' The `data.frame` object supplied must contain fields with the following
#'  names and contents where each line is a unique observation.
#'  
#'  * isolate - Unique identifier for the isolate
#'  * Rps - _Rps_ gene(s) included in study
#'  * total - Total number of plants
#'  * hr - Number of plants with hypersensitive response to inoculation
#'  * lesion - Number of plants with lesion in response to inoculation
#'  * lesion_to_cotyledon - Number of plants with lesion to cotyledon
#'  in response to inoculation
#'  * dead - Number of plants dead in response to inoculation
#'  
#' The use of [write_template()] is encouraged to ensure that the input file
#'   used is properly formatted.
#' 
#' @examples 
#' 
#' # locate system file for import
#' Ps <- system.file("extdata", "practice_data_set.csv", package = "hagis")
#' 
#' # import 'practice_data_set.csv'
#' Ps <- read.csv(Ps)
#' 
#' # calculate totals and percents for resistant and susceptible reactions
#' total_perc <- percents(Ps)
#' total_perc
#' 
#' @author Adam H. Sparks, adamhsparks@@gmail.com
#' @return A `data.frame` as a `data.table` object with total and percent 
#'   susceptible and resistant values
#' @importFrom data.table ":="
#' @export percents
#' 
percents <- function(x) {
  # CRAN NOTE avoidance
  total.resis <- hr <- total.susc <- lesion <- lesion_to_cotyledon <- dead <- 
    perc.resis <- perc.susc <- total <- NULL
  
  data.table::setDT(x)
  
  x[, total.resis := hr]
  x[, total.susc := rowSums(.SD, na.rm = TRUE), .SDcols = c("lesion",
                                                             "lesion_to_cotyledon",
                                                             "dead")]
  x[, perc.resis := round((total.resis / total) * 100, 1)]
  x[, perc.susc := round((total.susc / total) * 100, 1)]
  return(x)
}
