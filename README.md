
<!-- README.md is generated from README.Rmd. Please edit README.Rmd -->

# PFUSetup

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/Recca)](https://cran.r-project.org/package=PFUSetup)
[![lifecycle](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable)
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![R-CMD-check](https://github.com/EnergyEconomyDecoupling/PFUSetup/workflows/R-CMD-check/badge.svg)](https://github.com/EnergyEconomyDecoupling/PFUSetup/actions)
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

## More Information

Find more information, including vignettes and function documentation,
at <https://EnergyEconomyDecoupling.github.io/PFUSetup/>.
