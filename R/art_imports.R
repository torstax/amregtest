
#' Placeholder file for roxygen2 import tags
#'
#' This package uses the "Single file" or "Central Place" strategy
#' for how to maintain import dependencies.
#' See e.g. \href{https://roxygen2.r-lib.org/articles/namespace.html#functions-1}{Imports}
#'
#' @details
#' Roxygen uses the tags in our R/*.R files to automatically update the NAMESPACE
#' file. \cr
#' \cr
#' See \href{https://cran.r-project.org/doc/manuals/R-exts.html#Package-Dependencies}{Package-Dependencies}
#' for how to manually add needed packages to the 'Imports' 'Depends', 'Suggests'
#' or 'Enhances' statements in the DESCRIPTION file. \cr
#' \cr
#' HINT: Use `pak::pkg_deps_tree(package)` (e.g. pak::pkg_deps_tree("testthat"))
#' to see the package dependencies.
#'
#' @noRd
NULL


#' List imports. Order: "testthat depends on withr, so withr must come first"
#'
#' @import utils
#' @import remotes
#' @import withr
#' @import testthat
#' @import allelematch
#'
#' @noRd
NULL
