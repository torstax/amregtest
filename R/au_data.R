

#'
#'
#' This is sample data from package allelematch that we use to test
#' allelmatch backwards compatibility.
#'
#' @name allelematch::amExample1
#' @docType data
#' @references \url{https://github.com/cran/allelematch}
#' @keywords data
NULL

#'
#'
#' This is sample data from package allelematch version 2.5.1,
#' but saved on .csv format, as described under 'Details' in utils::data.
#'
#' as described  that we use to test
#' allelmatch backwards compatibility.
#' ... saved on the format
#'
#' @name amExample1_inp
#' @docType data
#' @references \url{https://github.com/cran/allelematch}
#' @keywords data
NULL


#' Loads and returns a large data set without polluting the global environment.
#'
#' The data set is taken from the ./data/ folder of the specified package.
#' See [data] for how the supported data types are encrypted.
#'
#' The parameters are the same as for the `utils::data()` function.
#'
#' Thank you @henfiber! See https://stackoverflow.com/questions/30951204/load-dataset-from-r-package-using-data-assign-it-directly-to-a-variable/30951700#30951700
#'
#' @param ... Passed on to `utils::data` as is
#'
#' @returns the specified data set loaded by `utils::data`
getdata <- function(...)
{
    e <- new.env()
    name <- utils::data(..., envir = e)[1]
    e[[name]]
}


#' Write data to .R file in ./data directory using `dump()`
#'
#' @param df        Data frame to write
#' @param outName   Name of file to write to, excluding leading "data/" and trailing ".R"
#'
#  ' @export
#'
#  ' @examples
auDumpToData <- function(df, outName) {
    e <- new.env()
    assign(outName, df, envir = e)
    outFile = paste("data/", outName, ".R", sep="")
    file = auTextOutFile(outFile)
    # base::dump(list = c(outName), file, control = "all", envir = e)
    base::dump(list = c(outName), file, envir = e)
    close(file)
    # readr::problems(df)
}

#' Load data from remote package and dump it to .R file in local data directory
#'
#' @param package    The name of the package to load from as character
#' @param remoteName The name of the data to read from the remote package
#' @param localName  The name of the data to write to the local data dir as .R file
#' @param keep       If TRUE, both remoteName and localName will be kept in the the .GlobalEnv. Otherwise they will be removed.
#'
#  ' @return
#  ' @export
#'
#  ' @examples
auCopyToLocalData <- function(package, remoteName, localName=remoteName, keep=FALSE) {
    # package = "allelematch"
    # remoteName = "amExample1"
    # localName =  "amExample1_in"

    data(list = c(remoteName), package=package)
    auDumpToData(get(remoteName), localName)
    data(list = c(localName))
    stopifnot(identical(get(remoteName), get(localName)))

    if (!keep) {
        rm(list = c(remoteName, localName), envir = .GlobalEnv)
    }
}

#' Copy from package `alleledata` all amExample?.RData files to this data directory.
#'
#  ' @return
#' @export
#'
#  ' @examples
auCopyAmExamplesToLocalData <- function() {
    auCopyToLocalData( "allelematch", "amExample1", "amExample1_in")
    auCopyToLocalData( "allelematch", "amExample2", "amExample2_in")
    auCopyToLocalData( "allelematch", "amExample3", "amExample3_in")
    auCopyToLocalData( "allelematch", "amExample4", "amExample4_in")
    auCopyToLocalData( "allelematch", "amExample5", "amExample5_in")
}


#' Stops execution if remote and local data are not identical
#'
#' @param package    The name of the remote package to load from as character
#' @param remoteName The name of the data to read from the remote package
#' @param localName  The name of the data to write to the local data dir as .R file
#' @param keep       If TRUE, both remoteName and localName will be kept in the the .GlobalEnv. Otherwise they will be removed.
#'
#  ' @return
#  ' @export
#'
#  ' @examples
auAssertLocalDataIdentical <- function(package, remoteName, localName, keep=FALSE) {
    data(list = c(remoteName), package=package)
    data(list = c(localName))
    stopifnot(identical(get(remoteName), get(localName)))

    if (!keep) {
        # Remove the variables from the global environment again:
        base::rm(list = c(remoteName, localName), envir = .GlobalEnv)
    }
}

#' Compares the local amExample files with the originals.
#'
#' Stops execution if any of the local amExample files is not identical with the corresponding
#' file in the `allelematch` package
#'
# ' @return
#' @export
#'
#' @examples auVerifyAmExamples()
auVerifyAmExamples <- function() {
    auAssertLocalDataIdentical( "allelematch", "amExample1", "amExample1_in")
    auAssertLocalDataIdentical( "allelematch", "amExample2", "amExample2_in")
    auAssertLocalDataIdentical( "allelematch", "amExample3", "amExample3_in")
    auAssertLocalDataIdentical( "allelematch", "amExample4", "amExample4_in")
    auAssertLocalDataIdentical( "allelematch", "amExample5", "amExample5_in")
}
