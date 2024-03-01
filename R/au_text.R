###############################################################################
### This file contains utility functions that handle
### low-level text handling stuff without dependencies to allelematch.
### "art" stands for "allelematch regtest".
###############################################################################

###############################################################################
### Misc
###############################################################################

## strcat - Trivial utility for concatenating strings without adding separators.
strcat <- function(...) { paste(..., sep="") }


###############################################################################
### Create file 'connection' for Writing GIT and unix style text files with NL
### Line Breaks.
###############################################################################

artUnixLineBreaks <- function(fileName) {
    # Opens a text file for output in binary mode that allows LF linebreaks,
    # even on Windows.
    # Note that the file needs to be closed explicitly. Sample usage:
    #
    #   file = artUnixLineBreaks(fileName)
    #   write.csv2(file, eol="\n")
    #   close(file)
    #
    # We want our .txt and .csv text files to have GIT style LF line breaks, also on Windows.
    # If we instead wrote Windows style CRLF line breaks to the working tree,
    # then that would confuse the tools that detect differences and there
    # would be a lot of conversion between LF and CRLF.
    #
    # CR stands for Carriage Return, written in R source as "\r", binary encoded as 0x0D=13
    # LF stands for Line Feed, written as "\n", binary encoded as 0x0A=10.
    # Unfortunately, files open for writing in text mode on Windows
    # have low-layer code that detect single LF characters and convert them to CRLF.
    # In order to avoid that conversion, we need to open our output text files in
    # binary mode (a.k.a. raw mode) .

    return(file(fileName, "wb", raw=TRUE))
}

###############################################################################
### Reading and writing CSV files containing allelematch output
### to and from Data Frames
###############################################################################

#' Write .csv file on the same format as [allelematch]
#'
#' [allelematch] writes summary file using "," as field delimiter, rather
#' than ";", expected by [utils::data].
#'
#' Quote from `allelematch::amCSV.amUnique`  \cr\cr
#'
#' `utils::write.csv(csvTable, file=csvFile, row.names=FALSE)`
#'
#' @param df            Data to be written on [allelematch] summary format
#' @param csvOutFile    The file to write to
#'
artWrite_amCSV <- function(df, csvOutFile) {
    file = artUnixLineBreaks(csvOutFile)
    write.csv(df, file, row.names=FALSE)  # Already defaults in write.csv: , quote=TRUE, na = "NA")
    close(file)

    # Make sure we can read the same back again:
    df_read_back = artRead_amCSV(csvOutFile)
    stopifnot(identical(df_read_back, df))
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


#' Write .csv file on format accepted by [utils::data] and excel.
#'
#' @param df            Data to be written
#' @param csvOutFile    Name of file to write, or an already open [connection]. \cr
#'                      An open connection will be left open. \cr
#'                      A named file will be closed at exit. \cr
#'
artWriteCsv2File <- function(df, csvOutFile) {

    if (inherits(csvOutFile, "connection")) {
        # The file is already open
        write.csv2(df, csvOutFile, row.names=FALSE)  # Defaults for write.csv2:  , row.names=FALSE, quote=TRUE, na = "NA")
    } else {
        # We assume we have the name of a file as a string.
        stopifnot(is.character(csvOutFile))

        # Open the file in binary mode to avoid adding CR before LF at line endings:
        file = artUnixLineBreaks(csvOutFile)
        write.csv2(df, file, row.names=FALSE)  # Defaults for write.csv2:  , quote=TRUE, na = "NA")
        close(file)

        # # Check that we get the same back
        # readDf = artReadCsvFile(csvOutFile)
        # stopifnot(identical(df, readDf))
    }
}

###############################################################################
### Check that an actual CSV output file is identical with the expected output.
### Assumes that the two files are called *_actual* and *_expected*
###############################################################################

#' Verifies that the data in `actualCsvFile` exactly matches that in `expectedData`
#'
#' Fetches expected from the [amregtest] data using [utils::data] \cr
#' \cr
#' Note that [allelematch] and [utils::data] differs on how .csv files
#' shall be encoded.\cr
#' \cr
#' o [allelematch] writes .csv files with comma (",") as separator.\cr
#' o [data] expects .csv files to have semicolon (";") as separator.\cr
#' \cr
#' So, the separators in the old output from `allelematch` have been changed to semicolon (";")
#' in order to become `expectedData`
#'
#' @param actualCsvFile New output from `allelematch` to be compared to `expectedData`
#' @param expectedData  Old output from `allelematch` used to verify that `allelematch` is still backwards compatible.
#'
#  ' @export
artAssertCsvEqualToExpectedData <- function(actualCsvFile, expectedData=NULL) {
    if(is.null(expectedData)) {
        e = actualCsvFile
        e = sub("^.*/",    "",         e, perl = TRUE, useBytes = TRUE) # Drop leading directories
        e = sub("actual",  "expected", e, perl = TRUE, useBytes = TRUE) # One naming convention
        e = sub("^act_",   "exp_",     e, perl = TRUE, useBytes = TRUE) # Another naming convention
        e = sub("\\.csv$", "",         e, perl = TRUE, useBytes = TRUE) # Drop the .cvs extension
        expectedData = e
    }
    stopifnot(expectedData != actualCsvFile)
    if(!file.exists(actualCsvFile)) { stop("actualCsvFile ", actualCsvFile, " does not exist")}
    # if(length(find(expectedData)) == 0) { stop("Can't find expectedData ", expectedData)}

    act = artRead_amCSV(actualCsvFile)
    exp = getdata(expectedData, package="amregtest")

    if(is.null(exp)) { stop("Can't find expectedData ", expectedData)}

    cat("Comparing",
         "\n   Actual   :", ncol(act), "x", nrow(act), actualCsvFile,
         "\n   Expected :", ncol(exp), "x", nrow(exp), "data(", expectedData, ") at ", find(expectedData),
         "\n")

    if(!identical(names(act), names(exp))) {
        stop("Actual column names differs from Expected:",
             "\n   Only in Actual   : ", setdiff(names(act), names(exp)),
             "\n   Only in Expected : ", setdiff(names(exp), names(act)),
             "\n   Actual   : ", actualCsvFile,
             "\n   Expected : data(", expectedData, ") at ", find(expectedData),
             "\n   Hint     : use arsenal::comparedf to find differences",
             "\n")
    }
    if(nrow(act) != nrow(exp)) {
        stop("Actual number of rows differs from Expected:",
             "\n   Actual   :", ncol(act), "x", nrow(act), actualCsvFile,
             "\n   Expected :", ncol(exp), "x", nrow(exp), "data(", expectedData, ") at ", find(expectedData),
             "\n   Hint     : use arsenal::comparedf to find differences",
             "\n")
    }
    if (!isTRUE(all.equal(act, exp, check.attributes = FALSE))) {
        stop("Actual content differs from Expected:",
             "\n   Actual   : ", actualCsvFile,
             "\n   Expected : data(", expectedData, ") at ", find(expectedData),
             "\n",
             "\n   Calling  : all.equal(act, exp, check.attributes = FALSE)",
             "\n", capture.output(all.equal(act, exp, check.attributes = FALSE)),
             "\n",
             "\n   Hint     : use arsenal::comparedf to find differences",
             "\n")
    }
    cat("   Expected       =  data(", expectedData, ") at ", find(expectedData), "\n", sep="")
    cat("   OK             : Actual equal to Expected. col=", ncol(act), ", row=", nrow(act), "\n", sep="")
}

artWarnIfNotExpected <- function(actualCsvFile) {
  expectedCsvFile <- gsub("_actual", "_expected", actualCsvFile)
  stopifnot(expectedCsvFile != actualCsvFile)

  expectedMd5sum = tools::md5sum(expectedCsvFile)
  actualMd5sum   = tools::md5sum(actualCsvFile)

  if (actualMd5sum != expectedMd5sum) {
    warning("Expected md5sum differs from Actual:",
         "\n   Expected : ", expectedMd5sum, expectedCsvFile,
         "\n   Actual   : ", actualMd5sum, actualCsvFile)
  }
}

