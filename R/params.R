
#' Get Parameters
#'
#' Retrieves the parameters and copies the parameter file to the specified
#' output path.
#' @param out_path character. The output path where the parameter file will be
#' copied. Default is temporary directory [tempdir()]
#' @param iwindow logical. If `TRUE`, prompts the user to select the output
#' directory using a file chooser window. Default is `FALSE`
#' @return character. The path to the copied parameter file.
#' @export
#' @details
#' Using configuration file is an alternative to [sean()]
#'
#' @seealso [set_parameters()]
#'
#' @examples
#' get_parameters()
#' get_parameters(out = tempdir())
#'
get_parameters <- function(out_path = tempdir(), iwindow = FALSE) {
  if (interactive() && iwindow) {
    out_path <- .get_directoryfromuser()
  }

  params_file_path <- .param_fp()
  .copy_file(params_file_path, out_path)
  message("parameters fetched successfully")
  return(file.path(paste(out_path, basename(params_file_path), sep = "/")))
}

#' Set Parameters
#'
#' This function allows you to set the parameters by replacing the existing
#' parameters file with a new one. Use [get_parameters()] to modify the parameter values.
#'
#' @param new_params The path to the new parameters file.
#' @param iwindow Logical indicating whether to prompt the user to select the
#' new parameters file using a file selection window. Defaults to FALSE.
#' @return None
#' @export
#'
#' @examples
#' param_fp <- get_parameters()
#' set_parameters(param_fp)
#'
set_parameters <- function(new_params, iwindow = FALSE) {
  if (iwindow && interactive()) {
    new_params <- .open_file_selection_prompt()
  }

  init_param <- .default_param()
  if (.check_yaml_structure(
    existing_yaml_file = init_param,
    provided_yaml_file = new_params
  )) {
    .copy_file(new_params, .param_fp())
  }
}

#' Load Parameters from YAML File
#'
#' This function loads parameters from a YAML file and stores them in an object.
#'
#' @param filepath Path to the YAML file containing the parameters. By default, it
#'   takes the value of `parameters.yaml` in R user's directory.
#'
#' @return object with parameters and values
#'
#' @importFrom config get
#'
#' @examples
#' # Load parameters from default file
#' load_parameters()
#'
#' @export
load_parameters <- function(filepath = .param_fp()) {
  return(config::get(file = filepath))
}

#' Get resolution value
#'
#' Resolution stored in `parameter.yaml`.
#' If not present it will result default value.
#' @return Numeric. Resolution from `parameters.yaml`. Default is 24.
#' @export
#' @seealso [set_reso()]
reso <- function() {
  reso <- the$parameters_config$`CCRI parameters`$Resolution
  reso <- if (is.null(reso) || is.na(reso)) {
    24
  } else {
    reso
  }
  return(reso)
}

#' Reset parameters.yaml
#'
#' Resets the values in the `parameters.yaml`
#' file to the default initial values.
#' @return Logical. `TRUE` if function was successfully executed
#' @export
#' @examples
#' reset_params()
#'
reset_params <- function() {
  .copy_file(.default_param(), .param_fp())
  return(TRUE)
}

#' Set resolution value
#'
#' Set `resolution` to be used in analysis.
#' It doesn't modify the `parameters.yaml`
#' but instead a currently loaded instance of it.
#' Must be greater than 0 and less than or equal to 48.
#'
#' @param value numeric. Resolution value.
#' @return Invisible TRUE
#' @export
#' @examples
#' set_reso(24)
#'
set_reso <- function(value) {
  stopifnot("Invalid resolution" = is.numeric(value), value >= 0, value <= 48)
  .loadparam_ifnull()
  the$parameters_config$`CCRI parameters`$Resolution <- value
  invisible(TRUE)
}

.param_fp <- function() {

  cfp <-  tools::R_user_dir("geohabnet", which = "config")
  if (!dir.exists(cfp)) {
    dir.create(cfp, recursive = TRUE)
  }

  cfp <- file.path(cfp, "parameters.yaml")
  if (!file.exists(cfp)) {
    .copy_file(.get_helper_filepath(.kparameters_file_type), cfp)
  }

  return(cfp)
}

.default_param <- function() {
  return(system.file("defaultParams.yaml", package = "geohabnet", mustWork = TRUE))
}

.get_directoryfromuser <- function() {
  return(easycsv::choose_dir())
}

.open_file_selection_prompt <- function() {
  return(file.choose())
}

.copy_file <- function(from, to) {
  file.copy(from = from, to = to, overwrite = TRUE)
}

.extract_hosts <- function(params = load_parameters()) {
  monfredas <- params$`CCRI parameters`$Hosts$monfreda
  spams <- params$`CCRI parameters`$Hosts$mapspam
  crops <- list()
  if (!is.null(monfredas) && !is.list(monfredas)) {
    crops[["monfreda"]] <- monfredas
  }
  if (!is.null(spams) && !is.list(spams)) {
    crops[["mapspam"]] <- spams
  }
  return(crops)
}
