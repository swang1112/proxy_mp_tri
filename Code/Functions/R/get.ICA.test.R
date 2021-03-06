#' Test of independence of recovered shocks at given rotation angels
#'
#' @param theta Vector, containing \code{choose(K,2)} rotation angles
#' @param testMethod Method to be used for independence test
#' @param B Matrix, (KxK) dimensional original decomposition matrix, usually the cholesky factor
#' @param dd Object of class 'indepTestDist' (generated by 'indepTest' from package 'copula'). A simulated independent sample of the same size as the data.
#' @param u Matrix oder data.frame, containing (TxK) residuals from an estimated VAR model
#'
#' @return Numeric, test statistics or Hoeffding's D --> to be minimized
#' @export get.ICA.test
#'
#'
#' @examples NULL
get.ICA.test <- function(theta, testMethod, B, u, dd = NULL) {

  K       <- ncol(B)
  B.temp  <- givens.Q.svars(theta, B)

  shock.test <- tcrossprod(u, solve(B.temp))

  if (testMethod == "cvm") {
    cvmtest    <- copula::indepTest(shock.test, d = dd)
    cvmtest$global.statistic
  } else if (testMethod == "hoeffd") {
    d_temp     <- Hmisc::hoeffd(shock.test)$D - diag(K)
    d_sum      <- sum(d_temp[!is.na(d_temp)])
    d_sum
  } else {
    stop("Undefinded method!")
  }
}
