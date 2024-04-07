# Validation of arguments to amUnique() is working

    Code
      print(miniExample1)
    Output
        LOC1a LOC1b LOC2a LOC2b
      1    11    21    31    41
      2    12    22    32    42
      3    13    23    33    43
      4    14    24   -99    44

---

    Code
      amdataMini1 <- amDataset(miniExample1)

---

    Code
      print.amDataset(amdataMini1)
    Output
      allelematch
      amDataset object
          LOC1a LOC1b LOC2a LOC2b
      AAA    11    21    31    41
      AAB    12    22    32    42
      AAC    13    23    33    43
      AAD    14    24   -99    44

