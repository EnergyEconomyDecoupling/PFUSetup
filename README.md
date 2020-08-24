
<!-- README.md is generated from README.Rmd. Please edit README.Rmd -->

# PFUSetup

<!-- badges: start -->

[![Codecov test
coverage](https://codecov.io/gh/EnergyEconomyDecoupling/PFUSetup/branch/master/graph/badge.svg)](https://codecov.io/gh/EnergyEconomyDecoupling/PFUSetup?branch=master)
<!-- badges: end -->

PFUSetup automates the setup process for the PFU database project. Well,
at least it figures out the locations of several directories common to
all installations of the PFU database in a platform- and
machine-independent manner.

## Installation

You can install the latest version of PFUSetup from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("EnergyEconomyDecoupling/PFUSetup")
```

## Example

You might use the package as follows:

``` r
library(PFUSetup)
get_abs_paths()
```
