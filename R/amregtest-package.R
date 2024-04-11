#' @keywords internal
"_PACKAGE"

## usethis namespace: start
#    List imports. Entered into the "Imports:" section of DESCRIPTION file by roxygen2.
#    Order: "testthat depends on withr, so withr must come first"
#' @import utils
#' @import digest
#' @import remotes
#' @import withr
#' @import testthat
#' @import allelematch
## usethis namespace: end
NULL


#' @name amregtest
#'
#' @title Package Overview
#'
#' @description
#' Package 'amregtest' automates regression testing of package [allelematch].
#'
#' The API is simple. There are only three functions:
#' \tabular{clcl}{
#'  `  ` \tab [artRun]`  `\tab `  ` \tab Executes the test, or a subset of the tests\cr
#'  `  ` \tab [artList]\tab \tab Lists the available tests without running them\cr
#'  `  ` \tab [artVersion]\tab \tab Shows the installed versions of [allelematch] and [amregtest]\cr
#' }
#'
#' The prefix "art" is short for "Allelematch Regression Test".
#'
#' See [artData] for a description of data sets used as input.
#'
#' @references [amregtest-package]
#' @references \url{https://github.com/cran/allelematch}
#' @references \href{https://github.com/cran/allelematch/blob/2.5.1/inst/doc/allelematchSuppDoc.pdf}{allelematchSuppDoc.pdf}
NULL
