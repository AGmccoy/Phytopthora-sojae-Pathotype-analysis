#' Calculate pathotype frequency distribution
#' 
#' @description 
#' @param x A `data.frame`` containing the data
#' @param sample
#' @param precent_susc
#' @param gene
#' @param susceptibility_cutoff

freq_dist <-
  function(x,
           sample,
           percent_susc,
           gene,
           susceptibility_cutoff) {
    # same as previous scripts
    x[, gene] <-
      transform(stringr::str_replace(x[[gene]], "Rps ", ""))
    remove_controls <-
      subset(x, x[[gene]]  != "susceptible")
    #x$Susceptible.1 <- ifelse(x[[percent_susc]] >= susceptibility_cutoff, 1, 0)
    remove_controls$Susceptible.1 <-
      ifelse(remove_controls[[percent_susc]] >= susceptibility_cutoff, 1, 0)
    
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
    
    return_Pathotypes <-
      list(individual_pathotypes = Ind_pathotypes,
           pathotypes_distribution = Pathotype_Freq_Distribution)
    # table showing only unique pathotypes and their frequency within the dataset
    return(return_Pathotypes)
  }