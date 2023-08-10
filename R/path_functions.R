#' Get absolute paths to important files and folders appropriate for this computer
#'
#' Default argument values assume a directory structure that includes Dropbox
#' and is appropriate for the Fellowship project for Dr. Paul Brockway.
#'
#' The default argument for `home_path` gets the value for `fs::path_home()`.
#'
#' @param home_path The absolute path to the user's home directory.
#' @param dropbox_path The path to the user's Dropbox directory, relative to `home_path`.
#' @param project_path The path to the project directory, relative to `home_path`.
#' @param iea_folder_path The path to the IEA data directory, relative to `home_path`.
#' @param iea_data_path The path to the IEA data file, relative to `home_path`.
#' @param version The version of the input data.
#' @param input_data_path The path to the input data directory.
#' @param output_data_path The path to the output data directory.
#' @param fao_data_path The path to the FAO live animals data file, relative to `home_path`.
#' @param ilo_employment_data_path The path to the ILO employment data file, relative to `home_path`.
#' @param ilo_workingHours_data_path The path to the ILO working hours data file, relative to `home_path`.
#' @param hmw_analysis_data_path The path to the human muscle work analysis file, relative to `home_path`.
#' @param amw_analysis_data_path The path to the animal muscle work file, relative to `home_path`.
#' @param mw_concordance_path The path to the muscle work country concordance file, relative to `home_path`.
#' @param country_concordance_path The path to the country concordance file, relative to `home_path`.
#' @param aggregation_mapping_path The path to the aggregation mapping file, relative to `home_path`.
#' @param phi_constants_path The path to the exergy-to-energy ratio file containing constant values, relative to `home_path`.
#' @param exemplar_table_path The path to the exemplar table, relative to `home_path`.
#' @param fu_analysis_folder The path to the folder containing final-to-useful exergy information, relative to `home_path`.
#' @param machine_data_folder The path to the folder containing machine-specific efficiencies, relative to `home_path`.
#' @param ceda_data_folder The path to the folder containing CEDA (Centre for Environmental Data Analysis) data, relative to `home_path`.
#' @param reports_source_folders A string vector of paths to folders containing report sources.
#' @param reports_dest_folder The path to the folder into which reports will be written, relative to `home_path`.
#' @param pipeline_caches_folder The path to a folder containing zipped versions of the pipeline cache.
#'                               Data are stored as .zip files
#'                               Default is "PipelineCaches" relative to `project_path`.
#' @param pipeline_releases_folder The path to a folder containing released versions of the PSUT target data frame.
#'                                 Data are stored using the `pins` package.
#'                                 Default is "PipelineReleases" relative to `project_path`.
#'
#' @return A named list containing paths to important directories and files, including:
#' \itemize{
#'  \item{home_path}{The absolute path to the user's home.}
#'  \item{dropbox_path}{The absolute path of the user's Dropbox folder.}
#'  \item{project_path}{The absolute path to the project folder.}
#'  \item{iea_folder_path}{The absolute path to a folder containing IEA data.}
#'  \item{iea_data_path}{The absolute path to the IEA data file for the OECD countries.}
#'  \item{input_data_path}{The absolute path to the input data directory.}
#'  \item{output_data_path}{The absolute path to the output data directory.}
#'  \item{fao_data_path}{The absolute path to the FAO live animals data file.}
#'  \item{ilo_employment_data_path}{The absolute path to the ILO employment data file.}
#'  \item{ilo_workingHours_data_path}{The absolute path to the ILO working hours data file.}
#'  \item{hmw_analysis_data_path}{The absolute path to the human muscle work analysis file.}
#'  \item{amw_analysis_data_path}{The absolute path to the animal muscle work file.}
#'  \item{mw_concordance_path}{The absolute path to the muscle work country concordance file.}
#'  \item{country_concordance_path}{The absolute path to the country concordance file.}
#'  \item{aggregation_mapping_path}{The absolute path to the aggregation mapping file.}
#'  \item{phi_constants_path}{The absolute path to the exergy-to-energy ratio file containing constant values.}
#'  \item{exemplar_table_path}{The path to the exemplar table.}
#'  \item{fu_analysis_folder}{The absolute path to the folder containing final-to-useful exergy information.}
#'  \item{machine_data_folder}{The absolute path to the folder containing machine-specific efficiency information.}
#'  \item{ceda_data_folder}{The absolute path to the folder containing CEDA environment information.}
#'  \item{reports_source_folders}{A vector of absolute paths to folders containing source reports.}
#'  \item{reports_dest_folder}{A directory into which completed reports will be written.}
#'  \item{pipeline_caches_folder}{The path to a folder that stores zipped versions of the pipeline cache.}
#'  \item{pipeline_releases_folder}{The path to a folder that stores releases of various targets.}
#' }
#'
#' @importFrom fs path_home
#'
#' @export
#'
#' @examples
#' get_abs_paths()
get_abs_paths <- function(home_path = fs::path_home() %>% as.character(),
                          dropbox_path = "Dropbox",
                          project_path =  file.path(dropbox_path,
                                                    "Fellowship 1960-2015 PFU database"),
                          iea_folder_path = file.path(project_path,
                                                      "IEA extended energy balance data",
                                                      "IEA 2022 energy balance data"),
                          iea_data_path = file.path(iea_folder_path,
                                                    "IEA Extended Energy Balances 2022 (TJ).csv"),
                          version = "v1.1",
                          input_data_path = file.path(project_path, "InputData", version),
                          output_data_path = file.path(project_path, "OutputData"),
                          fao_data_path = file.path(input_data_path, "fao_qcl_data.rds"),
                          ilo_employment_data_path = file.path(input_data_path, "ilo_employment_data.rds"),
                          ilo_workingHours_data_path = file.path(input_data_path, "ilo_workingHours_data.rds"),
                          hmw_analysis_data_path = file.path(input_data_path, "hmw_analysis_data.xlsx"),
                          amw_analysis_data_path = file.path(input_data_path, "amw_analysis_data.xlsx"),
                          mw_concordance_path = file.path(input_data_path, "FAO_ISO_MW_Mapping.xlsx"),
                          country_concordance_path = file.path(input_data_path, "Country_Concordance_Full.xlsx"),
                          aggregation_mapping_path = file.path(input_data_path, "aggregation_mapping.xlsx"),
                          phi_constants_path = file.path(input_data_path, "phi_constants.xlsx"),
                          exemplar_table_path = file.path(input_data_path, "Exemplar_Table.xlsx"),
                          fu_analysis_folder = file.path(input_data_path, "FU analysis data"),
                          ceda_data_folder = file.path(input_data_path, "CEDA Data"),
                          machine_data_folder = file.path(input_data_path, "Machines - Data"),
                          reports_source_folders = "reports",
                          reports_dest_folder = file.path(output_data_path, "Reports"),
                          pipeline_caches_folder = file.path(output_data_path, "PipelineCaches"),
                          pipeline_releases_folder = file.path(output_data_path, "PipelineReleases")) {

  list(home_path = home_path,
       dropbox_path = file.path(home_path, dropbox_path),
       project_path = file.path(home_path, project_path),
       iea_folder_path = file.path(home_path, iea_folder_path),
       input_data_path = file.path(home_path, input_data_path),
       output_data_path = file.path(home_path, output_data_path),
       iea_data_path = file.path(home_path, iea_data_path),
       fao_data_path = file.path(home_path, fao_data_path),
       ilo_employment_data_path = file.path(home_path, ilo_employment_data_path),
       ilo_workingHours_data_path = file.path(home_path, ilo_workingHours_data_path),
       hmw_analysis_data_path = file.path(home_path, hmw_analysis_data_path),
       amw_analysis_data_path = file.path(home_path, amw_analysis_data_path),
       mw_concordance_path = file.path(home_path, mw_concordance_path),
       country_concordance_path = file.path(home_path, country_concordance_path),
       aggregation_mapping_path = file.path(home_path, aggregation_mapping_path),
       exemplar_table_path = file.path(home_path, exemplar_table_path),
       phi_constants_path = file.path(home_path, phi_constants_path),
       fu_analysis_folder = file.path(home_path, fu_analysis_folder),
       machine_data_folder = file.path(home_path, machine_data_folder),
       ceda_data_folder = file.path(home_path, ceda_data_folder),
       reports_source_folders = reports_source_folders,
       reports_dest_folder = file.path(home_path, reports_dest_folder),
       pipeline_caches_folder = file.path(home_path, pipeline_caches_folder),
       pipeline_releases_folder = file.path(home_path, pipeline_releases_folder))
}
