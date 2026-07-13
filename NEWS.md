# amregtest 1.2.0

## New features

* More adaptions to backwards incompatibilities in allelematch 2.6.0:
 - Changed philosophy to how to changes in messages from allelematch are handled. 
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
