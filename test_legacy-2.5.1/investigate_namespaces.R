####################################
### Setup for scripted execution ###
####################################

requireNamespace("data.table")
requireNamespace("dplyr")


# Check that we are standing in a relevant directory
setupScript="test_legacy-2.5.1/r_script_setup_for_regressiontest.R"
here::i_am(setupScript)
source(here::here(setupScript))

cat( "\nHello?")
cat ("\n\n")
cat(loadedNamespaces(), delim="\t")
cat ("\n\n")

library(allelematch)

cat(find("write.csv"))
cat ("\n\n")

#cat(findFunction("write.csv"))

