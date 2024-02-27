###############################################################################
### This file contains utility functions that handle
### low-level text handling stuff without dependencies to allelematch.
### "au" stands for "allelematch utilities".
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

auUnixLineBreaks <- function(fileName) {
    # Opens a text file for output in binary mode that allows LF linebreaks,
    # even on Windows.
    # Note that the file needs to be closed explicitly. Sample usage:
    #
    #   file = auUnixLineBreaks(fileName)
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
### Reading and writing TSV files containing allelematch input
### to and from Data Frames
###############################################################################

auReadTsvFile <- function(tsvInFile) {
    # Read file with new samples from the sequencer robot:
    # Note that strings that start with an integer are not valid column names
    # They are prefixed with X by read_delim; "16S1_Gg291" becomes "X16S1_Gg291".
    newSamples <- readr::read_tsv(tsvInFile, name_repair = make.names, col_types = cols(.default = col_character()))
    readr::problems(newSamples)
    return(newSamples)
}

auWriteTsvFile <- function(df, tsvOutFile) {
    file=auUnixLineBreaks(tsvOutFile) # Open in binary mode to be able to use LF without CR as newline on Windows
    write.table(df, file, sep="\t", row.names=FALSE, quote=FALSE)
    close(file)
}


###############################################################################
### Reading and writing CSV files containing allelematch output
### to and from Data Frames
###############################################################################

#' Read .csv file for use in ... ([allelematch::amDataset] ?)
#'
#' [allelematch] writes summary file using "," as field delimiter, rather
#' than ";", expected by [utils::data].
#'
#' Quote from `allelematch::amCSV.amUnique`  \cr\cr
#'
#' `utils::write.csv(csvTable, file=csvFile, row.names=FALSE)`
#'
#' @export
auReadCsvFile <- function(csvInFile) {
    df <- read.csv(file=csvInFile, colClasses="character", check.names=FALSE)
    readr::problems(df)
    return (df)
}

#' Write .csv file on the same format as [allelematch]
#'
#' [allelematch] writes summary file using "," as field delimiter, rather
#' than ";", expected by [utils::data].
#'
#' Quote from `allelematch::amCSV.amUnique`  \cr\cr
#'
#' `utils::write.csv(csvTable, file=csvFile, row.names=FALSE)`
#'
auWriteCsvFile <- function(df, csvOutFile) {
    file = auUnixLineBreaks(csvOutFile)
    write.csv(df, file, row.names=FALSE)  # Already defaults in write.csv: , quote=TRUE, na = "NA")
    close(file)
    readr::problems(df)

    # Make sure we can read the same back again:
    df_read_back = auReadCsvFile(csvOutFile)
    stopifnot(identical(df_read_back, df))
}


#' Read .csv file written by [allelematch] for comparison with data
#'
#' [allelematch] writes summary file using "," as field delimiter, rather
#' than ";", expected by [utils::data].
#'
#' Quote from `allelematch::amCSV.amUnique`  \cr\cr
#'
#' `utils::write.csv(csvTable, file=csvFile, row.names=FALSE)`
#'
#' @export
auRead_amCSV <- function(csvInFile) {
    #   df <- read.csv(file=csvInFile, check.names=FALSE)
    df <- read.table(file=csvInFile, header=TRUE, sep=",", as.is=FALSE)
    readr::problems(df)
    return (df)
}


#
# auReadCsv2File <- function(csvInFile) {
#     df <- read.csv2(file=csvInFile)
#     readr::problems(df)
#     return (df)
# }

#' Write .csv file on format accepted by [utils::data] and excel.
#'
#' @param df            Data to be written
#' @param csvOutFile    Name of file to write, or an already open [connection]. \cr
#'                      An open connection will be left open. \cr
#'                      A named file will be closed at exit. \cr
#'
auWriteCsv2File <- function(df, csvOutFile) {

    if (inherits(csvOutFile, "connection")) {
        # The file is already open
        write.csv2(df, csvOutFile, row.names=FALSE)  # Defaults for write.csv2:  , row.names=FALSE, quote=TRUE, na = "NA")
    } else {
        # We assume we have the name of a file as a string.
        stopifnot(is.character(csvOutFile))

        # Open the file in binary mode to avoid adding CR before LF at line endings:
        file = auUnixLineBreaks(csvOutFile)
        write.csv2(df, file, row.names=FALSE)  # Defaults for write.csv2:  , quote=TRUE, na = "NA")
        close(file)

        # # Check that we get the same back
        # readDf = auReadCsvFile(csvOutFile)
        # stopifnot(identical(df, readDf))
    }
    readr::problems(df)


}

###############################################################################
### Check that an actual CSV output file is identical with the expected output.
### Assumes that the two files are called *_actual* and *_expected*
###############################################################################

auAssertCsvIdentical <- function(actualCsvFile, expectedCsvFile=NULL) {
    if(is.null(expectedCsvFile)) { expectedCsvFile <- gsub("_actual", "_expected", actualCsvFile) }
    stopifnot(expectedCsvFile != actualCsvFile)

    act = auReadCsvFile(actualCsvFile)
    exp = auReadCsvFile(expectedCsvFile)

    if (!identical(exp, act)) {
        stop("Actual content differs from Expected:",
             "\n   Actual   : ", actualCsvFile,
             "\n   Expected : ", expectedCsvFile)
    }
    cat("   Expected       =  ", expectedCsvFile, "\n", sep="")
    cat("   OK             : Actual identical to Expected. col=", ncol(act), ", row=", nrow(act), "\n", sep="")
}

#' Verifies that the data in `actualCsvFile` exactly matches that in `expectedData`
#'
#' Fetches expected from the [regressiontest] data using [utils::data] \cr
#' \cr
#' Note that [allelematch] and [utils::data] differs on the how .csv files
#' shall be encoded.\cr
#' o [allelematch] writes .csv files with comma (",") as separator.\cr
#' o [data] expects .csv files to have semicolon (";") as separator.
#'
#' @export
auAssertCsvEqualToExpectedData <- function(actualCsvFile, expectedData=NULL) {
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

    act = auRead_amCSV(actualCsvFile)
    exp = getdata(expectedData, package="regressiontest")

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

auWarnIfNotExpected <- function(actualCsvFile) {
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

