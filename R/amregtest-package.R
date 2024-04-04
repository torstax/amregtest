#' @keywords internal
"_PACKAGE"


## usethis namespace: start
#' @import allelematch
## usethis namespace: end
NULL


#' Tests package `allelematch` for backwards compatibility
#'
#' @description
#' `amregtest` stands for "allelematch regression test".\cr
#' \cr
#' It is used to verify backwards compatibility after updates to
#' the R package [allelematch] from \url{https://github.com/cran/allelematch} \cr
#'
#' @seealso [amExampleData] [artVersion] [artRun]
#'
#' @examples
#' # Check versions:
#' artVersion()
#'
#' # List all tests:
#' artList()
#'
#' # Run all tests:
#' \dontrun{
#' artRun()
#' }
#'
#' @details
#' Function Naming convention: External functions have a
#' prefix "art" that stands for "allelematch regression testing".
#' For example [artVerson] and [artRun].\cr
#' \cr
#' The testing is built upon [testthat].\cr
#' \cr
#' NOTE that the output of [sort] is platform dependent.
#' You get different results based on the locale. And [allelematch] uses [sort].\cr\cr
#'
#' The sort order also depends on the size of the data to be sorted.
#' See the description of "radix" under [sort].\cr\cr
#'
#' [testthat] (and R CMD check) makes sure that the tests behave the same way
#' on every platform, by setting the collation locale to "C" and the language to "en".\cr
#' See github issue
#' \href{https://github.com/r-lib/testthat/issues/1181#issuecomment-692851342}{locale / collation used in testhat #1181}\cr\cr
#'
#'
#'
