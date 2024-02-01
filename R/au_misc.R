

#' Returns a large data set from some package without duplicating
#'
#' The parameters are the same as for the `utils::data()` function.
#'
#' Thank you @henfiber! See https://stackoverflow.com/questions/30951204/load-dataset-from-r-package-using-data-assign-it-directly-to-a-variable/30951700#30951700
#'
getdata <- function(...)
{
    e <- new.env()
    name <- utils::data(..., envir = e)[1]
    e[[name]]
}


utils::globalVariables(c("IS_BRIEF_AMUNIQUE_SUPPORTED_BY_ALLELEMATCH"))
