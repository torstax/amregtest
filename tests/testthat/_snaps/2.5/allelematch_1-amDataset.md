# See how an object of class amDataset is built:

    Code
      print(miniExample)
    Output
        sampleId knownIndividual             dismiss. LOC1a LOC1b LOC2a LOC2b
      1        1               A                 Rain    11    21    31    41
      2        2               A                drops    12    22    32    42
      3        3               B                 keep    13    23    33    43
      4        4               C  fallin' on my head     14    24   -88    44

---

    Code
      print.amDataset(miniDataset1)
    Output
      allelematch
      amDataset object
          sampleId knownIndividual        dismiss. LOC1a LOC1b LOC2a LOC2b
      AAA        1               A            Rain    11    21    31    41
      AAB        2               A           drops    12    22    32    42
      AAC        3               B            keep    13    23    33    43
      AAD        4               C fallin'onmyhead    14    24   -88    44

---

    Code
      print.amDataset(miniDataset2)
    Output
      allelematch
      amDataset object
             LOC1a LOC1b LOC2a LOC2b
      1  A      11    21    31    41
      2  A      12    22    32    42
      3  B      13    23    33    43
      4    C    14    24   -88    44

---

    Code
      print.amDataset(miniDataset2)
    Output
      allelematch
      amDataset object
             LOC1a LOC1b LOC2a LOC2b
      1  A      11    21    31    41
      2  A      12    22    32    42
      3  B      13    23    33    43
      4    C    14    24   -88    44

# Different data types for arg to 'missingCode' give same result

    Code
      ds1 <- amDataset(sample, missingCode = "NA")
    Output
      allelematch:  NA data converted to NA 

---

    structure(list(index = c("AAA", "AAB", "AAC", "AAD"), multilocus = structure(c("11", 
    "12", "13", "14", "21", "22", "23", "NA", "31", "32", "33", "NA", 
    "41", "42", "43", "NA"), dim = c(4L, 4L), dimnames = list(NULL, 
        c("LOC1a", "LOC1b", "LOC2a", "LOC2b"))), missingCode = "NA"), class = "amDataset")

---

    Code
      ds2 <- amDataset(sample, missingCode = NA)
    Output
      allelematch:  NA data converted to NA 

---

    structure(list(index = c("AAA", "AAB", "AAC", "AAD"), multilocus = structure(c("11", 
    "12", "13", "14", "21", "22", "23", "NA", "31", "32", "33", "NA", 
    "41", "42", "43", "NA"), dim = c(4L, 4L), dimnames = list(NULL, 
        c("LOC1a", "LOC1b", "LOC2a", "LOC2b"))), missingCode = "NA"), class = "amDataset")

