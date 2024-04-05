#' @name artData
#'
#' @title Example data used by [amregtest]
#'
#' @description
#' This example data is used when testing allelmatch backwards compatibility
#' with [artRun]. The tests load this data and passes it to [amDataset].\cr
#' \cr
#' It includes data that was imported from version 5.2.1 of [allelematch].
#' It is still unchanged in 5.2.3. \cr
#' \tabular{clcl}{
#'  `  ` \tab [amExample1]`  `\tab `  ` \tab Example 1 High quality data set\cr
#'  `  ` \tab [amExample2]\tab \tab Example 2 Good quality data set\cr
#'  `  ` \tab [amExample3]\tab \tab Example 3 Marginal quality data set\cr
#'  `  ` \tab [amExample4]\tab \tab Example 4 Low quality data set\cr
#'  `  ` \tab [amExample5]\tab \tab Example 5 Wildlife data set\cr
#' }
#' See \href{https://github.com/cran/allelematch/blob/2.5.1/inst/doc/allelematchSuppDoc.pdf}{allelematchSuppDoc.pdf}
#' for a more detailed description. \cr
#'
#' It also includes a large data set gathered from field work:\cr
#' \tabular{clcl}{
#'  `  ` \tab [ggSample]`  `\tab `  ` \tab Very large wildlife data set\cr
#' }
#'
#' @format Data frames with differing numbers of samples in rows, and alleles in columns. Missing data is represented as "-99".
#'
#' @docType data
#' @references \url{https://github.com/cran/allelematch}
#' @references \href{https://github.com/cran/allelematch/blob/2.5.1/inst/doc/allelematchSuppDoc.pdf}{allelematchSuppDoc.pdf}
#' @keywords data
NULL

#' Example 1 High quality data set
#'
#' The data in this example is simulated to represent a high quality data set that might
#' result from a laboratory protocol where samples were run multiple times to confirm their
#' identity. It has no genotyping error, a near-zero missing data load, and approximately
#' 60% of the individuals have been artificially resampled more than once.
#'
#' @format Data frame with differing numbers of samples in rows, and alleles in columns. Missing data is represented as "-99".
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
#' @format Data frame with differing numbers of samples in rows, and alleles in columns. Missing data is represented as "-99".
#'
#' @name amExample2
#' @docType data
#' @references \url{https://github.com/cran/allelematch}
#' @keywords data
NULL

#' Example 3 Marginal quality data set
#'
#' This is sample data copied from [allelematch::amExampleData] in version 5.2.1
#' of package [allelematch]. We use this data to test allelmatch backwards compatibility.
#'
#' The data in this example have been simulated to represent a data set of marginal
#' quality where the use of allelematch combined with careful manual review of the
#' results is required to achieve a confident assessment of the unique genotypes. At each
#' locus a random 4% of heterozygotes lost their second allele to simulate an allele dropout,
#' and a random 10% of samples at each locus had alleles set to missing.
#'
#' @format Data frame with differing numbers of samples in rows, and alleles in columns. Missing data is represented as "-99".
#'
#' @name amExample3
#' @docType data
#' @references \url{https://github.com/cran/allelematch}
#' @keywords data
NULL

#' Example 4 Low quality data set
#'
#' This is sample data copied from [allelematch::amExampleData] in version 5.2.1
#' of package [allelematch]. We use this data to test allelmatch backwards compatibility.
#'
#' For this example we have simulated a low quality data set where uncertainty created
#' by genotyping error and missing data, combined with a lack of information in the form
#' of allelic diversity across loci will result in a low confidence assessment of the unique
#' genotypes. At each locus a random 6% of heterozygotes lost their second allele to
#' simulate an allele dropout, and a random 20% of samples at each locus had alleles set
#' to missing.
#'
#' @format Data frame with differing numbers of samples in rows, and alleles in columns. Missing data is represented as "-99".
#'
#' @name amExample4
#' @docType data
#' @references \url{https://github.com/cran/allelematch}
#' @keywords data
NULL

#' Example 5 Wildlife data set
#'
#' This is sample data copied from [allelematch::amExampleData] in version 5.2.1
#' of package [allelematch]. We use this data to test allelmatch backwards compatibility.
#'
#' In this final example we use real data from the non-invasive sampling of a wildlife
#' population. The data have been anonymized by changing sampling details. A single
#' column giving the gender is also available and we show how this can be used as an extra
#' locus. Missing data is also more common at some loci than at others, with a total load
#' of about 10%.
#'
#' @format Data frame with differing numbers of samples in rows, and alleles in columns. Missing data is represented as "-99".
#'
#' @name amExample5
#' @docType data
#' @references \url{https://github.com/cran/allelematch}
#' @keywords data
NULL


#' @name ggSample
#'
#' @title Data sets originating from GG work
#'
#' @description
#' Large data set gathered from field work in 2022. Here used to test [allelematch] for backwards compatibility.
#' Combines a reference db of known individuals with new samples to be analyzed.\cr\cr
#'
#' This data is saved on semicolon (";") delimited .csv format, as described under 'Details' in [utils::data].\cr
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
#' @noRd
getdata <- function(name, ...)
{
    stopifnot(is.character(name))
    e <- new.env()
    name <- utils::data(list = c(name), ..., envir = e)[1]
    e[[name]]
}

#' Internal utility for above
#'
#' @noRd
artDumpToData <- function(df, outName, dir = "data") {
    e <- new.env()
    assign(outName, df, envir = e)
    outFile = paste(dir, "/", outName, ".R", sep="")
    file = artUnixLineBreaks(outFile)
    # base::dump(list = c(outName), file, control = "all", envir = e)
    base::dump(list = c(outName), file, envir = e)
    close(file)
}


#' strcat - Trivial utility for concatenating strings without adding separators.
#'
#' @noRd
strcat <- function(...) { paste(..., sep="") }


#' Trivial utility to create file [connection] for Writing GIT and unix style text files
#' with NL Line Breaks.
#'
#' @noRd
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



#' Load data from remote package and dump it to .R file in local data directory
#'
#' @param package    The name of the package to load from as character. Ignored if `dir` is set
#' @param remoteName The name of the data to read from the remote package
#' @param localName  The name of the data to write to the local data dir as .R file. Default is `remoteName`
#' @param dir        A directory that contains `remoteName`, with extension ".RData". If set, `package` is ignored
#'
#  ' @return
#'
#' @noRd
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
#'
#  ' @examples
#'
#' @noRd
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
#'
#  ' @examples
#'
#' @noRd
artAssertDataIdentical <- function(dataName) {
    data1 = getdata(dataName, package="allelematch")
    data2  = getdata(dataName, package="amregtest")
    if(!identical(data1, data2)) {
        stop("\n    data(", dataName, ") differs between packages 'allelematch' and 'amregtest'\n")
    }
}

#' Compares the files amExample1 to amExample5 files in package `allelematch`
#' with the copies from 2.5.3 in `amregtest`.
#'
#' Stops execution if any of the local amExample files is not identical with the corresponding
#' file in the [allelematch] package. This is important since the tests in `amregtest`
#' are based on the contents of these files.
#'
#' ' @return
#'
#' @noRd
artVerifyAmExamples <- function() {
    cat("\nVerifying that 'data(amExample*)' is identical in installed packages 'allelematch' and 'amregtest'\n")
    artVersionInner()
    artAssertDataIdentical("amExample1")
    artAssertDataIdentical("amExample2")
    artAssertDataIdentical("amExample3")
    artAssertDataIdentical("amExample4")
    artAssertDataIdentical("amExample5")
    cat("\n\nOK: 'data/amExample*' is identical\n")
}

