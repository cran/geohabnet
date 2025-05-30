% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sean.R
\name{sean}
\alias{sean}
\alias{msean}
\title{Sensitivity analysis across maps of habitat connectivity}
\usage{
sean(
  rast,
  global = TRUE,
  geoscale = NULL,
  agg_methods = c("sum", "mean"),
  dist_method = "geodesic",
  link_threshold = 0,
  hd_threshold = 0,
  res = reso(),
  inv_pl = inv_powerlaw(NULL, betas = c(0.5, 1, 1.5), mets = c("betweeness",
    "NODE_STRENGTH", "Sum_of_nearest_neighbors", "eigenVector_centrAlitY"), we = c(50,
    15, 15, 20), linkcutoff = -1),
  neg_exp = neg_expo(NULL, gammas = c(0.05, 1, 0.2, 0.3), mets = c("betweeness",
    "NODE_STRENGTH", "Sum_of_nearest_neighbors", "eigenVector_centrAlitY"), we = c(50,
    15, 15, 20), linkcutoff = -1)
)

msean(
  rast,
  global = TRUE,
  geoscale = NULL,
  res = reso(),
  ...,
  outdir = tempdir()
)
}
\arguments{
\item{rast}{Raster object which will be used in analysis.}

\item{global}{Logical. \code{TRUE} if global analysis, \code{FALSE} otherwise.
Default is \code{TRUE}}

\item{geoscale}{Numeric vector. Geographical coordinates
in the form of c(Xmin, Xmax, Ymin, Ymax) which EPSG:4326 in coordinate reference system. If \code{geoscale} is NuLL,
the extent is extracted from \code{rast}(SpatRaster) using \code{\link[terra:ext]{terra::ext()}}.}

\item{agg_methods}{Character. One or both methods of spatial aggregation - SUM, MEAN.
Aggregation strategy for scaling the input raster to the desired resolution.}

\item{dist_method}{Character. The method to calculate the distance matrix.}

\item{link_threshold}{Numeric. A threshold value for link weight.
All link weights that are below this threshold will be replaced with zero for the connectivity analysis.
Link weights represent the relative likelihood of pathogen, pest,
or invasive species movement between a pair of host locations,
which is calculated using gravity models based on host density (or availability) and dispersal kernels.}

\item{hd_threshold}{Numeric. A threshold value for habitat availability (e.g., cropland density or host density).
All locations with a host density below the selected threshold will be excluded from the connectivity analysis,
which focuses the analysis on the most important locations.
The values for the habitat availability threshold can range between 0 and 1;
if value is 1, all locations will be excluded from the analysis and 0 will include all locations in the analysis.
Selecting a threshold for, for example, host density requires at least knowing what is the maximum value
in the host density map to avoid excluding all locations in the analysis.
if value is 1, all locations will be excluded from the analysis and 0 will include all locations in the analysis.
Selecting a threshold for host density requires at least knowing what is the maximum value
in the host density map to avoid excluding all locations in the analysis.}

\item{res}{Numeric. The spatial aggregation factor that will be used to aggregate the raster layer of habitat availability, from fine to coars resolution. Default is \code{\link[=reso]{reso()}}.}

\item{inv_pl}{List. A named list of parameters for inverse power law. See details.}

\item{neg_exp}{List. A named list of parameters for inverse negative exponential. See details.
All locations with a host density below the selected threshold will be excluded from the connectivity analysis,
which focuses the analysis on the most important locations.
The values for the host density threshold can range between 0 and 1;}

\item{...}{arguments passed to \code{\link[=sean]{sean()}}}

\item{outdir}{Character. Output directory for saving raster in TIFF format.
Default is \code{\link[=tempdir]{tempdir()}}.}
}
\value{
GeoRasters.

GeoNetwork.
}
\description{
This function performs a sensitivity analysis across different values of habitat connectivity
for each location in a map.
For each combination of selected parameters, an index of habitat connectivity is calculated.
\code{\link[=sensitivity_analysis]{sensitivity_analysis()}} is a wrapper around \code{\link[=sean]{sean()}} function.
\itemize{
\item \code{msean()} is a wrapper around \code{\link[=sean]{sean()}} function.
It has additional argument to specify maps which are calculated
using \code{\link[=connectivity]{connectivity()}} function.
}
}
\details{
When \code{global = TRUE}, \code{geoscale} is ignored and \code{\link[=global_scales]{global_scales()}} is used by default.

The functions \code{\link[=sean]{sean()}} and \code{\link[=msean]{msean()}} perform the same sensitivity analysis, but they differ in their return value.
The return value of \code{\link[=msean]{msean()}} is \code{GeoNetwork},
which contains the result from applying the \code{\link[=connectivity]{connectivity()}} function on the habitat connectivity indexes.
Essentially, the risk maps.

If neither the inverse power law nor the negative exponential dispersal kernel is specified,
the function will return an error.

In \code{\link[=msean]{msean()}}, three spatRasters are produced with the following values.
For each location in the area of interest,
the mean in habitat connectivity across selected parameters is calculated.
For each location in the area of interest,
the variance in habitat connectivity across selected parameters is calculated.
For each location in the area of interest,
the difference between the rank of habitat connectivity and the rank of host density is calculated.
By default, each of these spatRasters is plotted for visualization.
}
\references{
Yanru Xing, John F Hernandez Nopsa, Kelsey F Andersen, Jorge L Andrade-Piedra, Fenton D Beed,
Guy Blomme, Mónica Carvajal-Yepes, Danny L Coyne, Wilmer J Cuellar, Gregory A Forbes,
Jan F Kreuze, Jürgen Kroschel, P Lava Kumar, James P Legg, Monica Parker, Elmar Schulte-Geldermann,
Kalpana Sharma, Karen A Garrett,
\emph{Global Cropland connectivity: A Risk Factor for Invasion and Saturation by Emerging Pathogens and Pests},
BioScience, Volume 70, Issue 9, September 2020, Pages 744–758,
\doi{10.1093/biosci/biaa067}

Hijmans R (2023). \emph{terra: Spatial Data Analysis}.
R package version 1.7-46, \url{https://CRAN.R-project.org/package=terra}
}
\seealso{
Uses \code{\link[=connectivity]{connectivity()}}

Uses \code{\link[=msean]{msean()}} \code{\link[=inv_powerlaw]{inv_powerlaw()}} \code{\link[=neg_expo]{neg_expo()}}
}
