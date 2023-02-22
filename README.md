
# vkmCites

<!-- badges: start -->
[![R-CMD-check](https://github.com/DrMattG/vkmCites/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/DrMattG/vkmCites/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of vkmCites is to produce plots from CITES Trade Database for Non-Detriment Findings (NDFs) and reports. 

## Installation

You can install the development version of vkmCites from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("DrMattG/vkmCites")
```

## Example

If you download data from CITES you can use functions to make standardised plots. 

Currently we have data on python trade in to Norway installed in the package.

``` r
library(vkmCites)
Plot_imports(data=vkmCites::Pythons, Species="Python bivittatus", fullTerms = FALSE)
```

