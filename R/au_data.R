#' @name amExampleData
#' @aliases amExample3 amExample4 amExample5
#'
#' @title Example data from package allelematch
#'
#' @description
#' This example data is used when testing allelmatch backwards compatibility.\cr
#' It was imported from version 5.2.1 of [allelematch].
#' It is still unchanged in 5.2.3. \cr \cr
#' See [allelematch::amExampleData] for a brief introduction. \cr
#' See \href{https://github.com/cran/allelematch/blob/2.5.1/inst/doc/allelematchSuppDoc.pdf}{allelematchSuppDoc.pdf}.
#' for a more detailed description.
#'
#'
#' @examples
#' # Make sure that the local copy of all data/amExample* files match
#' # match those in the currently installed version of allelematch:
#' regressiontest::auVerifyAmExamples() # Stops if not identical
#'
#' # If needed, the local copy can be updated (not recommended)
#' # regressiontest::auImportAmExamplesToLocalData()
#'
#' @docType data
#' @references \url{https://github.com/cran/allelematch}
#' @references \href{https://github.com/cran/allelematch/blob/2.5.1/inst/doc/allelematchSuppDoc.pdf}{allelematchSuppDoc.pdf}
#' @keywords data
NULL

#' @name ggExampleData
#' @aliases input_Match_references_clean
#' @aliases input_new_samples_clean input_new_samples_clean_split
#' @aliases output_aMm15_expected output_mThr0.9_expected
#'
#' @title Data sets originating from GG work
#'
#' @description
#' Large data sets gathered from field work in 2022.
#' \tabular{clcl}{
#'  `  ` \tab `input_Match_references_clean  `\tab `  ` \tab A reference db containing known individuals\cr
#'  `  ` \tab `input_new_samples_clean`\tab \tab A set of new samples from the field to be matched against the reference\cr
#'  `  ` \tab `input_new_samples_clean_split  `\tab \tab The new samples cleaned up and alligned with the reference\cr
#'  `  ` \tab `output_aMm15_expected`\tab \tab Output after running through `amUnique( alleleMisMatch=15 (??))`...\cr
#'  `  ` \tab `output_mThr0.9_expected`\tab \tab Output after running through ...
#' }
#' New attempt:
#'
#' \tabular{cll}{
#'  `  ` \tab `input_Match_references_clean`\tab A reference db containing known individuals\cr
#'  `  ` \tab `input_new_samples_clean`\tab A set of new samples from the field to be matched against the reference\cr
#'  `  ` \tab `input_new_samples_clean_split \ \ \ \.
#'  `\tab The new samples cleaned up and alligned with the reference\cr
#'  `  ` \tab `output_aMm15_expected`\tab Output after running through `amUnique( alleleMisMatch=15 (??))`...\cr
#'  `  ` \tab `output_mThr0.9_expected`\tab Output after running through ...
#' }


#  '  \item{`input_Match_references_clean`}{   A reference db containing known individuals}
#  '  \item{`input_new_samples_clean`}{   A set of new samples from the field to be matched against the reference}
#  '  \item{`input_new_samples_clean_split  `}{   The new samples cleaned up and alligned with the reference}
#  '  \item{`output_aMm15_expected`}{   Output after running through `amUnique(alleleMisMatch=15 (??))`...}
#  '  \item{`output_mThr0.9_expected`}{   Output after running through ...}


#'
#' @docType data
#' @keywords data
NULL


#' @name auObsoleteOutputData
#'
#' @title To be removed.
#'
#' @aliases output_aMm15_actual.brief output_aMm15_actual output_aMm15_actual.sorted
#' @aliases output_mThr0.9_actual.brief output_mThr0.9_actual output_mThr0.9_actual.sorted
#' @docType data
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
#'
#' See the Description section under [utils::data] for how the supported file
#' types (including .R, .RData, .txt and .csv) shall be encoded.
#'
#' The parameters are the same as for the [data] function in package [utils].
#'
#' Thank you @henfiber! See https://stackoverflow.com/questions/30951204/load-dataset-from-r-package-using-data-assign-it-directly-to-a-variable/30951700#30951700
#'
#' @param ... All parameters are passed on to [utils::data] as is
#'
#' @returns the specified data set loaded by [utils::data]
#'
#' @examples foo = getdata(amExample1, package = "allelematch")
#'
#' @export
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
#' @param package    The name of the package to load from as character. Ignored if `dir` is set
#' @param remoteName The name of the data to read from the remote package
#' @param localName  The name of the data to write to the local data dir as .R file. Default is `remoteName`
#' @param dir        A directory that contains `remoteName`, with extension ".RData". If set, `package` is ignored
#'
#  ' @return
#' @export
#'
#  ' @examples
auImportToLocalData <- function(package, remoteName, localName=remoteName, dir=NULL) {

    if (is.null(dir)) {
        # Copy data from remote package to local:
        remoteData = getdata(list = c(remoteName), package=package)
    } else {
        # Copy data from remote directory (and ignore package):
        load(file=strcat(dir, "/", remoteName, ".RData"), e <- new.env(), verbose=TRUE)
        remoteData = e[[remoteName]]
    }
    auDumpToData(remoteData, localName)

    # Verify that the local copy is identical to the remote original:
    localData  = getdata(list = c(localName))
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
#' @export
#'
#  ' @examples
auImportAmExamplesToLocalData <- function(dir=NULL) {
    if (is.null(dir)) {
        cat("\nImporting data/amExample* from installed allelematch version", toString(packageVersion("allelematch")), "\n")
    } else {
        cat("\nImporting five amExample* files from", dir,  "to local /data/ dir\n")
    }
    auImportToLocalData( "allelematch", "amExample1", dir=dir)
    auImportToLocalData( "allelematch", "amExample2", dir=dir)
    auImportToLocalData( "allelematch", "amExample3", dir=dir)
    auImportToLocalData( "allelematch", "amExample4", dir=dir)
    auImportToLocalData( "allelematch", "amExample5", dir=dir)
}


#' Stops execution if remote and local data are not identical
#'
#' @param package    The name of the remote package to load from as character
#' @param remoteName The name of the data to read from the remote package
#' @param localName  The name of the data to write to the local data dir as .R file
#'
#  ' @return
#' @export
#'
#  ' @examples
auAssertLocalDataIdentical <- function(package, remoteName, localName=remoteName) {
    remoteData = getdata(list = c(remoteName), package=package)
    localData  = getdata(list = c(localName))
    stopifnot(identical(remoteData, localData))
}

#' Compares the local amExample files with the originals.
#'
#' Stops execution if any of the local amExample files is not identical with the corresponding
#' file in the `allelematch` package
#'
# ' @return
#' @export
#'
#  ' @examples auVerifyAmExamples()
auVerifyAmExamples <- function() {
    cat("\nVerifying local data/amExample* against installed allelematch version", toString(packageVersion("allelematch")), "\n")
    auAssertLocalDataIdentical( "allelematch", "amExample1")
    auAssertLocalDataIdentical( "allelematch", "amExample2")
    auAssertLocalDataIdentical( "allelematch", "amExample3")
    auAssertLocalDataIdentical( "allelematch", "amExample4")
    auAssertLocalDataIdentical( "allelematch", "amExample5")
    cat("OK: Local data is identical with that in installed allelematch version", toString(packageVersion("allelematch")), "\n")
}

