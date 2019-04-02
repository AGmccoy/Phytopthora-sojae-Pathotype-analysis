
<!-- README.md is generated from README.Rmd. Please edit that file -->

# hagis

[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Travis Build
Status](https://travis-ci.org/openplantpathology/hagis.svg?branch=master)](https://travis-ci.org/openplantpathology/hagis)
[![Appveyor Build
Status](https://ci.appveyor.com/api/projects/status/qhkacm5n9twor80c/branch/master?svg=true)](https://ci.appveyor.com/project/adamhsparks/hagis/branch/master)
[![codecov](https://codecov.io/gh/openplantpathology/hagis/branch/master/graph/badge.svg)](https://codecov.io/gh/openplantpathology/hagis)
[![DOI](https://zenodo.org/badge/164751172.svg)](https://zenodo.org/badge/latestdoi/164751172)

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
managing *Phytophthora sojae*, state-wide surveys must be conducted to
determine the pathotype (previously referred to as “race”) structure
within sampled population of *P. sojae*.

The goal of these scripts was to provide all the necessary analyses
needed when conducting a *Phytophthora sojae* pathotype survey,
including: distribution of susceptibilities (effective and non-effective
*Rps* genes), distribution of pathotype complexities with statistics,
pathotype frequency distribution, as well as diversity indices for
pathotypes.

Users may refer to the example file, `system.file("extdata",
"practice_data_set.csv", package = "hagis")` and the documentation for
further examples.

## Citation

Please cite *hagis* by using:

``` r
citation("hagis")
#> 
#> McCoy A, Noel Z, Sparks A, Chilvers M (????). _hagis: Tools for
#> Analysis of Phytophthora Pathotype Complexities, Distributions and
#> Diversity_. doi: 10.5281/zenodo.2619820 (URL:
#> http://doi.org/10.5281/zenodo.2619820), R package version
#> 2.0.0.9000, <URL: https://openplantpathology.github.io/hagis/>.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {{hagis}: Tools for Analysis of Phytophthora Pathotype Complexities, Distributions and Diversity},
#>     author = {Austin McCoy and Zachary Noel and Adam H. Sparks and Martin Chilvers},
#>     note = {R package version 2.0.0.9000},
#>     url = {https://openplantpathology.github.io/hagis/},
#>     doi = {10.5281/zenodo.2619820},
#>   }
```

# References

> Herrmann, , Löwer, and Schachtel, (1999), A new tool for entry and
> analysis of virulence data for plant pathogens. Plant Pathology, 48:
> 154-158. DOI:
> [10.1046/j.1365-3059.1999.00325.x](https://doi.org/10.1046/j.1365-3059.1999.00325.x)
