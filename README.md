hagis
================

<!-- badges: start -->

[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![tic](https://github.com/openplantpathology/hagis/workflows/tic/badge.svg?branch=main)](https://github.com/openplantpathology/hagis/actions)
[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/hagis)](https://cran.r-project.org/package=hagis)
[![codecov](https://codecov.io/gh/openplantpathology/hagis/branch/main/graph/badge.svg)](https://app.codecov.io/gh/openplantpathology/hagis)
[![DOI](https://zenodo.org/badge/164751172.svg)](https://zenodo.org/badge/latestdoi/164751172)
<!-- badges: end -->

## Introduction

The goal of *hagis* is to provide analysis tools for plant pathogens
with gene-for-gene interactions in the R programming language that the
original [Habgood-Gilmour Spreadsheet,
HaGiS](https://doi.org/10.1046/j.1365-3059.1999.00325.x), (Herrmann,
Löwer and Schachtel) provided.

This R package has been published in *MPMI* as a resource announcement
[(McCoy *et al.* 2019)](https://doi.org/10.1094/MPMI-07-19-0180-A). You
may wish to refer to that paper for further information on this package.

## Overview

*hagis* was initially created for *Phytophthora sojae* surveys by Austin
McCoy and Zachary Noel at Michigan State University in the US, where the
disease has been managed primarily via deployment of resistance genes
(*Rps* genes, resistance to *P. sojae*) in commercial soybean cultivars
and by the application of fungicide seed treatments. However, repeated
use of resistance genes can cause populations to adapt over time
rendering these resistance genes ineffective. To determine current
effectiveness of resistance genes for managing *P. sojae*, state-wide
surveys (in the US) are conducted to determine the pathotype (previously
referred to as “race”) structure within sampled population of *P.
sojae*.

However, the package is not only useful for *P. sojae* work. It was
built to be useful for other plant pathogen gene-for-gene interaction
systems, *e.g.* rusts or canola blackleg, *Leptosphaeria maculans*. The
goal of this package is to provide all the necessary analyses needed
when conducting a pathotype surveys, including: distribution of
susceptibilities (effective and non-effective resistance genes),
distribution of pathotype complexities with statistics, pathotype
frequency distribution, as well as diversity indices for pathotypes in
an efficient and reproducible manner.

New users are encouraged to visit the documentation,
<https://openplantpathology.github.io/hagis/articles/hagis.html>, for
detailed information on how to use *hagis* along with working examples
using a built-in data set.

## Quick Start Install

### Stable Version

A stable version of *hagis* is available from CRAN.

``` r
install.packages("hagis")
```

### Development Version

A development version is available from from GitHub. If you wish to
install the development version that may have new features or bug fixes
before the CRAN version does (but also may not work properly), please
install the remotes package, available from CRAN. We strive to keep the
main branch on GitHub functional and working properly.

``` r
if (!require("remotes")) {
  install.packages("remotes", repos = "http://cran.rstudio.com/")
  library("remotes")
}

install_github("openplantpathology/hagis", build_vignettes = TRUE)
```

## Meta

### Citation

When you use *hagis*, please cite by using:

``` r
citation("hagis")
```

    ## 
    ## Thank you for citing `hagis`. To cite `hagis` in publications, please
    ## use both the MPMI citation and the package version citation for
    ## reproducibility purposes so changes. to the package over time may be
    ## accounted for in publications.
    ## 
    ##   Austin Glenn McCoy, Zachary A. Noel, Adam H. Sparks and Martin
    ##   Chilvers (2019). `hagis', an R Package Resource for Pathotype
    ##   Analysis of Phytophthora sojae Populations Causing Stem and Root Rot
    ##   of Soybean. Molecular Plant-Microbe Interactions 32.12 (Nov 2019) p.
    ##   1574-1576. DOI: 10.1094/MPMI-07-19-0180-A
    ## 
    ##   McCoy AG, Noel ZA, Sparks AH, Chilvers MI (2021). _hagis: Analysis of
    ##   Plant Pathogen Pathotype Complexities, Distributions and Diversity_.
    ##   doi:10.5281/zenodo.2619820 <https://doi.org/10.5281/zenodo.2619820>,
    ##   R package version 3.1.3,
    ##   <https://openplantpathology.github.io/hagis/>.
    ## 
    ## To see these entries in BibTeX format, use 'print(<citation>,
    ## bibtex=TRUE)', 'toBibtex(.)', or set
    ## 'options(citation.bibtex.max=999)'.

### Code of Conduct

Please note that the *hagis* project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.

## References

> Herrmann, Löwer and Schachtel. (1999), A new tool for entry and
> analysis of virulence data for plant pathogens. Plant Pathology, 48:
> 154-158. DOI:
> [10.1046/j.1365-3059.1999.00325.x](https://doi.org/10.1046/j.1365-3059.1999.00325.x)

> McCoy, Noel, Sparks and Chilvers. (2019). ‘hagis’, an R Package
> Resource for Pathotype Analysis of *Phytophthora sojae* Populations
> Causing Stem and Root Rot of Soybean. Molecular Plant-Microbe
> Interactions 32.12 (Nov 2019) p. 1574-1576. DOI:
> [10.1094/MPMI-07-19-0180-A](https://doi.org/10.1094/MPMI-07-19-0180-A)
