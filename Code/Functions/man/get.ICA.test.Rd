% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get.ICA.test.R
\name{get.ICA.test}
\alias{get.ICA.test}
\title{Test of independence of recovered shocks at given rotation angels}
\usage{
get.ICA.test(theta, testMethod, B, u, dd = NULL)
}
\arguments{
\item{theta}{Vector, containing \code{choose(K,2)} rotation angles}

\item{testMethod}{Method to be used for independence test}

\item{B}{Matrix, (KxK) dimensional original decomposition matrix, usually the cholesky factor}

\item{u}{Matrix oder data.frame, containing (TxK) residuals from an estimated VAR model}

\item{dd}{Object of class 'indepTestDist' (generated by 'indepTest' from package 'copula'). A simulated independent sample of the same size as the data.}
}
\value{
Numeric, test statistics or Hoeffding's D --> to be minimized
}
\description{
Test of independence of recovered shocks at given rotation angels
}
\examples{
NULL
}
