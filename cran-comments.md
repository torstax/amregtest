## R CMD check results

0 errors ✔ | 0 warnings ✔ | 0 notes ✔

This is a new delivery 1.1.0 of amregtest that adapts to a coming delivery 
2.6.0 of allelematch that introduced a number of cosmetic backwards incompatibilities
that will not pass the tests of amregtest 1.0.10.

### Problem - Cosmetic backwards incompatibilities in allelematch 2.6.0


**Symptom:** 17 tests out of 2852 failed


**Root cause:** 
 1) Column name changed from "gender" to "sex" in the allelematch::amExample5 data set.
 
 2) Lot's of white space changes in the output from functions called 'print.XXX()' 
    and 'amHTML.XXX()' caused testthat snapshot errors.
    
 3) Some white space changes in some abort messages from detection of parameter errors


**Fix:** .
 1) What checksum to expect from allelematch::amExample5 data set now depends on 
    the Major and Minor digits in the version number of allelematch.
    
 2) The tests "allelematch_3-amPairwise_print", "allelematch_4-amCluster_print", 
    and "allelematch_6-amUnique_print" now use the Major and Minor digits 
    in the version number of allelematch as variant parameter to the snapshot tests.
    
 3) Regular expressions were used to tolerate varying lengths of consecutive 
    white space when testing that allelematch abort messages are as expected.


/Kind regards,
torvald.staxler@telia.com
