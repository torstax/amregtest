#' @keywords internal
"_PACKAGE"

## usethis namespace: start
#    List imports. Entered into the "Imports:" section of DESCRIPTION file by roxygen2.
#    Order: "testthat depends on withr, so withr must come first"
#' @import utils
#' @import digest
#' @importFrom R6 R6Class
#' @import remotes
#' @import withr
#' @import testthat
## usethis namespace: end
NULL


#' @name amregtest
#'
#' @title Package Overview
#'
#' @description
#' Package 'amregtest' automates regression testing of package [allelematch][allelematch::allelematch-package].
#'
#' The API is simple. There are only four functions:
#' \tabular{clcl}{
#'  `  ` \tab \code{\link{artRun}()}`  `\tab `  ` \tab Executes the test, or a subset of the tests\cr
#'  `  ` \tab \code{\link{artList}()}\tab \tab Lists the available tests without running them\cr
#'  `  ` \tab \code{\link{artVersion}()}\tab \tab Shows the used versions of 'allelematch' and 'amregtest'\cr
#'  `  ` \tab \code{\link{artInstallCranAllelematch}()}\tab`  ` \tab Installs official CRAN version of 'allelematch'\cr
#' }
#'
#' The prefix "art" is short for "Allelematch Regression Test".
#'
#' See \link{artData} for a description of data sets used as input.
#'
#' @references \url{https://github.com/cran/allelematch}
#' @references \href{https://github.com/cran/allelematch/blob/2.5.1/inst/doc/allelematchSuppDoc.pdf}{allelematchSuppDoc.pdf}
NULL
