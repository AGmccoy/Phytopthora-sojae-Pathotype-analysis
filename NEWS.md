# hagis 3.0.1

## Minor Changes

* Update citation with full MPMI citation

* Remove an extra "/" in the CITATION's DOI

* Fix issue in CITATION file where `nasapower` was referred to in text

* Use ROxygen 7.0.0

# hagis 3.0.0

## Defunct functions

* `plot()` is now defunct. Use `autoplot()` to plot *hagis* objects in place of
`plot()`. This is to avoid the side-effect of generating and displaying a plot
every time `plot()` is called, which can be troublesome when using *ggplot2*
themes since it created two plots, the original with the base theme and the new
themed plot

## Minor Changes
 
* Rename output column `N_susc` to `N_virulent_isolates`

* Don't round results from `summarize_gene()` or `calculate_complexities()`
before returning values to user

* Implement fix suggested by @zkamvar to ensure that the user-input data is not
changed from a `data.frame` or `tibble` object to a `data.table` object in the
R session

* Add ability to sort graph x-axis in ascending or descending order based on the
y-axis values rather than only by gene or complexity.

* Move example data set into internal data and provide documentation for them

* Provide documentation for how diversity indices are calculated along with
mathematical notation where possible to display

* Calculate Shannon and Simpson indices internally rather than rely on *vegan*
to reduce number of Dependencies

* Replace the term `field` with `column` in documentation

* Test coverage now 100 %

* Add funding agencies to DESCRIPTION Authors@R field

# hagis 2.0.0

* Initial CRAN release

* Completely new R-package format rather than just Rmd and script files.

# hagis 1.0.0

* Initial release of Rmd and script files by A. McCoy and Z. Noel.
