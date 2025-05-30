% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/params.R
\name{get_parameters}
\alias{get_parameters}
\title{Get Parameters}
\usage{
get_parameters(out_path = tempdir(), iwindow = FALSE)
}
\arguments{
\item{out_path}{character. The output path where the parameter file will be
copied. The default is a temporary directory \code{\link[=tempdir]{tempdir()}}}

\item{iwindow}{logical. If window = \code{TRUE}, this will prompt the user to select the output
directory using a file chooser window. The default value is \code{FALSE}.}
}
\value{
character. The path to the copied parameter file.
}
\description{
This function retrieves the list of parameters and saves a copy of
the parameter file (of type .yaml) to the specified output path.
}
\details{
Using this configuration where the parameters are structurally listed in
a yaml file is an alternative method used in the \code{\link[=sensitivity_analysis]{sensitivity_analysis()}}
function. Once the parameter.yaml is saved in a local directory, the user can
modify each parameter value, save this file with the changes, and get the
new parameters back in R with \code{\link[=set_parameters]{set_parameters()}}.

Note that the \code{\link[=sean]{sean()}} or \code{\link[=msean]{msean()}} function will require to directly list
the parameters within the function as it is typical in other R packages.
}
\examples{
get_parameters()
get_parameters(out = tempdir())

}
\seealso{
\code{\link[=set_parameters]{set_parameters()}}
}
