
# vkmCites

<!-- badges: start -->
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

``` r
library(vkmCites)
Plot_imports(data=vkmCites::Pythons, Species="Python bivittatus", fullTerms = FALSE)
```

