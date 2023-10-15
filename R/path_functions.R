#' Get absolute paths to important files and folders appropriate for this computer
#'
#' Default argument values assume a directory structure that includes Dropbox
#' and is appropriate for the Fellowship project for Dr. Paul Brockway.
#'
#' The default argument for `home_path` gets the value for `fs::path_home()`.
#'
#' Although this function is called [get_abs_paths()],
#' it can return relative paths if both `home_path` and `cloud_storage_path`
#' are set to "" (an empty string) and
#' `project_path` is set to the root folder of the project.
#' In that event, the leading file separator (`fsep`) is removed
#' from the path (if it exists).
#'
#' @param home_path The absolute path to the user's home directory.
#' @param cloud_storage_path The path to the user's cloud storage directory, relative to `home_path`.
#' @param project_path The path to the project directory, relative to `home_path`.
#' @param iea_year The year of IEA data release, as a string.
#' @param iea_folder_path The path to the IEA data directory, relative to `home_path`.
#' @param iea_data_path The path to the IEA data file, relative to `home_path`.
#' @param version The version of the input data.
#' @param input_data_path The path to the input data directory, relative to `home_path`.
#' @param output_data_path The path to the output data directory, relative to `home_path`.
#' @param fao_data_path The path to the FAO live animals data file, relative to `home_path`.
#' @param ilo_employment_data_path The path to the ILO employment data file, relative to `home_path`.
#' @param ilo_working_hours_data_path The path to the ILO working hours data file, relative to `home_path`.
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
#' @param pipeline_caches_folder The path to a folder containing zipped versions of the pipeline cache, relative to `home_path`.
#'                               Data are stored as .zip files
#'                               Default is "PipelineCaches" relative to `project_path`.
#' @param pipeline_releases_folder The path to a folder containing released versions of the PSUT target data frame, relative to `home_path`.
#'                                 Data are stored using the `pins` package.
#'                                 Default is "PipelineReleases" relative to `project_path`.
#' @param versions_and_products_path The path to the versions and products file containing lists of all versions and products,
#'                                   relative to `project_path`.
#'                                   Default is "versions_and_products.xlsx".
#' @param fsep The file separator used when constructing paths.
#'             Default is `.Platform$file.sep`.
#'
#' @return A named list containing paths to important directories and files, including:
#' \itemize{
#'  \item{home_path}{The absolute path to the user's home.}
#'  \item{cloud_storage_path}{The absolute path of the user's cloud storage folder.}
#'  \item{project_path}{The absolute path to the project folder.}
#'  \item{iea_folder_path}{The absolute path to a folder containing IEA data.}
#'  \item{iea_data_path}{The absolute path to the IEA data file for the OECD countries.}
#'  \item{input_data_path}{The absolute path to the input data directory.}
#'  \item{output_data_path}{The absolute path to the output data directory.}
#'  \item{fao_data_path}{The absolute path to the FAO live animals data file.}
#'  \item{ilo_employment_data_path}{The absolute path to the ILO employment data file.}
#'  \item{ilo_working_hours_data_path}{The absolute path to the ILO working hours data file.}
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
#'  \item{versions_and_products_path}{The path to the versions and products file.}
#' }
#'
#' @importFrom fs path_home
#'
#' @export
#'
#' @examples
#' get_abs_paths()
#' # Set relative paths with empty strings
#' get_abs_paths(home_path = "", cloud_storage_path = "",
#'               project_path = "my_project_path")
get_abs_paths <- function(home_path = fs::path_home() %>% as.character(),
                          cloud_storage_path = "Dropbox",
                          project_path =  file.path(cloud_storage_path,
                                                    "Fellowship 1960-2015 PFU database"),
                          iea_year = "2022",
                          iea_folder_path = file.path(project_path,
                                                      "IEA extended energy balance data",
                                                      paste("IEA", iea_year, "energy balance data")),
                          iea_data_path = file.path(iea_folder_path,
                                                    paste("IEA Extended Energy Balances", iea_year, "(TJ).csv")),
                          version = "v1.1",
                          input_data_path = file.path(project_path, "InputData", version),
                          output_data_path = file.path(project_path, "OutputData"),
                          fao_data_path = file.path(input_data_path, "fao_qcl_data.rds"),
                          ilo_employment_data_path = file.path(input_data_path, "ilo_employment_data.rds"),
                          ilo_working_hours_data_path = file.path(input_data_path, "ilo_working_hours_data.rds"),
                          hmw_analysis_data_path = file.path(input_data_path, "hmw_analysis_data.xlsx"),
                          amw_analysis_data_path = file.path(input_data_path, "amw_analysis_data.xlsx"),
                          mw_concordance_path = file.path(input_data_path, "FAO_ISO_MW_Mapping.xlsx"),
                          country_concordance_path = file.path(input_data_path, "Country_Concordance_Full.xlsx"),
                          aggregation_mapping_path = file.path(input_data_path, "aggregation_mapping.xlsx"),
                          phi_constants_path = file.path(input_data_path, "phi_constants.xlsx"),
                          exemplar_table_path = file.path(input_data_path, "Exemplar_Table.xlsx"),
                          fu_analysis_folder = file.path(input_data_path, "FU analysis data"),
                          machine_data_folder = file.path(input_data_path, "Machines - Data"),
                          ceda_data_folder = file.path(input_data_path, "CEDA Data"),
                          reports_source_folders = "reports",
                          reports_dest_folder = file.path(output_data_path, "Reports"),
                          pipeline_caches_folder = file.path(output_data_path, "PipelineCaches"),
                          pipeline_releases_folder = file.path(output_data_path, "PipelineReleases"),
                          versions_and_products_path = file.path(pipeline_releases_folder, "versions and products.xlsx"),
                          fsep = .Platform$file.sep) {

  if (home_path == "" & cloud_storage_path == "") {
    csp <- ""
    remove_leading_file_seps <- TRUE
  } else {
    csp <- file.path(home_path, cloud_storage_path)
    remove_leading_file_seps <- FALSE
  }
  out <- list(home_path = home_path,
              cloud_storage_path = csp,
              project_path = file.path(home_path, project_path, fsep = fsep),
              iea_folder_path = file.path(home_path, iea_folder_path, fsep = fsep),
              input_data_path = file.path(home_path, input_data_path, fsep = fsep),
              output_data_path = file.path(home_path, output_data_path, fsep = fsep),
              iea_data_path = file.path(home_path, iea_data_path, fsep = fsep),
              fao_data_path = file.path(home_path, fao_data_path, fsep = fsep),
              ilo_employment_data_path = file.path(home_path, ilo_employment_data_path, fsep = fsep),
              ilo_working_hours_data_path = file.path(home_path, ilo_working_hours_data_path, fsep = fsep),
              hmw_analysis_data_path = file.path(home_path, hmw_analysis_data_path, fsep = fsep),
              amw_analysis_data_path = file.path(home_path, amw_analysis_data_path, fsep = fsep),
              mw_concordance_path = file.path(home_path, mw_concordance_path, fsep = fsep),
              country_concordance_path = file.path(home_path, country_concordance_path, fsep = fsep),
              aggregation_mapping_path = file.path(home_path, aggregation_mapping_path, fsep = fsep),
              exemplar_table_path = file.path(home_path, exemplar_table_path, fsep = fsep),
              phi_constants_path = file.path(home_path, phi_constants_path, fsep = fsep),
              fu_analysis_folder = file.path(home_path, fu_analysis_folder, fsep = fsep),
              machine_data_folder = file.path(home_path, machine_data_folder, fsep = fsep),
              ceda_data_folder = file.path(home_path, ceda_data_folder, fsep = fsep),
              reports_source_folders = reports_source_folders,
              reports_dest_folder = file.path(home_path, reports_dest_folder, fsep = fsep),
              pipeline_caches_folder = file.path(home_path, pipeline_caches_folder, fsep = fsep),
              pipeline_releases_folder = file.path(home_path, pipeline_releases_folder, fsep = fsep),
              versions_and_products_path = file.path(home_path, versions_and_products_path, fsep = fsep))
  if (remove_leading_file_seps) {
    out <- lapply(out, FUN = function(path) {
      gsub(pattern = paste0("^", fsep), replacement = "", x = path)
    })
  }
  return(out)
}
