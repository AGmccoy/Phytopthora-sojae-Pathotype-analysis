#' Calculate distribution of susceptilibilities by Rps gene
#' 
#' @description This function will calculate the distribution of
#' susceptibilities by Rps gene.
#' @param x A data.frame containing the data 
#' @param sample
#' @param precent_susc
#' @param gene
#' @param susc_cutoff
#' 
susceptibilities = function(x,
                        sample,
                        perc.susc,
                        gene,
                        susc_cutoff) {
  # if else for resistant or susceptible reaction. This will mark susceptible
  # reactions with a "1" in a new column labelled "Susceptible.1" to then be
  # used in later analysis.
  
  x$Susceptible.1 <- ifelse(x[, "perc.susc"] >= susc_cutoff, 1, 0)
  
  # summary by rps gene to tally. This code takes the "Susceptible.1" column 
  # and summarises it by gene for your total Isolates pathogenic on each gene.
  # Likewise "Isolate_N" is calculated given the unique isolate names to find
  # the total number of isolates within your data set.
  # "Percent_isolates_pathogenic" is then found for each gene, showing the
  # percentage of isolates that are pathogenic on tested genes.
  # "Rps.Gene.Summary" will return these values.
  
  Rps.Gene.Summary <-
    ddply(x, gene, summarise, N = sum(Susceptible.1))
  x[[sample]] <- as.factor(x[[sample]])
  Isolate_n <- length(levels(x[[sample]]))
  x[[gene]] <- as.factor(x[[gene]])
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