This test directory and the files in it were created
to make it possible to check that new functionality in 
allelematch.r does not change backward compatiblility.

It was created as an afterthought when it turned out 
to be quite dificult to evaluate changes in test result output.

Use as follows: 

To restore the tests, do one of:
	cd ..../allelematch
	git checkout test_legacy-2.5.1 test_legacy-2.5.1 # (From branch test_legacy-2.5.1 check out directory test_legacy-2.5.1)

Or:
	cd ..../allelematch
	git checkout 2.5.1 test_legacy-2.5.1 # (From tag version tag 2.5.1, check out R/allelematch.r)


From the R-studio GUI:
	Click [Session] -> [Set Working Directory] -> [To Project Directory]
	Open file  test_legacy-2.5.1/TestLegacy-2.5.1.R
	Click [Source]

Expect the following output in the R Studio console:

	> setwd("~/Private/GuloGulo/allelematch")
	> source("~/Private/GuloGulo/allelematch/test_legacy-2.5.1/TestLegacy-2.5.1.R")
	Rows: 109 Columns: 104                                                          
	── Column specification ────────────────────────────────────────────────────────
	Delimiter: "\t"
	chr (101): Plate, DNA_ID, amp, Sex, SexA, Y2_Gg_644, Y2_Gg_720, Y3_Gg_97, 16...
	dbl   (3): Place, ZZ, YY

	ℹ Use `spec()` to retrieve the full column specification for this data.
	ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

	Attaching package: ‘dplyr’

	The following objects are masked from ‘package:plyr’:

		arrange, count, desc, failwith, id, mutate, rename, summarise,
		summarize

	The following objects are masked from ‘package:stats’:

		filter, lag

	The following objects are masked from ‘package:base’:

		intersect, setdiff, setequal, union

	Rows: 1549 Columns: 199                                                         
	── Column specification ────────────────────────────────────────────────────────
	Delimiter: "\t"
	chr (195): Ind2, Individual, Sex, SexA1, SexA2, 16S1_Gg2911, 16S1_Gg2912, Y2...
	dbl   (4): #SNPs, DeadYear, mtDNAfox1, mtDNAfox2

	ℹ Use `spec()` to retrieve the full column specification for this data.
	ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

	GuloGulo: About to match using matchThreshold = 0.9 
	   workingDirectory          =  C:/Users/etorvst/OneDrive - Ericsson/Documents/Private/GuloGulo/allelematch/test_legacy-2.5.1/ 
	   inputNewSamplesFile       =  C:/Users/etorvst/OneDrive - Ericsson/Documents/Private/GuloGulo/allelematch/test_legacy-2.5.1/input_new_samples.txt 
	   inputMatchReferencesFile  =  C:/Users/etorvst/OneDrive - Ericsson/Documents/Private/GuloGulo/allelematch/test_legacy-2.5.1/input_Match_references.txt 
	   outputMatchThreasholdFile =  C:/Users/etorvst/OneDrive - Ericsson/Documents/Private/GuloGulo/allelematch/test_legacy-2.5.1/output_mThr0.9_actual.csv 
	allelematch:  assuming genotype columns are in pairs, representing 90 loci

	GuloGulo: About to match using alleleMismatch = 15 
	   workingDirectory          =  C:/Users/etorvst/OneDrive - Ericsson/Documents/Private/GuloGulo/allelematch/test_legacy-2.5.1/ 
	   inputNewSamplesFile       =  C:/Users/etorvst/OneDrive - Ericsson/Documents/Private/GuloGulo/allelematch/test_legacy-2.5.1/input_new_samples.txt 
	   inputMatchReferencesFile  =  C:/Users/etorvst/OneDrive - Ericsson/Documents/Private/GuloGulo/allelematch/test_legacy-2.5.1/input_Match_references.txt 
	   outputAllelMisMatchFile   =  C:/Users/etorvst/OneDrive - Ericsson/Documents/Private/GuloGulo/allelematch/test_legacy-2.5.1/output_15MM_actual.csv 
	allelematch:  assuming genotype columns are in pairs, representing 90 loci

	GuloGulo: DONE!

	Warning messages:
	1: One or more parsing issues, call `problems()` on your data frame for details,
	e.g.:
	  dat <- vroom(...)
	  problems(dat) 
	2: In (dim(amDatasetFocal$multilocus) == dim(amDatasetComparison$multilocus)) &&  :
	  'length(x) = 2 > 1' in coercion to 'logical(1)'
	3: In (dim(amDatasetFocal$multilocus) == dim(amDatasetComparison$multilocus)) &&  :
	  'length(x) = 2 > 1' in coercion to 'logical(1)'

Sort the output files:
	./sort_cvs.sh output_mThr0.9_actual.csv
	./sort_cvs.sh output_15MM_actual.csv
	
Check that the md5sums have not changed: 
	cat md5sum.txt
	md5sum * | sort | tee newsums.txt
	diff md5sums.txt newsums.txt
	 
/Torvald Staxler 2022-12-20