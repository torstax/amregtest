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

auTextOutFile <- function(fileName) {
    # Opens a text file for output in binary mode that allows LF linebreaks,
    # even on Windows.
    # Note that the file needs to be closed explicitly. Sample usage:
    #
    #   file = auTextOutFile(fileName)
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
    file=auTextOutFile(tsvOutFile) # Open in binary mode to be able to use LF without CR as newline on Windows
    write.table(df, file, sep="\t", row.names=FALSE, quote=FALSE)
    close(file)
}


###############################################################################
### Reading and writing CSV files containing allelematch output
### to and from Data Frames
###############################################################################

auReadCsvFile <- function(csvInFile) {
    stopifnot()
    df <- read.csv(file=csvInFile, colClasses="character", check.names=FALSE)
    readr::problems(df)
    return (df)
}

auWriteCsvFile <- function(df, csvOutFile) {
    file = auTextOutFile(csvOutFile)
    write.csv(df, file, row.names=FALSE, quote=TRUE, na = "NA")
    close(file)
    readr::problems(df)
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
        file = auTextOutFile(csvOutFile)
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

auAssertExpected <- function(actualCvsFile) {
    expectedCvsFile <- gsub("_actual", "_expected", actualCvsFile)

    exp = auReadCsvFile(expectedCvsFile)
    act = auReadCsvFile(actualCvsFile)


    if (!identical(exp, act)) {
        stop("Expected content differs from Actual:",
             "\n   Expected : ", expectedCvsFile,
             "\n   Actual   : ", actualCvsFile)
    }
    cat("   OK             : Actual identical to Expected. col=", ncol(act), ", row=", nrow(act), "\n", sep="")
}

auWarnIfNotExpected <- function(actualCvsFile) {
  expectedCvsFile <- gsub("_actual", "_expected", actualCvsFile)

  expectedMd5sum = tools::md5sum(expectedCvsFile)
  actualMd5sum   = tools::md5sum(actualCvsFile)

  if (actualMd5sum != expectedMd5sum) {
    warning("Expected md5sum differs from Actual:",
         "\n   Expected : ", expectedMd5sum, expectedCvsFile,
         "\n   Actual   : ", actualMd5sum, actualCvsFile)
  }
}

