
#' Summary by _Rps_ Gene
#' 
#' Tally a summary by Rps gene. This code takes the "Susceptible.1" column and
#'  summarises it by gene for your total Isolates pathogenic on each gene. 
#'  Likewise "Isolate_N" is calculated given the unique Isolate names to find
#'  the total number of isolates within your data set.
#'  "Percent_isolates_pathogenic" is then found for each gene, showing the
#'  percentage of isolates that are pathogenic on tested genes.
#'  "Rps.Gene.Summary" will return these values.
#'  
#' @param .x A `data.table` containing the values to be summarised
#' @return A `data.table` that tallies the results by _Rps_ gene
#' @author Adam H. Sparks, adamhsparks@@gmail.com
#' @importFrom data.table ":="
#' @noRd
.summarise_rps_genes <- function(.x) {
  # CRAN NOTE avoidance
  N <- susceptible.1 <- Rps <- NULL
  y <- .x[, list(N = sum(susceptible.1)), by = list(Rps = Rps)]
  return(y)
}
