#' Show average coverage frequencies of AoAs as table
#'
#' @param Simus List, contains multiple (KxKxh) arrays generated by functions simulate.**()
#' @param s Numeric, short-run period up to...
#' @param l Numeric, long-run period up to...
#' @param Label Character, names of identification methods
#' @param Varname Character, names of variables in the systems
#'
#' @return List containing average coverage frequencies discriminate btw short- and long-run
#' @export tabulate.simu.aoa
#'
#' @examples NULL
tabulate.simu.aoa <- function(Simus, s = 4, l = 15, Label, Varname = c("x", "pi", "r")){
  N     <- length(Simus)
  short <- matrix(NA, nrow = N, ncol = 3)
  long  <- matrix(NA, nrow = N, ncol = 3)

  for (n in 1:N) {
    mean.temp <- apply(Simus[[n]], 2, colMeans)
    short[n,] <- colMeans(mean.temp[1:(s+1),])
    long[n,]  <- colMeans(mean.temp[(s+2):(l+1),])
  }
  short.mean  <- rowMeans(short)
  long.mean   <- rowMeans(long)
  short       <- cbind(short.mean, short)
  long        <- cbind(long.mean, long)

  colnames(short) <- colnames(long) <- c("mean", Varname)
  rownames(short) <- rownames(long) <- Label

  erg <- list("short" = short, "long" = long)
  return(erg)
}

#' Show frequencies of identification of UMP and RMSE as table
#'
#' @param Simus List, contains multiple (KxKxh) arrays generated by functions simulate.**()
#' @param Label Character, names of identification methods
#' @param Varname Character, names of variables in the systems
#'
#' @return List
#' @export tabulate.simu.ump
#'
#' @examples NULL
tabulate.simu.ump <- function(Simus, Label, Varname = c("x", "pi", "r")){
  N     <- length(Simus)
  ump   <- matrix(NA, nrow = N, ncol = 1)
  rmse  <- matrix(NA, nrow = N, ncol = 3)

  for (n in 1:N) {
    ump[n,]   <- Simus[[n]]$ump
    rmse[n,]  <- Simus[[n]]$mse.mp
  }

  rmse.mean <- rowMeans(rmse)
  rmse      <- cbind(rmse.mean, rmse)

  colnames(rmse) <- c("mean", Varname)
  colnames(ump)  <- "ump"
  rownames(rmse) <- rownames(ump) <- Label

  erg <- list("ump" = ump, "rmse" = rmse)
  return(erg)
}


