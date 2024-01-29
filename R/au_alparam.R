

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
