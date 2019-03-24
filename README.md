
<!-- README.md is generated from README.Rmd. Please edit that file -->

# hagis

The goal of *hagis* is to provide *Phytophthora sojae* pathotype
analysis that the original [HaGiS
worksheet](https://onlinelibrary.wiley.com/doi/full/10.1046/j.1365-3059.1999.00325.x)
(Herrmann, Löwer and Schachtel) provided.

## Installation

Currently you can only install *hagis* from GitHub with:

``` r
if (!require("remotes")) {
  install.packages("remotes", repos = "http://cran.rstudio.com/")
  library("remotes")
}

install_github("openplantpathology/hagis", build_vignettes = TRUE)
```

The original R scripts were produced by Austin McCoy and Zachary Noel at
Michigan State University to replicate the HaGiS worksheet and provide
all necessary results for pathotype data analysis in R in addition to
other tools to assist in the analysis of these data.

*Phytophthora sojae* has been managed primarily via deployment of
resistance genes (*Rps* genes, resistance to *Phytophthora sojae*) in
commercial soybean cultivars and by the application of fungicide seed
treatments. However, repeated use of resistance genes can cause
populations to adapt over time rendering these resistance genes
ineffective. To determine current effectiveness of resistance genes for
managing Phytophthora sojae, state-wide surveys must be conducted to
determine the pathotype (previously referred to as “race”) structure
within sampled population of *P. sojae*.

The goal of these scripts was to provide all the necessary analyses
needed when conducting a *Phytophthora sojae* pathotype survey,
including: distribution of susceptibilities (effective and non-effective
*Rps* genes), distribution of pathotype complexities with statistics,
pathotype frequency distribution, as well as diversity indices for
pathotypes.

This package should allow for all users to use their own data. To
assist, functions are provided to generate a template for data entry,
`write_template()` and calculate total and percent values for each
observation, `percents()`. It is recommended to use these functions as
the user .csv files will need to have the expected column headings,
“perc.susc”, “rps”and “isolate”, to function properly.

Users may refer to the example file, `system.file("extdata",
"practice_data_set.csv", package = "hagis")` and the documentation for
further examples.

## Citation

Please cite *hagis* by using:

``` r
citation("hagis")
```

# References

Herrmann, Löwer, and Schachtel, (1999), A new tool for entry and
analysis of virulence data for plant pathogens. Plant Pathology, 48:
154-158. <doi:10.1046/j.1365-3059.1999.00325.x>
