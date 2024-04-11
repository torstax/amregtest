## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new release.


This has been done in response to the below mail from CRAN (thank you for good comments!):

>Från : benjamin.altmann@wu.ac.at
>Datum : 2024-04-09 - 18:36 ()
>Till : torvald.staxler@telia.com, cran-submissions@r-project.org
>Ämne : Re: CRAN Submission amregtest 1.0.3
>
>Thanks,
>
>Please omit all instance of \link{} and \cr in your description of your 
>DESCRIPTION file as those are not recognized and added in verbatim. 

/DONE

>Please add () behind all function names in the description texts 
>(DESCRIPTION file). e.g: --> artVersion(), artList(), artRun(), etc....  

/DONE (All function names were moved from the DESCRIPTION file to the amregtest-package.R file)

>Please add \value to .Rd files regarding exported methods and explain 
>the functions results in the documentation. Please write about the 
>structure of the output (class) and also what the output means. (If a 
>function does not return a value, please document that too, e.g. 
>\value{No return value, called for side effects} or similar)
>Missing Rd-tags:
>      artRun.Rd: \value                                                                           

/DONE

>\dontrun{} should only be used if the example really cannot be executed 
>(e.g. because of missing additional software, missing API keys, ...) by 
>the user. That's why wrapping examples in \dontrun{} adds the comment 
>("# Not run:") as a warning for the user. Does not seem necessary. 
>Please replace \dontrun with \donttest.
>Please wrap examples that need packages in ‘Suggests’ in 
>if(requireNamespace("pkgname")){} instead.

/DONE

>You write information messages to the console that cannot be easily 
>suppressed.
>It is more R like to generate objects that can be used to extract the 
>information a user is interested in, and then print() that object. 
>Instead of print()/cat() rather use message()/warning() or 
>if(verbose)cat(..) (or maybe stop()) if you really have to write text to 
>the console. (except for print, summary, interactive functions) -> 
>R/art_api.R

/DONE   (Using the "if(verbose)cat(..)" approach)

>Please always add all authors, contributors and copyright holders in the 
>Authors@R field with the appropriate roles.

/DONE   (

> From CRAN policies you agreed to:
>"The ownership of copyright and intellectual property rights of all 
>components of the package must be clear and unambiguous (including from 
>the authors specification in the DESCRIPTION file). Where code is copied 
>(or derived) from the work of others (including from R itself), care 
>must be taken that any copyright/license statements are preserved and 
>authorship is not misrepresented.
>Preferably, an ‘Authors@R’ would be used with ‘ctb’ roles for the 
>authors of such code. ...

/DONE (Data files copied from package 'allelematch' under MIT license)

>Where copyrights are held by an entity 
>other than the package authors, this should preferably be indicated via 
>‘cph’ roles in the ‘Authors@R’ field, ...

/DONE (Here I specified both the University department and the Senior Lecturer as 'cph'. Hope that is OK)

> ... or using a ‘Copyright’ field (if 
>necessary referring to an inst/COPYRIGHTS file)."
>e.g.: "F. Last" in your LICENSE file.

/NOTED (not needed)

>Please explain in the submission comments what you did about this issue.

/DONE (see above)
>
>Please fix and resubmit.

/ONGOING

>
>Best,
>Benjamin Altmann
