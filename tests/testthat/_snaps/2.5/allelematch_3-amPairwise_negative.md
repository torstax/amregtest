# Validation of arguments to amPairwise() is working

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

---

    Code
      print.amDataset(amdataOdd2)
    Output
      allelematch
      amDataset object
          LOC1a LOC1b LOC2a LOC2b LOC3a
      AAA    11    21    31    41    51
      AAB    12    22    32    42    52
      AAC    13    23    33    43    53
      AAD    14    24   -99    44   -99

