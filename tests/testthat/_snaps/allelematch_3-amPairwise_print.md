# Print

    Code
      paste("About to exercise", obj)
    Output
      [1] "About to exercise objMini"

---

    Code
      summary.amPairwise(get(obj))
    Output
      allelematch
      pairwise analysis
      
      focal dataset N=4
      focal dataset compared against itself
      missing data represented by: -99
      missing data matching method: 2
      alleleMismatch (m-hat; maximum number of mismatching alleles): 0.5
      matchThreshold (s-hat; lowest matching score returned): 0.875
      
      score flags:
      *101 allele does not match
      +101 allele is missing
      
      (1 of 4)
                   LOC1a LOC1b LOC2a LOC2b score
      FOCAL  AAA      11    21    31    41      
      MATCH  AAA      11    21    31    41     1
      1 perfect matches found.  0 partial matches found.
      
      
      (2 of 4)
                   LOC1a LOC1b LOC2a LOC2b score
      FOCAL  AAB      12    22    32    42      
      MATCH  AAB      12    22    32    42     1
      1 perfect matches found.  0 partial matches found.
      
      
      (3 of 4)
                   LOC1a LOC1b LOC2a LOC2b score
      FOCAL  AAC      13    23    33    43      
      MATCH  AAC      13    23    33    43     1
      1 perfect matches found.  0 partial matches found.
      
      
      (4 of 4)
                   LOC1a LOC1b LOC2a LOC2b score
      FOCAL  AAD      14    24  +-99    44      
      MATCH  AAD      14    24  +-99    44     1
      1 perfect matches found.  0 partial matches found.
      
      

---

    Code
      amCSV.amPairwise(get(obj), csvFile = tmp)

---

    Code
      format(read.csv(tmp))
    Output
        matchGroup nMatchGroup focalIndex comparisonIndex matchThreshold score LOC1a LOC1b LOC2a LOC2b
      1          1           1        AAA             AAA          0.875     1    11    21    31    41
      2          2           1        AAB             AAB          0.875     1    12    22    32    42
      3          3           1        AAC             AAC          0.875     1    13    23    33    43
      4          4           1        AAD             AAD          0.875     1    14    24   -99    44

---

    Code
      amHTML.amPairwise(get(obj), htmlFile = tmp)

---

    Code
      cat(sub("summary generated: </b><em>.+?</em>", "summary generated: </b><em>(date)</em>", gsub("(\\t| )+?(\\n|$)", "\\2", readLines(tmp, warn = FALSE), perl = TRUE), perl = TRUE), sep = "\n")
    Output
      <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
      
               <html xmlns='http://www.w3.org/1999/xhtml' xml:lang='en' lang='en'><head>
      
              <meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
      <title>allelematch: amPairwise() output</title><style type="text/css">
      
              html {
                  height: 100%;
              }
      
              body {
                  background-color: inherit;
                  color: inherit;
                  font-family: Verdana;
                  font-size: xx-small;
                  margin: 0;
                  height: 100%;
      
              }
      
              a:active {
                  color: #CC0000;
              }
      
              a:link {
                  color: #CC0000;
              }
      
              a:visited {
                  color: #CC0000;
              }
      
              .amMismatchAllele {
                  background-color: #CC0000;
                  color: white;
                  font-weight: bold;
              }
      
              .amMissingAllele {
                  background-color: #FFCCCC;
              }
      
              .amInterpolatedAllele {
                  background-color: blue;
                  color: white;
              }
      
              .amGrid {
                  border-collapse: separate;
              }
      
              .amGridContent {
                  padding: 0;
                  border: 1px solid #7EACB1;
              }
      
      
              .amGridUpperPanel, .amGridLowerPanel {
                  padding: 3px;
                  border-left: 0;
                  border-right: 0;
                  background-color: #F4FAFB;
                  color: #2A769D;
                  font-family: Verdana;
                  font-size: xx-small;
              }
      
              .amGridUpperPanel {
                  border-top: 0px;
                  border-bottom: 1px solid;
                  border-color: #7EACB1;
              }
      
              .amGridMiddlePanel {
                  border: 0;
              }
      
              .amGridLowerPanel {
                  border-top: 1px solid;
                  border-bottom: 0px;
                  border-color: #C2D4DA;
              }
      
              .amGridUpperPanel td, .amGridLowerPanel td {
                  color: #2A769D;
                  font-family: Verdana;
                  font-size: xx-small;
              }
      
      
              .amTable {
                  border: 0;
                  border-spacing: 0;
                  border-collapse: collapse;
                  empty-cells: show;
                  width: 100%;
                  font-family: Verdana;
                  font-size: xx-small;
              }
      
              .amTableSeparate {
                  border-collapse: separate;
              }
      
              .amTable td {
                  padding: 3px;
                  border-bottom: 1px solid;
                  border-top: 0px;
                  border-left: 0px;
                  border-right: 1px solid;
                  border-color: #C2D4DA;
                  white-space:nowrap;
              }
      
      
              .amTable .amTableHeader, .amTable .amTableHeader td {
                  background-color: #B7D8DC;
                  color: #000000;
                  border-bottom: 1px solid;
                  border-right: 1px solid;
                  border-color: #7EACB1;
                  background-repeat: repeat-x;
                  vertical-align: top;
                  white-space:nowrap;
              }
      
              .amPointer {
                  cursor: pointer;
              }
      
      
              .amTableHeaderBtn {
                  width: 100%;
                  font-family: Verdana;
                  font-size: xx-small;
              }
      
              .amTableHeader .amTableHeaderBtn td {
                  background: transparent;
                  padding: 0;
                  border: 0;
                  white-space: nowrap;
              }
      
              .amTableSelectRow {
                  background-color: #FFFF66;
                  color: #000000;
              }
      
      </style></head><body><div style="margin-left:5%; margin-right:5%"><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><div style="font-size:x-small;"><table><tr><td style="width:400px;"><span style="font-size:20px;">allelematch<br>pairwise analysis</span><br><br></td></tr>
      <tr><td><b>
      focal dataset N=</b><em>4</em></td></tr>
       <tr><td><b>focal dataset compared against itself</b><em></em></td></tr>
       <tr><td><b>missing data represented by: </b><em>-99</em></td></tr>
       <tr><td><b>alleleMismatch (m-hat; maximum number of mismatching alleles): </b><em>0.5</em></td></tr>
       <tr><td><b>matchThreshold (s-hat; lowest matching score returned): </b><em>0.875</em></td></tr>
       <tr><td><b>summary generated: </b><em>(date)</em></td></tr>
      </table></div></div></td></tr></table><br><br>
      <table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(1 of 4)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>AAA</div></td>
      <td class="amTableSelectRow"><div>11</div></td>
      <td class="amTableSelectRow"><div>21</div></td>
      <td class="amTableSelectRow"><div>31</div></td>
      <td class="amTableSelectRow"><div>41</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>AAA</div></td><td><div>11</div></td><td><div>21</div></td><td><div>31</div></td><td><div>41</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>1 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(2 of 4)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>AAB</div></td>
      <td class="amTableSelectRow"><div>12</div></td>
      <td class="amTableSelectRow"><div>22</div></td>
      <td class="amTableSelectRow"><div>32</div></td>
      <td class="amTableSelectRow"><div>42</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>AAB</div></td><td><div>12</div></td><td><div>22</div></td><td><div>32</div></td><td><div>42</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>1 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(3 of 4)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>AAC</div></td>
      <td class="amTableSelectRow"><div>13</div></td>
      <td class="amTableSelectRow"><div>23</div></td>
      <td class="amTableSelectRow"><div>33</div></td>
      <td class="amTableSelectRow"><div>43</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>AAC</div></td><td><div>13</div></td><td><div>23</div></td><td><div>33</div></td><td><div>43</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>1 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(4 of 4)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>AAD</div></td>
      <td class="amTableSelectRow"><div>14</div></td>
      <td class="amTableSelectRow"><div>24</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>44</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>AAD</div></td><td><div>14</div></td><td><div>24</div></td><td><div class="amMissingAllele">-99</div></td><td><div>44</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>1 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><span style="font-size:x-small;">Generated by allelematch:  an R package<br></span><span style="font-size:x-small;">To reference this analysis please use citation("allelematch")<br><br></span></div></body></html>

---

    Code
      paste("About to exercise", obj)
    Output
      [1] "About to exercise objExample5"

---

    Code
      summary.amPairwise(get(obj))
    Output
      allelematch
      pairwise analysis
      
      focal dataset N=20
      focal dataset compared against itself
      missing data represented by: -99
      missing data matching method: 2
      alleleMismatch (m-hat; maximum number of mismatching alleles): 0.5
      matchThreshold (s-hat; lowest matching score returned): 0.975
      
      score flags:
      *101 allele does not match
      +101 allele is missing
      
      (1 of 20)
                          LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1001.ON.CA     382   384   230   236  +-99  +-99   185   185   301   301   223   223   192   192   118   118   296   304    166    166      
      MATCH  1001.ON.CA     382   384   230   236  +-99  +-99   185   185   301   301   223   223   192   192   118   118   296   304    166    166     1
      1 perfect matches found.  0 partial matches found.
      
      
      (2 of 20)
                          LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1002.ON.CA     382   384   230   236  +-99  +-99   181   193   299   299   223   223   202   202   118   118   288   296    166    166      
      MATCH  1002.ON.CA     382   384   230   236  +-99  +-99   181   193   299   299   223   223   202   202   118   118   288   296    166    166     1
      1 perfect matches found.  0 partial matches found.
      
      
      (3 of 20)
                          LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1003.ON.CA     382   382   224   242  +-99  +-99   185   191   285   299   223   223   192   202   102   118   298   304    166    172      
      MATCH  1003.ON.CA     382   382   224   242  +-99  +-99   185   191   285   299   223   223   192   202   102   118   298   304    166    172     1
      MATCH  1005.ON.CA     382   382   224   242  +-99  +-99   185   191   285   299   223   223   192   202   102   118   298   304    166    172     1
      2 perfect matches found.  0 partial matches found.
      
      
      (4 of 20)
                          LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1004.ON.CA     382   384   232   236  +-99  +-99   193   193   299   301   223   223   192   216   102   108   296   304    168    174      
      MATCH  1004.ON.CA     382   384   232   236  +-99  +-99   193   193   299   301   223   223   192   216   102   108   296   304    168    174     1
      1 perfect matches found.  0 partial matches found.
      
      
      (5 of 20)
                          LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1005.ON.CA     382   382   224   242  +-99  +-99   185   191   285   299   223   223   192   202   102   118   298   304    166    172      
      MATCH  1003.ON.CA     382   382   224   242  +-99  +-99   185   191   285   299   223   223   192   202   102   118   298   304    166    172     1
      MATCH  1005.ON.CA     382   382   224   242  +-99  +-99   185   191   285   299   223   223   192   202   102   118   298   304    166    172     1
      2 perfect matches found.  0 partial matches found.
      
      
      (6 of 20)
                          LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1006.ON.CA     382   384   224   230  +-99  +-99   181   193   285   285   223   223   198   202   114   116   288   296    166    166      
      MATCH  1006.ON.CA     382   384   224   230  +-99  +-99   181   193   285   285   223   223   198   202   114   116   288   296    166    166     1
      MATCH  1007.ON.CA     382   384   224   230  +-99  +-99   181   193   285   285   223   223   198   202   114   116   288   296    166    166     1
      2 perfect matches found.  0 partial matches found.
      
      
      (7 of 20)
                          LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1007.ON.CA     382   384   224   230  +-99  +-99   181   193   285   285   223   223   198   202   114   116   288   296    166    166      
      MATCH  1006.ON.CA     382   384   224   230  +-99  +-99   181   193   285   285   223   223   198   202   114   116   288   296    166    166     1
      MATCH  1007.ON.CA     382   384   224   230  +-99  +-99   181   193   285   285   223   223   198   202   114   116   288   296    166    166     1
      2 perfect matches found.  0 partial matches found.
      
      
      (8 of 20)
                          LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1008.ON.CA     382   382   224   230  +-99  +-99   185   193   285   285   223   223   192   202   118   118   296   304    166    166      
      MATCH  1008.ON.CA     382   382   224   230  +-99  +-99   185   193   285   285   223   223   192   202   118   118   296   304    166    166     1
      MATCH  1009.ON.CA     382   382   224   230  +-99  +-99   185   193   285   285   223   223   192   202   118   118   296   304    166    166     1
      2 perfect matches found.  0 partial matches found.
      
      
      (9 of 20)
                          LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1009.ON.CA     382   382   224   230  +-99  +-99   185   193   285   285   223   223   192   202   118   118   296   304    166    166      
      MATCH  1008.ON.CA     382   382   224   230  +-99  +-99   185   193   285   285   223   223   192   202   118   118   296   304    166    166     1
      MATCH  1009.ON.CA     382   382   224   230  +-99  +-99   185   193   285   285   223   223   192   202   118   118   296   304    166    166     1
      2 perfect matches found.  0 partial matches found.
      
      
      (10 of 20)
                          LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1010.ON.CA     382   384   230   244  +-99  +-99   191   193   299   299   227   227   202   204   118   118   296   296    166    166      
      MATCH  1010.ON.CA     382   384   230   244  +-99  +-99   191   193   299   299   227   227   202   204   118   118   296   296    166    166     1
      1 perfect matches found.  0 partial matches found.
      
      
      (11 of 20)
                          LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1011.ON.CA     382   384   224   224  +-99  +-99   193   193   299   299   223   223   210   214   106   112   288   296    166    172      
      MATCH  1011.ON.CA     382   384   224   224  +-99  +-99   193   193   299   299   223   223   210   214   106   112   288   296    166    172     1
      MATCH  1012.ON.CA     382   384   224   224  +-99  +-99   193   193   299   299   223   223   210   214   106   112   288   296    166    172     1
      2 perfect matches found.  0 partial matches found.
      
      
      (12 of 20)
                          LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1012.ON.CA     382   384   224   224  +-99  +-99   193   193   299   299   223   223   210   214   106   112   288   296    166    172      
      MATCH  1011.ON.CA     382   384   224   224  +-99  +-99   193   193   299   299   223   223   210   214   106   112   288   296    166    172     1
      MATCH  1012.ON.CA     382   384   224   224  +-99  +-99   193   193   299   299   223   223   210   214   106   112   288   296    166    172     1
      2 perfect matches found.  0 partial matches found.
      
      
      (13 of 20)
                          LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1013.ON.CA     382   384   232   232  +-99  +-99   193   193   299   299   213   221   210   210   118   118   296   306    166    172      
      MATCH  1013.ON.CA     382   384   232   232  +-99  +-99   193   193   299   299   213   221   210   210   118   118   296   306    166    172     1
      1 perfect matches found.  0 partial matches found.
      
      
      (14 of 20)
                          LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1014.ON.CA     384   384   232   238  +-99  +-99   193   199   299   301   213   213   210   210   102   108   296   296    174    174      
      MATCH  1014.ON.CA     384   384   232   238  +-99  +-99   193   199   299   301   213   213   210   210   102   108   296   296    174    174     1
      1 perfect matches found.  0 partial matches found.
      
      
      (15 of 20)
                          LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1015.ON.CA     382   382   224   232  +-99  +-99   193   193   299   299   223   223   210   216   106   106   296   306    166    166      
      MATCH  1015.ON.CA     382   382   224   232  +-99  +-99   193   193   299   299   223   223   210   216   106   106   296   306    166    166     1
      1 perfect matches found.  0 partial matches found.
      
      
      (16 of 20)
                          LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1016.ON.CA     382   384   224   232  +-99  +-99   193   193  +-99  +-99   213   221   210   210   106   112   288   288    166    166      
      MATCH  1016.ON.CA     382   384   224   232  +-99  +-99   193   193  +-99  +-99   213   221   210   210   106   112   288   288    166    166     1
      1 perfect matches found.  0 partial matches found.
      
      
      (17 of 20)
                          LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1017.ON.CA     382   388   230   230  +-99  +-99   181   185   285   299   223   223   202   202   106   118   304   304    166    166      
      MATCH  1017.ON.CA     382   388   230   230  +-99  +-99   181   185   285   299   223   223   202   202   106   118   304   304    166    166     1
      1 perfect matches found.  0 partial matches found.
      
      
      (18 of 20)
                          LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1018.ON.CA     384   384   224   230  +-99  +-99   185   199   285   299   223   223   198   204   116   118   296   296    166    166      
      MATCH  1018.ON.CA     384   384   224   230  +-99  +-99   185   199   285   299   223   223   198   204   116   118   296   296    166    166     1
      1 perfect matches found.  0 partial matches found.
      
      
      (19 of 20)
                          LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1019.ON.CA     382   384   224   230   159   159   193   193   299   299   223   223   202   202   106   118   298   298    166    166      
      MATCH  1019.ON.CA     382   384   224   230   159   159   193   193   299   299   223   223   202   202   106   118   298   298    166    166     1
      1 perfect matches found.  0 partial matches found.
      
      
      (20 of 20)
                          LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1020.ON.CA     382   384   224   230   155   167   185   193   299   299   223   223   202   204   106   106   296   304    166    166      
      MATCH  1020.ON.CA     382   384   224   230   155   167   185   193   299   299   223   223   202   204   106   106   296   304    166    166     1
      1 perfect matches found.  0 partial matches found.
      
      

---

    Code
      amCSV.amPairwise(get(obj), csvFile = tmp)

---

    Code
      format(read.csv(tmp))
    Output
         matchGroup nMatchGroup focalIndex comparisonIndex matchThreshold score LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b
      1           1           1 1001.ON.CA      1001.ON.CA          0.975     1   382   384   230   236   -99   -99   185   185   301   301   223   223   192   192   118   118   296   304    166    166
      2           2           1 1002.ON.CA      1002.ON.CA          0.975     1   382   384   230   236   -99   -99   181   193   299   299   223   223   202   202   118   118   288   296    166    166
      3           3           2 1003.ON.CA      1003.ON.CA          0.975     1   382   382   224   242   -99   -99   185   191   285   299   223   223   192   202   102   118   298   304    166    172
      4           3           2 1003.ON.CA      1005.ON.CA          0.975     1   382   382   224   242   -99   -99   185   191   285   299   223   223   192   202   102   118   298   304    166    172
      5           4           1 1004.ON.CA      1004.ON.CA          0.975     1   382   384   232   236   -99   -99   193   193   299   301   223   223   192   216   102   108   296   304    168    174
      6           5           2 1005.ON.CA      1003.ON.CA          0.975     1   382   382   224   242   -99   -99   185   191   285   299   223   223   192   202   102   118   298   304    166    172
      7           5           2 1005.ON.CA      1005.ON.CA          0.975     1   382   382   224   242   -99   -99   185   191   285   299   223   223   192   202   102   118   298   304    166    172
      8           6           2 1006.ON.CA      1006.ON.CA          0.975     1   382   384   224   230   -99   -99   181   193   285   285   223   223   198   202   114   116   288   296    166    166
      9           6           2 1006.ON.CA      1007.ON.CA          0.975     1   382   384   224   230   -99   -99   181   193   285   285   223   223   198   202   114   116   288   296    166    166
      10          7           2 1007.ON.CA      1006.ON.CA          0.975     1   382   384   224   230   -99   -99   181   193   285   285   223   223   198   202   114   116   288   296    166    166
      11          7           2 1007.ON.CA      1007.ON.CA          0.975     1   382   384   224   230   -99   -99   181   193   285   285   223   223   198   202   114   116   288   296    166    166
      12          8           2 1008.ON.CA      1008.ON.CA          0.975     1   382   382   224   230   -99   -99   185   193   285   285   223   223   192   202   118   118   296   304    166    166
      13          8           2 1008.ON.CA      1009.ON.CA          0.975     1   382   382   224   230   -99   -99   185   193   285   285   223   223   192   202   118   118   296   304    166    166
      14          9           2 1009.ON.CA      1008.ON.CA          0.975     1   382   382   224   230   -99   -99   185   193   285   285   223   223   192   202   118   118   296   304    166    166
      15          9           2 1009.ON.CA      1009.ON.CA          0.975     1   382   382   224   230   -99   -99   185   193   285   285   223   223   192   202   118   118   296   304    166    166
      16         10           1 1010.ON.CA      1010.ON.CA          0.975     1   382   384   230   244   -99   -99   191   193   299   299   227   227   202   204   118   118   296   296    166    166
      17         11           2 1011.ON.CA      1011.ON.CA          0.975     1   382   384   224   224   -99   -99   193   193   299   299   223   223   210   214   106   112   288   296    166    172
      18         11           2 1011.ON.CA      1012.ON.CA          0.975     1   382   384   224   224   -99   -99   193   193   299   299   223   223   210   214   106   112   288   296    166    172
      19         12           2 1012.ON.CA      1011.ON.CA          0.975     1   382   384   224   224   -99   -99   193   193   299   299   223   223   210   214   106   112   288   296    166    172
      20         12           2 1012.ON.CA      1012.ON.CA          0.975     1   382   384   224   224   -99   -99   193   193   299   299   223   223   210   214   106   112   288   296    166    172
      21         13           1 1013.ON.CA      1013.ON.CA          0.975     1   382   384   232   232   -99   -99   193   193   299   299   213   221   210   210   118   118   296   306    166    172
      22         14           1 1014.ON.CA      1014.ON.CA          0.975     1   384   384   232   238   -99   -99   193   199   299   301   213   213   210   210   102   108   296   296    174    174
      23         15           1 1015.ON.CA      1015.ON.CA          0.975     1   382   382   224   232   -99   -99   193   193   299   299   223   223   210   216   106   106   296   306    166    166
      24         16           1 1016.ON.CA      1016.ON.CA          0.975     1   382   384   224   232   -99   -99   193   193   -99   -99   213   221   210   210   106   112   288   288    166    166
      25         17           1 1017.ON.CA      1017.ON.CA          0.975     1   382   388   230   230   -99   -99   181   185   285   299   223   223   202   202   106   118   304   304    166    166
      26         18           1 1018.ON.CA      1018.ON.CA          0.975     1   384   384   224   230   -99   -99   185   199   285   299   223   223   198   204   116   118   296   296    166    166
      27         19           1 1019.ON.CA      1019.ON.CA          0.975     1   382   384   224   230   159   159   193   193   299   299   223   223   202   202   106   118   298   298    166    166
      28         20           1 1020.ON.CA      1020.ON.CA          0.975     1   382   384   224   230   155   167   185   193   299   299   223   223   202   204   106   106   296   304    166    166

---

    Code
      amHTML.amPairwise(get(obj), htmlFile = tmp)

---

    Code
      cat(sub("summary generated: </b><em>.+?</em>", "summary generated: </b><em>(date)</em>", gsub("(\\t| )+?(\\n|$)", "\\2", readLines(tmp, warn = FALSE), perl = TRUE), perl = TRUE), sep = "\n")
    Output
      <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
      
               <html xmlns='http://www.w3.org/1999/xhtml' xml:lang='en' lang='en'><head>
      
              <meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
      <title>allelematch: amPairwise() output</title><style type="text/css">
      
              html {
                  height: 100%;
              }
      
              body {
                  background-color: inherit;
                  color: inherit;
                  font-family: Verdana;
                  font-size: xx-small;
                  margin: 0;
                  height: 100%;
      
              }
      
              a:active {
                  color: #CC0000;
              }
      
              a:link {
                  color: #CC0000;
              }
      
              a:visited {
                  color: #CC0000;
              }
      
              .amMismatchAllele {
                  background-color: #CC0000;
                  color: white;
                  font-weight: bold;
              }
      
              .amMissingAllele {
                  background-color: #FFCCCC;
              }
      
              .amInterpolatedAllele {
                  background-color: blue;
                  color: white;
              }
      
              .amGrid {
                  border-collapse: separate;
              }
      
              .amGridContent {
                  padding: 0;
                  border: 1px solid #7EACB1;
              }
      
      
              .amGridUpperPanel, .amGridLowerPanel {
                  padding: 3px;
                  border-left: 0;
                  border-right: 0;
                  background-color: #F4FAFB;
                  color: #2A769D;
                  font-family: Verdana;
                  font-size: xx-small;
              }
      
              .amGridUpperPanel {
                  border-top: 0px;
                  border-bottom: 1px solid;
                  border-color: #7EACB1;
              }
      
              .amGridMiddlePanel {
                  border: 0;
              }
      
              .amGridLowerPanel {
                  border-top: 1px solid;
                  border-bottom: 0px;
                  border-color: #C2D4DA;
              }
      
              .amGridUpperPanel td, .amGridLowerPanel td {
                  color: #2A769D;
                  font-family: Verdana;
                  font-size: xx-small;
              }
      
      
              .amTable {
                  border: 0;
                  border-spacing: 0;
                  border-collapse: collapse;
                  empty-cells: show;
                  width: 100%;
                  font-family: Verdana;
                  font-size: xx-small;
              }
      
              .amTableSeparate {
                  border-collapse: separate;
              }
      
              .amTable td {
                  padding: 3px;
                  border-bottom: 1px solid;
                  border-top: 0px;
                  border-left: 0px;
                  border-right: 1px solid;
                  border-color: #C2D4DA;
                  white-space:nowrap;
              }
      
      
              .amTable .amTableHeader, .amTable .amTableHeader td {
                  background-color: #B7D8DC;
                  color: #000000;
                  border-bottom: 1px solid;
                  border-right: 1px solid;
                  border-color: #7EACB1;
                  background-repeat: repeat-x;
                  vertical-align: top;
                  white-space:nowrap;
              }
      
              .amPointer {
                  cursor: pointer;
              }
      
      
              .amTableHeaderBtn {
                  width: 100%;
                  font-family: Verdana;
                  font-size: xx-small;
              }
      
              .amTableHeader .amTableHeaderBtn td {
                  background: transparent;
                  padding: 0;
                  border: 0;
                  white-space: nowrap;
              }
      
              .amTableSelectRow {
                  background-color: #FFFF66;
                  color: #000000;
              }
      
      </style></head><body><div style="margin-left:5%; margin-right:5%"><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><div style="font-size:x-small;"><table><tr><td style="width:400px;"><span style="font-size:20px;">allelematch<br>pairwise analysis</span><br><br></td></tr>
      <tr><td><b>
      focal dataset N=</b><em>20</em></td></tr>
       <tr><td><b>focal dataset compared against itself</b><em></em></td></tr>
       <tr><td><b>missing data represented by: </b><em>-99</em></td></tr>
       <tr><td><b>alleleMismatch (m-hat; maximum number of mismatching alleles): </b><em>0.5</em></td></tr>
       <tr><td><b>matchThreshold (s-hat; lowest matching score returned): </b><em>0.975</em></td></tr>
       <tr><td><b>summary generated: </b><em>(date)</em></td></tr>
      </table></div></div></td></tr></table><br><br>
      <table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(1 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1001.ON.CA</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>236</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>301</div></td>
      <td class="amTableSelectRow"><div>301</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>192</div></td>
      <td class="amTableSelectRow"><div>192</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1001.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div>230</div></td><td><div>236</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div>185</div></td><td><div>301</div></td><td><div>301</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>192</div></td><td><div>118</div></td><td><div>118</div></td><td><div>296</div></td><td><div>304</div></td><td><div>166</div></td><td><div>166</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>1 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(2 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1002.ON.CA</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>236</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>181</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>288</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1002.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div>230</div></td><td><div>236</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>181</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>202</div></td><td><div>202</div></td><td><div>118</div></td><td><div>118</div></td><td><div>288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>1 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(3 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1003.ON.CA</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>242</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>191</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>192</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>102</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>298</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>172</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1003.ON.CA</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div>242</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div>191</div></td><td><div>285</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>202</div></td><td><div>102</div></td><td><div>118</div></td><td><div>298</div></td><td><div>304</div></td><td><div>166</div></td><td><div>172</div></td><td><div>1</div></td> </tr>
      <tr><td><div>1005.ON.CA</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div>242</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div>191</div></td><td><div>285</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>202</div></td><td><div>102</div></td><td><div>118</div></td><td><div>298</div></td><td><div>304</div></td><td><div>166</div></td><td><div>172</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>2 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(4 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1004.ON.CA</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>232</div></td>
      <td class="amTableSelectRow"><div>236</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>301</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>192</div></td>
      <td class="amTableSelectRow"><div>216</div></td>
      <td class="amTableSelectRow"><div>102</div></td>
      <td class="amTableSelectRow"><div>108</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>168</div></td>
      <td class="amTableSelectRow"><div>174</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1004.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div>232</div></td><td><div>236</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>301</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>216</div></td><td><div>102</div></td><td><div>108</div></td><td><div>296</div></td><td><div>304</div></td><td><div>168</div></td><td><div>174</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>1 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(5 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1005.ON.CA</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>242</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>191</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>192</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>102</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>298</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>172</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1003.ON.CA</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div>242</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div>191</div></td><td><div>285</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>202</div></td><td><div>102</div></td><td><div>118</div></td><td><div>298</div></td><td><div>304</div></td><td><div>166</div></td><td><div>172</div></td><td><div>1</div></td> </tr>
      <tr><td><div>1005.ON.CA</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div>242</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div>191</div></td><td><div>285</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>202</div></td><td><div>102</div></td><td><div>118</div></td><td><div>298</div></td><td><div>304</div></td><td><div>166</div></td><td><div>172</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>2 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(6 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1006.ON.CA</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>181</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>198</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>114</div></td>
      <td class="amTableSelectRow"><div>116</div></td>
      <td class="amTableSelectRow"><div>288</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1006.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>181</div></td><td><div>193</div></td><td><div>285</div></td><td><div>285</div></td><td><div>223</div></td><td><div>223</div></td><td><div>198</div></td><td><div>202</div></td><td><div>114</div></td><td><div>116</div></td><td><div>288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>1</div></td> </tr>
      <tr><td><div>1007.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>181</div></td><td><div>193</div></td><td><div>285</div></td><td><div>285</div></td><td><div>223</div></td><td><div>223</div></td><td><div>198</div></td><td><div>202</div></td><td><div>114</div></td><td><div>116</div></td><td><div>288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>2 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(7 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1007.ON.CA</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>181</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>198</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>114</div></td>
      <td class="amTableSelectRow"><div>116</div></td>
      <td class="amTableSelectRow"><div>288</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1006.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>181</div></td><td><div>193</div></td><td><div>285</div></td><td><div>285</div></td><td><div>223</div></td><td><div>223</div></td><td><div>198</div></td><td><div>202</div></td><td><div>114</div></td><td><div>116</div></td><td><div>288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>1</div></td> </tr>
      <tr><td><div>1007.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>181</div></td><td><div>193</div></td><td><div>285</div></td><td><div>285</div></td><td><div>223</div></td><td><div>223</div></td><td><div>198</div></td><td><div>202</div></td><td><div>114</div></td><td><div>116</div></td><td><div>288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>2 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(8 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1008.ON.CA</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>192</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1008.ON.CA</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div>230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div>193</div></td><td><div>285</div></td><td><div>285</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>202</div></td><td><div>118</div></td><td><div>118</div></td><td><div>296</div></td><td><div>304</div></td><td><div>166</div></td><td><div>166</div></td><td><div>1</div></td> </tr>
      <tr><td><div>1009.ON.CA</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div>230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div>193</div></td><td><div>285</div></td><td><div>285</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>202</div></td><td><div>118</div></td><td><div>118</div></td><td><div>296</div></td><td><div>304</div></td><td><div>166</div></td><td><div>166</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>2 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(9 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1009.ON.CA</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>192</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1008.ON.CA</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div>230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div>193</div></td><td><div>285</div></td><td><div>285</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>202</div></td><td><div>118</div></td><td><div>118</div></td><td><div>296</div></td><td><div>304</div></td><td><div>166</div></td><td><div>166</div></td><td><div>1</div></td> </tr>
      <tr><td><div>1009.ON.CA</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div>230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div>193</div></td><td><div>285</div></td><td><div>285</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>202</div></td><td><div>118</div></td><td><div>118</div></td><td><div>296</div></td><td><div>304</div></td><td><div>166</div></td><td><div>166</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>2 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(10 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1010.ON.CA</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>244</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>191</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>227</div></td>
      <td class="amTableSelectRow"><div>227</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>204</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1010.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div>230</div></td><td><div>244</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>191</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>227</div></td><td><div>227</div></td><td><div>202</div></td><td><div>204</div></td><td><div>118</div></td><td><div>118</div></td><td><div>296</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>1 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(11 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1011.ON.CA</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>214</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>112</div></td>
      <td class="amTableSelectRow"><div>288</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>172</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1011.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>224</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>210</div></td><td><div>214</div></td><td><div>106</div></td><td><div>112</div></td><td><div>288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>172</div></td><td><div>1</div></td> </tr>
      <tr><td><div>1012.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>224</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>210</div></td><td><div>214</div></td><td><div>106</div></td><td><div>112</div></td><td><div>288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>172</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>2 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(12 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1012.ON.CA</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>214</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>112</div></td>
      <td class="amTableSelectRow"><div>288</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>172</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1011.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>224</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>210</div></td><td><div>214</div></td><td><div>106</div></td><td><div>112</div></td><td><div>288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>172</div></td><td><div>1</div></td> </tr>
      <tr><td><div>1012.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>224</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>210</div></td><td><div>214</div></td><td><div>106</div></td><td><div>112</div></td><td><div>288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>172</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>2 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(13 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1013.ON.CA</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>232</div></td>
      <td class="amTableSelectRow"><div>232</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>213</div></td>
      <td class="amTableSelectRow"><div>221</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>306</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>172</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1013.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div>232</div></td><td><div>232</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>213</div></td><td><div>221</div></td><td><div>210</div></td><td><div>210</div></td><td><div>118</div></td><td><div>118</div></td><td><div>296</div></td><td><div>306</div></td><td><div>166</div></td><td><div>172</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>1 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(14 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1014.ON.CA</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>232</div></td>
      <td class="amTableSelectRow"><div>238</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>199</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>301</div></td>
      <td class="amTableSelectRow"><div>213</div></td>
      <td class="amTableSelectRow"><div>213</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>102</div></td>
      <td class="amTableSelectRow"><div>108</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>174</div></td>
      <td class="amTableSelectRow"><div>174</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1014.ON.CA</div></td><td><div>384</div></td><td><div>384</div></td><td><div>232</div></td><td><div>238</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>199</div></td><td><div>299</div></td><td><div>301</div></td><td><div>213</div></td><td><div>213</div></td><td><div>210</div></td><td><div>210</div></td><td><div>102</div></td><td><div>108</div></td><td><div>296</div></td><td><div>296</div></td><td><div>174</div></td><td><div>174</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>1 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(15 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1015.ON.CA</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>232</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>216</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>306</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1015.ON.CA</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div>232</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>210</div></td><td><div>216</div></td><td><div>106</div></td><td><div>106</div></td><td><div>296</div></td><td><div>306</div></td><td><div>166</div></td><td><div>166</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>1 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(16 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1016.ON.CA</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>232</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>213</div></td>
      <td class="amTableSelectRow"><div>221</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>112</div></td>
      <td class="amTableSelectRow"><div>288</div></td>
      <td class="amTableSelectRow"><div>288</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1016.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>232</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>213</div></td><td><div>221</div></td><td><div>210</div></td><td><div>210</div></td><td><div>106</div></td><td><div>112</div></td><td><div>288</div></td><td><div>288</div></td><td><div>166</div></td><td><div>166</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>1 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(17 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1017.ON.CA</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>388</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>181</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1017.ON.CA</div></td><td><div>382</div></td><td><div>388</div></td><td><div>230</div></td><td><div>230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>181</div></td><td><div>185</div></td><td><div>285</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>202</div></td><td><div>202</div></td><td><div>106</div></td><td><div>118</div></td><td><div>304</div></td><td><div>304</div></td><td><div>166</div></td><td><div>166</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>1 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(18 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1018.ON.CA</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>199</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>198</div></td>
      <td class="amTableSelectRow"><div>204</div></td>
      <td class="amTableSelectRow"><div>116</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1018.ON.CA</div></td><td><div>384</div></td><td><div>384</div></td><td><div>224</div></td><td><div>230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div>199</div></td><td><div>285</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>198</div></td><td><div>204</div></td><td><div>116</div></td><td><div>118</div></td><td><div>296</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>1 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(19 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1019.ON.CA</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>159</div></td>
      <td class="amTableSelectRow"><div>159</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>298</div></td>
      <td class="amTableSelectRow"><div>298</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1019.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>230</div></td><td><div>159</div></td><td><div>159</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>202</div></td><td><div>202</div></td><td><div>106</div></td><td><div>118</div></td><td><div>298</div></td><td><div>298</div></td><td><div>166</div></td><td><div>166</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>1 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(20 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1020.ON.CA</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>155</div></td>
      <td class="amTableSelectRow"><div>167</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>204</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1020.ON.CA</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>230</div></td><td><div>155</div></td><td><div>167</div></td><td><div>185</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>202</div></td><td><div>204</div></td><td><div>106</div></td><td><div>106</div></td><td><div>296</div></td><td><div>304</div></td><td><div>166</div></td><td><div>166</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>1 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><span style="font-size:x-small;">Generated by allelematch:  an R package<br></span><span style="font-size:x-small;">To reference this analysis please use citation("allelematch")<br><br></span></div></body></html>

---

    Code
      paste("About to exercise", obj)
    Output
      [1] "About to exercise objExample5b"

---

    Code
      summary.amPairwise(get(obj))
    Output
      allelematch
      pairwise analysis
      
      focal dataset N=20
      focal dataset compared against itself
      missing data represented by: -99
      missing data matching method: 2
      alleleMismatch (m-hat; maximum number of mismatching alleles): 0.5
      matchThreshold (s-hat; lowest matching score returned): 0.9772727
      
      score flags:
      *101 allele does not match
      +101 allele is missing
      
      (1 of 20)
                                   samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1001.ON.CA   SiouxLookout-Jan-2004      F   382   384   230   236  +-99  +-99   185   185   301   301   223   223   192   192   118   118   296   304    166    166      
      MATCH  1001.ON.CA   SiouxLookout-Jan-2004      F   382   384   230   236  +-99  +-99   185   185   301   301   223   223   192   192   118   118   296   304    166    166     1
      1 perfect matches found.  0 partial matches found.
      
      
      (2 of 20)
                                   samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1002.ON.CA   SiouxLookout-Jan-2004      F   382   384   230   236  +-99  +-99   181   193   299   299   223   223   202   202   118   118   288   296    166    166      
      MATCH  1002.ON.CA   SiouxLookout-Jan-2004      F   382   384   230   236  +-99  +-99   181   193   299   299   223   223   202   202   118   118   288   296    166    166     1
      1 perfect matches found.  0 partial matches found.
      
      
      (3 of 20)
                                   samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1003.ON.CA   SiouxLookout-Jan-2004      M   382   382   224   242  +-99  +-99   185   191   285   299   223   223   192   202   102   118   298   304    166    172      
      MATCH  1003.ON.CA   SiouxLookout-Jan-2004      M   382   382   224   242  +-99  +-99   185   191   285   299   223   223   192   202   102   118   298   304    166    172     1
      MATCH  1005.ON.CA   SiouxLookout-Jan-2004      M   382   382   224   242  +-99  +-99   185   191   285   299   223   223   192   202   102   118   298   304    166    172     1
      2 perfect matches found.  0 partial matches found.
      
      
      (4 of 20)
                                   samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1004.ON.CA   SiouxLookout-Jan-2004      M   382   384   232   236  +-99  +-99   193   193   299   301   223   223   192   216   102   108   296   304    168    174      
      MATCH  1004.ON.CA   SiouxLookout-Jan-2004      M   382   384   232   236  +-99  +-99   193   193   299   301   223   223   192   216   102   108   296   304    168    174     1
      1 perfect matches found.  0 partial matches found.
      
      
      (5 of 20)
                                   samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1005.ON.CA   SiouxLookout-Jan-2004      M   382   382   224   242  +-99  +-99   185   191   285   299   223   223   192   202   102   118   298   304    166    172      
      MATCH  1003.ON.CA   SiouxLookout-Jan-2004      M   382   382   224   242  +-99  +-99   185   191   285   299   223   223   192   202   102   118   298   304    166    172     1
      MATCH  1005.ON.CA   SiouxLookout-Jan-2004      M   382   382   224   242  +-99  +-99   185   191   285   299   223   223   192   202   102   118   298   304    166    172     1
      2 perfect matches found.  0 partial matches found.
      
      
      (6 of 20)
                                   samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1006.ON.CA   SiouxLookout-Jan-2004      F   382   384   224   230  +-99  +-99   181   193   285   285   223   223   198   202   114   116   288   296    166    166      
      MATCH  1006.ON.CA   SiouxLookout-Jan-2004      F   382   384   224   230  +-99  +-99   181   193   285   285   223   223   198   202   114   116   288   296    166    166     1
      MATCH  1007.ON.CA   SiouxLookout-Jan-2004      F   382   384   224   230  +-99  +-99   181   193   285   285   223   223   198   202   114   116   288   296    166    166     1
      2 perfect matches found.  0 partial matches found.
      
      
      (7 of 20)
                                   samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1007.ON.CA   SiouxLookout-Jan-2004      F   382   384   224   230  +-99  +-99   181   193   285   285   223   223   198   202   114   116   288   296    166    166      
      MATCH  1006.ON.CA   SiouxLookout-Jan-2004      F   382   384   224   230  +-99  +-99   181   193   285   285   223   223   198   202   114   116   288   296    166    166     1
      MATCH  1007.ON.CA   SiouxLookout-Jan-2004      F   382   384   224   230  +-99  +-99   181   193   285   285   223   223   198   202   114   116   288   296    166    166     1
      2 perfect matches found.  0 partial matches found.
      
      
      (8 of 20)
                                   samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1008.ON.CA   SiouxLookout-Jan-2004      M   382   382   224   230  +-99  +-99   185   193   285   285   223   223   192   202   118   118   296   304    166    166      
      MATCH  1008.ON.CA   SiouxLookout-Jan-2004      M   382   382   224   230  +-99  +-99   185   193   285   285   223   223   192   202   118   118   296   304    166    166     1
      MATCH  1009.ON.CA   SiouxLookout-Jan-2004      M   382   382   224   230  +-99  +-99   185   193   285   285   223   223   192   202   118   118   296   304    166    166     1
      2 perfect matches found.  0 partial matches found.
      
      
      (9 of 20)
                                   samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1009.ON.CA   SiouxLookout-Jan-2004      M   382   382   224   230  +-99  +-99   185   193   285   285   223   223   192   202   118   118   296   304    166    166      
      MATCH  1008.ON.CA   SiouxLookout-Jan-2004      M   382   382   224   230  +-99  +-99   185   193   285   285   223   223   192   202   118   118   296   304    166    166     1
      MATCH  1009.ON.CA   SiouxLookout-Jan-2004      M   382   382   224   230  +-99  +-99   185   193   285   285   223   223   192   202   118   118   296   304    166    166     1
      2 perfect matches found.  0 partial matches found.
      
      
      (10 of 20)
                                   samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1010.ON.CA   SiouxLookout-Jan-2004   +-99   382   384   230   244  +-99  +-99   191   193   299   299   227   227   202   204   118   118   296   296    166    166      
      MATCH  1010.ON.CA   SiouxLookout-Jan-2004   +-99   382   384   230   244  +-99  +-99   191   193   299   299   227   227   202   204   118   118   296   296    166    166     1
      1 perfect matches found.  0 partial matches found.
      
      
      (11 of 20)
                                   samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1011.ON.CA   SiouxLookout-Jan-2004      F   382   384   224   224  +-99  +-99   193   193   299   299   223   223   210   214   106   112   288   296    166    172      
      MATCH  1011.ON.CA   SiouxLookout-Jan-2004      F   382   384   224   224  +-99  +-99   193   193   299   299   223   223   210   214   106   112   288   296    166    172     1
      MATCH  1012.ON.CA   SiouxLookout-Jan-2004      F   382   384   224   224  +-99  +-99   193   193   299   299   223   223   210   214   106   112   288   296    166    172     1
      2 perfect matches found.  0 partial matches found.
      
      
      (12 of 20)
                                   samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1012.ON.CA   SiouxLookout-Jan-2004      F   382   384   224   224  +-99  +-99   193   193   299   299   223   223   210   214   106   112   288   296    166    172      
      MATCH  1011.ON.CA   SiouxLookout-Jan-2004      F   382   384   224   224  +-99  +-99   193   193   299   299   223   223   210   214   106   112   288   296    166    172     1
      MATCH  1012.ON.CA   SiouxLookout-Jan-2004      F   382   384   224   224  +-99  +-99   193   193   299   299   223   223   210   214   106   112   288   296    166    172     1
      2 perfect matches found.  0 partial matches found.
      
      
      (13 of 20)
                                   samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1013.ON.CA   SiouxLookout-Jan-2004      M   382   384   232   232  +-99  +-99   193   193   299   299   213   221   210   210   118   118   296   306    166    172      
      MATCH  1013.ON.CA   SiouxLookout-Jan-2004      M   382   384   232   232  +-99  +-99   193   193   299   299   213   221   210   210   118   118   296   306    166    172     1
      1 perfect matches found.  0 partial matches found.
      
      
      (14 of 20)
                                   samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1014.ON.CA   SiouxLookout-Jan-2004      F   384   384   232   238  +-99  +-99   193   199   299   301   213   213   210   210   102   108   296   296    174    174      
      MATCH  1014.ON.CA   SiouxLookout-Jan-2004      F   384   384   232   238  +-99  +-99   193   199   299   301   213   213   210   210   102   108   296   296    174    174     1
      1 perfect matches found.  0 partial matches found.
      
      
      (15 of 20)
                                   samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1015.ON.CA   SiouxLookout-Jan-2004      F   382   382   224   232  +-99  +-99   193   193   299   299   223   223   210   216   106   106   296   306    166    166      
      MATCH  1015.ON.CA   SiouxLookout-Jan-2004      F   382   382   224   232  +-99  +-99   193   193   299   299   223   223   210   216   106   106   296   306    166    166     1
      1 perfect matches found.  0 partial matches found.
      
      
      (16 of 20)
                                   samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1016.ON.CA   SiouxLookout-Jan-2004      M   382   384   224   232  +-99  +-99   193   193  +-99  +-99   213   221   210   210   106   112   288   288    166    166      
      MATCH  1016.ON.CA   SiouxLookout-Jan-2004      M   382   384   224   232  +-99  +-99   193   193  +-99  +-99   213   221   210   210   106   112   288   288    166    166     1
      1 perfect matches found.  0 partial matches found.
      
      
      (17 of 20)
                                   samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1017.ON.CA   SiouxLookout-Jan-2004      F   382   388   230   230  +-99  +-99   181   185   285   299   223   223   202   202   106   118   304   304    166    166      
      MATCH  1017.ON.CA   SiouxLookout-Jan-2004      F   382   388   230   230  +-99  +-99   181   185   285   299   223   223   202   202   106   118   304   304    166    166     1
      1 perfect matches found.  0 partial matches found.
      
      
      (18 of 20)
                                   samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1018.ON.CA   SiouxLookout-Jan-2004      F   384   384   224   230  +-99  +-99   185   199   285   299   223   223   198   204   116   118   296   296    166    166      
      MATCH  1018.ON.CA   SiouxLookout-Jan-2004      F   384   384   224   230  +-99  +-99   185   199   285   299   223   223   198   204   116   118   296   296    166    166     1
      1 perfect matches found.  0 partial matches found.
      
      
      (19 of 20)
                                   samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1019.ON.CA   SiouxLookout-Jan-2004      F   382   384   224   230   159   159   193   193   299   299   223   223   202   202   106   118   298   298    166    166      
      MATCH  1019.ON.CA   SiouxLookout-Jan-2004      F   382   384   224   230   159   159   193   193   299   299   223   223   202   202   106   118   298   298    166    166     1
      1 perfect matches found.  0 partial matches found.
      
      
      (20 of 20)
                                   samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b LOC9a LOC9b LOC10a LOC10b score
      FOCAL  1020.ON.CA   SiouxLookout-Jan-2004      F   382   384   224   230   155   167   185   193   299   299   223   223   202   204   106   106   296   304    166    166      
      MATCH  1020.ON.CA   SiouxLookout-Jan-2004      F   382   384   224   230   155   167   185   193   299   299   223   223   202   204   106   106   296   304    166    166     1
      1 perfect matches found.  0 partial matches found.
      
      

---

    Code
      amCSV.amPairwise(get(obj), csvFile = tmp)

---

    Code
      format(read.csv(tmp))
    Output
         matchGroup nMatchGroup focalIndex comparisonIndex matchThreshold score          samplingData gender LOC1a LOC1b LOC2a LOC2b LOC3a LOC3b LOC4a LOC4b LOC5a LOC5b LOC6a LOC6b LOC7a LOC7b LOC8a LOC8b
      1           1           1 1001.ON.CA      1001.ON.CA      0.9772727     1 SiouxLookout-Jan-2004      F   382   384   230   236   -99   -99   185   185   301   301   223   223   192   192   118   118
      2           2           1 1002.ON.CA      1002.ON.CA      0.9772727     1 SiouxLookout-Jan-2004      F   382   384   230   236   -99   -99   181   193   299   299   223   223   202   202   118   118
      3           3           2 1003.ON.CA      1003.ON.CA      0.9772727     1 SiouxLookout-Jan-2004      M   382   382   224   242   -99   -99   185   191   285   299   223   223   192   202   102   118
      4           3           2 1003.ON.CA      1005.ON.CA      0.9772727     1 SiouxLookout-Jan-2004      M   382   382   224   242   -99   -99   185   191   285   299   223   223   192   202   102   118
      5           4           1 1004.ON.CA      1004.ON.CA      0.9772727     1 SiouxLookout-Jan-2004      M   382   384   232   236   -99   -99   193   193   299   301   223   223   192   216   102   108
      6           5           2 1005.ON.CA      1003.ON.CA      0.9772727     1 SiouxLookout-Jan-2004      M   382   382   224   242   -99   -99   185   191   285   299   223   223   192   202   102   118
      7           5           2 1005.ON.CA      1005.ON.CA      0.9772727     1 SiouxLookout-Jan-2004      M   382   382   224   242   -99   -99   185   191   285   299   223   223   192   202   102   118
      8           6           2 1006.ON.CA      1006.ON.CA      0.9772727     1 SiouxLookout-Jan-2004      F   382   384   224   230   -99   -99   181   193   285   285   223   223   198   202   114   116
      9           6           2 1006.ON.CA      1007.ON.CA      0.9772727     1 SiouxLookout-Jan-2004      F   382   384   224   230   -99   -99   181   193   285   285   223   223   198   202   114   116
      10          7           2 1007.ON.CA      1006.ON.CA      0.9772727     1 SiouxLookout-Jan-2004      F   382   384   224   230   -99   -99   181   193   285   285   223   223   198   202   114   116
      11          7           2 1007.ON.CA      1007.ON.CA      0.9772727     1 SiouxLookout-Jan-2004      F   382   384   224   230   -99   -99   181   193   285   285   223   223   198   202   114   116
      12          8           2 1008.ON.CA      1008.ON.CA      0.9772727     1 SiouxLookout-Jan-2004      M   382   382   224   230   -99   -99   185   193   285   285   223   223   192   202   118   118
      13          8           2 1008.ON.CA      1009.ON.CA      0.9772727     1 SiouxLookout-Jan-2004      M   382   382   224   230   -99   -99   185   193   285   285   223   223   192   202   118   118
      14          9           2 1009.ON.CA      1008.ON.CA      0.9772727     1 SiouxLookout-Jan-2004      M   382   382   224   230   -99   -99   185   193   285   285   223   223   192   202   118   118
      15          9           2 1009.ON.CA      1009.ON.CA      0.9772727     1 SiouxLookout-Jan-2004      M   382   382   224   230   -99   -99   185   193   285   285   223   223   192   202   118   118
      16         10           1 1010.ON.CA      1010.ON.CA      0.9772727     1 SiouxLookout-Jan-2004    -99   382   384   230   244   -99   -99   191   193   299   299   227   227   202   204   118   118
      17         11           2 1011.ON.CA      1011.ON.CA      0.9772727     1 SiouxLookout-Jan-2004      F   382   384   224   224   -99   -99   193   193   299   299   223   223   210   214   106   112
      18         11           2 1011.ON.CA      1012.ON.CA      0.9772727     1 SiouxLookout-Jan-2004      F   382   384   224   224   -99   -99   193   193   299   299   223   223   210   214   106   112
      19         12           2 1012.ON.CA      1011.ON.CA      0.9772727     1 SiouxLookout-Jan-2004      F   382   384   224   224   -99   -99   193   193   299   299   223   223   210   214   106   112
      20         12           2 1012.ON.CA      1012.ON.CA      0.9772727     1 SiouxLookout-Jan-2004      F   382   384   224   224   -99   -99   193   193   299   299   223   223   210   214   106   112
      21         13           1 1013.ON.CA      1013.ON.CA      0.9772727     1 SiouxLookout-Jan-2004      M   382   384   232   232   -99   -99   193   193   299   299   213   221   210   210   118   118
      22         14           1 1014.ON.CA      1014.ON.CA      0.9772727     1 SiouxLookout-Jan-2004      F   384   384   232   238   -99   -99   193   199   299   301   213   213   210   210   102   108
      23         15           1 1015.ON.CA      1015.ON.CA      0.9772727     1 SiouxLookout-Jan-2004      F   382   382   224   232   -99   -99   193   193   299   299   223   223   210   216   106   106
      24         16           1 1016.ON.CA      1016.ON.CA      0.9772727     1 SiouxLookout-Jan-2004      M   382   384   224   232   -99   -99   193   193   -99   -99   213   221   210   210   106   112
      25         17           1 1017.ON.CA      1017.ON.CA      0.9772727     1 SiouxLookout-Jan-2004      F   382   388   230   230   -99   -99   181   185   285   299   223   223   202   202   106   118
      26         18           1 1018.ON.CA      1018.ON.CA      0.9772727     1 SiouxLookout-Jan-2004      F   384   384   224   230   -99   -99   185   199   285   299   223   223   198   204   116   118
      27         19           1 1019.ON.CA      1019.ON.CA      0.9772727     1 SiouxLookout-Jan-2004      F   382   384   224   230   159   159   193   193   299   299   223   223   202   202   106   118
      28         20           1 1020.ON.CA      1020.ON.CA      0.9772727     1 SiouxLookout-Jan-2004      F   382   384   224   230   155   167   185   193   299   299   223   223   202   204   106   106
         LOC9a LOC9b LOC10a LOC10b
      1    296   304    166    166
      2    288   296    166    166
      3    298   304    166    172
      4    298   304    166    172
      5    296   304    168    174
      6    298   304    166    172
      7    298   304    166    172
      8    288   296    166    166
      9    288   296    166    166
      10   288   296    166    166
      11   288   296    166    166
      12   296   304    166    166
      13   296   304    166    166
      14   296   304    166    166
      15   296   304    166    166
      16   296   296    166    166
      17   288   296    166    172
      18   288   296    166    172
      19   288   296    166    172
      20   288   296    166    172
      21   296   306    166    172
      22   296   296    174    174
      23   296   306    166    166
      24   288   288    166    166
      25   304   304    166    166
      26   296   296    166    166
      27   298   298    166    166
      28   296   304    166    166

---

    Code
      amHTML.amPairwise(get(obj), htmlFile = tmp)

---

    Code
      cat(sub("summary generated: </b><em>.+?</em>", "summary generated: </b><em>(date)</em>", gsub("(\\t| )+?(\\n|$)", "\\2", readLines(tmp, warn = FALSE), perl = TRUE), perl = TRUE), sep = "\n")
    Output
      <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
      
               <html xmlns='http://www.w3.org/1999/xhtml' xml:lang='en' lang='en'><head>
      
              <meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
      <title>allelematch: amPairwise() output</title><style type="text/css">
      
              html {
                  height: 100%;
              }
      
              body {
                  background-color: inherit;
                  color: inherit;
                  font-family: Verdana;
                  font-size: xx-small;
                  margin: 0;
                  height: 100%;
      
              }
      
              a:active {
                  color: #CC0000;
              }
      
              a:link {
                  color: #CC0000;
              }
      
              a:visited {
                  color: #CC0000;
              }
      
              .amMismatchAllele {
                  background-color: #CC0000;
                  color: white;
                  font-weight: bold;
              }
      
              .amMissingAllele {
                  background-color: #FFCCCC;
              }
      
              .amInterpolatedAllele {
                  background-color: blue;
                  color: white;
              }
      
              .amGrid {
                  border-collapse: separate;
              }
      
              .amGridContent {
                  padding: 0;
                  border: 1px solid #7EACB1;
              }
      
      
              .amGridUpperPanel, .amGridLowerPanel {
                  padding: 3px;
                  border-left: 0;
                  border-right: 0;
                  background-color: #F4FAFB;
                  color: #2A769D;
                  font-family: Verdana;
                  font-size: xx-small;
              }
      
              .amGridUpperPanel {
                  border-top: 0px;
                  border-bottom: 1px solid;
                  border-color: #7EACB1;
              }
      
              .amGridMiddlePanel {
                  border: 0;
              }
      
              .amGridLowerPanel {
                  border-top: 1px solid;
                  border-bottom: 0px;
                  border-color: #C2D4DA;
              }
      
              .amGridUpperPanel td, .amGridLowerPanel td {
                  color: #2A769D;
                  font-family: Verdana;
                  font-size: xx-small;
              }
      
      
              .amTable {
                  border: 0;
                  border-spacing: 0;
                  border-collapse: collapse;
                  empty-cells: show;
                  width: 100%;
                  font-family: Verdana;
                  font-size: xx-small;
              }
      
              .amTableSeparate {
                  border-collapse: separate;
              }
      
              .amTable td {
                  padding: 3px;
                  border-bottom: 1px solid;
                  border-top: 0px;
                  border-left: 0px;
                  border-right: 1px solid;
                  border-color: #C2D4DA;
                  white-space:nowrap;
              }
      
      
              .amTable .amTableHeader, .amTable .amTableHeader td {
                  background-color: #B7D8DC;
                  color: #000000;
                  border-bottom: 1px solid;
                  border-right: 1px solid;
                  border-color: #7EACB1;
                  background-repeat: repeat-x;
                  vertical-align: top;
                  white-space:nowrap;
              }
      
              .amPointer {
                  cursor: pointer;
              }
      
      
              .amTableHeaderBtn {
                  width: 100%;
                  font-family: Verdana;
                  font-size: xx-small;
              }
      
              .amTableHeader .amTableHeaderBtn td {
                  background: transparent;
                  padding: 0;
                  border: 0;
                  white-space: nowrap;
              }
      
              .amTableSelectRow {
                  background-color: #FFFF66;
                  color: #000000;
              }
      
      </style></head><body><div style="margin-left:5%; margin-right:5%"><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><div style="font-size:x-small;"><table><tr><td style="width:400px;"><span style="font-size:20px;">allelematch<br>pairwise analysis</span><br><br></td></tr>
      <tr><td><b>
      focal dataset N=</b><em>20</em></td></tr>
       <tr><td><b>focal dataset compared against itself</b><em></em></td></tr>
       <tr><td><b>missing data represented by: </b><em>-99</em></td></tr>
       <tr><td><b>alleleMismatch (m-hat; maximum number of mismatching alleles): </b><em>0.5</em></td></tr>
       <tr><td><b>matchThreshold (s-hat; lowest matching score returned): </b><em>0.977</em></td></tr>
       <tr><td><b>summary generated: </b><em>(date)</em></td></tr>
      </table></div></div></td></tr></table><br><br>
      <table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(1 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>samplingData</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1001.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>F</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>236</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>301</div></td>
      <td class="amTableSelectRow"><div>301</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>192</div></td>
      <td class="amTableSelectRow"><div>192</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1001.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>384</div></td><td><div>230</div></td><td><div>236</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div>185</div></td><td><div>301</div></td><td><div>301</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>192</div></td><td><div>118</div></td><td><div>118</div></td><td><div>296</div></td><td><div>304</div></td><td><div>166</div></td><td><div>166</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>1 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(2 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>samplingData</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1002.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>F</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>236</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>181</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>288</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1002.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>384</div></td><td><div>230</div></td><td><div>236</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>181</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>202</div></td><td><div>202</div></td><td><div>118</div></td><td><div>118</div></td><td><div>288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>1 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(3 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>samplingData</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1003.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>M</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>242</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>191</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>192</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>102</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>298</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>172</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1003.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>M</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div>242</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div>191</div></td><td><div>285</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>202</div></td><td><div>102</div></td><td><div>118</div></td><td><div>298</div></td><td><div>304</div></td><td><div>166</div></td><td><div>172</div></td><td><div>1</div></td> </tr>
      <tr><td><div>1005.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>M</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div>242</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div>191</div></td><td><div>285</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>202</div></td><td><div>102</div></td><td><div>118</div></td><td><div>298</div></td><td><div>304</div></td><td><div>166</div></td><td><div>172</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>2 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(4 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>samplingData</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1004.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>M</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>232</div></td>
      <td class="amTableSelectRow"><div>236</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>301</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>192</div></td>
      <td class="amTableSelectRow"><div>216</div></td>
      <td class="amTableSelectRow"><div>102</div></td>
      <td class="amTableSelectRow"><div>108</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>168</div></td>
      <td class="amTableSelectRow"><div>174</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1004.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>M</div></td><td><div>382</div></td><td><div>384</div></td><td><div>232</div></td><td><div>236</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>301</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>216</div></td><td><div>102</div></td><td><div>108</div></td><td><div>296</div></td><td><div>304</div></td><td><div>168</div></td><td><div>174</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>1 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(5 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>samplingData</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1005.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>M</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>242</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>191</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>192</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>102</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>298</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>172</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1003.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>M</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div>242</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div>191</div></td><td><div>285</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>202</div></td><td><div>102</div></td><td><div>118</div></td><td><div>298</div></td><td><div>304</div></td><td><div>166</div></td><td><div>172</div></td><td><div>1</div></td> </tr>
      <tr><td><div>1005.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>M</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div>242</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div>191</div></td><td><div>285</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>202</div></td><td><div>102</div></td><td><div>118</div></td><td><div>298</div></td><td><div>304</div></td><td><div>166</div></td><td><div>172</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>2 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(6 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>samplingData</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1006.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>F</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>181</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>198</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>114</div></td>
      <td class="amTableSelectRow"><div>116</div></td>
      <td class="amTableSelectRow"><div>288</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1006.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>181</div></td><td><div>193</div></td><td><div>285</div></td><td><div>285</div></td><td><div>223</div></td><td><div>223</div></td><td><div>198</div></td><td><div>202</div></td><td><div>114</div></td><td><div>116</div></td><td><div>288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>1</div></td> </tr>
      <tr><td><div>1007.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>181</div></td><td><div>193</div></td><td><div>285</div></td><td><div>285</div></td><td><div>223</div></td><td><div>223</div></td><td><div>198</div></td><td><div>202</div></td><td><div>114</div></td><td><div>116</div></td><td><div>288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>2 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(7 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>samplingData</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1007.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>F</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>181</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>198</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>114</div></td>
      <td class="amTableSelectRow"><div>116</div></td>
      <td class="amTableSelectRow"><div>288</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1006.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>181</div></td><td><div>193</div></td><td><div>285</div></td><td><div>285</div></td><td><div>223</div></td><td><div>223</div></td><td><div>198</div></td><td><div>202</div></td><td><div>114</div></td><td><div>116</div></td><td><div>288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>1</div></td> </tr>
      <tr><td><div>1007.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>181</div></td><td><div>193</div></td><td><div>285</div></td><td><div>285</div></td><td><div>223</div></td><td><div>223</div></td><td><div>198</div></td><td><div>202</div></td><td><div>114</div></td><td><div>116</div></td><td><div>288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>2 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(8 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>samplingData</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1008.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>M</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>192</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1008.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>M</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div>230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div>193</div></td><td><div>285</div></td><td><div>285</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>202</div></td><td><div>118</div></td><td><div>118</div></td><td><div>296</div></td><td><div>304</div></td><td><div>166</div></td><td><div>166</div></td><td><div>1</div></td> </tr>
      <tr><td><div>1009.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>M</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div>230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div>193</div></td><td><div>285</div></td><td><div>285</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>202</div></td><td><div>118</div></td><td><div>118</div></td><td><div>296</div></td><td><div>304</div></td><td><div>166</div></td><td><div>166</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>2 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(9 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>samplingData</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1009.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>M</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>192</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1008.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>M</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div>230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div>193</div></td><td><div>285</div></td><td><div>285</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>202</div></td><td><div>118</div></td><td><div>118</div></td><td><div>296</div></td><td><div>304</div></td><td><div>166</div></td><td><div>166</div></td><td><div>1</div></td> </tr>
      <tr><td><div>1009.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>M</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div>230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div>193</div></td><td><div>285</div></td><td><div>285</div></td><td><div>223</div></td><td><div>223</div></td><td><div>192</div></td><td><div>202</div></td><td><div>118</div></td><td><div>118</div></td><td><div>296</div></td><td><div>304</div></td><td><div>166</div></td><td><div>166</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>2 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(10 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>samplingData</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1010.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>244</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>191</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>227</div></td>
      <td class="amTableSelectRow"><div>227</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>204</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1010.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div class="amMissingAllele">-99</div></td><td><div>382</div></td><td><div>384</div></td><td><div>230</div></td><td><div>244</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>191</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>227</div></td><td><div>227</div></td><td><div>202</div></td><td><div>204</div></td><td><div>118</div></td><td><div>118</div></td><td><div>296</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>1 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(11 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>samplingData</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1011.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>F</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>214</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>112</div></td>
      <td class="amTableSelectRow"><div>288</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>172</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1011.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>224</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>210</div></td><td><div>214</div></td><td><div>106</div></td><td><div>112</div></td><td><div>288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>172</div></td><td><div>1</div></td> </tr>
      <tr><td><div>1012.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>224</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>210</div></td><td><div>214</div></td><td><div>106</div></td><td><div>112</div></td><td><div>288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>172</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>2 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(12 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>samplingData</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1012.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>F</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>214</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>112</div></td>
      <td class="amTableSelectRow"><div>288</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>172</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1011.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>224</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>210</div></td><td><div>214</div></td><td><div>106</div></td><td><div>112</div></td><td><div>288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>172</div></td><td><div>1</div></td> </tr>
      <tr><td><div>1012.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>224</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>210</div></td><td><div>214</div></td><td><div>106</div></td><td><div>112</div></td><td><div>288</div></td><td><div>296</div></td><td><div>166</div></td><td><div>172</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>2 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(13 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>samplingData</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1013.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>M</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>232</div></td>
      <td class="amTableSelectRow"><div>232</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>213</div></td>
      <td class="amTableSelectRow"><div>221</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>306</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>172</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1013.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>M</div></td><td><div>382</div></td><td><div>384</div></td><td><div>232</div></td><td><div>232</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>213</div></td><td><div>221</div></td><td><div>210</div></td><td><div>210</div></td><td><div>118</div></td><td><div>118</div></td><td><div>296</div></td><td><div>306</div></td><td><div>166</div></td><td><div>172</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>1 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(14 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>samplingData</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1014.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>F</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>232</div></td>
      <td class="amTableSelectRow"><div>238</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>199</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>301</div></td>
      <td class="amTableSelectRow"><div>213</div></td>
      <td class="amTableSelectRow"><div>213</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>102</div></td>
      <td class="amTableSelectRow"><div>108</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>174</div></td>
      <td class="amTableSelectRow"><div>174</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1014.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>384</div></td><td><div>384</div></td><td><div>232</div></td><td><div>238</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>199</div></td><td><div>299</div></td><td><div>301</div></td><td><div>213</div></td><td><div>213</div></td><td><div>210</div></td><td><div>210</div></td><td><div>102</div></td><td><div>108</div></td><td><div>296</div></td><td><div>296</div></td><td><div>174</div></td><td><div>174</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>1 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(15 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>samplingData</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1015.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>F</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>232</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>216</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>306</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1015.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>382</div></td><td><div>224</div></td><td><div>232</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>210</div></td><td><div>216</div></td><td><div>106</div></td><td><div>106</div></td><td><div>296</div></td><td><div>306</div></td><td><div>166</div></td><td><div>166</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>1 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(16 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>samplingData</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1016.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>M</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>232</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>213</div></td>
      <td class="amTableSelectRow"><div>221</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>210</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>112</div></td>
      <td class="amTableSelectRow"><div>288</div></td>
      <td class="amTableSelectRow"><div>288</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1016.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>M</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>232</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>193</div></td><td><div>193</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>213</div></td><td><div>221</div></td><td><div>210</div></td><td><div>210</div></td><td><div>106</div></td><td><div>112</div></td><td><div>288</div></td><td><div>288</div></td><td><div>166</div></td><td><div>166</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>1 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(17 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>samplingData</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1017.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>F</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>388</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>181</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1017.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>388</div></td><td><div>230</div></td><td><div>230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>181</div></td><td><div>185</div></td><td><div>285</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>202</div></td><td><div>202</div></td><td><div>106</div></td><td><div>118</div></td><td><div>304</div></td><td><div>304</div></td><td><div>166</div></td><td><div>166</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>1 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(18 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>samplingData</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1018.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>F</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>-99</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>199</div></td>
      <td class="amTableSelectRow"><div>285</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>198</div></td>
      <td class="amTableSelectRow"><div>204</div></td>
      <td class="amTableSelectRow"><div>116</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1018.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>384</div></td><td><div>384</div></td><td><div>224</div></td><td><div>230</div></td><td><div class="amMissingAllele">-99</div></td><td><div class="amMissingAllele">-99</div></td><td><div>185</div></td><td><div>199</div></td><td><div>285</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>198</div></td><td><div>204</div></td><td><div>116</div></td><td><div>118</div></td><td><div>296</div></td><td><div>296</div></td><td><div>166</div></td><td><div>166</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>1 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(19 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>samplingData</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1019.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>F</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>159</div></td>
      <td class="amTableSelectRow"><div>159</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>118</div></td>
      <td class="amTableSelectRow"><div>298</div></td>
      <td class="amTableSelectRow"><div>298</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1019.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>230</div></td><td><div>159</div></td><td><div>159</div></td><td><div>193</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>202</div></td><td><div>202</div></td><td><div>106</div></td><td><div>118</div></td><td><div>298</div></td><td><div>298</div></td><td><div>166</div></td><td><div>166</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>1 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><table cellspacing="0" class="amGrid"><tr><td class="amGridContent"><div class="amGridUpperPanel"><span style="font-size:medium;">(20 of 20)</span></div><div class="amGridMiddlePanel">
      <table cellspacing="0" class="amTable amTableSeparate">
      <tr class="amTableHeader">
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td></td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>samplingData</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>gender</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC1b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC2b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC3b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC4b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC5b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC6b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC7b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC8b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC9b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10a</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>LOC10b</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      <td class="amPointer"><table cellspacing="0" class="amTableHeaderBtn"><tr><td>Score</td><td style="width:10px;">&nbsp;</td></tr></table></td>
      </tr>
      <tr>
      <td class="amTableSelectRow"><div>1020.ON.CA</div></td>
      <td class="amTableSelectRow"><div>SiouxLookout-Jan-2004</div></td>
      <td class="amTableSelectRow"><div>F</div></td>
      <td class="amTableSelectRow"><div>382</div></td>
      <td class="amTableSelectRow"><div>384</div></td>
      <td class="amTableSelectRow"><div>224</div></td>
      <td class="amTableSelectRow"><div>230</div></td>
      <td class="amTableSelectRow"><div>155</div></td>
      <td class="amTableSelectRow"><div>167</div></td>
      <td class="amTableSelectRow"><div>185</div></td>
      <td class="amTableSelectRow"><div>193</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>299</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>223</div></td>
      <td class="amTableSelectRow"><div>202</div></td>
      <td class="amTableSelectRow"><div>204</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>106</div></td>
      <td class="amTableSelectRow"><div>296</div></td>
      <td class="amTableSelectRow"><div>304</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>166</div></td>
      <td class="amTableSelectRow"><div>FOCAL</div></td>
      </tr>
      <tr><td><div>1020.ON.CA</div></td><td><div>SiouxLookout-Jan-2004</div></td><td><div>F</div></td><td><div>382</div></td><td><div>384</div></td><td><div>224</div></td><td><div>230</div></td><td><div>155</div></td><td><div>167</div></td><td><div>185</div></td><td><div>193</div></td><td><div>299</div></td><td><div>299</div></td><td><div>223</div></td><td><div>223</div></td><td><div>202</div></td><td><div>204</div></td><td><div>106</div></td><td><div>106</div></td><td><div>296</div></td><td><div>304</div></td><td><div>166</div></td><td><div>166</div></td><td><div>1</div></td> </tr>
      </table></div><div class="amGridLowerPanel"><span>1 perfect matches found.  0 partial matches found.</span></div></td></tr></table><br><br><span style="font-size:x-small;">Generated by allelematch:  an R package<br></span><span style="font-size:x-small;">To reference this analysis please use citation("allelematch")<br><br></span></div></body></html>

