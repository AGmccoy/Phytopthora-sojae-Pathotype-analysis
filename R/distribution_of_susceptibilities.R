
#' Calculate Distribution of Susceptibilities by _Rps_ Gene
#'
#' @description This function will calculate the distribution of
#' susceptibilities by _Rps_ gene.
#' @param x A `data.frame` containing the data. See Details below for more.
#'  Character. 
#' @param cutoff Value for percent susceptible cutoff. Integer.
#' @param control Value used to denote the susceptible control in the _Rps_
#'  column. Defaults to "susceptible". Character.
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
#'  * total.resis - Total number of plants exhibiting resistant reaction to
#'   inoculation
#'  * total.susc - Total number of plants exhibiting susceptible reaction to
#'   inoculation
#'  * perc.resis - Percent of plants exhibiting resistant reaction to
#'   inoculation
#'  * perc.susc - Percent of plants exhibiting susceptible reaction to
#'   inoculation
#' 
#' The use of [write_template()] and [percents()] is encouraged to ensure 
#'  that the input `data.frame`, \var{x}, used is properly formatted.
#' 
#' @examples
#  # locate system file for import
#' Ps <- system.file("extdata", "practice_data_set.csv", package = "hagis")
#' 
#' # import 'practice_data_set.csv'
#' Ps <- read.csv(Ps)
#' head(Ps)
#' 
#' # calculate totals and percents for resistant and susceptible reactions
#' Ps <- percents(Ps)
#' 
#' # calculate susceptibilities with a 60 % cutoff value
#' susc <- susceptibilities(Ps, cutoff = 60)
#' susc
#' 
#' @seealso [write_template()], [percents()]
#' @export susceptibilities

susceptibilities = function(x,
                            cutoff,
                            control = "susceptible") {
  # if else for resistant or susceptible reaction. This will mark susceptible
  # reactions with a "1" in a new column labelled "Susceptible.1" to then be
  # used in later analysis.
  
  x$Susceptible.1 <- ifelse(x[, "perc.susc"] >= cutoff, 1, 0)
  
  # summary by rps gene to tally. This code takes the "Susceptible.1" column
  # and summarises it by gene for your total Isolates pathogenic on each gene.
  # Likewise "Isolate_N" is calculated given the unique isolate names to find
  # the total number of isolates within your data set.
  # "Percent_isolates_pathogenic" is then found for each gene, showing the
  # percentage of isolates that are pathogenic on tested genes.
  # "Rps.Gene.Summary" will return these values.
  
  Rps.Gene.Summary <- .summarise_rps_genes(.x = x)
  
  x[[sample]] <- as.factor(x[[sample]])
  Isolate_n <- length(levels(x[[sample]]))
  x[["gene"]] <- as.factor(x[["gene"]])
  Rps.Gene.Summary$percent_isolates_pathogenic <-
    ((Rps.Gene.Summary$N) / Isolate_n) * 100
  Rps.Gene.Summary
  
  # visualization of data, using "Rps.Gene.Summary" to showing the percentage of isolate pathogenic on each gene tested. Scripts below can be edited for visual appeal.
  
  Visualization_of_Susceptibilities <-
    ggplot(
      data = Rps.Gene.Summary,
      aes(x = Rps.Gene.Summary[[gene]] , y = Rps.Gene.Summary$percent_isolates_pathogenic)
    ) +
    stat_summary(fun.y = mean,
                 position = position_dodge(width = 0.95),
                 geom = "bar") +
    theme_classic() +
    my.theme +
    ylab(expression(bold("Percent of Isolates"))) +
    xlab("") +
    ggtitle("Percentage of Isolates Pathogenic on Rps genes")
  
  final <-
    list(Data = Rps.Gene.Summary, Graphic = Visualization_of_Susceptibilities)
  return(final)
}