

#' Calculate Diversity Index
#'
#' @description Calculates _Phytophthora_ diversity index
#' @export calc_diversity

calculate_diversity <- function(x,
                                cutoff,
                                control,
                                sample,
                                Rps,
                                perc_susc) {
  # CRAN NOTE avoidance
  
  if (missing(x) |
      missing(cutoff) |
      missing(control) |
      missing(sample) |
      missing(Rps) |
      missing(perc_susc)) {
    stop(call. = FALSE,
         "You have failed to provide all necessary inputs.\
         Please check and try again.")
  }
  
  data.table::setDT(x)
  # The susceptible control is removed from all isolates in the data set so that
  #  it will not affect complexity calculations and a new data set is made that
  #  it does not contain susceptible controls.
  
  x <- subset(x, Rps != control)
  x[, Rps := droplevels(Rps)]
  
  # summarise the reactions, create susceptible.1 field, see
  # internal_functions.R
  x <- .binary_cutoff(.x = x, .cutoff = cutoff)
  
  # set the sample field to factor
  expr <- paste0("x[, ", sample, ":= as.factor(", sample, ")]")
  eval(parse(text = expr))
  
  # summarise the reactions, create susceptible.1 field, see
  # internal_functions.R
  x <- .binary_cutoff(.x = x, .cutoff = cutoff)
  
  
  # remove resistant reactions from the data set, leaving only susceptible
  # reactions (pathotype)
  
  x <- subset(x, susceptible.1 != 0)
  
  # individual isolate complexities
  expr <- paste0("x[, ", Rps, ":= as.character(", Rps, ")]")
  eval(parse(text = expr))
  
  y <- vapply(split(x[, Rps, with = FALSE],
                    x[, sample, with = FALSE]),
              toString, character(1))
  
  y <- data.table::setDT(data.frame(
    Isolate = as.numeric(names(res)),
    Pathotype = unname(res),
    stringsAsFactors = FALSE
  ))
  
  y[, Pathotype := substr(y$Pathotype, 3, nchar(y$Pathotype) - 1)]
  
  z <- data.table::as.data.table(table(y$Pathotype))
  data.table::setnames(z, c("Pathotype", "Frequency"))
  
  # determines the number of isolates within the data
  N_isolates <- length(unique(x[[sample]]))
  
  # Determines the number of unique pathotypes for this analysis
  N_pathotypes <- length(unique(y[["Pathotype"]]))
  
  # indices --------------------------------------------------------------------
  # simple diversity will show the proportion of unique pathotypes to total
  # isolates. As the values gets closer to 1, there is greater diversity in
  # pathoypes within the population.
  Simple <- N_pathotypes / N_isolates
  
  # An alternate version of Simple diversity index. This index is less
  # sensitive to sample size than the simple index.
  Gleason <- (N_pathotypes - 1) / log(N_isolates)
  
  # Shannon diversity index is typically between 1.5 and 3.5. As richness and
  # evenness of the population increase, so does the Shannon index value
  Shannon <-
    vegan::diversity(z[-1], index = "shannon")
  
  # Simpson diversity index values range from 0 to 1. 1 represents high
  # diversity and 0 represents no diversity.
  Simpson <-
    vegan::diversity(z[-1], index = "simpson")
  
  # Evenness ranges from 0 to 1. As the Eveness value approaches 1, there is a
  # more even distribution of each pathoypes frequency within the population.
  Evenness <- Shannon / log(N_pathotypes)
  
  out <-
    list(
      table_of_pathotypes = z,
      number_of_isolates = N_isolates,
      number_of_pathotypes = N_pathotypes,
      Simple = Simple,
      Gleason = Gleason,
      Shannon = Shannon,
      Simpson = Simpson,
      Evenness = Evenness
    )
  return(out)
}