% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/simulate.cvm.mc.R
\name{simulate.cvm.mc}
\alias{simulate.cvm.mc}
\title{(parallelized version) Independence-based identification and evaluation based on Cramer-von Mises distance}
\usage{
\method{simulate}{cvm.mc}(
  Data,
  AOA,
  Bmat,
  mc.cores,
  Iter = 1000,
  Steptol = 150,
  Stage2 = 50,
  Varname = c("x", "pi", "r")
)
}
\arguments{
\item{Data}{List containing simulated data}

\item{AOA}{List generated by function AOA.3d()}

\item{Bmat}{Matrix of dimension (KxK), the true structural decomposition implied by the DGP}

\item{Iter}{Iter Integer. Maximum number of iterations for first stage optimization using DEoptim}

\item{Steptol}{Numeric. Tolerance for steps without improvement for DEoptim}

\item{Stage2}{Integer, if provided, second stage optimization will be performed at given iterations}

\item{Varname}{Character, names of variables in the systems}
}
\value{
A (KxKxh) array containing proportion of all simulated IRFs that lie in the AOA
}
\description{
(parallelized version) Independence-based identification and evaluation based on Cramer-von Mises distance
}
\examples{
NULL
}
