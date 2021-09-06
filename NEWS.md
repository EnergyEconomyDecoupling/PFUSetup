# PFUSetup 0.1.7 (2021-09-06) 

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
