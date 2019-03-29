
#' Calculate Distribution of Complexities by Isolate
#'
#' @description This function will calculate the distribution of
#' susceptibilities by isolate.
#' @inheritParams summarize_rps
#' @importFrom data.table ":="
#' @examples
#'
#' # locate system file for import
#' Ps <- system.file("extdata", "practice_data_set.csv", package = "hagis")
#'
#' # import 'practice_data_set.csv'
#' Ps <- read.csv(Ps)
#' head(Ps)
#'
#' # calculate susceptibilities with a 60 % cutoff value
#' complexities <- calc_complexities(x = Ps,
#'                        cutoff = 60,
#'                        control = "susceptible",
#'                        sample = "Isolate",
#'                        Rps,
#'                        perc_susc = "perc.susc")
#' complexities
#'
#' @export calc_complexities

calc_complexities = function(x,
                             cutoff,
                             control,
                             sample,
                             Rps,
                             perc_susc) {
  # CRAN NOTE avoidance
  Rps <- .N <- i.N <- N_samp <- NULL
  
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
  
  # Individual isolate complexities as calculated by grouping by "sample" and
  # then summarising the number of "1"s for each "sample" in the "susceptible.1"
  # field, see internal_functions.R
  y <- .create_summary_isolate(.y = x, .sample = sample)
  
  # Frequency for each complexity (%).
  # Percent frequency is calculated by taking the individual complexity of each
  # Isolate and grouping all Isolates by their complexity
  
  
  # create an object of the number of genes in the data
  expr <- paste0("x[, ", Rps, "]")
  n_gene <- length(unique(eval(parse(text = expr))))
  
  # create an object of the number of samples in the data
  expr <- paste0("x[, ", sample, "]")
  n_sample <- length(unique(eval(parse(text = expr))))
  
  # create an empty list to populate with frequency values
  complexities <- vector(mode = "list", length = n_gene)
  names(complexities) <- seq_along(1:n_gene)
  
  for (i in seq_along(1:n_gene)) {
    complexities[[i]] <- round(
      length(which(y[, N_samp == i])) / n_sample * 100, 2)
  }
  
  complexities <- data.table::setDT(stack(complexities))
  names(complexities) <- c("frequency", "N_samp")
  
  
  # distribution of complexity (counts)
  o <- y[, .N, by = N_samp]
  o[, N_samp := as.factor(N_samp)]
  complexities[o, on = "N_samp", distribution := i.N]
  
  # set NA to 0 for distribution
  complexities[is.na(distribution), distribution := 0]
  data.table::setcolorder(complexities,
                          neworder = c("N_samp", "frequency", "distribution"))
  data.table::setnames(complexities, c("sample", "frequency", "distribution"))
  
  return(complexities)
}


## Visualization of Frequency (%)
Visualization_of_complexities <-
  ggplot(data = Freq_of_complex, aes(x = complexities , y = Frequency_of_Complexities)) +
  geom_bar(stat = "identity") +
  scale_x_continuous(name = "", breaks = seq(0, 13, 1)) +
  scale_y_continuous(name = "Percent of Isolates", breaks = seq(0, 60, 2)) +
  theme_classic() +
  ggtitle("Percentage of Pathotype Complexities") +
  my.theme2

## Visualization of Distribution (N per complexity)
Visualization_of_Distribution <-
  ggplot(data = Distr_of_complex, aes(x = complexities , y = Distribution_of_Complexities)) +
  geom_bar(stat = "identity") +
  scale_x_continuous(breaks = seq(0, 13, 1)) +
  scale_y_continuous(breaks = seq(0, 20, 2)) +
  theme_classic() +
  ggtitle("Number of Isolates in each Pathotype Complexity") +
  my.theme2 +
  ylab(expression(bold("Number of Isolates"))) +
  xlab("")

## summary statistic (Distribution). Mean, Standard deviation and Standard error of complexities for your data
# this will print as 3 = mean, 4 = standard deviation and 5 = standard error
comp_mean <- mean(Ind_complexities$N)
comp_sd <- sd(Ind_complexities$N)
comp_stderr <- std.error(Ind_complexities$N)


# This code will return all of the data which we just made once this chunk has been run, no need to go in and run everything one at a time. Simply run the chunk in an Rmd file and the output will appear either in the console (statistics) or in the plot visualization (frequency and distribution of complexities)
final_complexities <- list(
  FrequencyData = Freq_of_complex,
  DistributionData = Distr_of_complex,
  Mean = comp_mean,
  StandardDev = comp_sd,
  StandardErr = comp_stderr,
  FrequencyPlot = Visualization_of_complexities,
  DistributionPlot = Visualization_of_Distribution
)

return(final_complexities)



#' Create Summary Table of Binary Reactions by Sample
#'
#' Tally a summary by sample or isolate. This code takes the "Susceptible.1"
#'  column and summarises it by gene for your total Isolates pathogenic on each
#'  sample.
#'
#' @param .x A `data.table` containing the values to be summarised
#' @return A `data.table` that tallies the results by sample
#' @author Adam H. Sparks, adamhsparks@@gmail.com
#' @noRd
.create_summary_isolate <- function(.y, .sample) {
  expr = paste0(".y[, list(N_samp = sum(susceptible.1)), by = list(sample = ",
                .sample,
                ")]")
  y <- eval(parse(text = expr))
  return(y)
}
