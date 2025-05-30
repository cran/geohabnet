% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gplot.R
\name{gplot}
\alias{gplot}
\title{Plot a Raster* object}
\usage{
gplot(x, ...)
}
\arguments{
\item{x}{a Raster* object}

\item{...}{additional arguments passed to \code{\link[terra:plot]{terra::plot()}}}
}
\value{
a plot
}
\description{
This is a wrapper for \code{\link[terra:plot]{terra::plot()}} with customized parameters for an enhanced visualization.
}
\examples{
r <- terra::rast(nrows=108, ncols=21, xmin=0, xmax=10)
gplot(r)
gplot(r, col = "red")
gplot(r, col = "red", breaks = 10)
}
