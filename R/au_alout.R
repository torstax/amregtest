
###############################################################################
### Sort allelematch output data by index columns
###############################################################################

auSortDfByIndexes <- function(df) {
    # df <- df[ order(df$uniqueIndex, df$matchIndex), ]

    # sort the table by key columns (ignore case)
    df <- df[with(df, order(uniqueIndex, matchIndex)), ]
    readr::problems(df)

    return(df)
}

auSortCsvFile <- function(csvInFile) {
    df <- auReadCsvFile(csvInFile)
    df <- auSortDfByIndexes(df)
    csvOutFile <- gsub(".csv", ".sorted.csv", csvInFile)
    auWriteCsvFile(df, csvOutFile)
}


###############################################################################
### Shrink allelematch output data to brief format by removing data columns
###############################################################################

auMakeBriefDf <- function(df) {

    columnNamesToWrite <- c("rowType", "uniqueIndex", "matchIndex", "score")
    sortByColumns      <- c("uniqueIndex", "matchIndex") #, "nUniqueGroup")

    # Drop all columns except the ones we want to write:
    df <- df[, columnNamesToWrite]

    # Drop the rows where a sample is compared to itself:
    df <- df[df$uniqueIndex != df$matchIndex, ]

    # Drop the rows where similarity is 0:
    df <- df["0" != df$score, ]

    # sort the table by key columns
    df <- df[with(df, order(uniqueIndex, matchIndex)), ]

    return (df)
}

auMakeBriefCsvFile <- function(csvInFile) {
    df <- auReadCsvFile(csvInFile)
    df <- auMakeBriefDf(df)
    csvOutFile <- gsub(".csv", ".brief.csv", csvInFile)
    auWriteCsvFile(df, csvOutFile)
}

