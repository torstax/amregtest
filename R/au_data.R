#' @name amExampleData
#'
#' @title Example data from package allelematch
#'
#' @description
#' This example data is used when testing allelmatch backwards compatibility.\cr
#' It was imported from version 5.2.1 of [allelematch].
#' It is still unchanged in 5.2.3. \cr
#' \cr
#' See [allelematch::amExampleData] for a brief introduction. \cr
#' See \href{https://github.com/cran/allelematch/blob/2.5.1/inst/doc/allelematchSuppDoc.pdf}{allelematchSuppDoc.pdf}.
#' for a more detailed description.
#'
#' @examples
#' # Make sure that the local copy of all data/amExample* files match
#' # match those in the currently installed version of allelematch:
#' artVerifyAmExamples() # Stops if not identical
#'
#' @docType data
#' @references \url{https://github.com/cran/allelematch}
#' @references \href{https://github.com/cran/allelematch/blob/2.5.1/inst/doc/allelematchSuppDoc.pdf}{allelematchSuppDoc.pdf}
#' @keywords data
NULL

#' Example 1 High quality data set
#'
#' This is sample data copied from [allelematch::amExampleData] in version 5.2.1
#' of package [allelematch]. We use this data to test allelmatch backwards compatibility.
#'
#' The data in this example is simulated to represent a high quality data set that might
#' result from a laboratory protocol where samples were run multiple times to confirm their
#' identity. It has no genotyping error, a near-zero missing data load, and approximately
#' 60% of the individuals have been artificially resampled more than once.
#'
#' @name amExample1
#' @docType data
#' @references \url{https://github.com/cran/allelematch}
#' @keywords data
NULL

#' Example 2 Good quality data set
#'
#' This is sample data copied from [allelematch::amExampleData] in version 5.2.1
#' of package [allelematch]. We use this data to test allelmatch backwards compatibility.
#'
#' The data in this example have also been simulated, this time to reflect the qualities
#' of good quality data set, where genotyping error and missing data exist, but these can
#' be confidently handled by allelematch without manual intervention. At each locus a
#' random 4% of heterozygotes lost their second allele to simulate an allele dropout, and
#' a random 4% of samples at each locus had alleles set to missing.
#'
#' @name amExample2
#' @docType data
#' @references \url{https://github.com/cran/allelematch}
#' @keywords data
NULL

#' Example 3
#'
#' This is sample data copied from [allelematch::amExampleData] in version 5.2.1
#' of package [allelematch]. We use this data to test allelmatch backwards compatibility.
#'
#'
#' @name amExample3
#' @docType data
#' @references \url{https://github.com/cran/allelematch}
#' @keywords data
NULL

#' Example 4
#'
#' This is sample data copied from [allelematch::amExampleData] in version 5.2.1
#' of package [allelematch]. We use this data to test allelmatch backwards compatibility.
#'
#'
#' @name amExample4
#' @docType data
#' @references \url{https://github.com/cran/allelematch}
#' @keywords data
NULL

#' Example 5
#'
#' This is sample data copied from [allelematch::amExampleData] in version 5.2.1
#' of package [allelematch]. We use this data to test allelmatch backwards compatibility.
#'
#'
#' @name amExample5
#' @docType data
#' @references \url{https://github.com/cran/allelematch}
#' @keywords data
NULL


#' Expected data used in calls to [testthat::expect_identical]
#'
#' Naming convention: "exp" for "Expected". First number identifies the [testthat::test_that]
#' code block. The second number identifies the use within the same code block. \cr\cr
#'
#' This expected data was generated from runing the tests towards version 2.5.3 of [allelematch].
#' Look for commented out lines ending with "# This is how the expected data was stored" to see how.
#'
#' @name amExample1_0100_expected
#' @aliases amExample1_0100_expected amExample1_0101_expected amExample1_0102_example1_1_expected amExample1_0103_example1_2_expected amExample1_0104_expected amExample1_0105_expected
#' @aliases amExample2_0100_expected amExample2_0101_expected amExample2_0102_example2_1_expected amExample2_0103_expected amExample2_0104_example2_2_expected amExample2_0105_expected amExample2_0106_expected

#' @docType data
#' @references \url{https://github.com/cran/allelematch}
#' @keywords data
NULL


#' @name ggSample
#' @aliases           ggSample_aMm15_expected ggSample_mThr0.9_expected
#'
#' @title Data sets originating from GG work
#'
#' @description
#' Large data set gathered from field work in 2022. Here used to test [allelematch] for backwards compatibility.
#' \tabular{clcl}{
#'  `  ` \tab `ggSample  `\tab `  ` \tab Big input sample. Combines a reference db of known individuals with new samples to be analyzed\cr
#'  `  ` \tab `ggSample_mThr0.9_expected`\tab \tab Output summary after running through  `amUnique( matchThreshold=0.9)`\cr
#'  `  ` \tab `ggSample_aMm15_expected`\tab \tab Output summary after running through `amUnique( alleleMisMatch=15)`\cr
#' }
#'
#' This data is saved on semicolon (";") delimited .csv format, as described under 'Details' in [utils::data].\cr
#' \cr
#' The output data was generated using allelematch version 2.5.1.\cr
#' \cr
#' The output files have names that describe the called `allelematch` functions
#' and the parameters that are passed to the same functions.
#'
#' @references \url{https://github.com/cran/allelematch}
#'
#' @details
#' TODO : Move this to package introduction!
#'
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
#' @docType data
#' @keywords data
#' @keywords internal
NULL





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

#' Write data to .R file in ./data directory using [base::dump]`
#'
#' @param df        Data frame to write
#' @param outName   Name of file to write to, excluding leading "data/" and trailing ".R"
#' @param dir       The directory in which to write the data file.
#'                  Expected to point at the here::here("data") directory,
#'                  i.e. ./data under the package source root directory.
#' @param overwrite Set to ´TRUE´ for the overwrite to take place
#'
#  ' @export
#'
#  ' @examples
artOverwriteExpected <- function(df, outName, dir, overwrite = FALSE) {
    if(isFALSE(overwrite)) return() else cat("\n    Overwriting : ", dir, "/", outName, "\n", sep="")
    artDumpToData(df, outName, dir)
}

artDumpToData <- function(df, outName, dir = "data") {
    e <- new.env()
    assign(outName, df, envir = e)
    outFile = paste(dir, "/", outName, ".R", sep="")
    file = artUnixLineBreaks(outFile)
    # base::dump(list = c(outName), file, control = "all", envir = e)
    base::dump(list = c(outName), file, envir = e)
    close(file)
}


#' Load data from remote package and dump it to .R file in local data directory
#'
#' @param package    The name of the package to load from as character. Ignored if `dir` is set
#' @param remoteName The name of the data to read from the remote package
#' @param localName  The name of the data to write to the local data dir as .R file. Default is `remoteName`
#' @param dir        A directory that contains `remoteName`, with extension ".RData". If set, `package` is ignored
#'
#  ' @return
#  ' @export
#'
#  ' @examples
artImportToLocalData <- function(package, remoteName, localName=remoteName, dir=NULL) {

    if (is.null(dir)) {
        # Copy data from remote package to local:
        remoteData = getdata(remoteName, package=package)
    } else {
        # Copy data from remote directory (and ignore package):
        load(file=strcat(dir, "/", remoteName, ".RData"), e <- new.env(), verbose=TRUE)
        remoteData = e[[remoteName]]
    }
    artDumpToData(remoteData, localName)

    # Verify that the local copy is identical to the remote original:
    localData  = getdata(localName)
    stopifnot(identical(remoteData, localData))
}

#' Import all [allelematch::amExampleData] data to this data directory.
#'
#' @description
#' Import from package [allelematch] (or from specified `dir`)
#' all [allelematch::amExampleData] .RData files to this data directory.
#'
#' @param dir A directory that contains the files (with extension ".RData") to import.
#' If set, installed package `allelematch` is ignored
#'
#  ' @return
#  ' @export
#'
#  ' @examples
artImportAmExamplesToLocalData <- function(dir=NULL) {
    if (is.null(dir)) {
        cat("\nImporting data/amExample* from installed allelematch version", toString(packageVersion("allelematch")), "\n")
    } else {
        cat("\nImporting five amExample* files from", dir,  "to local /data/ dir\n")
    }
    artImportToLocalData( "allelematch", "amExample1", dir=dir)
    artImportToLocalData( "allelematch", "amExample2", dir=dir)
    artImportToLocalData( "allelematch", "amExample3", dir=dir)
    artImportToLocalData( "allelematch", "amExample4", dir=dir)
    artImportToLocalData( "allelematch", "amExample5", dir=dir)
}


#' Stops execution if remote and local data are not identical
#'
#' @param package    The name of the remote package to load from as character
#' @param remoteName The name of the data to read from the remote package
#' @param localName  The name of the data to write to the local data dir as .R file
#'
#  ' @return
#  ' @export
#'
#  ' @examples
artAssertLocalDataIdentical <- function(package, remoteName, localName=remoteName) {
    remoteData = getdata(remoteName, package=package)
    localData  = getdata(localName)
    stopifnot(identical(remoteData, localData))
}

#' Compares the local amExample files with the originals.
#'
#' Stops execution if any of the local amExample files is not identical with the corresponding
#' file in the [allelematch] package
#'
# ' @return
#' @export
#'
#  ' @examples artVerifyAmExamples()
artVerifyAmExamples <- function() {
    cat("\nVerifying local data/amExample* against installed allelematch version", toString(packageVersion("allelematch")), "\n")
    artAssertLocalDataIdentical( "allelematch", "amExample1")
    artAssertLocalDataIdentical( "allelematch", "amExample2")
    artAssertLocalDataIdentical( "allelematch", "amExample3")
    artAssertLocalDataIdentical( "allelematch", "amExample4")
    artAssertLocalDataIdentical( "allelematch", "amExample5")
    cat("OK: Local data is identical with that in installed allelematch version", toString(packageVersion("allelematch")), "\n")
}

