% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot.simu.multi.R
\name{plot.simu.multi}
\alias{plot.simu.multi}
\title{Plot and compare results from multiple identification methodes}
\usage{
plot.simu.multi(
  IRF.evas,
  Label = NULL,
  shape_manual = NULL,
  level_manual = NULL
)
}
\arguments{
\item{IRF.evas}{List, contains multiple (KxKxh) arrays generated by functions simulate.**()}

\item{Label}{Character, names of identification methods}

\item{shape_manual}{If provided, point shapes are set manually. It should contain set of aesthetic values
to map data values to. If this is a named vector, then the values will be matched based on the names.
If unnamed, values will be matched in order (usually alphabetical) with the limits of the scale.
Any data values that don't match will be given na.value.}

\item{level_manual}{change levels of factors}
}
\value{
Creat a ggplot object of class "gg"-"ggplot"
}
\description{
Plot and compare results from multiple identification methodes
}
\examples{
NULL

}
