# amregtest 1.3.2

## New features
  
* Fixed the documentation of 'artInstallCranAllelematch' by preventing 
  the example code in the documentation from executing. The examples took too long 
  to execute in the CRAN tests.

* Ensured that the allelematch version installed by 'artInstallCranAllelematch' 
  is also loaded into the current R session of the RStudio Console.

# amregtest 1.3.1

## New features

* Saved some space by removing testthat snapshot files for allelematch 2.6.1 
  that were identical to those for allelematch 3.0.0. Still keeping them for 
  bad allelematch version 2.6.0 in case it is still installed on any of the 
  delivery test machines.
  
* Minor improvements to the documentation.

# amregtest 1.3.0

## New features

* More adaptions to backwards incompatibilities in allelematch 3.0.0.

* Introduction of new function 'artInstallCranAllelematch' to facilitate
  switching between different versions of allelematch.

# amregtest 1.2.0

## New features

* More adaptions to backwards incompatibilities in allelematch 2.6.0:
 - Changed philosophy regarding how changes in messages from allelematch are handled. 
   Now we convert from old 2.5 text to new before comparing.
 - Introduced snapshot variants for the snapshot files: NULL, "2.5", "2.6", and "bad-2.6".
     o NULL (i.e. no variant) is kept where the output from 2.5.X and 2.6.0 is identical.
     o "2.5" and "2.6" are used when the output is different, but manual inspection 
       indicates that only benign differences occur.
     o "bad-2.6" is used to store tests that result in incompatible data 
       compared to "2.5".

We still support the 2.5.X versions of allelematch.

# amregtest 1.1.0

## New features

* Adapted to cosmetic backwards incompatibilities in allelematch 2.6.0:
 - Data set 'allelematch::amExample5' changed because column name "gender" changed to "sex"
 - Lot's of white space changes in the output from functions called 'print.XXX()' and 'amHTML.XXX()'.
 - Some white space changes in some abort messages from detection of parameter errors
We still support the 2.5.X versions of allelematch.


# amregtest 1.0.10

## New features

* Now detecting and reporting detritus files that are leaked to TEMP during a test.

* All detected detritus files are now deleted after the test.

* amregtest is now tolerating that multiple spaces in allelematch 'stop' messages are compressed to single spaces.

* Latest 'allelematch' version tested so far: 2.5.5


# amregtest 1.0.3

## New features

* First version delivered to CRAN.

* 'allelematch' versions tested so far: 2.5.4, 2.5.3 and 2.5.2
  (2.5.1 and earlier no longer runs on modern versions of R)
