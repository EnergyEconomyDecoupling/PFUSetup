#' Get pin version strings for a CL-PFU database release
#'
#' The CL-PFU database uses the `pins` package
#' to store results.
#' This function gives the pin version strings for CL-PFU database release.
#'
#' The return value is a named list where the values are the pin version strings
#' and the name are either product names or pin version strings.
#'
#' @param database_version A string, prefixed with "v" for the version of interest.
#'                         Any number will be prefixed by "v" and converted to a string internally.
#' @param versions_and_products_path The path to the "versions and products.xlsx" file
#'                                   that contains a concordance table of versions
#'                                   and pin names.
#'                                   Default is `get_abs_paths()[["versions_and_products_path"]]`.
#' @param version_table_tab The name of the `version_table` tab in the
#'                          versions and products file.
#'                          Default is "version_table".
#' @param product_column The name of the product column in the version table.
#'                       Default is "product".
#' @param pin_name_column The name of the pin name column in the version table.
#'                        Default is "pin_name".
#'
#' @return A named list of pin version strings.
#'         Names are the various pin names or the product names.
#'         Values are the pin version strings.
#'
#' @export
#'
#' @examples
#' pin_versions("v1.1")
#' pin_versions(1.1)
pin_versions <- function(database_version,
                         versions_and_products_path = get_abs_paths()[["versions_and_products_path"]],
                         version_table_tab = "version_table",
                         product_column = "product",
                         pin_name_column = "pin_name") {
  if (is.numeric(database_version)) {
    database_version <- paste0("v", database_version)
  }

  # Get the version table.
  cols <- readxl::read_excel(path = versions_and_products_path, sheet = version_table_tab) |>
    dplyr::select(dplyr::any_of(c(pin_name_column, database_version)))

  if (!(database_version %in% names(cols))) {
    stop(paste("Unknown database version:", database_version))
  }

  cols[[database_version]] |>
      magrittr::set_names(cols[[pin_name_column]]) |>
    as.list()
}


#' Read a version of a pinned CL-PFU database product
#'
#' @param pin_name The string name of the pin to be read.
#' @param database_version A string, prefixed with "v" for the version of interest.
#'                         Any number will be prefixed by "v" and converted to a string internally.
#' @param pin_version_string The version string for pin `pin_name` associated with `database_version`.
#'                           Default is `pin_versions(database_version)[[pin_name]]`.
#' @param pipeline_releases_folder The path to the pipeline releases folder.
#'                                 Default is `get_abs_paths()[["pipeline_releases_folder"]]`.
#'
#' @return The pinned object represented by the name and the version string.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' read_pin_version(pin_name = "phi_vecs", database_version = 1.2) |>
#'   head()
#'}
read_pin_version <- function(pin_name,
                             database_version,
                             pin_version_string = pin_versions(database_version)[[pin_name]],
                             pipeline_releases_folder = get_abs_paths()[["pipeline_releases_folder"]]) {

  pinboard <- pipeline_releases_folder |>
    pins::board_folder(versioned = TRUE)
  # Check if the pin exists
  if (! pins::pin_exists(pinboard, name = pin_name)) {
    stop(paste("CL-PFU database product", pin_name, "does not exist."))
  }

  pinboard |>
    pins::pin_read(name = pin_name, version = pin_version_string)
}