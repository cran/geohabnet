% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sean.R
\name{sensitivity_analysis}
\alias{sensitivity_analysis}
\title{Calculate sensitivity analysis on parameters}
\usage{
sensitivity_analysis(maps = TRUE, alert = TRUE)
}
\arguments{
\item{maps}{logical. \code{TRUE} if maps are to be plotted, \code{FALSE} otherwise}

\item{alert}{logical. \code{TRUE} if beep sound is to be played, \code{FALSE} otherwise}
}
\value{
logical. \code{TRUE} if analysis is completed, \code{FALSE} otherwise.
Errors are not handled.
}
\description{
This function runs sensitivity analysis on parameters based on
parameters provided through \code{\link[=set_parameters]{set_parameters()}}.
It can be used as an entry point for CCRI.
By default, it runs analysis on global sclaes\code{\link[=global_scales]{global_scales()}}.
After analysis is complete,
it will suppress maps for outcomes if \code{maps = FALSE} or
\code{\link[=interactive]{interactive()}} is \code{FALSE}.
}
\examples{
\donttest{
# Run analysis on specified parameters.yaml
sensitivity_analysis()
sensitivity_analysis(FALSE, FALSE)
sensitivity_analysis(TRUE, FALSE)
}
}
\references{
Yanru Xing, John F Hernandez Nopsa, Kelsey F Andersen, Jorge L Andrade-Piedra, Fenton D Beed,
Guy Blomme, Mónica Carvajal-Yepes, Danny L Coyne, Wilmer J Cuellar, Gregory A Forbes,
Jan F Kreuze, Jürgen Kroschel, P Lava Kumar, James P Legg, Monica Parker, Elmar Schulte-Geldermann,
Kalpana Sharma, Karen A Garrett,
\emph{Global Cropland Connectivity: A Risk Factor for Invasion and Saturation by Emerging Pathogens and Pests},
BioScience, Volume 70, Issue 9, September 2020, Pages 744–758,
\doi{10.1093/biosci/biaa067}

Hijmans R (2023). \emph{terra: Spatial Data Analysis}.
R package version 1.7-46, \url{https://CRAN.R-project.org/package=terra}
}
\seealso{
\code{\link[=sa_onrasters]{sa_onrasters()}}
\code{\link[=sean]{sean()}}
\code{\link[=global_scales]{global_scales()}}
\code{\link[=get_parameters]{get_parameters()}}
\code{\link[=set_parameters]{set_parameters()}}
\code{\link[=connectivity]{connectivity()}}
}
