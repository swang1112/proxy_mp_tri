% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/simulate.cvm.R
\name{simulate.cvm}
\alias{simulate.cvm}
\title{Independence-based identification and evaluation based on Cramer-von Mises distance}
\usage{
\method{simulate}{cvm}(
  Data,
  AOA,
  Reorder = TRUE,
  Subsample = NULL,
  Bmat,
  Iter = 1000,
  Steptol = 150,
  Stage2 = 50,
  Plot = FALSE,
  Varname = c("x", "pi", "r")
)
}
\arguments{
\item{Data}{List containing simulated data}

\item{AOA}{List generated by function AOA.3d()}

\item{Reorder}{Logical, if Reorder = TRUE, columns of B matrix are reorded according to AOA}

\item{Subsample}{Vector, a (1x2) vector containing start- and end-point of subsamples that will be
subject to estimation and identification}

\item{Bmat}{Matrix of dimension (KxK), the true structural decomposition implied by the DGP}

\item{Iter}{Iter Integer. Maximum number of iterations for first stage optimization using DEoptim}

\item{Steptol}{Numeric. Tolerance for steps without improvement for DEoptim}

\item{Stage2}{Integer, if provided, second stage optimization will be performed at given iterations}

\item{Plot}{Logical, if Plot = TRUE, a plot of identification performance will be created}

\item{Varname}{Character, names of variables in the systems}
}
\value{
A (KxKxh) array containing proportion of all simulated IRFs that lie in the AOA
}
\description{
Independence-based identification and evaluation based on Cramer-von Mises distance
}
\examples{
NULL
}
