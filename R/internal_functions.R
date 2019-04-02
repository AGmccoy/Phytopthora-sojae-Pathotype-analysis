
# data.table special symbols for package-wide use
.SD <- .N <- .I <- .GRP <- .BY <- .EACHI <- i.N <-  NULL

#' Check User Inputs
#'
#' Checks and validates user inputs before running functions
#'
#' @param .x a `data.table` containing the values to be summarised
#' @param .cutoff value for percent susceptible cutoff. Numeric.
#' @param .control value used to denote the susceptible control in the `Rps`
#'  field. Character.
#' @param .sample field providing the unique isolate identification for each
#'  isolate being tested. Character.
#' @param .Rps field providing the _Rps_ gene(s) being tested. Character.
#' @param .perc_susc field providing the percent susceptible reactions.
#' @author Adam H. Sparks, adamhsparks@@gmail.com
#' @importFrom data.table ":="
#' @noRd
.check_inputs <- function(.x, .cutoff, .control, .sample, .Rps, .perc_susc) {
  if (!is.data.frame(.x) |
      !is.numeric(.cutoff) |
      !is.character(.control) |
      !is.character(.sample) |
      !is.character(.Rps) |
      !is.character(.perc_susc)) {
    stop(call. = FALSE,
         "You have failed to provide all necessary inputs or\n",
         "you have provided an improperly formatted item.\n",
         "Please check and try again.")
  }
}

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
  susceptible.1 <- NULL
  # if else for resistant or susceptible reaction. This will mark susceptible
  # reactions with a "1" in a new column labelled "Susceptible.1" to then be
  # used in later analysis.
  susceptible <- .x$perc_susc >= 60
  .x[, susceptible.1 := 0][susceptible, susceptible.1 := 1]
}
