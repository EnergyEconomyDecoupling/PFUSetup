#' Get absolute paths to important files and folders appropriate for this computer
#'
#' Default argument values assume a directory structure that includes Dropbox
#' and is appropriate for the Fellowship project for Dr. Paul Brockway.
#'
#' The default argument for `home_path` gets the value for `fs::path_home()`.
#'
#' The default value for `drake_cache_folder` assumes that the `PFUSetup` folder
#' (this project's folder) is a sibling of the working directory
#' from which the drake workflow is run.
#' If this assumption is not true, users are free to
#' pass a non-default value into this function.
#'
#' @param home_path The absolute path to the user's home directory.
#' @param dropbox_path The path to the user's Dropbox directory, relative to `home_path`.
#' @param project_path The path to the project directory, relative to `home_path`.
#' @param iea_folder_path The path to the IEA data directory, relative to `home_path`.
#' @param iea_data_path The path to the IEA data file, relative to `home_path`.
#' @param country_concordance_path The path to the country concordance file, relative to `home_path`.
#' @param phi_constants_path The path to the exergy-to-energy ratio file containing constant values, relative to `home_path`.
#' @param exemplar_table_path The path to the exemplar table, relative to `home_path`.
#' @param fu_analysis_folder The path to the folder containing final-to-useful exergy information, relative to `home_path`.
#' @param machine_data_folder The path to the folder containing machine-specific efficiencies, relative to `home_path`.
#' @param ceda_data_folder The path to the folder containing CEDA (Centre for Environmental Data Analysis) data, relative to `home_path`.
#' @param reports_source_folders A string vector of paths to folders containing report sources.
#' @param reports_dest_folder The path to the folder into which reports will be written, relative to `home_path`.
#' @param drake_cache_folder The path to the drake cache. Default is `../PFU-Database/.drake`, relative to `getwd()`.
#'                           See Details for more information.
#'
#' @return A named list containing paths to important directories and files, including:
#' \itemize{
#'  \item{`home_path`}{The absolute path to the user's home.}
#'  \item{`dropbox_path`}{The absolute path of the user's Dropbox folder.}
#'  \item{`project_path`}{The absolute path to the project folder.}
#'  \item{`iea_folder_path`}{The absolute path to a folder containing IEA data.}
#'  \item{`iea_data_path`}{The absolute path to the IEA data file for the OECD countries.}
#'  \item{`country_concordance_path`}{The absolute path to the country concordance file.}
#'  \item{`phi_constants_path`}{The absolute path to the exergy-to-energy ratio file containing constant values.}
#'  \item{`exemplar_table_path`}{The path to the exemplar table.}
#'  \item{`fu_analysis_folder`}{The absolute path to the folder containing final-to-useful exergy information.}
#'  \item{`machine_data_folder`}{The absolute path to the folder containing machine-specific efficiency information.}
#'  \item{`ceda_data_folder`}{The absolute path to the folder containing CEDA environment information.}
#'  \item{`reports_source_folders`}{A vector of absolute paths to folders containing source reports.}
#'  \item{`reports_dest_folder`}{A directory into which completed reports will be written.}
#'  \item{`drake_cache_folder`}{The path to the drake cache.}
#' }
#'
#' @export
#'
#' @examples
#' get_abs_paths()
get_abs_paths <- function(home_path = fs::path_home() %>% as.character(),
                          dropbox_path = "Dropbox",
                          project_path = file.path(dropbox_path,
                                                   "Fellowship 1960-2015 PFU database"),
                          iea_folder_path = file.path(project_path,
                                                      "IEA extended energy balance data",
                                                      "IEA 2021 energy balance data"),
                          iea_data_path = file.path(iea_folder_path,
                                                    "IEA Extended Energy Balances 2021 (ktoe).csv"),
                          country_concordance_path = file.path(project_path, "Mapping", "Country_Concordance_Full.xlsx"),
                          phi_constants_path = file.path(project_path, "Data", "Phi - Data", "phi_constants.xlsx"),
                          exemplar_table_path = file.path(project_path, "Mapping", "Exemplar_Table.xlsx"),
                          fu_analysis_folder = file.path(project_path, "FU analysis data"),
                          ceda_data_folder = file.path(project_path, "Data", "CEDA Data"),
                          machine_data_folder = file.path(project_path, "Data", "Machines - Data"),
                          reports_source_folders = "reports",
                          reports_dest_folder = file.path(project_path, "Reports"),
                          drake_cache_folder = file.path(getwd(), "..", "PFU-Database", ".drake")) {

  list(home_path = home_path,
       dropbox_path = file.path(home_path, dropbox_path),
       project_path = file.path(home_path, project_path),
       iea_folder_path = file.path(home_path, iea_folder_path),
       iea_data_path = file.path(home_path, iea_data_path),
       country_concordance_path = file.path(home_path, country_concordance_path),
       exemplar_table_path = file.path(home_path, exemplar_table_path),
       phi_constants_path = file.path(home_path, phi_constants_path),
       fu_analysis_folder = file.path(home_path, fu_analysis_folder),
       machine_data_folder = file.path(home_path, machine_data_folder),
       ceda_data_folder = file.path(home_path, ceda_data_folder),
       reports_source_folders = reports_source_folders,
       reports_dest_folder = file.path(home_path, reports_dest_folder),
       drake_cache_folder = drake_cache_folder)
}
