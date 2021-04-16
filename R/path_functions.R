# Your custom code is a bunch of functions.

#' Get absolute paths to important files and folders appropriate for this computer
#'
#' Default argument values assume a directory structure that includes Dropbox
#' and is appropriate for the Fellowship project for Dr. Paul Brockway.
#'
#' The default argument for `home_path` gets the value for `Sys.getenv("HOME")`.
#' On Windows, user directories reported by Sys.getenv("HOME") are set to the user's "Documents" folder by default.
#' `R` on other OSs does not append the "Documents" folder at the end of the `home_path`.
#' For the `home_path` argument,
#' we want the path without the Documents folder appended, because that is the enclosing directory
#' for the Dropbox folder's default location.
#' Thus, the default argument for `home_path` trims trailing "Documents", if present.
#' The default value for the `home_path` argument won't find "Documents" at the end of macOS and Linux home paths
#' and will return the HOME path, as desired.
#'
#' @param home_path The absolute path to the user's home directory.
#' @param dropbox_path The path to the user's Dropbox directory, relative to `home_path`.
#' @param project_path The path to the project directory, relative to `dropbox_path`.
#' @param iea_folder_path The path to the IEA data directory, relative to `project_path`.
#' @param iea_data_path The path to the IEA data file, relative to `iea_folder_path`.
#' @param exemplar_table_path The path to the exemplar table, relative to `project_path`.
#' @param fu_analysis_folder The path to the folder containing final-to-useful exergy information, relative to `project_path`.
#' @param machine_data_folder The path to the folder containing machine-specific efficiencies, relative to `project_path`.
#' @param ceda_data_folder The path to the folder containing CEDA (Centre for Environmental Data Analysis) data, relative to `project_path`.
#' @param reports_source_folders A string vector of paths to folders containing report sources.
#' @param reports_dest_folder The path to the folder into which reports will be written, relative to `project_path`.
#'
#' @return A named list containing paths to important directories and files, including
#' `home_path` (the absolute path to the user's home),
#' `dropbox_path` (the absolute path of the user's Dropbox folder)
#' `project_path` (the absolute path to the project folder),
#' `iea_folder_path` (the absolute path to a folder containing IEA data),
#' `iea_data_path` (the absolute path to the IEA data file for the OECD countries),
#' `fu_analysis_path` (the absolute path to the folder containing final-to-useful exergy information),
#' `machine_data_folder` (the absolute path to the folder containing machine-specific efficiency information),
#' `ceda_data_folder` (the absolute path to the folder containing CEDA environment information),
#' `reports_source_folders` (a vector of absolute paths to folders containing source reports), and
#' `reports_dest_folder` (a directory into which completed reports will be written).
#'
#' @export
#'
#' @examples
#' get_abs_paths()
get_abs_paths <- function(home_path = sub(pattern = "\\Documents$", replacement = "", x = file.path(Sys.getenv("HOME"))),
                          dropbox_path = "Dropbox",
                          project_path = file.path(dropbox_path,
                                                   "Fellowship 1960-2015 PFU database"),
                          iea_folder_path = file.path(project_path,
                                                      "IEA extended energy balance data",
                                                      "IEA 2019 energy balance data"),
                          iea_data_path = file.path(iea_folder_path,
                                                    "IEA Extended Energy Balances 2019.csv"),
                          exemplar_table_path = file.path(project_path, "Database plan", "Exemplar_Table.xlsx"),
                          fu_analysis_folder = file.path(project_path, "Country-level exergy accounting data"),
                          ceda_data_folder = file.path(project_path, "Data", "CEDA Data"),
                          machine_data_folder = file.path(project_path, "Data", "Machines - Data"),
                          reports_source_folders = "reports",
                          reports_dest_folder = file.path(project_path, "Reports")) {

  list(home_path = home_path,
       dropbox_path = file.path(home_path, dropbox_path),
       project_path = file.path(home_path, project_path),
       iea_folder_path = file.path(home_path, iea_folder_path),
       iea_data_path = file.path(home_path, iea_data_path),
       exemplar_table_path = file.path(home_path, exemplar_table_path),
       fu_analysis_folder = file.path(home_path, fu_analysis_folder),
       machine_data_folder = file.path(home_path, machine_data_folder),
       ceda_data_folder = file.path(home_path, ceda_data_folder),
       reports_source_folders = reports_source_folders,
       reports_dest_folder = file.path(home_path, reports_dest_folder))
}
