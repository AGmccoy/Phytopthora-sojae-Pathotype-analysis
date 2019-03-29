
# data.table special symbols for package-wide use
.SD <- .N <- .I <- .GRP <- .BY <- .EACHI <- NULL

#' Create Binary Reaction Value
#'
#' Adds a column of 1 or 0 for the susceptible reaction cutoff
#'
#' @param .x A `data.table` containing the values to be summarised
#' @param .cutoff Cutoff value for susceptibility
#' @return A `data.table` that tallies the results by Rps gene
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
