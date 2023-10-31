#' Get pin strings
#'
#' The CL-PFU database uses the `pins` package
#' to store results.
#' This function translates a CL-PFU database version number to
#' a pin string for later retrieval.
#'
#' The return value is a named list where the values are the pin version strings
#' and the name are either product names or pin version strings.
#'
#' @param version A number representing the version for which pin names should be returned.
#' @param version_string A string, prefixed with "v" for the version of interest.
#'                       Default is `paste0("v", version)`.
#'                       The `version_string` is used internally.
#' @param versions_and_products_path The path to the "versions and products.xlsx" file
#'                                   that contains a concordance table of versions
#'                                   and pin names.
#' @param version_table_tab The name of the `version_table` tab in the
#'                          versions and products file.
#'                          Default is "version_table".
#'
#' @return A named list of pin version strings.
#'         Names are the various pin names or the product names.
#'         Values are the pin version strings.
#'
#' @export
#'
#' @examples
#' pin_names(1.1)
#' pin_names(version_string = "v1.1")
pin_names <- function(version,
                      version_string = paste0(version_prefix, version),
                      versions_and_products_path = get_abs_paths()[["versions_and_products_path"]],
                      version_table_tab = "version_table",
                      product_column = "product",
                      pin_name_column = "pin_name",
                      version_prefix = "v") {
  # Get the version table.
  cols <- readxl::read_excel(path = versions_and_products_path, sheet = version_table_tab) |>
    dplyr::select(tidyselect::any_of(c(product_column, pin_name_column, version_string)))

  # Create an outgoing list containing version strings
  # named with product names and with pin names.
  c(cols[[version_string]] |>
      magrittr::set_names(cols[[pin_name_column]]),
    cols[[version_string]] |>
      magrittr::set_names(cols[[product_column]])) |>
    as.list()
}


