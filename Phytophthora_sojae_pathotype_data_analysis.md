##### This analysis will provide Distribution of Susceptibilities, Distribution of complexities with statistics, Pathotype frequency distribution, as well as diversity indices for pathotypes.These scripts are meant to be a substitute for the Hagis spreadsheet previously used for *Phytophthroa sojae* pathotype analysis and provide the same necessary data as the Hagis sheet.

##### To start, your data should be in a similar format to that of the sample data file provided. Most importantly, Having columns labelled "Isolate"", "Rps"", and "perc.susc"" are critical for the code to work with minimal to no edits on the users part.

Packages needed for analysis
----------------------------

TRUE indicates package was installed and loaded correctly.

    ##      plyr   ggplot2 tidyverse   plotrix   stringr    pander     vegan 
    ##      TRUE      TRUE      TRUE      TRUE      TRUE      TRUE      TRUE 
    ##  devtools 
    ##      TRUE

This reads the file called functions\_themes.R and runs it. This will
enable you to use the functions and defines graphic themes.

    source(here("functions_themes.R"))

Reading in your data. Do not change "Pathotype.Data", just the name of
the file, we will use the Practice data provided as an example. The
function here() will find the .csv file relative to the R project, so
there is no need to set working directory or provide full file path.

The input should be in .csv format with any NA values encoded as blanks

If NA values are encoded differently, replace the option na = "" to what
your values are encoded as

    Pathotype.Data <- read_csv(here("Practice data set.csv"), na = "")

Section 1: Distribution of Susceptibilities
-------------------------------------------

The value in "Distribution\_of\_Susceptibilities(60)" (in this case,
60), sets the cutoff for susceptible reactions. For example, currently
all genes with 60% or more of the plants rated susceptible will return a
"1" in previous scripts (see line 30).

The output will return a list with the first element equal to the
graphic, and the second with the table. You can parse the list by
putting a $ and showing if you want the Data or a graphic

    Suceptibilities <- Distribution_of_Susceptibilities(60)

    pander::pander(Suceptibilities$Data)

<table style="width:67%;">
<colgroup>
<col width="19%" />
<col width="6%" />
<col width="40%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">Rps</th>
<th align="center">N</th>
<th align="center">percent_isolates_pathogenic</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">Rps 1a</td>
<td align="center">21</td>
<td align="center">100</td>
</tr>
<tr class="even">
<td align="center">Rps 1b</td>
<td align="center">15</td>
<td align="center">71.43</td>
</tr>
<tr class="odd">
<td align="center">Rps 1c</td>
<td align="center">20</td>
<td align="center">95.24</td>
</tr>
<tr class="even">
<td align="center">Rps 1d</td>
<td align="center">16</td>
<td align="center">76.19</td>
</tr>
<tr class="odd">
<td align="center">Rps 1k</td>
<td align="center">18</td>
<td align="center">85.71</td>
</tr>
<tr class="even">
<td align="center">Rps 2</td>
<td align="center">14</td>
<td align="center">66.67</td>
</tr>
<tr class="odd">
<td align="center">Rps 3a</td>
<td align="center">5</td>
<td align="center">23.81</td>
</tr>
<tr class="even">
<td align="center">Rps 3b</td>
<td align="center">20</td>
<td align="center">95.24</td>
</tr>
<tr class="odd">
<td align="center">Rps 3c</td>
<td align="center">4</td>
<td align="center">19.05</td>
</tr>
<tr class="even">
<td align="center">Rps 4</td>
<td align="center">5</td>
<td align="center">23.81</td>
</tr>
<tr class="odd">
<td align="center">Rps 5</td>
<td align="center">13</td>
<td align="center">61.9</td>
</tr>
<tr class="even">
<td align="center">Rps 6</td>
<td align="center">11</td>
<td align="center">52.38</td>
</tr>
<tr class="odd">
<td align="center">Rps 7</td>
<td align="center">21</td>
<td align="center">100</td>
</tr>
<tr class="even">
<td align="center">susceptible</td>
<td align="center">21</td>
<td align="center">100</td>
</tr>
</tbody>
</table>

    Suceptibilities$Graphic

![](Phytophthora_sojae_pathotype_data_analysis_files/figure-markdown_strict/Graphic%20output-1.png)

Section 2: Distribution of Complexities
---------------------------------------

Again, you can change your susceptible cutoff value here for your
dataset

    complexities <- Distribution_of_Complexities(60)

Output the frequency data

    pander::pander(complexities$FrequencyData)

<table style="width:58%;">
<colgroup>
<col width="38%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">Frequency_of_Complexities</th>
<th align="center">complexities</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">0</td>
<td align="center">0</td>
</tr>
<tr class="even">
<td align="center">0</td>
<td align="center">1</td>
</tr>
<tr class="odd">
<td align="center">0</td>
<td align="center">2</td>
</tr>
<tr class="even">
<td align="center">0</td>
<td align="center">3</td>
</tr>
<tr class="odd">
<td align="center">0</td>
<td align="center">4</td>
</tr>
<tr class="even">
<td align="center">4.762</td>
<td align="center">5</td>
</tr>
<tr class="odd">
<td align="center">9.524</td>
<td align="center">6</td>
</tr>
<tr class="even">
<td align="center">9.524</td>
<td align="center">7</td>
</tr>
<tr class="odd">
<td align="center">33.33</td>
<td align="center">8</td>
</tr>
<tr class="even">
<td align="center">0</td>
<td align="center">9</td>
</tr>
<tr class="odd">
<td align="center">23.81</td>
<td align="center">10</td>
</tr>
<tr class="even">
<td align="center">14.29</td>
<td align="center">11</td>
</tr>
<tr class="odd">
<td align="center">0</td>
<td align="center">12</td>
</tr>
<tr class="even">
<td align="center">4.762</td>
<td align="center">13</td>
</tr>
</tbody>
</table>

Output the distribution data

    pander::pander(complexities$DistributionData)

<table style="width:62%;">
<colgroup>
<col width="43%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">Distribution_of_Complexities</th>
<th align="center">complexities</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">0</td>
<td align="center">0</td>
</tr>
<tr class="even">
<td align="center">0</td>
<td align="center">1</td>
</tr>
<tr class="odd">
<td align="center">0</td>
<td align="center">2</td>
</tr>
<tr class="even">
<td align="center">0</td>
<td align="center">3</td>
</tr>
<tr class="odd">
<td align="center">0</td>
<td align="center">4</td>
</tr>
<tr class="even">
<td align="center">1</td>
<td align="center">5</td>
</tr>
<tr class="odd">
<td align="center">2</td>
<td align="center">6</td>
</tr>
<tr class="even">
<td align="center">2</td>
<td align="center">7</td>
</tr>
<tr class="odd">
<td align="center">7</td>
<td align="center">8</td>
</tr>
<tr class="even">
<td align="center">0</td>
<td align="center">9</td>
</tr>
<tr class="odd">
<td align="center">5</td>
<td align="center">10</td>
</tr>
<tr class="even">
<td align="center">3</td>
<td align="center">11</td>
</tr>
<tr class="odd">
<td align="center">0</td>
<td align="center">12</td>
</tr>
<tr class="even">
<td align="center">1</td>
<td align="center">13</td>
</tr>
</tbody>
</table>

output the mean of the distribution

    complexities$Mean

    ## [1] 8.714286

output the standard deviation of the output

    complexities$StandardDev

    ## [1] 2.003568

output the standard error of the output

    complexities$StandardErr

    ## [1] 0.4372144

Output the frequency plot

    complexities$FrequencyPlot

![](Phytophthora_sojae_pathotype_data_analysis_files/figure-markdown_strict/Frequency%20Plot%20output-1.png)

Output the distribution plot

    complexities$DistributionPlot

![](Phytophthora_sojae_pathotype_data_analysis_files/figure-markdown_strict/Distribution%20Plot%20output-1.png)

Section 3: Pathotype Frequency Distribution
-------------------------------------------

    path.freq <- Pathotype.frequency.dist(60) 

<table style="width:56%;">
<colgroup>
<col width="11%" />
<col width="44%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">count</th>
<th align="center">Pathotype</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1a, 1b, 1d, 1k, 2, 3a, 3b, 5, 6, 7</td>
</tr>
<tr class="even">
<td align="center">1</td>
<td align="center">1a, 1b, 1c, 1k, 2, 3b, 3c, 4, 6, 7</td>
</tr>
<tr class="odd">
<td align="center">1</td>
<td align="center">1a, 1b, 1c, 1d, 1k, 2, 3b, 4, 6, 7</td>
</tr>
<tr class="even">
<td align="center">2</td>
<td align="center">1a, 1c, 1d, 1k, 2, 3b, 5, 7</td>
</tr>
<tr class="odd">
<td align="center">1</td>
<td align="center">1a, 1c, 1d, 1k, 2, 3b, 6, 7</td>
</tr>
<tr class="even">
<td align="center">2</td>
<td align="center">1a, 1b, 1c, 1d, 1k, 2, 3b, 7</td>
</tr>
<tr class="odd">
<td align="center">1</td>
<td align="center">1a, 1c, 1d, 3b, 5, 7</td>
</tr>
<tr class="even">
<td align="center">1</td>
<td align="center">1a, 1c, 3b, 5, 7</td>
</tr>
<tr class="odd">
<td align="center">1</td>
<td align="center">1a, 1c, 3b, 5, 6, 7</td>
</tr>
<tr class="even">
<td align="center">1</td>
<td align="center">1a, 1b, 1c, 1d, 1k, 2, 6, 7</td>
</tr>
<tr class="odd">
<td align="center">1</td>
<td align="center">1a, 1b, 1c, 1d, 1k, 3b, 7</td>
</tr>
<tr class="even">
<td align="center">1</td>
<td align="center">1a, 1b, 1c, 1k, 3b, 5, 6, 7</td>
</tr>
<tr class="odd">
<td align="center">1</td>
<td align="center">1a, 1b, 1c, 1d, 1k, 2, 3b, 4, 5, 6, 7</td>
</tr>
<tr class="even">
<td align="center">1</td>
<td align="center">1a, 1b, 1c, 1k, 3b, 5, 7</td>
</tr>
<tr class="odd">
<td align="center">1</td>
<td align="center">1a, 1b, 1c, 1d, 1k, 2, 3b, 4, 5, 7</td>
</tr>
<tr class="even">
<td align="center">1</td>
<td align="center">1a, 1b, 1c, 1d, 1k, 3a, 3b, 5, 6, 7</td>
</tr>
<tr class="odd">
<td align="center">1</td>
<td align="center">1a, 1b, 1c, 1d, 1k, 2, 3a, 3b, 3c, 6, 7</td>
</tr>
<tr class="even">
<td align="center">1</td>
<td align="center">1a, 1b, 1c, 1d, 1k, 2, 3a, 3b, 3c, 5, 7</td>
</tr>
<tr class="odd">
<td align="center">1</td>
<td align="center">1a, 1b, 1c, 1d, 1k, 2, 3a, 3b, 3c, 4, 5, 6, 7</td>
</tr>
</tbody>
</table>

Section 4. Diversity index for Pathotypes
-----------------------------------------

Diversity indices used to investigate pathotype divversity within and
between states are shown below. In Version 1 of this document, only code
for analyzing a single state at a time is shown. In the future, scripts
could be produced so that multiple states could be analyzed at once,
independently of each other. Therefore, if analyzing multiple states
pathotype data, each state must be analyzed from its own .csv document.

Determines the number of isolates within the data

    Number_of_isolates <- length(levels(Pathotype.Data$Isolate))
    Number_of_isolates

    ## [1] 21

Determining the number of unique pathotypes for this analysis

    Number_of_pathotypes <- specnumber(path.freq$count)
    Number_of_pathotypes

    ## [1] 19

Simple diversity will show the proportion of unique pathotypes to total
isolates. As the values gets closer to 1, there is greater diversity in
pathoypes within the population.

    Simple <- Number_of_pathotypes/ Number_of_isolates
    Simple

    ## [1] 0.9047619

An alternate version of Simple diversity index. This index is less
sensitive to sample size than the simple index.

    Gleason <- (Number_of_pathotypes - 1)/log(Number_of_isolates)
    Gleason

    ## [1] 5.912257

Shannon diversity index is typically between 1.5 and 3.5. As richness
and evenness of the population increase, so does the Shannon index value

    Shannon <- diversity(path.freq[-1], index="shannon")
    Shannon

    ## [1] 2.912494

Simpsom diversity index values range from 0 to 1. 1 represents high
diversity and 0 represents no diversity.

    Simpson <- diversity(path.freq[-1], index="simpson")
    Simpson

    ## [1] 0.9433107

Evenness ranges from 0 to 1. As the Eveness value approaches 1, there is
a more evene distribution of each pathoypes frequency within the
population.

    Evenness <- Shannon/ log(Number_of_pathotypes)
    Evenness

    ## [1] 0.9891509

### Recommendations are always appreciated!!

#### Chilvers Lab

#### Michigan State University

#### East Lansing, MI
