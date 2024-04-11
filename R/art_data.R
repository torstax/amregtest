#' @name artData
#'
#' @title Example data used by [amregtest]
#'
#' @description
#' This example data is used when testing allelematch backwards compatibility
#' using [artRun]. The tests load this data and passes it to [amDataset].\cr
#' \cr
#' It includes data that was imported from version 5.2.1 of [allelematch].
#' It was still unchanged in 5.2.4. \cr
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
#' @format Data frames with varying numbers of samples in rows, and alleles in columns. Missing data is represented as "-99".
#'
#' @docType data
#' @references \url{https://github.com/cran/allelematch}
#' @references \href{https://github.com/cran/allelematch/blob/2.5.1/inst/doc/allelematchSuppDoc.pdf}{allelematchSuppDoc.pdf}
#' @keywords data
NULL

#' Example 1 High quality data set
#'
#' This is sample data copied from [allelematch::amExampleData] in version 5.2.1
#' of package [allelematch]. We use this data to test allelematch backwards compatibility.
#'
#' The data in this example is simulated to represent a high quality data set that might
#' result from a laboratory protocol where samples were run multiple times to confirm their
#' identity. It has no genotyping error, a near-zero missing data load, and approximately
#' 60% of the individuals have been artificially resampled more than once.
#'
#' @format Data frame with samples in rows, and alleles in columns. Missing data is represented as "-99".
#'
#' @name amExample1
#' @docType data
#' @references \url{https://github.com/cran/allelematch}
#' @keywords data
NULL

#' Example 2 Good quality data set
#'
#' This is sample data copied from [allelematch::amExampleData] in version 5.2.1
#' of package [allelematch]. We use this data to test allelematch backwards compatibility.
#'
#' The data in this example have also been simulated, this time to reflect the qualities
#' of good quality data set, where genotyping error and missing data exist, but these can
#' be confidently handled by allelematch without manual intervention. At each locus a
#' random 4% of heterozygotes lost their second allele to simulate an allele dropout, and
#' a random 4% of samples at each locus had alleles set to missing.
#'
#' @format Data frame with samples in rows, and alleles in columns. Missing data is represented as "-99".
#'
#' @name amExample2
#' @docType data
#' @references \url{https://github.com/cran/allelematch}
#' @keywords data
NULL

#' Example 3 Marginal quality data set
#'
#' This is sample data copied from [allelematch::amExampleData] in version 5.2.1
#' of package [allelematch]. We use this data to test allelematch backwards compatibility.
#'
#' The data in this example have been simulated to represent a data set of marginal
#' quality where the use of allelematch combined with careful manual review of the
#' results is required to achieve a confident assessment of the unique genotypes. At each
#' locus a random 4% of heterozygotes lost their second allele to simulate an allele dropout,
#' and a random 10% of samples at each locus had alleles set to missing.
#'
#' @format Data frame with samples in rows, and alleles in columns. Missing data is represented as "-99".
#'
#' @name amExample3
#' @docType data
#' @references \url{https://github.com/cran/allelematch}
#' @keywords data
NULL

#' Example 4 Low quality data set
#'
#' This is sample data copied from [allelematch::amExampleData] in version 5.2.1
#' of package [allelematch]. We use this data to test allelematch backwards compatibility.
#'
#' For this example we have simulated a low quality data set where uncertainty created
#' by genotyping error and missing data, combined with a lack of information in the form
#' of allelic diversity across loci will result in a low confidence assessment of the unique
#' genotypes. At each locus a random 6% of heterozygotes lost their second allele to
#' simulate an allele dropout, and a random 20% of samples at each locus had alleles set
#' to missing.
#'
#' @format Data frame with samples in rows, and alleles in columns. Missing data is represented as "-99".
#'
#' @name amExample4
#' @docType data
#' @references \url{https://github.com/cran/allelematch}
#' @keywords data
NULL

#' Example 5 Wildlife data set
#'
#' This is sample data copied from [allelematch::amExampleData] in version 5.2.1
#' of package [allelematch]. We use this data to test allelematch backwards compatibility.
#'
#' In this final example we use real data from the non-invasive sampling of a wildlife
#' population. The data have been anonymized by changing sampling details. A single
#' column giving the gender is also available and we show how this can be used as an extra
#' locus. Missing data is also more common at some loci than at others, with a total load
#' of about 10%.
#'
#' @format Data frame with samples in rows, and alleles in columns. Missing data is represented as "-99".
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
#' @format This data is saved on semicolon (";") delimited .csv format, as described under 'Details' in [utils::data].\cr
#' Data samples in rows, and alleles in columns. Missing data is represented as "-99".
#'
#' @references \url{https://github.com/cran/allelematch}
#'
#' @docType data
#' @keywords data
#' @keywords internal
NULL


