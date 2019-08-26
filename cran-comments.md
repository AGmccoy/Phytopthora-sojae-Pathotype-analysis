## Test environments
* local macOS install, R 3.6.1
* ubuntu 16.04 (on travis-ci), R 3.6.1
* win-builder (devel and release)

## Major changes
* The S3 `plot` method is no longer used, `ggplot2::autoplot` is used in its place

## Minor changes
* New citation information for Molecular Plant Pathogen Interactions Journal first look paper
* Rename output column `N_susc` to `N_virulent_isolates`
* Don't round results from `summarize_gene()` or `calculate_complexities()`
before returning values to user
* Implement fix suggested by reviewer to ensure that the user-input data is not
changed from a `data.frame` or `tibble` object to a `data.table` object in the
R session
* Add ability to sort graph x-axis in ascending or descending order based on the
y-axis values rather than only by gene or complexity as suggested by reviewer
* Move example data set into internal data and provide documentation for them
* Provide documentation for how diversity indices are calculated along with
mathematical notation where possible to display
* Calculate Shannon and Simpson indices internally rather than rely on *vegan*
to reduce number of package dependencies
* Replace the term `field` with `column` in documentation
* Test coverage now 100 %
* Add funding agencies to DESCRIPTION Authors@R field
* Add Zhian Kamvar as a contributor and reviewer to DESCRIPTION Authors@R field

## R CMD check results
There were no ERRORs or WARNINGs. 

## Downstream dependencies
There are no downstream dependencies
