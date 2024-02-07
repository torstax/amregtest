# Check that we are standing in a relevant directory
setupScript="test_legacy-2.5.1/r_script_setup_for_regressiontest.R"
here::i_am(setupScript)
source(here::here(setupScript))

wantedVersion    = "2.5.3"
regressiontest::auAssertAllelematchVersion(wantedVersion)
stopifnot(wantedVersion == toString(packageVersion("allelematch")))

library(regressiontest)

auReadCsv2File <- function(csvInFile) {
    df <- read.csv2(file=csvInFile)
    readr::problems(df)
    return (df)
}

auWriteCsv2File <- function(df, csvOutFile) {
    write.csv2(df, file=csvOutFile)
    readr::problems(df)
    return (df)
}

auWriteRFile <- function(names, outFile) {
    file = regressiontest:::auTextOutFile(outFile)
    base::dump(names, file, control = "all")
    close(file)
    # readr::problems(df)
}

# auCopyAmExamplesToLocalData()
auVerifyAmExamples()


# data("amExample1", package= "allelematch")
# amExample1_inp = amExample1
# envName = c("amExample1_inp")
# auWriteRFile(envName, "data/amExample1_inp.R")
# rm(list=envName)
# data("amExample1_inp")
# stopifnot(identical(amExample1, amExample1_inp))
