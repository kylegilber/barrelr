#' @title Barrel Classifier
#'
#' @description
#' Identifies whether a batted-ball event meets barrel criteria using its exit
#' velocity and launch angle.
#'
#' @param ev Numeric vector. Exit velocity (in mph).
#' @param la Numeric vector. Launch angle (in degrees).
#'
#' @return A logical vector of the same length as the inputs.
#' `TRUE` indicates the (ev, la) pair is classified as a barrel.
#'
#' @details
#' This function determines whether the given (ev, la) pair meets the
#' requirements for a barreled ball according to Division I College Baseball
#' data. The requirements to classify a batted-ball as a barrel are:
#' xBA >= 0.500 & xSLG >= 1.500.
#'
#' @examples
#' is_barrel(101, 29)
#' is_barrel(c(103, 107), c(34, 19))
#'
#' @export
is_barrel <- function(ev, la) {

  if (length(ev) != length(la)) {
    stop("`ev` and `la` must have the same length.")
  }

  tryCatch(
    {
      ev = as.numeric(ev)
      la = as.numeric(la)
    },
    error = function(cond) {
      message("`ev` and `la` must be numeric values.")
      message("\nOriginal error message:")
      message(conditionMessage(cond))
      NA
    },
    warning = function(cond) {
      message("`ev` and `la` must be numeric values.")
      message("\nOriginal warning message:")
      message(conditionMessage(cond))
      NA
    }
  )

  ev = round(ev, 1)
  la = round(la, 0)

  paste(ev, la) %in% paste(barrel_data$EV, barrel_data$LA)
}
