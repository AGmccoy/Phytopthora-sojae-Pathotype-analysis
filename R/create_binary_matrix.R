
#' Create binary data matrix
#'
#' @description Creates a binary data matrix from pathotype data representing
#'  the pathotype of each isolate. This binary data matrix can be used to
#'  visualize beta-diversity of pathotypes using \pkg{vegan} and \pkg{ape}.
#' @inheritParams summarize_gene
#' @examples
#'
#' # Using the built-in data set, P_sojae_survey
#' data(P_sojae_survey)
#'
#' P_sojae_survey
#'
#' # calculate susceptibilities with a 60 % cutoff value
#' final_matrix <- create_binary_matrix(x = P_sojae_survey,
#'                                     cutoff = 60,
#'                                     control = "susceptible",
#'                                     sample = "Isolate",
#'                                     gene = "Rps",
#'                                     perc_susc = "perc.susc")
#' final_matrix
#'
#' @return `create_binary_matrix` returns a binary matrix of pathotype data as
#' a [data.table] object
#' 
#' @export create_binary_matrix
#' 
create_binary_matrix <- function(x,
                                 cutoff,
                                 control,
                                 sample,
                                 gene,
                                 perc_susc) {

  # check inputs and rename columns to work with this package
  x <- .check_inputs(
    .x = x,
    .cutoff = cutoff,
    .control = control,
    .sample = sample,
    .gene = gene,
    .perc_susc = perc_susc
  )

  # CRAN NOTE avoidance
  susceptible.1 <- NULL
  
  # summarise the reactions, create susceptible.1 column, see
  # internal_functions.R
  x <- .binary_cutoff(.x = x, .cutoff = cutoff)
  
  # remove susceptible so that Beta diversity is only calculated based on pathotype
  x <- subset(x, gene != control)
  
  x <- data.table(x[, c(1, 3)], x[, "susceptible.1"])
         
  f <-
    dcast(melt(x, id.vars = c("sample", "gene")),
                    gene  ~ sample, value.var = "value")
  
  return(f)
}
