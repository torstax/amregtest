
###############################################################################
### Sort allelematch output data by index columns
###############################################################################

artSortDfByIndexes <- function(df) {
    # df <- df[ order(df$uniqueIndex, df$matchIndex), ]

    # sort the table by key columns (ignore case)
    df <- df[with(df, order(uniqueIndex, matchIndex)), ]

    return(df)
}

artSortCsvFile <- function(csvInFile) {
    df <- artRead_amCSV(csvInFile)
    df <- artSortDfByIndexes(df)
    csvOutFile <- gsub(".csv", ".sorted.csv", csvInFile)
    artWrite_amCSV(df, csvOutFile)
}


###############################################################################
### Shrink allelematch output data to brief format by removing data columns
###############################################################################

artMakeBriefDf <- function(df) {

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

artMakeBriefCsvFile <- function(csvInFile) {
    df <- artRead_amCSV(csvInFile)
    df <- artMakeBriefDf(df)
    csvOutFile <- gsub(".csv", ".brief.csv", csvInFile)
    artWrite_amCSV(df, csvOutFile)
}

