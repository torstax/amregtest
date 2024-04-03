# Loop the Loop

    Code
      cat(cmdstr)
    Output
      amUniqueProfile(amdataMini, verbose=FALSE)

---

    Code
      cat(ret)
    Output
      allelematch:  assuming genotype columns are in pairs, representing 3 loci
        matchThreshold cutHeight alleleMismatch samples unique unclassified
      1      1.0000000 0.0000000              0       4      4            0
      2      0.8333333 0.1666667              1       4      4            0
      3      0.6666667 0.3333333              2       4      4            0
        multipleMatch guessOptimum missingDataLoad allelicDiversity guessMorphology
      1             0        FALSE           0.083              7.3        ZeroFlat
      2             0         TRUE           0.083              7.3        ZeroFlat
      3             0        FALSE           0.083              7.3        ZeroFlat

---

    Code
      cat(cmdstr)
    Output
      amUniqueProfile(amdataExample1, verbose=FALSE)

---

    Code
      cat(ret)
    Output
      allelematch:  assuming genotype columns are in pairs, representing 10 loci
        matchThreshold cutHeight alleleMismatch samples unique unclassified
      1           1.00      0.00              0      20     13            0
      2           0.95      0.05              1      20     13            0
      3           0.90      0.10              2      20     12            0
      4           0.85      0.15              3      20     12            0
      5           0.80      0.20              4      20     12            0
      6           0.75      0.25              5      20     12            0
      7           0.70      0.30              6      20     12            0
      8           0.65      0.35              7      20     12            0
      9           0.60      0.40              8      20     12            0
        multipleMatch guessOptimum missingDataLoad allelicDiversity   guessMorphology
      1             0        FALSE           0.005              6.1 ZeroSecondMinimum
      2             2        FALSE           0.005              6.1 ZeroSecondMinimum
      3             0         TRUE           0.005              6.1 ZeroSecondMinimum
      4             0        FALSE           0.005              6.1 ZeroSecondMinimum
      5             0        FALSE           0.005              6.1 ZeroSecondMinimum
      6             0        FALSE           0.005              6.1 ZeroSecondMinimum
      7             0        FALSE           0.005              6.1 ZeroSecondMinimum
      8             0        FALSE           0.005              6.1 ZeroSecondMinimum
      9             1        FALSE           0.005              6.1 ZeroSecondMinimum

---

    Code
      cat(cmdstr)
    Output
      amUniqueProfile(amdataExample2, verbose=FALSE)

---

    Code
      cat(ret)
    Output
      allelematch:  assuming genotype columns are in pairs, representing 10 loci
        matchThreshold cutHeight alleleMismatch samples unique unclassified
      1           1.00      0.00              0     148    140            0
      2           0.95      0.05              1     148    136            0
      3           0.90      0.10              2     148    122            0
      4           0.85      0.15              3     148    100            0
      5           0.80      0.20              4     148     99            0
      6           0.75      0.25              5     148     99            0
      7           0.70      0.30              6     148     98            0
      8           0.65      0.35              7     148     98            0
      9           0.60      0.40              8     148     89            0
        multipleMatch guessOptimum missingDataLoad allelicDiversity   guessMorphology
      1             0        FALSE           0.046              7.9 ZeroSecondMinimum
      2            25        FALSE           0.046              7.9 ZeroSecondMinimum
      3            33        FALSE           0.046              7.9 ZeroSecondMinimum
      4             0         TRUE           0.046              7.9 ZeroSecondMinimum
      5             0        FALSE           0.046              7.9 ZeroSecondMinimum
      6             1        FALSE           0.046              7.9 ZeroSecondMinimum
      7             1        FALSE           0.046              7.9 ZeroSecondMinimum
      8            14        FALSE           0.046              7.9 ZeroSecondMinimum
      9            30        FALSE           0.046              7.9 ZeroSecondMinimum

---

    Code
      cat(cmdstr)
    Output
      amUniqueProfile(amdataExample3, verbose=FALSE)

---

    Code
      cat(ret)
    Output
      allelematch:  assuming genotype columns are in pairs, representing 10 loci
        matchThreshold cutHeight alleleMismatch samples unique unclassified
      1           1.00      0.00              0     319    291            0
      2           0.95      0.05              1     319    281            0
      3           0.90      0.10              2     319    212            0
      4           0.85      0.15              3     319    159            0
      5           0.80      0.20              4     319    120            0
      6           0.75      0.25              5     319    109            0
      7           0.70      0.30              6     319    100            2
      8           0.65      0.35              7     319     93            7
      9           0.60      0.40              8     319     93            2
        multipleMatch guessOptimum missingDataLoad allelicDiversity
      1             0        FALSE           0.097              8.2
      2            97        FALSE           0.097              8.2
      3           103        FALSE           0.097              8.2
      4            77        FALSE           0.097              8.2
      5            31        FALSE           0.097              8.2
      6            25        FALSE           0.097              8.2
      7             4         TRUE           0.097              8.2
      8            12        FALSE           0.097              8.2
      9            75        FALSE           0.097              8.2
             guessMorphology
      1 NonZeroSecondMinimum
      2 NonZeroSecondMinimum
      3 NonZeroSecondMinimum
      4 NonZeroSecondMinimum
      5 NonZeroSecondMinimum
      6 NonZeroSecondMinimum
      7 NonZeroSecondMinimum
      8 NonZeroSecondMinimum
      9 NonZeroSecondMinimum

---

    Code
      cat(cmdstr)
    Output
      amUniqueProfile(amdataExample4, verbose=FALSE)

---

    Code
      cat(ret)
    Output
      allelematch:  assuming genotype columns are in pairs, representing 10 loci
        matchThreshold cutHeight alleleMismatch samples unique unclassified
      1           1.00      0.00              0     307    307            0
      2           0.95      0.05              1     307    307            0
      3           0.90      0.10              2     307    283            0
      4           0.85      0.15              3     307    228            1
      5           0.80      0.20              4     307    180            1
      6           0.75      0.25              5     307    137            4
      7           0.70      0.30              6     307     99            1
      8           0.65      0.35              7     307     66            8
      9           0.60      0.40              8     307     39           10
        multipleMatch guessOptimum missingDataLoad allelicDiversity guessMorphology
      1             0        FALSE           0.199              4.8 NoSecondMinimum
      2            42         TRUE           0.199              4.8 NoSecondMinimum
      3            92        FALSE           0.199              4.8 NoSecondMinimum
      4            99        FALSE           0.199              4.8 NoSecondMinimum
      5           110        FALSE           0.199              4.8 NoSecondMinimum
      6           122        FALSE           0.199              4.8 NoSecondMinimum
      7           153        FALSE           0.199              4.8 NoSecondMinimum
      8           196        FALSE           0.199              4.8 NoSecondMinimum
      9           234        FALSE           0.199              4.8 NoSecondMinimum

---

    Code
      cat(cmdstr)
    Output
      amUniqueProfile(amdataExample5, verbose=FALSE)

---

    Code
      cat(ret)
    Output
      allelematch:  assuming genotype columns are in pairs, representing 10 loci
        matchThreshold cutHeight alleleMismatch samples unique unclassified
      1           1.00      0.00              0     335    253            0
      2           0.95      0.05              1     335    233            0
      3           0.90      0.10              2     335    189            0
      4           0.85      0.15              3     335    165            1
      5           0.80      0.20              4     335    154            0
      6           0.75      0.25              5     335    136            2
      7           0.70      0.30              6     335    106            1
      8           0.65      0.35              7     335     74            3
      9           0.60      0.40              8     335     40            4
        multipleMatch guessOptimum missingDataLoad allelicDiversity
      1             0        FALSE           0.064              6.4
      2            95        FALSE           0.064              6.4
      3            65        FALSE           0.064              6.4
      4            32         TRUE           0.064              6.4
      5            48        FALSE           0.064              6.4
      6           103        FALSE           0.064              6.4
      7           163        FALSE           0.064              6.4
      8           234        FALSE           0.064              6.4
      9           237        FALSE           0.064              6.4
             guessMorphology
      1 NonZeroSecondMinimum
      2 NonZeroSecondMinimum
      3 NonZeroSecondMinimum
      4 NonZeroSecondMinimum
      5 NonZeroSecondMinimum
      6 NonZeroSecondMinimum
      7 NonZeroSecondMinimum
      8 NonZeroSecondMinimum
      9 NonZeroSecondMinimum

