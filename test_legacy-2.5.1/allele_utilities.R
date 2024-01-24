cat("Sourcing allelematch_utilities.R\n")

######################
### Needed libs    ###
######################
library(readr)
library(plyr)
library(allelematch)


###############################################################################
### Misc
###############################################################################
# Check that we are standing in a relevant directory
if (file.exists("./R/allelematch.r") == FALSE) {
  stop("ERROR! getwd() = ", getwd(), " does not contain './R/alelematch.r'!\n",
       "    You are recommended to use paths that starts at the Working Directory that you set\n",
       "    either using the RStudio menu 'Session' -> 'Set Working Directory'\n",
       "    or using the R command 'setwd()' \n"
  )
}

## strcat - Trivial utility for concatenating strings without adding separators.
strcat <- function(...) { paste(..., sep="") }


###############################################################################
### Manipulating allelematch input as data frames
###############################################################################

auCheckCleanSamplesDf <- function(cleanSamples) {
  twoFirstColNamesExpected = "DNA_ID, Sex"
  twoFirstColNamesActual   = paste(names(cleanSamples)[1], names(cleanSamples)[2], sep=", ")
  if (twoFirstColNamesExpected != twoFirstColNamesActual) {
    stop("Espected cleanSamples to start with columns '", twoFirstColNamesExpected, "', but found '", twoFirstColNamesActual, "'")
  }

  CHECK_THAT_ROBOT_ROWS_CONTAIN_VALID_DATA = TRUE  
  if (CHECK_THAT_ROBOT_ROWS_CONTAIN_VALID_DATA) {

    # Check the rows:
    expectedValues = c("XX", "XY", "YY", "ZZ")
    expectedValuesStr = paste(expectedValues)
    for (r in 1:nrow(cleanSamples)) { 
      dnaId = cleanSamples[r,1]
      for (c in 2:ncol(cleanSamples)) {
        colName  = colnames(cleanSamples)[c]
        allelValue = cleanSamples[r,c]
        if ( ! allelValue %in% expectedValues) { 
          stop("Unexpected value='", allelValue, "' in row ", r, "=", dnaId, " col ", c, "=", colName, ". Expected one of [", expectedValuesStr, "]!\n",
               "   colnames  = [", paste(shQuote(names(cleanSamples)), collapse=","), "]\n",
               "   row       = [", paste(shQuote(cleanSamples[r,]), collapse=","), "]\n"
          )
        }
      }
    }
  }
  
}

## auCleanNewSamplesInputDf 
##  Cleans up a data frame with new samples from the robot 
##  in order to match the data frame from the input reference
auCleanNewSamplesInputDf <- function(newSamples) {

  # Adapt the columns from the sequencer robot (just keep DNA_ID and SexA from the first 8 columns):
  newSamples <- subset(newSamples, select=-c(Plate, Place, amp, ZZ, YY, Sex))
  if("Plate" %in% names(newSamples)) { stop("Failed dropping column \"Plate\" from newSamples") }

  # Rename column SexA to Sex:
  newSamples <- dplyr::rename(newSamples,"Sex"="SexA") # Rename column to "Sex" from "SexA"

  # Drop extra, spices-specific loci columns: (TODO : How generalize this cleaning?)
  colNames = names(newSamples)
  if ("Y2_Gg_644" %in% colNames) {
    cat("Drop the ... (too noisy y-coromosome loci from the robot?), 'Y2_Gg_644, Y2_Gg_720, Y3_Gg_97'\n")
    newSamples <- subset(newSamples, select=-c(Y2_Gg_644, Y2_Gg_720, Y3_Gg_97))
    if("Y3_Gg_97" %in% names(newSamples)) { stop("Failed dropping column \"Y3_Gg_97\" from newSamples") }
  }
  if ("drop1" %in% colNames) {
    # Drop loci from the syntectic samples that were alwayes intended to be dropped:
    newSamples <- subset(newSamples, select=-c(drop1, drop2, drop3))
    if("drop3" %in% names(newSamples)) { stop("Failed dropping column \"drop3\" from newSamples") }
  }
  
  # Display the result to the console:  
  cat("Cleaned up new samples:\n")
  spec(newSamples)
  
  auCheckCleanSamplesDf(newSamples)

  return (newSamples)
}

## auSpitCleanSamplesDf
##  Splits the sample columns from the robot in two to be comparable with the 
##  reference.
auSpitCleanSamplesDf <- function(cleanSamples) {
  
  # Split all columns in two, except DNA_ID (assumed to be column 1):
  # We do this to make the new samples be comparable with the references.
  twoFirstColNamesExpected = "DNA_ID, Sex"
  twoFirstColNamesActual   = paste(names(cleanSamples)[1], names(cleanSamples)[2], sep=", ")
  if (twoFirstColNamesExpected != twoFirstColNamesActual) {
    stop("Espected cleanSamples to start with columns '", twoFirstColNamesExpected, "', but found '", twoFirstColNamesActual, "'")
  }
  splitSamples <- as.data.frame(unlist(lapply(cleanSamples[,c(2:ncol(cleanSamples))],    data.table::tstrsplit, ""),recursive = FALSE))
  splitSamples[splitSamples=="Z"] <- -99 # We use -99 rather than Z as NA for historical reasons.
  splitSamples <- cbind(cleanSamples[,1], splitSamples) # Insert the DNA_ID column at the front of the data frame, unsplitted
  readr::problems(splitSamples) # Check against problems
  
  auCheckSplitData(dataSetDir, splitSamples)
  
  FEED_BAD_COLUMNS_TO_ALLELEMATCH_FOR_BACKWARDS_COMPATIBILITY = FALSE
  if (FEED_BAD_COLUMNS_TO_ALLELEMATCH_FOR_BACKWARDS_COMPATIBILITY) {
    # Here we re-produce the behavior of the original SLU script:
    #remove row (why? /TSR)
    splitSamples<-splitSamples[-c(57), ]  # Drops sample row Gg22_1646 (or possibly Gg22_1645) (why? /TSR)
    splitSamples<-splitSamples[,-c(5:10)] # Drops one of the "X16S1_Gg291" alleles, not the other.
  }
  
  return (splitSamples)
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
  write.table(df, tsvOutFile, sep="\t", row.names=FALSE, quote=FALSE) #, na="\"\"")
}

###############################################################################
### Reading the input files and calling above data frame functions 
### to manipulate the read data.
###############################################################################

## auCleanNewSamplesInputFiles - Reads raw focal file, cleans it up to match the reference and combines them to single data.frame
auCleanNewSamplesInputFiles <- function(dataSetDir, inputNewSamplesFile="input_new_samples.txt") {
  
  dataDirectory = strcat(WORKING_DIRECTORY, dataSetDir)
  
  cat("\nAbout to clean raw Input:\n")
  cat("   dataDirectory             = ", dataDirectory, "\n")
  cat("   inputNewSamplesFile       = ", inputNewSamplesFile, "\n")
  
  # Read file with new samples from the sequencer robot:
  # Note that strings that start with an integer are not valid column names
  # They are prefixed with X by read_delim; "16S1_Gg291" becomes "X16S1_Gg291".
  #  newSamples <- read_delim(strcat(dataDirectory, inputNewSamplesFile),"\t", escape_double = FALSE, trim_ws = TRUE, name_repair = make.names)
  newSamples <- auReadTsvFile(strcat(dataDirectory, inputNewSamplesFile))
  newSamples <- auCleanNewSamplesInputDf(newSamples)

  # Write the fixed cleanSamplesFile for easier debugging:  
  cleanSamplesFile <- gsub(".txt", "_clean.txt", inputNewSamplesFile)
  auWriteTsvFile(newSamples, strcat(dataDirectory, cleanSamplesFile))
  
  # Split all columns in two, except DNA_ID (assumed to be column 1):
  splitSamples <- auSpitCleanSamplesDf(newSamples)  

  # Write the split columns to file for easier debugging:  
  cleanSamplesSplitFile <- gsub(".txt", "_clean_split.txt", inputNewSamplesFile)
  auWriteTsvFile(splitSamples, strcat(dataDirectory, cleanSamplesSplitFile))
  
  cat("Done cleaning newSamples input file:\n")
  cat("   Loaded samples to compare : ncol=", ncol(splitSamples), ", nrow=", nrow(splitSamples), "\n")
}

## auCleanOldReferencesInputFile - Reads raw focal file, cleans it up to match the reference and combines them to single data.frame
auCleanOldReferencesInputFile <- function(dataSetDir, inputMatchReferencesFile="input_Match_references.txt") {
  
  dataDirectory = strcat(WORKING_DIRECTORY, dataSetDir)
  
  # Read the file with the reference database of known individuals:
  cat("   inputMatchReferencesFile  = ", inputMatchReferencesFile,  "\n")
  # rm(oldReferences)
  #  oldReferences<-read_delim(strcat(dataDirectory, inputMatchReferencesFile),"\t", escape_double = FALSE, trim_ws = TRUE)
  #  spec(oldReferences)
  #  oldReferences <- readr::read_tsv(strcat(dataDirectory, inputMatchReferencesFile), name_repair = make.names)
  oldReferences <- readr::read_tsv(strcat(dataDirectory, inputMatchReferencesFile), name_repair = make.names, col_types = cols(.default = col_character()))
  readr::problems(oldReferences)
  
  # Drop not used columns:
  oldReferences <- subset(oldReferences, select=-c(X.SNPs, DeadYear, Ind2, Sex)) #, Y2_Gg_6441, Y2_Gg_6442, Y2_Gg_7201, Y2_Gg_7202, Y3_Gg_971, Y3_Gg_972, mtDNAfox1, mtDNAfox2))
  
  # Rename columns, to<-from:
  oldReferences<-dplyr::rename(oldReferences, "Sex1"="SexA1")
  oldReferences<-dplyr::rename(oldReferences, "Sex2"="SexA2")
  oldReferences<-dplyr::rename(oldReferences, "DNA_ID"="Individual")
  readr::problems(oldReferences)
  
  # Display the result to the console:  
  spec(oldReferences)
  
  auCheckSplitData(dataSetDir, oldReferences)
  
  # Write the fixed cleanSamplesFile:  
  cleanReferencesFile <- gsub(".txt", "_clean.txt", inputMatchReferencesFile)
  cat("   inputCleanReferencesFile  = ", cleanReferencesFile, "\n")
  cat("                             = ", strcat(dataDirectory, cleanReferencesFile), "\n") # TODO remove after debugging
  write.table(oldReferences, strcat(dataDirectory, cleanReferencesFile), sep="\t", row.names=FALSE, quote=FALSE) #, na="\"\"")
  readr::problems(oldReferences)
  
  ###################################################
  ### Combine df for single Allelmatch input file ###
  ###################################################
  
  #  common_cols <- intersect(colnames(oldReferences), colnames(splitSamples))
  #  readr::problems(common_cols)
  #  Input<-rbind(oldReferences[common_cols],splitSamples[common_cols])
  #  readr::problems(Input)
  
  cat("\nDone cleaning oldReferences file:\n")
  cat("   dataDirectory             = ", dataDirectory, "\n")
  # cat("   inputNewSamplesFile       = ", inputNewSamplesFile, "\n")
  cat("   inputMatchReferencesFile  = ", inputMatchReferencesFile,  "\n")
  cat("   Loaded samples to compare : ncol=", ncol(oldReferences), ", nrow=", nrow(oldReferences), "\n")
  # cat("   Loaded samples to compare = ", nrow(splitSamples), "+", nrow(oldReferences), "=", nrow(Input),"\n")
  
}

# auReadCleanSamplesFiles - Reads raw focal file, cleans it up to match the reference and combines them to single data.frame
auReadCleanSamplesFiles <- function(dataSetDir, inputNewSamplesFile="input_new_samples.txt") {
  dataDirectory = strcat(WORKING_DIRECTORY, dataSetDir)
  
  # Make sure we can read the cleaned new samples file again:
  cleanSamplesSplitFile <- gsub(".txt", "_clean_split.txt", inputNewSamplesFile)
  cleanSamples <- readr::read_tsv(strcat(dataDirectory, cleanSamplesSplitFile), name_repair = make.names, col_types = cols(.default = col_character()))
  readr::problems(cleanSamples)
  
  # Polute them again?
  if (ALLOW_COLUMN_NAMES_TO_START_WITH_DIGITS) {
    # Column headers that start with digits are not allowed as R 'names'
    if("X16S1_Gg291"  %in% names(cleanSamples)) { cleanSamples<-dplyr::rename(cleanSamples,"16S1_Gg291" ="X16S1_Gg291" ) }
    if("X16S1_Gg2911" %in% names(cleanSamples)) { cleanSamples<-dplyr::rename(cleanSamples,"16S1_Gg2911"="X16S1_Gg2911") }
    if("X16S1_Gg2912" %in% names(cleanSamples)) { cleanSamples<-dplyr::rename(cleanSamples,"16S1_Gg2912"="X16S1_Gg2912") }
  }
  
  return(cleanSamples);
}

# auReadCleanReferencesFile - Reads raw focal file, cleans it up to match the reference and combines them to single data.frame
auReadCleanReferencesFile <- function(dataSetDir, inputMatchReferencesFile="input_Match_references.txt") {
  dataDirectory = strcat(WORKING_DIRECTORY, dataSetDir)
  
  cleanReferencesFile <- gsub(".txt", "_clean.txt", inputMatchReferencesFile)
  cleanReferences <- readr::read_tsv(strcat(dataDirectory, cleanReferencesFile), name_repair = make.names, col_types = cols(.default = col_character()))
  readr::problems(cleanReferences)
  
  # Polute them again?
  if (ALLOW_COLUMN_NAMES_TO_START_WITH_DIGITS) {
    # Column headers that start with digits are not allowed as R 'names'
    if("X16S1_Gg291"  %in% names(cleanReferences)) { cleanReferences<-dplyr::rename(cleanReferences,"16S1_Gg291" ="X16S1_Gg291" ) }
    if("X16S1_Gg2911" %in% names(cleanReferences)) { cleanReferences<-dplyr::rename(cleanReferences,"16S1_Gg2911"="X16S1_Gg2911") }
    if("X16S1_Gg2912" %in% names(cleanReferences)) { cleanReferences<-dplyr::rename(cleanReferences,"16S1_Gg2912"="X16S1_Gg2912") }
  }
  
  
  return(cleanReferences)
}

auCheckSplitData <- function(dataSetDir, ds) {
  
  CHECK_THE_SPLIT_COLUMN_NAMES = FALSE
  if (CHECK_THE_SPLIT_COLUMN_NAMES) {
    # Check columns:
    if ( (ncol(ds)%%2) == 0) { stop("Cleaned ", dataSetDir, " has even number of columns, ", ncol(ds), "! Expected odd! ", c, "=", colName, " is ", colClass, ". Expected character!\n") }
    for (c in 1:ncol(ds)) {
      colClass = class(ds[[c]])
      colName  = colnames(ds)[c]
      if (colClass != "character") { stop("Class of ", dataSetDir, " colulmn ", c, "=", colName, " is ", colClass, ". Expected character!\n") }
      if (c == 1) {
        if (colName != "DNA_ID")   { stop("Name of ", dataSetDir, " colulmn ", c, " is ", colName, ". Expected 'DNA_ID'!\n") }
      } else if ((c%%2) == 0) {
        # The column number is even. Expect a column name that ends with "1":
        if (!endsWith(colName, '1')) { stop("Name of ", dataSetDir, " colulmn ", c, " is ", colName, ". Expected it to end with '1'! Prev col is ", prevColName) }
      } else {
        # The column number is even and larger than 1. Expect a column name that ends with "2":
        prevColName = colnames(ds)[c-1]
        if (!endsWith(colName, '2')) { stop("Name of ", dataSetDir, " colulmn ", c, " is ", colName, ". Expected it to end with '2'! Prev col is ", prevColName) }
        if (substring(prevColName, 1, nchar(prevColName)) != substring(prevColName, 1, nchar(prevColName))) { 
          stop("Name of ", dataSetDir, " colulmn ", c, " is ", colName, ". Expected same name as prev col, ", prevColName, " but ending with 2 rather than 1")
        }
      }
    }
  }
  
  CHECK_THAT_ROWS_CONTAIN_VALID_DATA = FALSE  
  if (CHECK_THAT_ROWS_CONTAIN_VALID_DATA) {
    # Check the rows:
    for (r in 1:nrow(ds)) { 
      dnaId = ds[r,1]
      for (c in 2:ncol(ds)) {
        colName  = colnames(ds)[c]
        allelValue = ds[r,c]
        if ( ! allelValue %in% c("X", "Y", "-99")) { 
          stop("Unexpected value='", allelValue, "' in ", dataSetDir, ", row ", r, "=", dnaId, " col ", c, "=", colName, ". Expected X, Y or -99!\n")#,
        }
      }
    }
  }
}

# auCheckInput - Ensures that the split version of the newSamples and the oldReferences data sets 
#              have the same header rows so that they can be compared
auCheckInput <- function(dataSetDir, cleanSamples, cleanReferences) {
  dataDirectory = strcat(WORKING_DIRECTORY, dataSetDir)
  
  # union        = union(names(cleanSamples), names(cleanReferences))
  # intersection = intersect(names(cleanSamples), names(cleanReferences))
  # diff         = setdiff(names(cleanSamples), names(cleanReferences))
  
  {
    newCols=ncol(cleanSamples);     newRows=nrow(cleanSamples)
    refCols=ncol(cleanReferences);  refRows=nrow(cleanReferences)
    
    cat("\nData set sizes:\n")
    cat("   dataDirectory             = ", dataDirectory, "\n")
    cat(" Headers:\n")
    cat("     newSamples:   ", head(names(cleanSamples), 10),    "...", tail(names(cleanSamples), 2), " \n")
    cat("     oldReferences:", head(names(cleanReferences), 10), "...", tail(names(cleanReferences), 2), " \n")
    cat("   newSamples:   ", strcat(" ncol=", newCols, ", nrow=", newRows, "\n")) 
    cat("   oldReferences:", strcat(" ncol=", refCols, ", nrow=", refRows,  "\n"))
  }
  if (!setequal(names(cleanSamples), names(cleanReferences))) {
    cat("\nNOTE: The sets of column headers are not equal. The following headers differ and will be dropped:\n")
    cat("   dataDirectory             = ", dataDirectory, "\n")
    cat(" Only in newSamples:\n")
    cat("     ", setdiff(names(cleanSamples), names(cleanReferences)), "\n")
    cat(" Only in oldReference:\n")
    cat("     ", setdiff(names(cleanReferences), names(cleanSamples)), "\n")
  } else {
    cat(" Headers match for newSamples and oldReference files to match /OK\n")
  }
  
  comparedCols = length(intersect(names(cleanSamples), names(cleanReferences))) - 1 # Not counting DNA_ID column
  commonCols = intersect(names(cleanSamples), names(cleanReferences))
  
  cat("\n")
  cat("   => Compared cols:", comparedCols, "(i.e. not counting DNA_ID column)\n" )
  cat("   => commonCols   :", head(commonCols, 10),    "...", tail(commonCols, 2), " \n")
  cat("   => Comparisons  :", strcat("(", newRows, "*", refRows, ")*", comparedCols, "=",
                                     (newRows*refRows)*comparedCols, "\n") )
  
  auCheckSplitData(dataSetDir, cleanSamples)
  auCheckSplitData(dataSetDir, cleanReferences)
}

# auCheckInputFiles - Ensures that the split version of the newSamples and the oldReferences files
#              have the same header rows so that they can be compared
auCheckInputFiles <- function(dataSetDir, inputNewSamplesFile="input_new_samples.txt", inputMatchReferencesFile="input_Match_references.txt") {
  
  # Make sure we can read the cleaned new samples file again:
  cleanSamples <- auReadCleanSamplesFiles(dataSetDir, inputNewSamplesFile)
  
  # Make sure we can read the cleaned old references file again:
  cleanReferences <- auReadCleanReferencesFile(dataSetDir, inputMatchReferencesFile)
  
  # Make sure they match:
  auCheckInput(dataSetDir, cleanSamples, cleanReferences)
}

## auCleanInputFiles - Reads raw focal file, cleans it up to match the reference and combines them to single data.frame
auCleanInputFiles <- function(dataSetDir, inputNewSamplesFile="input_new_samples.txt", inputMatchReferencesFile="input_Match_references.txt") {
  auCleanNewSamplesInputFiles(   dataSetDir, inputNewSamplesFile)
  auCleanOldReferencesInputFile( dataSetDir, inputMatchReferencesFile)
  
  auCheckInputFiles(dataSetDir, inputNewSamplesFile, inputMatchReferencesFile)
}


# auReadInput - Reads focal and reference files. Cleans them up and combines them to single data.frame
auReadInput <- function(dataSetDir, inputNewSamplesFile, inputMatchReferencesFile) {
  dataDirectory = strcat(WORKING_DIRECTORY, dataSetDir)
  
  
  cat("\nAbout to load Input:\n")
  cat("   dataDirectory             = ", dataDirectory, "\n")
  
  # Read file with new samples from the sequencer robot:
  A_2col <- auReadCleanSamplesFiles(dataSetDir, inputNewSamplesFile)
  
  # Read the file with the reference database of known individuals:
  cat("   inputMatchReferencesFile  = ", inputMatchReferencesFile,  "\n")
  A_20220209 <- auReadCleanReferencesFile(dataSetDir, inputMatchReferencesFile)
  # readr::problems_over_this_skip_the_rest_of_readInput <- function(dataDirectory, inputNewSamplesFile, inputMatchReferencesFile) {
  
  ###################################################
  ### Combine df for single Allelmatch input file ###
  ###################################################
  
  common_cols <- intersect(colnames(A_20220209), colnames(A_2col))
  readr::problems(common_cols)
  Input<-rbind(A_20220209[common_cols],A_2col[common_cols])
  readr::problems(Input)
  
  cat("\nDone loading Input:\n")
  cat("   dataDirectory             = ", dataDirectory, "\n")
  cat("   inputNewSamplesFile       = ", inputNewSamplesFile, "\n")
  cat("   inputMatchReferencesFile  = ", inputMatchReferencesFile,  "\n")
  cat("   Loaded samples to compare = ", nrow(A_2col), "+", nrow(A_20220209), "=", nrow(Input),"\n")
  
  return(amDataset(Input, indexColumn=1, missingCode="-99"))
}


###############################################################################
### Based on input parameters for allelematch, construct
### log messages and unique output file names:
###############################################################################

auDefaultFileName <- function(alleleMismatch=NULL, matchThreshold=NULL, cutHeight=NULL, maxMissing=NULL, doPsib="missing", consensusMethod=1) {
  aMm="";  if(!is.null(alleleMismatch)) { aMm=strcat("_aMm",   alleleMismatch)}
  mThr=""; if(!is.null(matchThreshold)) { mThr=strcat("_mThr",  matchThreshold)}
  cHgt=""; if(!is.null(cutHeight))      { cHgt=strcat("_cHgt",  cutHeight)}
  maxM=""; if(!is.null(maxMissing))     { maxM=strcat("_maxM",  maxMissing)}
  psib=""; if(doPsib != "missing")      { psib=strcat("_psib-", doPsib)}
  cnss=""; if(consensusMethod != 1)     { cnss=strcat("_cnss",  consensusMethod)}
  ret=strcat("output", aMm, mThr, cHgt, maxM, psib, cnss, "_actual.csv")
  return(ret)
}

amUniqueParamString <- function(alleleMismatch=NULL, matchThreshold=NULL, cutHeight=NULL, maxMissing=NULL, doPsib="missing", consensusMethod=1) {
  aMm="";  if(!is.null(alleleMismatch)) { aMm=strcat( " alleleMismatch=", alleleMismatch)}
  mThr=""; if(!is.null(matchThreshold)) { mThr=strcat(" matchThreshold=", matchThreshold)}
  cHgt=""; if(!is.null(cutHeight))      { cHgt=strcat(" cutHeight=",      cutHeight)}
  maxM=""; if(!is.null(maxMissing))     { maxM=strcat(" maxMissing=",     maxMissing)}
  psib=""; if(doPsib != "missing")      { psib=strcat(" doPsib=",         doPsib)}
  cnss=""; if(consensusMethod != 1)     { cnss=strcat(" consensusMethod=",consensusMethod)}
  ret=paste(aMm, mThr, cHgt, maxM, psib, cnss, sep="")
  return(ret)
}



###############################################################################
### Manipulating allelematch output as data frames
###############################################################################

auSortDfByIndexes <- function(df) {
  # df <- df[ order(df$uniqueIndex, df$matchIndex), ]
  
  # sort the table by key columns (ignore case)
  df <- df[with(df, order(uniqueIndex, matchIndex)), ]
  readr::problems(df)
  
  return(df)
}

## makeBriefDf()
#
# Make the contents of an output data frame (Df) brief and sorted
#
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


###############################################################################
### Reading and writing CSV files containing allelematch output 
### to and from Data Frames
###############################################################################

auReadCsvFile <- function(csvInFile) {
  df <- read.csv(file=csvInFile, colClasses="character", check.names=FALSE)
  readr::problems(df)
  return (df)
}

auWriteCsvFile <- function(df, csvOutFile) {
  write.csv(df, csvOutFile, row.names=FALSE, quote=TRUE, na = "NA")
  readr::problems(df)
}

auSortCsvFile <- function(csvInFile) {
  df <- auReadCsvFile(csvInFile)
  df <- auSortDfByIndexes(df)
  csvOutFile <- gsub(".csv", ".sorted.csv", csvInFile) # Add ".brief" before ".csv" file name extension.
  auWriteCsvFile(df, csvOutFile)
}

auMakeBriefCsvFile <- function(csvInFile) {
  df <- auReadCsvFile(csvInFile)
  df <- auMakeBriefDf(df)
  csvOutFile <- gsub(".csv", ".brief.csv", csvInFile) # Add ".brief" before ".csv" file name extension.
  auWriteCsvFile(df, csvOutFile)
}


###############################################################################
### Check that actual CSV output files are identical with the expected output.
###############################################################################

auAssertExpected <- function(actualCvsFile) {
  expectedCvsFile <- gsub("_actual", "_expected", actualCvsFile)
  
  expectedMd5sum = tools::md5sum(expectedCvsFile)
  actualMd5sum   = tools::md5sum(actualCvsFile)
  
  if (actualMd5sum != expectedMd5sum) {
    stop("Expected md5sum differs from Actual:",
         "\n   Expected : ", expectedMd5sum, expectedCvsFile, 
         "\n   Actual   : ", actualMd5sum, actualCvsFile)
  }
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
