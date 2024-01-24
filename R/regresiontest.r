## regresiontest R Package
## v0.0.1
## regresiontest: Tests backward compatibility of package allelematch:  Pairwise matching and identification of unique multilocus genotypes
##
## by Paul Galpern
## License: GPL-2
##
## Last update:  12 September 2011
##
## N.B. Renamed from MicroSatMatch as of v1.1
##
## Functions:
## amDataset()             Produces an input dataset object for allelematch routines
## print.amDataset()       Print method for amDataset objects
## amMatrix()              Produce a dissimilarity matrix
## amPairwise()            Pairwise matching of genotypes
## summary.amPairwise()    Summary method for amPairwise objects
## amCluster()             Clustering of genotypes  
## summary.amCluster()     Summary method for amCluster objects
## amUnique()              Identification of unique genotypes
## summary.amUnique()      Summary method for amUnique objects
## amUniqueProfile()       Utility to find optimal parameters for amUnique()
## amAlleleFreq()          Produces allele frequencies from an amDataset object
##
## Requires:  dynamicTreeCut
##
## Please see R documentation for full description of function parameters
##
## amDataset()
amDataset <- function(multilocusDataset, missingCode="-99", indexColumn=NULL, metaDataColumn=NULL, ignoreColumn=NULL) {
    
                
    ## Create amDataset object
    newDataset <- list()
    class(newDataset) <- "amDataset"

    ## Check function call variables for validity
    if (is.null(dim(multilocusDataset))) stop("allelematch:  multilocusDataset must be a matrix or a data.frame", call.=FALSE)
    if ((is.character(indexColumn) || is.character(metaDataColumn) || is.character(ignoreColumn)) && is.null(dimnames(multilocusDataset)[[2]])) {
        stop("allelematch:  multilocusDataset does not have dimnames()[[2]] set; use integer column indices or set dimnames()", call.=FALSE)
    }
    if (!is.null(indexColumn)) {
        if (length(indexColumn) > 1) stop("allelematch:  only one indexColumn permitted", call.=FALSE)
        if (is.character(indexColumn)) {
            indexColumnWhich <- which(indexColumn == dimnames(multilocusDataset)[[2]])
            if (length(indexColumnWhich) == 0) stop("allelematch:  indexColumn does not exist in multilocusDataset", call.=FALSE)
        }
        else {
            indexColumnWhich <- indexColumn
            if (length(indexColumn))
            if (indexColumnWhich > ncol(multilocusDataset)) stop("allelematch:  indexColumn does not exist in multilocusDataset", call.=FALSE)
        }
    }
    else {
        indexColumnWhich <- 0
    }
    if (!is.null(metaDataColumn)) {
        if (length(metaDataColumn) > 1) stop("allelematch:  only one metaDataColumn permitted", call.=FALSE)
        if (is.character(metaDataColumn)) {
            metaDataColumnWhich <- which(metaDataColumn == dimnames(multilocusDataset)[[2]])
            if (length(metaDataColumnWhich) == 0) stop("allelematch:  metaDataColumn does not exist in multilocusDataset", call.=FALSE)
        }
        else {
            metaDataColumnWhich <- metaDataColumn
            if (length(metaDataColumn))
            if (metaDataColumnWhich > ncol(multilocusDataset)) stop("allelematch:  metaDataColumn does not exist in multilocusDataset", call.=FALSE)
        }
    }
    else {
        metaDataColumnWhich <- 0
    }
    if (!is.null(ignoreColumn)) {
        if (is.character(ignoreColumn)) {
            ignoreColumnWhich <- which(as.logical(rowSums(sapply(ignoreColumn, function(x) x == dimnames(multilocusDataset)[[2]]))))
            if (length(ignoreColumnWhich) != length(ignoreColumn)) stop("allelematch:  one or more ignoreColumn does not exist in multilocusDataset", call.=FALSE)
        }
        else {
            ignoreColumnWhich <- ignoreColumn
            if (length(ignoreColumn))
            if (any(ignoreColumnWhich > ncol(multilocusDataset))) stop("allelematch:  one or more ignoreColumn does not exist in multilocusDataset", call.=FALSE)
        }
    }
    else {
        ignoreColumnWhich <- 0
    }
    
    
    
    ## Prepare multilocusDataset
    columnDataset <- dimnames(multilocusDataset)[[2]]
    multilocusDataset <- t(apply(multilocusDataset, 1, as.character))

    ## Change NA data to the missingCode
    if (sum(is.na(multilocusDataset)) > 0) {
        multilocusDataset[is.na(multilocusDataset)] <- missingCode
        cat("allelematch:  NA data converted to", missingCode, "\n")
    }
    newDataset$index <- multilocusDataset[, indexColumnWhich]
    newDataset$metaData <- multilocusDataset[, metaDataColumnWhich]
    keepTheseColumns <- 1:ncol(multilocusDataset) %in% c(indexColumnWhich, metaDataColumnWhich, ignoreColumnWhich)
    if (sum(!keepTheseColumns) < 3) stop("allelematch:  at least three data columns are required for allelematch", call.=FALSE)
    newDataset$multilocus <- multilocusDataset[, !keepTheseColumns]
    ## Remove spaces from the multilocus and index columns (overcomes problems caused by space padding that may crop up)
    newDataset$multilocus <- t(apply(newDataset$multilocus, 1, function(x) gsub(" ", "", x)))
    newDataset$index <- gsub(" ", "", newDataset$index)
    columnDataset <- columnDataset[!keepTheseColumns]

    
   
    ## Assign index and multilocus column names if not given
    if (length(newDataset$index)==0) {
        if (nrow(newDataset$multilocus) > 17576) {
            ## N.B. 17576 is length of labelRepository (below)
            stop("allelematch:  too many samples for automatic assignment of index;  please provide an index column", call.=FALSE)
        }
        ## Produce a vector of possible index or column name labels 
        labelRepository <- as.character(apply(cbind(rep(1:26, each=26*26),
                                        do.call(rbind,lapply(1:26, function(x) cbind(rep(1:26, each=26),rep(1:26, times=26))))), 1, function(x)
                                        paste(LETTERS[x[1]], LETTERS[x[2]], LETTERS[x[3]], sep="")))
        
        newDataset$index <- labelRepository[1:nrow(newDataset$multilocus)]
    }
    if (length(newDataset$metaData)==0) {
        newDataset$metaData <- NULL
    }
    if (is.null(columnDataset)) {
        dimnames(newDataset$multilocus)[[2]] <- paste("loc", 1:ncol(newDataset$multilocus), sep="") 
    }
    else {
        dimnames(newDataset$multilocus)[[2]] <- columnDataset
    }
    
    if (sum(duplicated(newDataset$index)) > 0) stop("allelematch:  index column should contain a unique identifier for each sample", call.=FALSE)
    
    if (is.na(missingCode)) {
        newDataset$multilocus[is.na(newDataset$multilocus)] <- "NA"
        newDataset$missingCode <- "NA"
    }
    else {
        newDataset$missingCode <- missingCode
    }
    
    return(newDataset)
}
