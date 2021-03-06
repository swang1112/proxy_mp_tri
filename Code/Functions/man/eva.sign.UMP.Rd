% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/loss.R
\name{eva.sign.UMP}
\alias{eva.sign.UMP}
\title{check unique monetary policy shock (works only for K = 3) based on sign pattern (-1,-1,1)}
\usage{
eva.sign.UMP(Bhat, B, Reorder = FALSE)
}
\arguments{
\item{Bhat}{Matrix of dimension (KxK), the estimated decomposition}

\item{B}{Matrix of dimension (KxK), the true structural decomposition}

\item{Reorder}{Logical, whether column ordering of Bhat is unidentified}
}
\value{
Numeric, vector of dimension (1x4): c(indicator, RMSEs for demand, supply and mp shock)
}
\description{
check unique monetary policy shock (works only for K = 3) based on sign pattern (-1,-1,1)
}
\examples{
NULL
}
