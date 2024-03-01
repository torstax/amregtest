####################################
### Setup for scripted execution ###
####################################

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
