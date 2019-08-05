# hagis (development version)

## Minor Changes

* Don't round results from `summarize_gene()` or `calculate_complexities()`
* Implement fix suggested by @zkamvar to ensure that the user-input data is not
changed from a `data.frame` or `tibble` object to a `data.table` object in the
R session
* Use `autoplot()` to plot *hagis* objects in place of `plot()`. This is to
avoid the side-effect of generating and displaying a plot every time `plot()`
is called, which can be troublesome when using *ggplot2* themes since it
created two plots, the original with the base theme and the new themed plot
* Add ability to sort graph x-axis in ascending or descending order based on the
y-axis values rather than only by gene or complexity.
* Move example data set into internal data and provide documentation for them

# hagis 2.0.0

* Initial CRAN release
* Completely new R-package format rather than just Rmd and script files.

# hagis 1.0.0

* Initial release of Rmd and script files by A. McCoy and Z. Noel.
