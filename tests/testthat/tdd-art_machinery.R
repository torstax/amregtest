# 'tdd-*.R' files are not picked up automatically by 'testthat',
# but can be executed manually.
#
# This file tests the art machinery.


test_that("We can read environment set from artRun()", code = {

    art_env = list(
        ART_CALLERS_WD = getwd(),
        ART_GENERATE_HTML = as.character(FALSE)
    )
    assign("art_env", art_env, globalenv())

    artEnv <- new.env(parent=globalenv())
    attr(artEnv, "name") = "artEnv"

    artEnv2 <- new.env(parent=globalenv())
    attr(artEnv2, "name") = "artEnv"

    testthat::expect_identical(environmentName(artEnv2), environmentName(artEnv))

    assign("ART_CALLERS_WD", getwd(), artEnv)

    # dir = Sys.getenv("ART_CALLERS_WD")

    # testthat::expect_identical(get("ART_CALLERS_WD", artEnv), "hemma hos nisse")
    testthat::expect_identical(get("art_env", globalenv())$ART_CALLERS_WD, "hemma hos nisse")
})


#-
#- @details
#- TODO : Move this to package introduction!
#-
#- NOTE that the output of [sort] is platform dependent.
#- You get different results based on the locale. And [allelematch] uses [sort].\cr\cr
#-
#- The sort order also depends on the size of the data to be sorted.
#- See the description of "radix" under [sort].\cr\cr
#-
#- [testthat] (and R CMD check) makes sure that the tests behave the same way
#- on every platform, by setting the collation locale to "C" and the language to "en".\cr
#- See github issue
#- \href{https://github.com/r-lib/testthat/issues/1181#issuecomment-692851342}{locale / collation used in testthat #1181}\cr\cr
