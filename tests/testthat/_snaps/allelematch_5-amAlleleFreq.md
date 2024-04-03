# Loop the Loop

    Code
      cat(cmdstr)
    Output
      amAlleleFreq(amdataMini)

---

    structure(list(multilocusMap = c(1L, 1L, 2L, 2L), loci = list(
        list(name = "LOC1a-LOC1b", columnNames = c("LOC1a", "LOC1b"
        ), alleleFreq = c("11" = 0.125, "12" = 0.125, "13" = 0.125, 
        "14" = 0.125, "21" = 0.125, "22" = 0.125, "23" = 0.125, "24" = 0.125
        ), missingFreq = 0, numAlleles = 8L), list(name = "LOC2a-LOC2b", 
            columnNames = c("LOC2a", "LOC2b"), alleleFreq = c("31" = 0.142857142857143, 
            "32" = 0.142857142857143, "33" = 0.142857142857143, "41" = 0.142857142857143, 
            "42" = 0.142857142857143, "43" = 0.142857142857143, "44" = 0.142857142857143
            ), missingFreq = 0.125, numAlleles = 7L))), class = "amAlleleFreq")

---

    Code
      print.amAlleleFreq(af)
    Output
      allelematch
      amAlleleFreq object
      Frequencies calculated after removal of missing data
      
      LOC1a-LOC1b (8 alleles)
      	Allele	 11 	 0.125 
      	Allele	 12 	 0.125 
      	Allele	 13 	 0.125 
      	Allele	 14 	 0.125 
      	Allele	 21 	 0.125 
      	Allele	 22 	 0.125 
      	Allele	 23 	 0.125 
      	Allele	 24 	 0.125 
      
      LOC2a-LOC2b (7 alleles)
      	Allele	 31 	 0.143 
      	Allele	 32 	 0.143 
      	Allele	 33 	 0.143 
      	Allele	 41 	 0.143 
      	Allele	 42 	 0.143 
      	Allele	 43 	 0.143 
      	Allele	 44 	 0.143 

---

    Code
      cat(cmdstr)
    Output
      amAlleleFreq(amdataMini, multilocusMap=c(1, 1, 2, 2))

---

    structure(list(multilocusMap = c(1L, 1L, 2L, 2L), loci = list(
        list(name = "LOC1a-LOC1b", columnNames = c("LOC1a", "LOC1b"
        ), alleleFreq = c("11" = 0.125, "12" = 0.125, "13" = 0.125, 
        "14" = 0.125, "21" = 0.125, "22" = 0.125, "23" = 0.125, "24" = 0.125
        ), missingFreq = 0, numAlleles = 8L), list(name = "LOC2a-LOC2b", 
            columnNames = c("LOC2a", "LOC2b"), alleleFreq = c("31" = 0.142857142857143, 
            "32" = 0.142857142857143, "33" = 0.142857142857143, "41" = 0.142857142857143, 
            "42" = 0.142857142857143, "43" = 0.142857142857143, "44" = 0.142857142857143
            ), missingFreq = 0.125, numAlleles = 7L))), class = "amAlleleFreq")

---

    Code
      print.amAlleleFreq(af)
    Output
      allelematch
      amAlleleFreq object
      Frequencies calculated after removal of missing data
      
      LOC1a-LOC1b (8 alleles)
      	Allele	 11 	 0.125 
      	Allele	 12 	 0.125 
      	Allele	 13 	 0.125 
      	Allele	 14 	 0.125 
      	Allele	 21 	 0.125 
      	Allele	 22 	 0.125 
      	Allele	 23 	 0.125 
      	Allele	 24 	 0.125 
      
      LOC2a-LOC2b (7 alleles)
      	Allele	 31 	 0.143 
      	Allele	 32 	 0.143 
      	Allele	 33 	 0.143 
      	Allele	 41 	 0.143 
      	Allele	 42 	 0.143 
      	Allele	 43 	 0.143 
      	Allele	 44 	 0.143 

---

    Code
      cat(cmdstr)
    Output
      amAlleleFreq(amdataExample1)

---

    structure(list(multilocusMap = c(1L, 1L, 2L, 2L, 3L, 3L, 4L, 
    4L, 5L, 5L, 6L, 6L, 7L, 7L, 8L, 8L, 9L, 9L, 10L, 10L), loci = list(
        list(name = "LOC1a-LOC1b", columnNames = c("LOC1a", "LOC1b"
        ), alleleFreq = c("109" = 0.275, "108" = 0.25, "103" = 0.15, 
        "120" = 0.15, "104" = 0.075, "110" = 0.05, "114" = 0.05), 
            missingFreq = 0, numAlleles = 7L), list(name = "LOC2a-LOC2b", 
            columnNames = c("LOC2a", "LOC2b"), alleleFreq = c("208" = 0.4, 
            "201" = 0.325, "207" = 0.1, "209" = 0.1, "203" = 0.075
            ), missingFreq = 0, numAlleles = 5L), list(name = "LOC3a-LOC3b", 
            columnNames = c("LOC3a", "LOC3b"), alleleFreq = c("306" = 0.289473684210526, 
            "307" = 0.236842105263158, "314" = 0.157894736842105, 
            "317" = 0.157894736842105, "313" = 0.0789473684210526, 
            "318" = 0.0789473684210526), missingFreq = 0.05, numAlleles = 6L), 
        list(name = "LOC4a-LOC4b", columnNames = c("LOC4a", "LOC4b"
        ), alleleFreq = c("417" = 0.325, "407" = 0.2, "404" = 0.175, 
        "413" = 0.15, "405" = 0.05, "408" = 0.05, "414" = 0.05), 
            missingFreq = 0, numAlleles = 7L), list(name = "LOC5a-LOC5b", 
            columnNames = c("LOC5a", "LOC5b"), alleleFreq = c("502" = 0.35, 
            "519" = 0.25, "514" = 0.125, "516" = 0.1, "505" = 0.1, 
            "501" = 0.075), missingFreq = 0, numAlleles = 6L), list(
            name = "LOC6a-LOC6b", columnNames = c("LOC6a", "LOC6b"
            ), alleleFreq = c("607" = 0.325, "603" = 0.3, "618" = 0.2, 
            "602" = 0.1, "616" = 0.075), missingFreq = 0, numAlleles = 5L), 
        list(name = "LOC7a-LOC7b", columnNames = c("LOC7a", "LOC7b"
        ), alleleFreq = c("715" = 0.25, "709" = 0.15, "706" = 0.15, 
        "703" = 0.15, "719" = 0.1, "717" = 0.075, "712" = 0.075, 
        "713" = 0.05), missingFreq = 0, numAlleles = 8L), list(name = "LOC8a-LOC8b", 
            columnNames = c("LOC8a", "LOC8b"), alleleFreq = c("804" = 0.375, 
            "816" = 0.3, "811" = 0.175, "812" = 0.1, "805" = 0.05
            ), missingFreq = 0, numAlleles = 5L), list(name = "LOC9a-LOC9b", 
            columnNames = c("LOC9a", "LOC9b"), alleleFreq = c("914" = 0.475, 
            "911" = 0.35, "912" = 0.05, "918" = 0.05, "915" = 0.05, 
            "907" = 0.025), missingFreq = 0, numAlleles = 6L), list(
            name = "LOC10a-LOC10b", columnNames = c("LOC10a", "LOC10b"
            ), alleleFreq = c("1015" = 0.425, "1007" = 0.225, "1006" = 0.175, 
            "1018" = 0.1, "1005" = 0.05, "1019" = 0.025), missingFreq = 0, 
            numAlleles = 6L))), class = "amAlleleFreq")

---

    Code
      print.amAlleleFreq(af)
    Output
      allelematch
      amAlleleFreq object
      Frequencies calculated after removal of missing data
      
      LOC1a-LOC1b (7 alleles)
      	Allele	 109 	 0.275 
      	Allele	 108 	 0.25 
      	Allele	 103 	 0.15 
      	Allele	 120 	 0.15 
      	Allele	 104 	 0.075 
      	Allele	 110 	 0.05 
      	Allele	 114 	 0.05 
      
      LOC2a-LOC2b (5 alleles)
      	Allele	 208 	 0.4 
      	Allele	 201 	 0.325 
      	Allele	 207 	 0.1 
      	Allele	 209 	 0.1 
      	Allele	 203 	 0.075 
      
      LOC3a-LOC3b (6 alleles)
      	Allele	 306 	 0.289 
      	Allele	 307 	 0.237 
      	Allele	 314 	 0.158 
      	Allele	 317 	 0.158 
      	Allele	 313 	 0.0789 
      	Allele	 318 	 0.0789 
      
      LOC4a-LOC4b (7 alleles)
      	Allele	 417 	 0.325 
      	Allele	 407 	 0.2 
      	Allele	 404 	 0.175 
      	Allele	 413 	 0.15 
      	Allele	 405 	 0.05 
      	Allele	 408 	 0.05 
      	Allele	 414 	 0.05 
      
      LOC5a-LOC5b (6 alleles)
      	Allele	 502 	 0.35 
      	Allele	 519 	 0.25 
      	Allele	 514 	 0.125 
      	Allele	 516 	 0.1 
      	Allele	 505 	 0.1 
      	Allele	 501 	 0.075 
      
      LOC6a-LOC6b (5 alleles)
      	Allele	 607 	 0.325 
      	Allele	 603 	 0.3 
      	Allele	 618 	 0.2 
      	Allele	 602 	 0.1 
      	Allele	 616 	 0.075 
      
      LOC7a-LOC7b (8 alleles)
      	Allele	 715 	 0.25 
      	Allele	 709 	 0.15 
      	Allele	 706 	 0.15 
      	Allele	 703 	 0.15 
      	Allele	 719 	 0.1 
      	Allele	 717 	 0.075 
      	Allele	 712 	 0.075 
      	Allele	 713 	 0.05 
      
      LOC8a-LOC8b (5 alleles)
      	Allele	 804 	 0.375 
      	Allele	 816 	 0.3 
      	Allele	 811 	 0.175 
      	Allele	 812 	 0.1 
      	Allele	 805 	 0.05 
      
      LOC9a-LOC9b (6 alleles)
      	Allele	 914 	 0.475 
      	Allele	 911 	 0.35 
      	Allele	 912 	 0.05 
      	Allele	 918 	 0.05 
      	Allele	 915 	 0.05 
      	Allele	 907 	 0.025 
      
      LOC10a-LOC10b (6 alleles)
      	Allele	 1015 	 0.425 
      	Allele	 1007 	 0.225 
      	Allele	 1006 	 0.175 
      	Allele	 1018 	 0.1 
      	Allele	 1005 	 0.05 
      	Allele	 1019 	 0.025 

---

    Code
      cat(cmdstr)
    Output
      amAlleleFreq(amdataExample2)

---

    structure(list(multilocusMap = c(1L, 1L, 2L, 2L, 3L, 3L, 4L, 
    4L, 5L, 5L, 6L, 6L, 7L, 7L, 8L, 8L, 9L, 9L, 10L, 10L), loci = list(
        list(name = "LOC1a-LOC1b", columnNames = c("LOC1a", "LOC1b"
        ), alleleFreq = c("116" = 0.325, "101" = 0.225, "111" = 0.225, 
        "107" = 0.2, "102" = 0.025), missingFreq = 0, numAlleles = 5L), 
        list(name = "LOC2a-LOC2b", columnNames = c("LOC2a", "LOC2b"
        ), alleleFreq = c("211" = 0.375, "203" = 0.275, "216" = 0.15, 
        "212" = 0.075, "219" = 0.075, "214" = 0.05), missingFreq = 0, 
            numAlleles = 6L), list(name = "LOC3a-LOC3b", columnNames = c("LOC3a", 
        "LOC3b"), alleleFreq = c("305" = 0.525, "314" = 0.1, "320" = 0.1, 
        "315" = 0.1, "316" = 0.075, "308" = 0.05, "306" = 0.05), 
            missingFreq = 0, numAlleles = 7L), list(name = "LOC4a-LOC4b", 
            columnNames = c("LOC4a", "LOC4b"), alleleFreq = c("411" = 0.361111111111111, 
            "402" = 0.25, "416" = 0.222222222222222, "403" = 0.138888888888889, 
            "412" = 0.0277777777777778), missingFreq = 0.1, numAlleles = 5L), 
        list(name = "LOC5a-LOC5b", columnNames = c("LOC5a", "LOC5b"
        ), alleleFreq = c("514" = 0.275, "501" = 0.275, "520" = 0.25, 
        "515" = 0.075, "505" = 0.075, "512" = 0.05), missingFreq = 0, 
            numAlleles = 6L), list(name = "LOC6a-LOC6b", columnNames = c("LOC6a", 
        "LOC6b"), alleleFreq = c("607" = 0.3, "620" = 0.2, "601" = 0.175, 
        "610" = 0.1, "604" = 0.075, "617" = 0.075, "619" = 0.025, 
        "615" = 0.025, "616" = 0.025), missingFreq = 0, numAlleles = 9L), 
        list(name = "LOC7a-LOC7b", columnNames = c("LOC7a", "LOC7b"
        ), alleleFreq = c("711" = 0.45, "707" = 0.175, "705" = 0.125, 
        "713" = 0.125, "718" = 0.075, "706" = 0.025, "701" = 0.025
        ), missingFreq = 0, numAlleles = 7L), list(name = "LOC8a-LOC8b", 
            columnNames = c("LOC8a", "LOC8b"), alleleFreq = c("808" = 0.275, 
            "816" = 0.225, "807" = 0.2, "820" = 0.15, "815" = 0.1, 
            "819" = 0.05), missingFreq = 0, numAlleles = 6L), list(
            name = "LOC9a-LOC9b", columnNames = c("LOC9a", "LOC9b"
            ), alleleFreq = c("906" = 0.5, "916" = 0.210526315789474, 
            "919" = 0.157894736842105, "917" = 0.131578947368421), 
            missingFreq = 0.05, numAlleles = 4L), list(name = "LOC10a-LOC10b", 
            columnNames = c("LOC10a", "LOC10b"), alleleFreq = c("1002" = 0.35, 
            "1014" = 0.25, "1004" = 0.125, "1020" = 0.1, "1010" = 0.05, 
            "1016" = 0.05, "1012" = 0.025, "1005" = 0.025, "1009" = 0.025
            ), missingFreq = 0, numAlleles = 9L))), class = "amAlleleFreq")

---

    Code
      print.amAlleleFreq(af)
    Output
      allelematch
      amAlleleFreq object
      Frequencies calculated after removal of missing data
      
      LOC1a-LOC1b (5 alleles)
      	Allele	 116 	 0.325 
      	Allele	 101 	 0.225 
      	Allele	 111 	 0.225 
      	Allele	 107 	 0.2 
      	Allele	 102 	 0.025 
      
      LOC2a-LOC2b (6 alleles)
      	Allele	 211 	 0.375 
      	Allele	 203 	 0.275 
      	Allele	 216 	 0.15 
      	Allele	 212 	 0.075 
      	Allele	 219 	 0.075 
      	Allele	 214 	 0.05 
      
      LOC3a-LOC3b (7 alleles)
      	Allele	 305 	 0.525 
      	Allele	 314 	 0.1 
      	Allele	 320 	 0.1 
      	Allele	 315 	 0.1 
      	Allele	 316 	 0.075 
      	Allele	 308 	 0.05 
      	Allele	 306 	 0.05 
      
      LOC4a-LOC4b (5 alleles)
      	Allele	 411 	 0.361 
      	Allele	 402 	 0.25 
      	Allele	 416 	 0.222 
      	Allele	 403 	 0.139 
      	Allele	 412 	 0.0278 
      
      LOC5a-LOC5b (6 alleles)
      	Allele	 514 	 0.275 
      	Allele	 501 	 0.275 
      	Allele	 520 	 0.25 
      	Allele	 515 	 0.075 
      	Allele	 505 	 0.075 
      	Allele	 512 	 0.05 
      
      LOC6a-LOC6b (9 alleles)
      	Allele	 607 	 0.3 
      	Allele	 620 	 0.2 
      	Allele	 601 	 0.175 
      	Allele	 610 	 0.1 
      	Allele	 604 	 0.075 
      	Allele	 617 	 0.075 
      	Allele	 619 	 0.025 
      	Allele	 615 	 0.025 
      	Allele	 616 	 0.025 
      
      LOC7a-LOC7b (7 alleles)
      	Allele	 711 	 0.45 
      	Allele	 707 	 0.175 
      	Allele	 705 	 0.125 
      	Allele	 713 	 0.125 
      	Allele	 718 	 0.075 
      	Allele	 706 	 0.025 
      	Allele	 701 	 0.025 
      
      LOC8a-LOC8b (6 alleles)
      	Allele	 808 	 0.275 
      	Allele	 816 	 0.225 
      	Allele	 807 	 0.2 
      	Allele	 820 	 0.15 
      	Allele	 815 	 0.1 
      	Allele	 819 	 0.05 
      
      LOC9a-LOC9b (4 alleles)
      	Allele	 906 	 0.5 
      	Allele	 916 	 0.211 
      	Allele	 919 	 0.158 
      	Allele	 917 	 0.132 
      
      LOC10a-LOC10b (9 alleles)
      	Allele	 1002 	 0.35 
      	Allele	 1014 	 0.25 
      	Allele	 1004 	 0.125 
      	Allele	 1020 	 0.1 
      	Allele	 1010 	 0.05 
      	Allele	 1016 	 0.05 
      	Allele	 1012 	 0.025 
      	Allele	 1005 	 0.025 
      	Allele	 1009 	 0.025 

---

    Code
      cat(cmdstr)
    Output
      amAlleleFreq(amdataExample3)

---

    structure(list(multilocusMap = c(1L, 1L, 2L, 2L, 3L, 3L, 4L, 
    4L, 5L, 5L, 6L, 6L, 7L, 7L, 8L, 8L, 9L, 9L, 10L, 10L), loci = list(
        list(name = "LOC1a-LOC1b", columnNames = c("LOC1a", "LOC1b"
        ), alleleFreq = c("103" = 0.275, "115" = 0.225, "107" = 0.2, 
        "117" = 0.1, "112" = 0.1, "116" = 0.1), missingFreq = 0, 
            numAlleles = 6L), list(name = "LOC2a-LOC2b", columnNames = c("LOC2a", 
        "LOC2b"), alleleFreq = c("202" = 0.5625, "219" = 0.34375, 
        "206" = 0.09375), missingFreq = 0.2, numAlleles = 3L), list(
            name = "LOC3a-LOC3b", columnNames = c("LOC3a", "LOC3b"
            ), alleleFreq = c("306" = 0.236842105263158, "302" = 0.157894736842105, 
            "311" = 0.157894736842105, "317" = 0.131578947368421, 
            "313" = 0.105263157894737, "310" = 0.0789473684210526, 
            "316" = 0.0526315789473684, "312" = 0.0526315789473684, 
            "307" = 0.0263157894736842), missingFreq = 0.05, numAlleles = 9L), 
        list(name = "LOC4a-LOC4b", columnNames = c("LOC4a", "LOC4b"
        ), alleleFreq = c("411" = 0.5, "416" = 0.225, "409" = 0.2, 
        "412" = 0.075), missingFreq = 0, numAlleles = 4L), list(name = "LOC5a-LOC5b", 
            columnNames = c("LOC5a", "LOC5b"), alleleFreq = c("501" = 0.315789473684211, 
            "514" = 0.289473684210526, "504" = 0.184210526315789, 
            "510" = 0.131578947368421, "508" = 0.0789473684210526
            ), missingFreq = 0.05, numAlleles = 5L), list(name = "LOC6a-LOC6b", 
            columnNames = c("LOC6a", "LOC6b"), alleleFreq = c("604" = 0.34375, 
            "608" = 0.3125, "606" = 0.21875, "611" = 0.09375, "617" = 0.03125
            ), missingFreq = 0.2, numAlleles = 5L), list(name = "LOC7a-LOC7b", 
            columnNames = c("LOC7a", "LOC7b"), alleleFreq = c("718" = 0.447368421052632, 
            "708" = 0.421052631578947, "703" = 0.0789473684210526, 
            "712" = 0.0526315789473684), missingFreq = 0.05, numAlleles = 4L), 
        list(name = "LOC8a-LOC8b", columnNames = c("LOC8a", "LOC8b"
        ), alleleFreq = c("817" = 0.210526315789474, "807" = 0.184210526315789, 
        "819" = 0.184210526315789, "811" = 0.105263157894737, "812" = 0.105263157894737, 
        "809" = 0.0789473684210526, "813" = 0.0789473684210526, "802" = 0.0526315789473684
        ), missingFreq = 0.05, numAlleles = 8L), list(name = "LOC9a-LOC9b", 
            columnNames = c("LOC9a", "LOC9b"), alleleFreq = c("908" = 0.470588235294118, 
            "919" = 0.205882352941176, "903" = 0.147058823529412, 
            "910" = 0.117647058823529, "904" = 0.0588235294117647
            ), missingFreq = 0.15, numAlleles = 5L), list(name = "LOC10a-LOC10b", 
            columnNames = c("LOC10a", "LOC10b"), alleleFreq = c("1001" = 0.368421052631579, 
            "1008" = 0.342105263157895, "1004" = 0.131578947368421, 
            "1002" = 0.0789473684210526, "1020" = 0.0789473684210526
            ), missingFreq = 0.05, numAlleles = 5L))), class = "amAlleleFreq")

---

    Code
      print.amAlleleFreq(af)
    Output
      allelematch
      amAlleleFreq object
      Frequencies calculated after removal of missing data
      
      LOC1a-LOC1b (6 alleles)
      	Allele	 103 	 0.275 
      	Allele	 115 	 0.225 
      	Allele	 107 	 0.2 
      	Allele	 117 	 0.1 
      	Allele	 112 	 0.1 
      	Allele	 116 	 0.1 
      
      LOC2a-LOC2b (3 alleles)
      	Allele	 202 	 0.562 
      	Allele	 219 	 0.344 
      	Allele	 206 	 0.0938 
      
      LOC3a-LOC3b (9 alleles)
      	Allele	 306 	 0.237 
      	Allele	 302 	 0.158 
      	Allele	 311 	 0.158 
      	Allele	 317 	 0.132 
      	Allele	 313 	 0.105 
      	Allele	 310 	 0.0789 
      	Allele	 316 	 0.0526 
      	Allele	 312 	 0.0526 
      	Allele	 307 	 0.0263 
      
      LOC4a-LOC4b (4 alleles)
      	Allele	 411 	 0.5 
      	Allele	 416 	 0.225 
      	Allele	 409 	 0.2 
      	Allele	 412 	 0.075 
      
      LOC5a-LOC5b (5 alleles)
      	Allele	 501 	 0.316 
      	Allele	 514 	 0.289 
      	Allele	 504 	 0.184 
      	Allele	 510 	 0.132 
      	Allele	 508 	 0.0789 
      
      LOC6a-LOC6b (5 alleles)
      	Allele	 604 	 0.344 
      	Allele	 608 	 0.312 
      	Allele	 606 	 0.219 
      	Allele	 611 	 0.0938 
      	Allele	 617 	 0.0312 
      
      LOC7a-LOC7b (4 alleles)
      	Allele	 718 	 0.447 
      	Allele	 708 	 0.421 
      	Allele	 703 	 0.0789 
      	Allele	 712 	 0.0526 
      
      LOC8a-LOC8b (8 alleles)
      	Allele	 817 	 0.211 
      	Allele	 807 	 0.184 
      	Allele	 819 	 0.184 
      	Allele	 811 	 0.105 
      	Allele	 812 	 0.105 
      	Allele	 809 	 0.0789 
      	Allele	 813 	 0.0789 
      	Allele	 802 	 0.0526 
      
      LOC9a-LOC9b (5 alleles)
      	Allele	 908 	 0.471 
      	Allele	 919 	 0.206 
      	Allele	 903 	 0.147 
      	Allele	 910 	 0.118 
      	Allele	 904 	 0.0588 
      
      LOC10a-LOC10b (5 alleles)
      	Allele	 1001 	 0.368 
      	Allele	 1008 	 0.342 
      	Allele	 1004 	 0.132 
      	Allele	 1002 	 0.0789 
      	Allele	 1020 	 0.0789 

---

    Code
      cat(cmdstr)
    Output
      amAlleleFreq(amdataExample4)

---

    structure(list(multilocusMap = c(1L, 1L, 2L, 2L, 3L, 3L, 4L, 
    4L, 5L, 5L, 6L, 6L, 7L, 7L, 8L, 8L, 9L, 9L, 10L, 10L), loci = list(
        list(name = "LOC1a-LOC1b", columnNames = c("LOC1a", "LOC1b"
        ), alleleFreq = c("104" = 0.5, "108" = 0.210526315789474, 
        "118" = 0.210526315789474, "111" = 0.0789473684210526), missingFreq = 0.05, 
            numAlleles = 4L), list(name = "LOC2a-LOC2b", columnNames = c("LOC2a", 
        "LOC2b"), alleleFreq = c("202" = 0.5, "208" = 0.40625, "212" = 0.09375
        ), missingFreq = 0.2, numAlleles = 3L), list(name = "LOC3a-LOC3b", 
            columnNames = c("LOC3a", "LOC3b"), alleleFreq = c("304" = 0.366666666666667, 
            "311" = 0.366666666666667, "307" = 0.266666666666667), 
            missingFreq = 0.25, numAlleles = 3L), list(name = "LOC4a-LOC4b", 
            columnNames = c("LOC4a", "LOC4b"), alleleFreq = c("413" = 0.411764705882353, 
            "408" = 0.294117647058824, "418" = 0.235294117647059, 
            "420" = 0.0588235294117647), missingFreq = 0.15, numAlleles = 4L), 
        list(name = "LOC5a-LOC5b", columnNames = c("LOC5a", "LOC5b"
        ), alleleFreq = c("505" = 0.566666666666667, "501" = 0.4, 
        "519" = 0.0333333333333333), missingFreq = 0.25, numAlleles = 3L), 
        list(name = "LOC6a-LOC6b", columnNames = c("LOC6a", "LOC6b"
        ), alleleFreq = c("608" = 0.794117647058823, "620" = 0.117647058823529, 
        "605" = 0.0882352941176471), missingFreq = 0.15, numAlleles = 3L), 
        list(name = "LOC7a-LOC7b", columnNames = c("LOC7a", "LOC7b"
        ), alleleFreq = c("720" = 0.382352941176471, "705" = 0.205882352941176, 
        "717" = 0.176470588235294, "704" = 0.117647058823529, "702" = 0.117647058823529
        ), missingFreq = 0.15, numAlleles = 5L), list(name = "LOC8a-LOC8b", 
            columnNames = c("LOC8a", "LOC8b"), alleleFreq = c("810" = 0.388888888888889, 
            "819" = 0.305555555555556, "801" = 0.277777777777778, 
            "813" = 0.0277777777777778), missingFreq = 0.1, numAlleles = 4L), 
        list(name = "LOC9a-LOC9b", columnNames = c("LOC9a", "LOC9b"
        ), alleleFreq = c("902" = 0.40625, "920" = 0.25, "904" = 0.15625, 
        "909" = 0.125, "906" = 0.0625), missingFreq = 0.2, numAlleles = 5L), 
        list(name = "LOC10a-LOC10b", columnNames = c("LOC10a", "LOC10b"
        ), alleleFreq = c("1007" = 0.357142857142857, "1005" = 0.321428571428571, 
        "1019" = 0.285714285714286, "1013" = 0.0357142857142857), 
            missingFreq = 0.3, numAlleles = 4L))), class = "amAlleleFreq")

---

    Code
      print.amAlleleFreq(af)
    Output
      allelematch
      amAlleleFreq object
      Frequencies calculated after removal of missing data
      
      LOC1a-LOC1b (4 alleles)
      	Allele	 104 	 0.5 
      	Allele	 108 	 0.211 
      	Allele	 118 	 0.211 
      	Allele	 111 	 0.0789 
      
      LOC2a-LOC2b (3 alleles)
      	Allele	 202 	 0.5 
      	Allele	 208 	 0.406 
      	Allele	 212 	 0.0938 
      
      LOC3a-LOC3b (3 alleles)
      	Allele	 304 	 0.367 
      	Allele	 311 	 0.367 
      	Allele	 307 	 0.267 
      
      LOC4a-LOC4b (4 alleles)
      	Allele	 413 	 0.412 
      	Allele	 408 	 0.294 
      	Allele	 418 	 0.235 
      	Allele	 420 	 0.0588 
      
      LOC5a-LOC5b (3 alleles)
      	Allele	 505 	 0.567 
      	Allele	 501 	 0.4 
      	Allele	 519 	 0.0333 
      
      LOC6a-LOC6b (3 alleles)
      	Allele	 608 	 0.794 
      	Allele	 620 	 0.118 
      	Allele	 605 	 0.0882 
      
      LOC7a-LOC7b (5 alleles)
      	Allele	 720 	 0.382 
      	Allele	 705 	 0.206 
      	Allele	 717 	 0.176 
      	Allele	 704 	 0.118 
      	Allele	 702 	 0.118 
      
      LOC8a-LOC8b (4 alleles)
      	Allele	 810 	 0.389 
      	Allele	 819 	 0.306 
      	Allele	 801 	 0.278 
      	Allele	 813 	 0.0278 
      
      LOC9a-LOC9b (5 alleles)
      	Allele	 902 	 0.406 
      	Allele	 920 	 0.25 
      	Allele	 904 	 0.156 
      	Allele	 909 	 0.125 
      	Allele	 906 	 0.0625 
      
      LOC10a-LOC10b (4 alleles)
      	Allele	 1007 	 0.357 
      	Allele	 1005 	 0.321 
      	Allele	 1019 	 0.286 
      	Allele	 1013 	 0.0357 

---

    Code
      cat(cmdstr)
    Output
      amAlleleFreq(amdataExample5)

---

    structure(list(multilocusMap = c(1L, 1L, 2L, 2L, 3L, 3L, 4L, 
    4L, 5L, 5L, 6L, 6L, 7L, 7L, 8L, 8L, 9L, 9L, 10L, 10L), loci = list(
        list(name = "LOC1a-LOC1b", columnNames = c("LOC1a", "LOC1b"
        ), alleleFreq = c("382" = 0.575, "384" = 0.4, "388" = 0.025
        ), missingFreq = 0, numAlleles = 3L), list(name = "LOC2a-LOC2b", 
            columnNames = c("LOC2a", "LOC2b"), alleleFreq = c("224" = 0.375, 
            "230" = 0.3, "232" = 0.15, "236" = 0.075, "242" = 0.05, 
            "244" = 0.025, "238" = 0.025), missingFreq = 0, numAlleles = 7L), 
        list(name = "LOC3a-LOC3b", columnNames = c("LOC3a", "LOC3b"
        ), alleleFreq = c("159" = 0.5, "155" = 0.25, "167" = 0.25
        ), missingFreq = 0.9, numAlleles = 3L), list(name = "LOC4a-LOC4b", 
            columnNames = c("LOC4a", "LOC4b"), alleleFreq = c("193" = 0.55, 
            "185" = 0.225, "181" = 0.1, "191" = 0.075, "199" = 0.05
            ), missingFreq = 0, numAlleles = 5L), list(name = "LOC5a-LOC5b", 
            columnNames = c("LOC5a", "LOC5b"), alleleFreq = c("299" = 0.578947368421053, 
            "285" = 0.315789473684211, "301" = 0.105263157894737), 
            missingFreq = 0.05, numAlleles = 3L), list(name = "LOC6a-LOC6b", 
            columnNames = c("LOC6a", "LOC6b"), alleleFreq = c("223" = 0.8, 
            "213" = 0.1, "227" = 0.05, "221" = 0.05), missingFreq = 0, 
            numAlleles = 4L), list(name = "LOC7a-LOC7b", columnNames = c("LOC7a", 
        "LOC7b"), alleleFreq = c("202" = 0.35, "210" = 0.225, "192" = 0.175, 
        "198" = 0.075, "204" = 0.075, "216" = 0.05, "214" = 0.05), 
            missingFreq = 0, numAlleles = 7L), list(name = "LOC8a-LOC8b", 
            columnNames = c("LOC8a", "LOC8b"), alleleFreq = c("118" = 0.425, 
            "106" = 0.225, "102" = 0.1, "116" = 0.075, "112" = 0.075, 
            "114" = 0.05, "108" = 0.05), missingFreq = 0, numAlleles = 7L), 
        list(name = "LOC9a-LOC9b", columnNames = c("LOC9a", "LOC9b"
        ), alleleFreq = c("296" = 0.45, "304" = 0.225, "288" = 0.175, 
        "298" = 0.1, "306" = 0.05), missingFreq = 0, numAlleles = 5L), 
        list(name = "LOC10a-LOC10b", columnNames = c("LOC10a", "LOC10b"
        ), alleleFreq = c("166" = 0.775, "172" = 0.125, "174" = 0.075, 
        "168" = 0.025), missingFreq = 0, numAlleles = 4L))), class = "amAlleleFreq")

---

    Code
      print.amAlleleFreq(af)
    Output
      allelematch
      amAlleleFreq object
      Frequencies calculated after removal of missing data
      
      LOC1a-LOC1b (3 alleles)
      	Allele	 382 	 0.575 
      	Allele	 384 	 0.4 
      	Allele	 388 	 0.025 
      
      LOC2a-LOC2b (7 alleles)
      	Allele	 224 	 0.375 
      	Allele	 230 	 0.3 
      	Allele	 232 	 0.15 
      	Allele	 236 	 0.075 
      	Allele	 242 	 0.05 
      	Allele	 244 	 0.025 
      	Allele	 238 	 0.025 
      
      LOC3a-LOC3b (3 alleles)
      	Allele	 159 	 0.5 
      	Allele	 155 	 0.25 
      	Allele	 167 	 0.25 
      
      LOC4a-LOC4b (5 alleles)
      	Allele	 193 	 0.55 
      	Allele	 185 	 0.225 
      	Allele	 181 	 0.1 
      	Allele	 191 	 0.075 
      	Allele	 199 	 0.05 
      
      LOC5a-LOC5b (3 alleles)
      	Allele	 299 	 0.579 
      	Allele	 285 	 0.316 
      	Allele	 301 	 0.105 
      
      LOC6a-LOC6b (4 alleles)
      	Allele	 223 	 0.8 
      	Allele	 213 	 0.1 
      	Allele	 227 	 0.05 
      	Allele	 221 	 0.05 
      
      LOC7a-LOC7b (7 alleles)
      	Allele	 202 	 0.35 
      	Allele	 210 	 0.225 
      	Allele	 192 	 0.175 
      	Allele	 198 	 0.075 
      	Allele	 204 	 0.075 
      	Allele	 216 	 0.05 
      	Allele	 214 	 0.05 
      
      LOC8a-LOC8b (7 alleles)
      	Allele	 118 	 0.425 
      	Allele	 106 	 0.225 
      	Allele	 102 	 0.1 
      	Allele	 116 	 0.075 
      	Allele	 112 	 0.075 
      	Allele	 114 	 0.05 
      	Allele	 108 	 0.05 
      
      LOC9a-LOC9b (5 alleles)
      	Allele	 296 	 0.45 
      	Allele	 304 	 0.225 
      	Allele	 288 	 0.175 
      	Allele	 298 	 0.1 
      	Allele	 306 	 0.05 
      
      LOC10a-LOC10b (4 alleles)
      	Allele	 166 	 0.775 
      	Allele	 172 	 0.125 
      	Allele	 174 	 0.075 
      	Allele	 168 	 0.025 

