---
title: "Release notes for `PFUSetup`"
output: html_document
---


Cite all releases with doi [10.5281/zenodo.5228359](https://doi.org/10.5281/zenodo.5228359), 
which always resolves to the latest release.



# PFUSetup 0.1.19 (2023-12-10)

* Moved pkgdown website to `gh-pages` branch.
* No new tests.
    * Still at 77 tests, all passing.
    * Test coverage remains at 100%.


# PFUSetup 0.1.18 (2023-12-02) [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.10251609.svg)](https://doi.org/10.5281/zenodo.10251609)

* Added code of conduct and contributing pages to documentation.
* No new tests.
    * Still at 77 tests, all passing.
    * Test coverage remains at 100%.


# PFUSetup 0.1.17 (2023-11-15) [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.10137351.svg)](https://doi.org/10.5281/zenodo.10137351)

* Changed name of tab in versions and products.xlsx file.
* No new tests.
    - Still at 77 tests, all passing.
    - Test coverage remains at 100%.


# PFUSetup 0.1.16 (2023-11-11) [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.10114842.svg)](https://doi.org/10.5281/zenodo.10114842)

* `pin_versions()` now moved to package PFUPipelineTools.
* Paths to Exiobase energy flows now added.
* New tests for new functions.
    - Now at 77 tests, all passing.
    - Test coverage remains at 100%.


# PFUSetup 0.1.15 [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.10059871.svg)](https://doi.org/10.5281/zenodo.10059871)

* Added new functions `pin_versions()` and `read_pin_version()` 
  to assist development of computational pipelines.
* New tests for new functions.
    - Now at 68 tests, all passing.
    - Test coverage remains at 100%.


# PFUSetup 0.1.14 (2023-08-18) [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.8264422.svg)](https://doi.org/10.5281/zenodo.8264422)

* Now uses DOI for long-term citation.
* Relative paths if `home_path` and `cloud_storage_path` are both
  set to an empty string (`""`).
* New tests for relative paths.
    - Now at 58 tests, all passing.
    - Test coverage remains at 100%.


# PFUSetup 0.1.13 (2023-04-24) [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.7859068.svg)](https://doi.org/10.5281/zenodo.7859068)

* Now defaulting to 2022 release of IEA World Extended Energy Balance (WEEB) data.
* No new tests.
    - Now at 35 tests, all passing.
    - Test coverage remains at 100%.


# PFUSetup 0.1.12 (2023-01-28) [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.7580050.svg)](https://doi.org/10.5281/zenodo.7580050)

* Updated GitHub actions.
* Eliminated references to drake cache path.
  We no longer use the `drake` package.
* Added constants required by the `MWTools` package for Muscle Work analysis.
* No new tests.
    - Still at 36 tests, all passing.
    - Test coverage remains at 100%.


# PFUSetup 0.1.11 (2022-03-23) [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.6380998.svg)](https://doi.org/10.5281/zenodo.6380998)

* Renamed constants for output folders (pins and caches).


# PFUSetup 0.1.10 (2022-03-23) [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.6380706.svg)](https://doi.org/10.5281/zenodo.6380706)

* New release, same code and functionality as 0.1.9, whose only purpose
  is to fix DOI problems.
  Year on the license has been fixed, too.


# PFUSetup 0.1.9 (2022-03-23)

* Now includes path to an aggregation mapping file.
* Now includes folders for drake cache and `PSUT` target outputs.


# PFUSetup 0.1.8 (2021-10-15) [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.5572350.svg)](https://doi.org/10.5281/zenodo.5572350)

* Update documentation for paths.
* Added `phi_constants` table to output of `get_abs_paths()`.
* Exemplar table now sits in Mapping folder.
  Changed `get_abs_paths()` and tests to reflect this change.


# PFUSetup 0.1.7 (2021-09-06) [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.5476116.svg)](https://doi.org/10.5281/zenodo.5476116)

* Now using IEA's 2021 release, with data to 2019.


# PFUSetup 0.1.6 (2021-08-20) [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.5228360.svg)](https://doi.org/10.5281/zenodo.5228360)

* Added `country_concordance_path` argument.
* Two new tests.
    * Now at 23 tests, all passing.
    * Test coverage remains at 100 %.


# PFUSetup 0.1.5 (2021-05-07)

* Now making a character vector of the home path.
  `fs::path_home() %>% as.character()`
* No new tests.
    * Now at 22 tests, all passing.
    * Test coverage remains at 100 %.


# PFUSetup 0.1.4 (2021-04-27)

* Added `drake_cache_path` to the list of strings returned 
  from `get_abs_paths()`.
* No new tests.
    * Now at 22 tests, all passing.
    * Test coverage remains at 100 %.


# PFUSetup 0.1.3 (2021-04-17)

* Fixed all warnings and notes in R CMD Check
* Now skips file existence tests if running on continuous integration systems.
* Added continuous integration testing.
* No new tests.
    * Still at 20 tests, all passing.
    * Test coverage remains at 100 %.


# PFUSetup 0.1.2 (2020-08-26)

* Added `reports_source_folder` and `reports_dest_folder` items
  in the output of `get_abs_paths()`.


# PFUSetup 0.1.1 (2020-08-24)

* Various package setup items, including
    * `NEWS.md` file
    * GitHub Pages Website
* Initial version
