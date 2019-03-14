#' 
#' @description 
#' @param x A `data.frame`` containing the data
#' @param sample
#' @param precent_susc
#' @param gene
#' @param susceptibility_cutoff

diversity_index <-
  function(x,
           sample,
           percent.susc,
           gene,
           susceptibility_cutoff) {
    # same as previous scripts
    x[[gene]] <-
      transform(str_replace(x[[gene]], "Rps ", ""))
    remove_controls <-
      subset(x, x[[gene]]  != "susceptible")
    #x$Susceptible.1 <- ifelse(x[[percent.susc]] >= susceptibility_cutoff, 1, 0)
    remove_controls$Susceptible.1 <-
      ifelse(remove_controls[[percent.susc]] >= susceptibility_cutoff, 1, 0)
    
    # Removal of resistant reactions from the data set, leaving only susceptible reactions (pathotype)
    #remove_controls[[gene]] <- as.factor(remove_controls[[gene]])
    Remove_resistance <-
      subset(remove_controls, Susceptible.1 != 0) #%>%
    #transform(remove_controls, gene = gsub("Rps ", "", remove_controls[[gene]])) # this line takes the "Rps" out of my data set leaving only the gene number, as you would see in a publication. You may not need this line for yours...
    
    #Individual Isolate Complexities
    # using our data set that now only has susceptible reactions, the actual pathotype for each individual Isolate is now displayed. Print "Ind_pathotypes" to take a look!
    Remove_resistance[, sample] <-
      as.character(Remove_resistance[, sample])
    
    Ind_pathotypes <- Remove_resistance %>%
      group_by(.[[sample]]) %>%
      nest() %>%
      mutate(Pathotype = map(data, ~ toString(.[[gene]])))  %>%
      unnest(Pathotype) #%>%
    #select(.[[sample]], Pathotype)
    
    
    # Identifying the frequency at which each Pathotype is found in the data set
    #  Isolate needs to be a character vector for this to work, this line of code takes care of that
    
    Ind_pathotypes$Isolate <-
      as.character(Ind_pathotypes[['.[[sample]]']])
    Ind_pathotypes <- Ind_pathotypes[, 3:4]
    
    # The frequency at which each pathotype is found within the dataset is performed here. It can be confusing to look at, but we will clean it up in the next step. For now, each isolates pathotype will have a column next to it, showing how often that pathotype is in the dataset.
    
    #Pathotype_Freq <- within(Ind_pathotypes, { count <- ave(.[[sample]], Pathotype, FUN=function(Pathotype) length(unique(Pathotype)))})
    
    #Final Chart for visualizing unique pathotype distributions
    # this script takes out only the unique pathotypes and the count at which they are found in the data set to be used in the next graphic
    
    Pathotype_Freq_Distribution <-
      x(table(Ind_pathotypes$Pathotype))
    colnames(Pathotype_Freq_Distribution) = c("Pathotype", "Frequency")
    #Pathotype_Freq %>%
    #select(count, Pathotype) %>%
    #distinct(Pathotype, .keep_all = TRUE)
    #Changes sample to a factor
    
    
    
    #Determines the number of isolates within the data
    
    Number_of_isolates <- length(unique(Ind_pathotypes[[sample]]))
    
    
    
    #Determining the number of unique pathotypes for this analysis
    
    Number_of_pathotypes <- length(unique(Ind_pathotypes$Pathotype))
    
    
    #Simple diversity will show the proportion of unique pathotypes to total isolates. As the values gets closer to 1, there is greater diversity in pathoypes within the population.
    
    Simple <- Number_of_pathotypes / Number_of_isolates
    
    #An alternate version of Simple diversity index. This index is less sensitive to sample size than the simple index.
    
    Gleason <- (Number_of_pathotypes - 1) / log(Number_of_isolates)
    
    #Shannon diversity index is typically between 1.5 and 3.5. As richness and evenness of the population increase, so does the Shannon index value
    Shannon <-
      diversity(Pathotype_Freq_Distribution[-1], index = "shannon")
    
    
    #Simpson diversity index values range from 0 to 1. 1 represents high diversity and 0 represents no diversity.
    
    Simpson <-
      diversity(Pathotype_Freq_Distribution[-1], index = "simpson")
    
    
    #Evenness ranges from 0 to 1. As the Eveness value approaches 1, there is a more evene distribution of each pathoypes frequency within the population.
    
    Evenness <- Shannon / log(Number_of_pathotypes)
    
    all.indices <-
      list(
        Number_of_isolates = Number_of_isolates,
        Number_of_pathotypes = Number_of_pathotypes,
        Simple = Simple,
        Gleason = Gleason,
        Shannon = Shannon,
        Simpson = Simpson,
        Evenness = Evenness
      )
    return(all.indices)
  }