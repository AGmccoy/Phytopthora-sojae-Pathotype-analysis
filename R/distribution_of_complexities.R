#' Calculate distribution of complexities by Rps gene
#'
#' @description This function will calculate the distribution of
#' susceptibilities by Rps gene.
#' @param x A x containing the data
#' @param sample
#' @param precent_susc
#' @param gene
#' @param susceptibility_cutoff
#'
complexities = function(x,
                                        sample,
                                        percent.susc,
                                        gene,
                                        susceptibility_cutoff) {
  # The susceptible control is removed from all isolates in the data set so that it will not impact complexity calculations and a new data set is made that does not contain susceptible controls. Thus, complexities can be from 0 to 13 (13 genes tested) for this data set. This can be changed later on if more, or less, genes are being tested.
  # for this to work your susceptible control must be labelled "susceptible" under the Rps column of your data set. you can change "susceptible" to "rps/rps" or whatever you have it labelled as and it should work.
  remove_controls <- subset(x, x[[gene]]  != "susceptible")
  #x$Susceptible.1 <- ifelse(x[[percent.susc]] >= susceptibility_cutoff, 1, 0)
  remove_controls$Susceptible.1 <-
    ifelse(remove_controls[[percent.susc]] >= susceptibility_cutoff, 1, 0)
  ## summary by rps gene to tally. This code takes the "Susceptible.1" column and summarises it by gene for your total Isolates pathogenic on each gene. Likewise "Isolate_N" is calculated given the unique Isolate names to find the total number of isolates within your data set. "Percent_isolates_pathogenic" is then found for each gene, showing the percentage of isolates that are pathogenic on tested genes. "Rps.Gene.Summary" will return these values.
  
  Rps.Gene.Summary <-
    ddply(remove_controls, gene, summarise, N = sum(Susceptible.1))
  remove_controls[[sample]] <- as.factor(remove_controls[[sample]])
  Isolate_n <- length(levels(remove_controls[[sample]]))
  remove_controls[[gene]] <- as.factor(remove_controls[[gene]])
  
  #Rps.Gene.Summary$percent_isolates_pathogenic <- ((Rps.Gene.Summary$N)/Isolate_n)*100
  #Rps.Gene.Summary
  
  #Individual Isolate Complexities as calculated by grouping by Isolate and then summarising the number of"1"'s for each Isolate in the "Susceptible.1" Column.
  Ind_complexities <- remove_controls %>%
    group_by(remove_controls[[sample]]) %>%
    summarise(N = sum(Susceptible.1))
  
  # Frequency for each complexity (%).
  #Percent frequency is calculated by taking the individual complexity of each Isolate and grouping all Isolates by their complexity (Ind_complexities$Complexity[Ind_complexities$N==X]). The function legnth() is then used to identify how many of each complexity there are in the data set (from 0 to 13). This number is then taken and divided by the total number of isolates in the dataset (which was calculated in previous scripts and is identified as "Isolate_n" here) then multiplied by 100 for final percentages.
  # If you are using less than 13 genes, you can edit the script by placing "#" before all "Freq_comp_X" that are above your number of genes tested. If testing more than 13 genes, you will need to simply copy a line of this code and add as many more linesas necessary, making sure to change the "N==X" to the correct complexity (i.e. 14, 15, 16, etc)
  # Changing the script here will require edits on scripts down the line, but I will try and annotate where those changes would need to be made, if necessary
  
  Ind_complexities$Complexity <-
    as.character(Ind_complexities$N) #adds a column telling the complexity of each individual isolates in the dataset
  # Determining the frequency of each complexity (0:13) within the data set
  freq_comp_0 <-
    (length(Ind_complexities$Complexity[Ind_complexities$N == 0]) / Isolate_n) *
    100
  freq_comp_1 <-
    (length(Ind_complexities$Complexity[Ind_complexities$N == 1]) / Isolate_n) *
    100
  freq_comp_2 <-
    (length(Ind_complexities$Complexity[Ind_complexities$N == 2]) / Isolate_n) *
    100
  freq_comp_3 <-
    (length(Ind_complexities$Complexity[Ind_complexities$N == 3]) / Isolate_n) *
    100
  freq_comp_4 <-
    (length(Ind_complexities$Complexity[Ind_complexities$N == 4]) / Isolate_n) *
    100
  freq_comp_5 <-
    (length(Ind_complexities$Complexity[Ind_complexities$N == 5]) / Isolate_n) *
    100
  freq_comp_6 <-
    (length(Ind_complexities$Complexity[Ind_complexities$N == 6]) / Isolate_n) *
    100
  freq_comp_7 <-
    (length(Ind_complexities$Complexity[Ind_complexities$N == 7]) / Isolate_n) *
    100
  freq_comp_8 <-
    (length(Ind_complexities$Complexity[Ind_complexities$N == 8]) / Isolate_n) *
    100
  freq_comp_9 <-
    (length(Ind_complexities$Complexity[Ind_complexities$N == 9]) / Isolate_n) *
    100
  freq_comp_10 <-
    (length(Ind_complexities$Complexity[Ind_complexities$N == 10]) / Isolate_n) *
    100
  freq_comp_11 <-
    (length(Ind_complexities$Complexity[Ind_complexities$N == 11]) / Isolate_n) *
    100
  freq_comp_12 <-
    (length(Ind_complexities$Complexity[Ind_complexities$N == 12]) / Isolate_n) *
    100
  freq_comp_13 <-
    (length(Ind_complexities$Complexity[Ind_complexities$N == 13]) / Isolate_n) *
    100
  
  # Making another dataset which only contains the frequncey of each complexity, for use in data visualization
  Freq_of_complex <-
    rbind.x(
      freq_comp_0,
      freq_comp_1,
      freq_comp_2,
      freq_comp_3,
      freq_comp_4,
      freq_comp_5,
      freq_comp_6,
      freq_comp_7,
      freq_comp_8,
      freq_comp_9,
      freq_comp_10,
      freq_comp_11,
      freq_comp_12,
      freq_comp_13
    )
  colnames(Freq_of_complex) = "Frequency_of_Complexities"
  # adds another column to the data set so you can easily tell the frequency of each complexity in your data.
  # This will need to be altered should you be testing a different number of genes. Change the "13" to you maximum complexity possible, without controls
  Freq_of_complex$complexities <- (0:13)
  
  ## Distribution of complexity (counts)
  # This operates in the same manner as the frequency data, but will only show how many (not percentage) isolates are included in each complexity
  # Changes made to frequency data for more, or less, genes will also need to be made here.
  Distr_comp_0 <-
    length(Ind_complexities$Complexity[Ind_complexities$N == 0])
  Distr_comp_1 <-
    length(Ind_complexities$Complexity[Ind_complexities$N == 1])
  Distr_comp_2 <-
    length(Ind_complexities$Complexity[Ind_complexities$N == 2])
  Distr_comp_3 <-
    length(Ind_complexities$Complexity[Ind_complexities$N == 3])
  Distr_comp_4 <-
    length(Ind_complexities$Complexity[Ind_complexities$N == 4])
  Distr_comp_5 <-
    length(Ind_complexities$Complexity[Ind_complexities$N == 5])
  Distr_comp_6 <-
    length(Ind_complexities$Complexity[Ind_complexities$N == 6])
  Distr_comp_7 <-
    length(Ind_complexities$Complexity[Ind_complexities$N == 7])
  Distr_comp_8 <-
    length(Ind_complexities$Complexity[Ind_complexities$N == 8])
  Distr_comp_9 <-
    length(Ind_complexities$Complexity[Ind_complexities$N == 9])
  Distr_comp_10 <-
    length(Ind_complexities$Complexity[Ind_complexities$N == 10])
  Distr_comp_11 <-
    length(Ind_complexities$Complexity[Ind_complexities$N == 11])
  Distr_comp_12 <-
    length(Ind_complexities$Complexity[Ind_complexities$N == 12])
  Distr_comp_13 <-
    length(Ind_complexities$Complexity[Ind_complexities$N == 13])
  
  # Producing another dataset for the count/distribution of complexities within the data, same as frequency
  Distr_of_complex <-
    rbind.x(
      Distr_comp_0,
      Distr_comp_1,
      Distr_comp_2,
      Distr_comp_3,
      Distr_comp_4,
      Distr_comp_5,
      Distr_comp_6,
      Distr_comp_7,
      Distr_comp_8,
      Distr_comp_9,
      Distr_comp_10,
      Distr_comp_11,
      Distr_comp_12,
      Distr_comp_13
    )
  colnames(Distr_of_complex) = "Distribution_of_Complexities"
  # This will need to be altered should you be testing a different number of genes. Change the "13" to you maximum complexity possible, without controls
  Distr_of_complex$complexities <- (0:13)
  
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
}