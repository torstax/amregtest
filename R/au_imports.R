#library(readr)
#library(plyr)
#library(dplyr)
#library(here)
library(allelematch)
#library(debugr)

#' Placeholder function for roxygen2 import tags
#'
#' This package uses the recommended "Single file" strategy from the roxygen2
#' documentation for how to maintain import dependencies,
#' see ????
#'
#' @details
#' Roxygen uses the tags in our R/*.R files to automatically update the NAMESPACE
#' file.
#'
#' See https://cran.r-project.org/doc/manuals/R-exts.html#Package-Dependencies
#' for how to manually add needed packages to the 'Imports' 'Depends', 'Suggests'
#' or 'Enhances' statements in the DESCRIPTION file.
#'
#' Hint: Use `pak::pkg_deps_tree(package)` (e.g. pak::pkg_deps_tree("dplyr"))
#' to see the package dependencies.


# Packages refferenced with '::' : base data.table dplyr readr remotes rstudioapi table tools utils
#
# data.table::tstrsplit
# dplyr::rename
# readr::problems readr::problems_over_this_skip_the_rest_of_readInput readr::read_tsv
# remotes::install_version
# rstudioapi::isAvailable rstudioapi::restartSession
# tools::md5sum
# utils::data utils::globalVariables utils::packageVersion
#'
#'
#' @import utils
#' @import remotes
#' @import readr
#   ' @import debugr
#' @import allelematch
#' @importFrom data.table tstrsplit
#'
au_imports <- function() {}

utils::globalVariables(c("IS_BRIEF_AMUNIQUE_SUPPORTED_BY_ALLELEMATCH"))
