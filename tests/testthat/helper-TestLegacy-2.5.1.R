####################################
### Setup for scripted execution ###
####################################

# Ensure that actualData is identical to expected.
# Overwrite expected while writing a new test.
expect_identical_R <- function(actualData, expectedName, overwrite) {
    if(overwrite == TRUE) amOverwriteExpectedR(actual, expectedName, ".R")

    testthat::expect_identical(actualData, getdata(expectedName))
}

# Dump expected data to the data directory.
dump_expected <- function(df, name, extension) {
    if(!file.exists("../../data/ggSample.csv"))
        stop("\n    Trying to overwrite when not running 'testthat'!",
             "\n    Can't find file '../../ggSample.csv'!\n")

    path = paste("../../data/", name, extension, sep="")
    if(file.exists(path))
        cat("\n    WARNING: Overwriting existing file '", path, "'!\n", sep="")
    else
        cat("\n    Overwriting : ", path, "\n", sep="")

    e <- new.env()
    assign(name, df, envir = e)
    uxFile = file(path, "wb", raw=TRUE) # Use GIT-compatible UNIX line breaks (LF) rather than Windows (CRLF)
    base::dump(list = c(name), uxFile, envir = e)
    close(file)
}


#' Validates the output file naming convention we use for tests on [ggData]
#'
#' @description
#' Validating the naming convention rather than generating the actual and expected
#' names allow us to hard-code the names in the test, which makes them easier to follow.\cr
#' \cr
#' The actual data is written by [allelematch] to a temporary file we point at.\cr
#' We choose to name it <test>_actual.csv\cr
#' \cr
#' The expected data is a permanent, read-only part of this package. \cr
#' It is stored under ./data/ and needs to be read with the function [data].\cr
#' We choose to name it <test>_expected.csv. So we read it with `data("<test>_expected")`.\cr
#' \cr
#' Unfortunately the .csv files that are written by 'allelematch' use comma (",") as field separator,
#' whilst `data()` requires the separator to be semicolon (";").
#' So, an actual .csv file needs to be modified in order to become a new expected.
#'
#' @param actualCsv     The actual summary is written to a .csv file
#' @param expectedData  The expected summary is loaded from the package data
ggAssertSummaryNamesAlligned <- function(actualCsv, expectedData) {
    cat("\n")
    cat("   actualCsv      =", actualCsv, "\n")
    cat("   expectedData   =", expectedData, "\n")

    stopifnot(isTRUE(grepl("_expected$", expectedData)))
    basename = sub("_expected", "", expectedData)
    allignedActual = paste("/", basename, "_actual.csv", sep="")
    if(!isTRUE(grepl(allignedActual, actualCsv))) {
        stop("Actual and Expected names are not alligned",
             "\n    actualCsv      =", actualCsv,
             "\n    allignedActual =", allignedActual,
             "\n    expectedData   =", expectedData)
    }
}

ggAssertActualCsv <- function(test, actualCsv) {
    # stopifnot(isTRUE(grepl(paste("\\b", test, "_actual.csv$", collapse = ""), actualCsv, perl=TRUE)))
    regexp = paste("\\b", test, "_actual.csv$", sep="", collapse = "")
    if(!isTRUE(grepl(regexp, actualCsv, perl=TRUE))) {
        stop("ActualCvs is not alligned with name of test",
             "\n    test           = ", test,
             "\n    regexp         = ", regexp,
             "\n    actualCsv      = ", actualCsv
        )
    }

    # testthat::expect_match(actualCsv, regexp, perl=TRUE)
    return(actualCsv)
}

#' Merges, logs and validates the file into which to write the test result
#'
#' @description
#' Validates the naming convention used in names that are hard-coded in the test,
#' which makes them easier to follow.\cr
#' \cr
#' The actual data is written by [allelematch] to a temporary file we point at.\cr
#' We choose to name it <test>_actual.csv\cr
#'
#' @param test The name of the test. Is validated to be part of the `actualCsv` file name.
#' @param outDir The directory where the file `actualCsv` is to be written. Typically [tempdir()]
#' @param actualCsv  The name of the output file, excluding dir bur including .csv extension.
#'
#' @value Returns validated path  `outdir` + "/" + `actualCsv`
#'
ggActualCsv <- function(test, outDir, actualCsv) {
    actualCsv = paste(outDir, "/", actualCsv, sep="", collapse = "")
    cat("\n")
    cat("   actualCsv      =", actualCsv, "\n")
    ggAssertActualCsv(test, actualCsv)
    return(actualCsv)
}

ggAssertExpected <- function(test, expectedData) {
    # testthat::expect_identical(!!expectedData, !!paste(test, "_expected", sep="", collapse = ""))
    wanted = paste(test, "_expected", sep="", collapse = "")
    if(!isTRUE(grepl(wanted, expectedData, perl=TRUE))) {
        stop("ExpectedData is not alligned with name of test",
             "\n    test           = ", test,
             "\n    wanted         = ", wanted,
             "\n    expectedData   = ", expectedData
        )
    }
    return(expectedData)
}


#' Merges, logs and validates the name of expected result
#'
#' @description
#' Validates the naming convention used in names that are hard-coded in the test,
#' which makes them easier to follow.\cr
#' \cr
#' The expected data is stored as a permanent, read-only part of this package. \cr
#' It is stored under ./data/ and needs to be read with the function [data].\cr
#' We choose to name it <test>_expected.csv. So we read it with `data("<test>_expected")`.\cr
#'
#' @param test The name of the test. Is validated to be part of `expectedData`.
#' @param expectedData  The name of the input [data] file.
#'
#' @value Returns validated `expectedData`
#'
ggExpectedData <- function(test, expectedData) {
    cat("   expectedData   =", expectedData, "\n")
    ggAssertExpected(test, expectedData)
    return(expectedData)
}

#' Validates naming conventions and tests data for equality
#'
#' @description
#' Validating the naming convention rather than generating the actual and expected
#' names allow us to hard-code the names in the test, which makes them easier to follow.\cr
#' \cr
#' The actual data is written by [allelematch] to a temporary file we point at.\cr
#' We choose to name it <test>_actual.csv\cr
#' \cr
#' The expected data is a permanent, read-only part of this package. \cr
#' It is stored under ./data/ and needs to be read with the function [data].\cr
#' We choose to name it <test>_expected.csv. So we read it with `data("<test>_expected")`.\cr
#' \cr
#' Unfortunately the .csv files that are written by 'allelematch' use comma (",") as field separator,
#' whilst `data()` requires the separator to be semicolon (";").
#' So, an actual .csv file needs to be modified in order to become a new expected.
#'
#' @param test The name of the test. Is validated to be part of both `actualCsv` and `expectedData`
#' @param actualCsv     The actual summary that was written to a .csv file by [allelematch]
#' @param expectedData  The expected summary is loaded from the package data
expect_gg_summaries_equal <- function(test, actualCsv, expectedData) {
    actual   = artRead_amCSV(ggAssertActualCsv(test, actualCsv))
    expected = getdata(     ggAssertExpected(test, expectedData))
    testthat::expect_equal( actual, expected, ignore_attr = TRUE)
}

################################################################
### Shaddowing exported functions in amregtest:
################################################################

#' Loads and returns a large data set without polluting the global environment.
#'
#' The data set is taken from the ./data/ folder of the specified package.
#'
#' See the Description section under [utils::data] for how the supported file
#' types (including .R, .RData, .txt and .csv) shall be encoded.
#'
#' The parameters are the same as for the [data] function in package [utils].
#'
#' Thank you @henfiber! See https://stackoverflow.com/questions/30951204/load-dataset-from-r-package-using-data-assign-it-directly-to-a-variable/30951700#30951700
#'
#' @param name The name (excluding directory and extension) of the data to load
#' @param ...  All other parameters are passed on to [utils::data] as is
#'
#' @returns the specified data set loaded by [utils::data]
#'
#' @examples foo = getdata("amExample1", package = "allelematch")
#'
#' @export
getdata <- function(name, ...)
{
    stopifnot(is.character(name))
    e <- new.env()
    name <- utils::data(list = c(name), ..., envir = e)[1]
    e[[name]]
}


#' Read gg style .csv file for use in ... ([allelematch::amDataset] ?)
#'
#' The format of the data to be analyzed by `allelematch`
#' is outside of the control by `allelematch`. So, the format read by this function
#' is specific to this package rather than to `allelematch`.
#'
#' @param   csvInFile Dir, name and extension for the .csv file to be read
#'
#' @export
#' @keywords internal
artReadCsvFile <- function(csvInFile) {
    df <- read.csv(file=csvInFile, colClasses="character", check.names=FALSE)
    return (df)
}


#' Read .csv file written by [allelematch] for comparison with data
#'
#' [allelematch] writes summary file using "," as field delimiter, rather
#' than ";", expected by [utils::data].
#' \cr
#' Quote from `allelematch::amCSV.amUnique`  \cr
#' \cr
#' `utils::write.csv(csvTable, file=csvFile, row.names=FALSE)`
#'
#' @param   csvInFile Dir, name and extension for the .csv file to be read
#'
#' @export
#' @keywords internal
artRead_amCSV <- function(csvInFile) {
    #   df <- read.csv(file=csvInFile, check.names=FALSE)
    df <- read.table(file=csvInFile, header=TRUE, sep=",", as.is=FALSE)
    return (df)
}

artHtml <- function(file) {
    dir = Sys.getenv("ART_CALLERS_WD")
    if(dir == "") {
        dir = ifelse( grepl("/tests/testthat$", getwd()), "../..", ".") # testthat changes getwd() to tests/testthat/.
        dir = normalizePath(dir, winslash = "/")
    }
    # dir = sub("^(C):", "/\\1", dir, perl=TRUE, fixed=FALSE)
    dir = sub("^C:", "", dir, perl=TRUE, fixed=FALSE)
    # dir = "\"/c/Users/Torva/repo/regressiontest\""
    if(!dir.exists(dir)) stop("\n    dir = '", dir, "' does not exist!\n    getwd() = '", getwd(), "' ", sep="")
    longfile = paste(dir, "/", file, sep="")
    cat("\n    Writing html to :", longfile)

    # return("/c/Users/Torva/repo/regressiontest/hej.html")

    return(longfile)
}
