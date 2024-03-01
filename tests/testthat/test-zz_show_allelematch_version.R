
test_that("Show installed version of package 'allelematch' at end of tests", code = {

    actualVersion = toString(utils::packageVersion("allelematch")) # artAssertAllelematchVersion(wantedVersion)
    cat("\n\n    TESTED VERSION OF PACKAGE 'allelematch' is -->", actualVersion, "<--\n\n", sep="")
    # if(!identical(actualVersion, wantedVersion)){warning("Unexpected version=", actualVersion, " of allelematch. Expected ", wantedVersion)}
    testthat::expect_no_match( actualVersion, "^$" , "No version of package 'allelematch' found!")
})
