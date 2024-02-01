######################
### au_config.R    ###
######################
# Load this configuration like this:
#
#   data("au_config", package = "regressiontest")
#


#` Column headers that start with digits are not allowed as R 'names'
#`
#` If this constant is FALSE, we will allow R to change the column names
#` by prefixing them with an ... (X??).
#
ALLOW_COLUMN_NAMES_TO_START_WITH_DIGITS = FALSE

#` WRITE_CLEANED_INPUT_TO_FILE
#``
#` After the new samples and reference input files have been
#` loaded, cleaned up and aligned, should they then be written out
#` again for examination and re-use?
WRITE_CLEANED_INPUT_TO_FILE = TRUE

#` IS_BRIEF_AMUNIQUE_SUPPORTED_BY_ALLELEMATCH
#`
#` This update of allelematch adds one more csv output format
#` intended to give a quick overview.
IS_BRIEF_AMUNIQUE_SUPPORTED_BY_ALLELEMATCH = FALSE

#` MAX_MISSING_SUPPORTED
#`
#` Have the MaxMissing parameter been implemented in allelematch yet?
MAX_MISSING_SUPPORTED = FALSE
