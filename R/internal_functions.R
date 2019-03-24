
#' Create Binary Reaction Value
#' 
#' Adds a column of 1 or 0 for the susceptible reaction cutoff
#'  
#' @param .x A `data.table` containing the values to be summarised
#' @param .cutoff Cutoff value for susceptibility
#' @return A `data.table` that tallies the results by _Rps_ gene
#' @author Adam H. Sparks, adamhsparks@@gmail.com
#' @importFrom data.table ":="
#' @noRd
.binary_cutoff <- function(.x, .cutoff) {
  # if else for resistant or susceptible reaction. This will mark susceptible
  # reactions with a "1" in a new column labelled "Susceptible.1" to then be
  # used in later analysis.
  susceptible <- .x$perc.susc >= 60
  .x[, susceptible.1 := 0][susceptible, susceptible.1 := 1]
}


#' Create Summary Table of Reactions
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
#' @noRd
.create_summary <- function(.y) {
  # CRAN NOTE avoidance
  N <- susceptible.1 <- Rps <- NULL
  y <- .y[, list(N = sum(susceptible.1)), by = list(Rps = Rps)]
  return(y)
}
