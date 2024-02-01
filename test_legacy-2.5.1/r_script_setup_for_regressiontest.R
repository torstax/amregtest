######################
### Configuration  ###
######################
# Clear the Environment from old data:
rm(list = ls())  # Clear the Environment

#############################
### Finding R project dir ###
#############################

# Check that we are standing in a relevant directory
stopifnot(file.exists(here::here("R/.")))

# Remember the root directory for this 'regressiontest' package:
R_PROJ_DIR          = here::here()


#######################
### Needed packages ###
#######################
#library(readr)
#library(plyr)
library(allelematch)

# Find function calls that miss namespace prefixes:
requireNamespace("here")
requireNamespace("readr")
requireNamespace("dplyr")
requireNamespace("data.table")

# # Decide if to use the loaded package our our source files:
# if (FALSE) {
#     # When using the built package:
#     library(regressiontest)
# } else {
#     # When testing during development:
#     source(here::here("R/au_config.R"))
#     source(here::here("R/au_misc.R"))
#     source(here::here("R/au_text.R"))
#     source(here::here("R/au_alin.R"))
#     source(here::here("R/au_alout.R"))
#     source(here::here("R/au_alparam.R"))
#     source(here::here("R/au_testengin.R"))
# }
