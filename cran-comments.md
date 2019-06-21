## Test environments
* local macOS install, R 3.6.0
* ubuntu 14.04 (on travis-ci), R 3.6.0
* win-builder (devel and release)

## Notes
* This is a resubmission with the following requested changes being made and with minor changes to improve the package included

## Requested changes
* Have omitted the redundant part "Tools for" the title
* Have used only undirected quotation marks in the Description text
* Have added authors, year and DOI reference describing our methods to Description text, (Herrmann, Löwer, Schachtel (1999)
  <doi:10.1046/j.1365-3059.1999.00325.x>)

## Minor changes
* Improved citation
* Simplified user interface for plotting by using the S3 method, `plot()` in place of `autoplot()`
* Made the package title and documentation more generic for any gene-for-gene pathosystem, not just _Phytopthora sojae_
* Made the resource announcement written in Rmarkdown for Molecular Plant Pathogen Interactions available as a part of the package in `/inst/paper`

## R CMD check results
There were no ERRORs or WARNINGs. 

## Downstream dependencies
This is a new release, there are no downstream dependencies
