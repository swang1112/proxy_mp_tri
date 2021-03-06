#' Identification and evaluation based on Proxy SVAR with given instruments
#'
#' @param Data List containing simulated data
#' @param AOA List generated by function AOA.3d()
#' @param Plot Logical, if Plot = TRUE, a plot of identification performance will be created
#' @param Subsample Vector, a (1x2) vector containing start- and end-point of subsamples that will be
#' subject to estimation and identification
#' @param Bmat Matrix of dimension (KxK), the true structural decomposition implied by the DGP
#' @param Varname Character, names of variables in the systems
#' @param Weak Logical, if Weak = TRUE, weak instruments will be used for identification
#' @param Combi Logical, if Combi = TRUE, instruments that are correlated with more than one endogeneous
#' structural shocks will be used for identification
#'
#' @return A (KxKxh) array containing proportion of all simulated IRFs that lie in the AOA
#' @import dplyr
#' @export simulate.iv
#'
#' @examples NULL
simulate.iv <- function(Data, AOA, Weak = FALSE, Combi = FALSE, Bmat, Subsample = NULL, Plot = FALSE, Varname = c("x", "pi", "r")){

  Size     <- length(Data)
  K        <- ncol(Data[[1]]$Y)
  p        <- 2
  Step     <- dim(AOA$L)[3] - 1
  eva.temp <- array(NA, c(K, K, Step + 1, Size))
  mse.temp <- matrix(rep(NA, Size*4), nrow = Size, ncol = 4)
  F_stat   <- matrix(NA, nrow = Size, ncol = K)

  start.time <- Sys.time()
  cat("\r", "...calculating finish time...")

  for (i in 1:Size) {
    # Data-generation
    Y.temp <- Data[[i]]

    # Subsample
    if (!is.null(Subsample)){
      Y.temp$Y     <- Y.temp$Y[Subsample[1]:Subsample[2],]
      Y.temp$shock <- Y.temp$shock[Subsample[1]:Subsample[2],]
      Y.temp$iv    <- Y.temp$iv[Subsample[1]:Subsample[2],]
      Y.temp$wiv   <- Y.temp$wiv[Subsample[1]:Subsample[2],]
      Y.temp$piv   <- Y.temp$piv[Subsample[1]:Subsample[2],]
    }

    # Estimation
    var2 <- vars::VAR(Y.temp$Y, p = 2, type = "none")

    # Identification
    Bmat.temp   <- matrix(0, nrow = K, ncol = K)
    for (k in 1:K) {
      if (Weak) {
        IV.temp       <- get.id.iv(var2, instruments = Y.temp$wiv[-c(1:p),k])
      } else if (Combi) {
        IV.temp       <- get.id.iv(var2, instruments = Y.temp$piv[-c(1:p),k])
      } else {
        IV.temp       <- get.id.iv(var2, instruments = Y.temp$iv[-c(1:p),k])
      }
      Bmat.temp[,k] <- IV.temp$B %>% c()
      F_stat[i,k]   <- IV.temp$F_test
    }

    IRF.temp       <- get.my.irf(Model = var2, Step = Step, Bmat = Bmat.temp, Normalize = TRUE, Varname = Varname)
    eva.temp[,,,i] <- Evaluate.AOA(IRF.temp, AOA = AOA)

    mse.temp[i,]     <- eva.sign.UMP(Bhat = Bmat.temp, B = Bmat)

    # print progress
    progress(i, max = Size, start.time = start.time)
  }

  test.erg <- data.frame("F-statistic" = round(colMeans(F_stat), 2))
  print(test.erg)

  erg.aoa <- array(NA, c(K, K, Step + 1))
  for (h in 1:(Step + 1)) {
    for (i in 1:K) {
      for (j in 1:K) {
        erg.aoa[i,j,h] <- mean(eva.temp[i,j,h,])
      }
    }
  }

  row.names(erg.aoa) <- Varname

  if (Plot == TRUE){
    plot(plot.simu(erg.aoa))
  }

  mse     <- colSums(mse.temp, na.rm = T)
  UMP     <- mse[1]/Size
  mse.mp  <- mse[-1]/mse[1]

  erg     <- list("aoa" = erg.aoa, "ump" = UMP, "mse.mp" = mse.mp)
  return(erg)
}
