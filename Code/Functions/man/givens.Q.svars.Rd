% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/givens.Q.R
\name{givens.Q.svars}
\alias{givens.Q.svars}
\title{From svars package: B matrix after givens rotation at giben angles,
faster than \code{givens.Q(theta, K)}}
\usage{
givens.Q.svars(theta, B)
}
\arguments{
\item{theta}{Vector, containing \code{choose(K,2)} rotation angles}

\item{B}{Matrix, (KxK) dimensional original decomposition matrix, usually the cholesky factor}
}
\value{
a (KxK) rotated B matrix
}
\description{
From svars package: B matrix after givens rotation at giben angles,
faster than \code{givens.Q(theta, K)}
}
\examples{
NULL
}
