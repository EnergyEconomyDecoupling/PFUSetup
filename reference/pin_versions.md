# Get pin version strings for a CL-PFU database release

The CL-PFU database uses the `pins` package to store results. This
function gives the pin version strings for CL-PFU database release.

## Usage

``` r
pin_versions(
  database_version,
  versions_and_products_path = get_abs_paths()[["versions_and_products_path"]],
  product_table_tab = "product_table",
  product_column = "product",
  pin_name_column = "pin_name"
)
```

## Arguments

- database_version:

  A string, prefixed with "v" for the version of interest. Any number
  will be prefixed by "v" and converted to a string internally.

- versions_and_products_path:

  The path to the "versions and products.xlsx" file that contains a
  concordance table of versions and pin names. Default is
  `get_abs_paths()[["versions_and_products_path"]]`.

- product_table_tab:

  The name of the `version_table` tab in the versions and products file.
  Default is "version_table".

- product_column:

  The name of the product column in the version table. Default is
  "product".

- pin_name_column:

  The name of the pin name column in the version table. Default is
  "pin_name".

## Value

A named list of pin version strings. Names are the various pin names or
the product names. Values are the pin version strings.

## Details

The return value is a named list where the values are the pin version
strings and the name are either product names or pin version strings.

## Examples

``` r
if (FALSE) { # \dontrun{
pin_versions("v1.2")
pin_versions(1.2)
} # }
```
