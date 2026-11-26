---
title: 'traps-and-ethics'
teaching: 10
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions 

- How do you write a lesson using R Markdown and `{sandpaper}`?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Explain how to use markdown with the new lesson template
- Demonstrate how to include pieces of code, figures, and nested challenge blocks

::::::::::::::::::::::::::::::::::::::::::::::::

De er blevet bedre. Men...

Særligt ved tidyverse funktioner har vi oplevet at de har fundet mønstret `geom_` og så navnet på hvad det er for et plot man vil lave.

Og så har botten selv opfundet nye funktioner der lyder rigtige. Men ikke eksisterer

Ofte udfordringer med at få de korrekte argumentnavne på.

Nok et udtryk for at de er trænet på de sidste 20 års materiale. Og når argumentet skiftede navn
for 2 år siden, er der 9 gange så meget træningsmateriale der nævner det gamle navn...

De fleste R-funktioner bruger na.rm = TRUE for at fjerne manglende værdier før funktionen kører.

Enkelte af dem bruger andre argumentnavne og værdier. Det kan der gå ged i.

IKKE UPLOADE DINE DATA TIL CHATTY

Undertiden er det helt uproblematisk. Undertiden fører det til en overskrift i Ekstra Bladet. 

Et trick er at generere fake data. Og den lette måde er `FakeDataR`

generate_fake_data tager en eksisterende dataframe, og returnerer en ny, med samme struktur, og data der følger (ca) samme fordeling som de oprindelige data.

The function attempts to identify personal identifiable data.

Pas på kategoriske variable der er kodet som tal. De bliver behandlet som tal...

Øh? der er noget galt med forks?

``` r
library(FakeDataR)
generate_fake_data(mtcars) |> saveRDS(file = "/episodes/data/test.rds")
```

``` warning
Warning in gzfile(file, mode): cannot open compressed file
'/episodes/data/test.rds', probable reason 'No such file or directory'
```

``` error
Error in `gzfile()`:
! cannot open the connection
```

``` r
FakeDataR::generate_llm_prompt("test.rds", write_file = FALSE) 
```

``` output
[1] "Context:\n- The attached dataset is FAKE and privacy-safe. It mirrors the real data's structure (column types, factor levels, NA/blank rates, date/time classes) but contains no real values.\n\n\nWhat I want from you:\n1) Propose an analysis plan suitable for the real dataset that has the SAME structure.\n2) Provide reusable, parameterized R code (prefer tidyverse) for EDA, key summaries, and relevant models/tests.\n3) Do NOT draw conclusions from the FAKE values; they are placeholders.\n\nFiles:\n- Fake data: test.rds\n\n\nImportant constraints:\n- Treat column names/types and missingness patterns as true.\n- If factor labels look generic (e.g., 'Category A'), treat them as placeholders.\n\n"
```

generate_llm_prompt giver metadata på data, og en umiddelbar prompt at kaste efter 


``` r
library(tidyverse)
```

``` output
── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
✔ dplyr     1.2.1     ✔ readr     2.2.0
✔ forcats   1.0.1     ✔ stringr   1.6.0
✔ ggplot2   4.0.4     ✔ tibble    3.3.1
✔ lubridate 1.9.5     ✔ tidyr     1.3.2
✔ purrr     1.2.2     
── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
✖ dplyr::filter() masks stats::filter()
✖ dplyr::lag()    masks stats::lag()
ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors
```

``` r
mtcars |>  mutate(cyl = as.factor(cyl)) |> 
generate_fake_data()  
```

``` output
        mpg cyl      disp        hp     drat       wt     qsec         vs
1  14.57948   8 213.76085 128.31089 3.265873 2.660939 16.12459 0.60746060
2  23.81379   8 454.78484 217.12313 3.221739 2.004338 21.16001 0.63620302
3  16.53393   4 344.43090 280.40922 4.805277 4.523243 18.51801 0.72292959
4  11.64663   6 206.78024 289.45783 4.625652 3.222058 16.12717 0.49342968
5  16.96219   4 179.90860  77.55047 3.929502 1.690711 16.95833 0.04385989
6  30.29556   6 227.10718 197.93050 4.026296 2.133626 16.16081 0.37136288
7  11.94246   8  86.22405 219.21552 4.353824 5.284898 19.14892 0.89512360
8  14.67389   6 381.70059 166.87262 3.823358 3.963629 16.81127 0.09433037
9  25.18754   4 163.14481 216.35819 3.517634 3.722121 22.79639 0.70834788
10 17.87684   8 401.49882 199.14754 3.098157 4.623097 17.16033 0.38704693
11 29.47936   6 416.13279 248.54508 4.510029 4.533067 17.04106 0.20465427
12 33.20059   4 470.67331  56.55803 3.868343 4.348542 17.84708 0.41125509
13 30.30121   8  76.01115 111.68926 3.613183 4.368460 19.29019 0.24444868
14 19.23005   8 420.28756 127.60531 2.955360 4.601936 16.69026 0.26875085
15 12.32659   8 328.87200 234.07009 2.828355 4.353137 16.20672 0.34219177
16 17.03842   4 255.97297 208.25382 4.820960 2.355030 14.67554 0.65668427
17 16.14654   8 108.23933 244.05394 4.288862 1.976986 17.31400 0.92843629
18 13.59229   6 468.46660 219.90410 2.792202 4.501014 21.21956 0.80527229
19 12.44583   4 449.44143 265.04369 3.261352 2.162572 20.39138 0.38826461
20 32.98878   8  81.08694  78.09762 3.594859 2.665661 15.63176 0.77985120
21 33.45777   8 443.62572 211.51938 3.414965 3.411243 20.48465 0.45946142
22 26.81206   8 389.56882 267.52392 4.567421 2.420413 21.40267 0.02010229
23 29.63478   6 330.31826 279.89822 2.994053 2.181139 20.28473 0.69043655
24 26.01767   4 409.52646  89.69281 3.889672 2.253063 19.19581 0.80499795
25 20.62055   8 274.31272 312.66299 4.350639 2.323813 17.87298 0.28050070
26 20.50897   8 332.68808 327.78661 3.102491 4.728634 19.98009 0.60333337
27 31.82912   4 114.90325 310.44505 3.697397 2.221548 14.67141 0.92742851
28 33.20909   8 109.05364 114.56962 4.164451 3.569417 19.63542 0.34279686
29 21.65683   6 393.79189 129.77052 3.208321 5.282194 17.32661 0.41071345
30 31.36492   8 413.31786 222.08520 4.745837 3.325856 18.24417 0.77718098
          am     gear     carb
1  0.1540247 4.441733 7.687352
2  0.5026045 3.638424 3.522847
3  0.8108771 3.745930 3.951784
4  0.8203529 4.813262 5.908085
5  0.9890600 4.011904 6.571495
6  0.5844545 3.089070 6.064625
7  0.7963548 3.911994 2.677792
8  0.1735560 3.235114 5.966108
9  0.9915449 3.392316 7.849995
10 0.2694221 4.766153 2.772932
11 0.7252719 3.826235 5.322270
12 0.2774357 3.076011 4.185131
13 0.8612560 3.398011 2.784282
14 0.8176661 4.972133 6.101714
15 0.5118888 3.904555 2.320319
16 0.5701072 4.330600 4.884891
17 0.3295502 3.166353 7.474762
18 0.9640441 3.576838 6.482383
19 0.9839874 3.379443 2.723625
20 0.4284261 3.776711 2.920504
21 0.6725940 4.996948 7.705702
22 0.7945729 3.892888 1.373849
23 0.1603603 3.870532 4.438202
24 0.9008398 3.228507 3.843024
25 0.3839270 3.085909 5.762126
26 0.8462593 3.652285 4.327632
27 0.2447119 3.580136 4.819112
28 0.8504499 3.268051 3.901630
29 0.3700903 3.250161 5.575840
30 0.1146907 4.110650 6.665241
```


``` r
summary(mtcars)
```

``` output
      mpg             cyl             disp             hp       
 Min.   :10.40   Min.   :4.000   Min.   : 71.1   Min.   : 52.0  
 1st Qu.:15.43   1st Qu.:4.000   1st Qu.:120.8   1st Qu.: 96.5  
 Median :19.20   Median :6.000   Median :196.3   Median :123.0  
 Mean   :20.09   Mean   :6.188   Mean   :230.7   Mean   :146.7  
 3rd Qu.:22.80   3rd Qu.:8.000   3rd Qu.:326.0   3rd Qu.:180.0  
 Max.   :33.90   Max.   :8.000   Max.   :472.0   Max.   :335.0  
      drat             wt             qsec             vs        
 Min.   :2.760   Min.   :1.513   Min.   :14.50   Min.   :0.0000  
 1st Qu.:3.080   1st Qu.:2.581   1st Qu.:16.89   1st Qu.:0.0000  
 Median :3.695   Median :3.325   Median :17.71   Median :0.0000  
 Mean   :3.597   Mean   :3.217   Mean   :17.85   Mean   :0.4375  
 3rd Qu.:3.920   3rd Qu.:3.610   3rd Qu.:18.90   3rd Qu.:1.0000  
 Max.   :4.930   Max.   :5.424   Max.   :22.90   Max.   :1.0000  
       am              gear            carb      
 Min.   :0.0000   Min.   :3.000   Min.   :1.000  
 1st Qu.:0.0000   1st Qu.:3.000   1st Qu.:2.000  
 Median :0.0000   Median :4.000   Median :2.000  
 Mean   :0.4062   Mean   :3.688   Mean   :2.812  
 3rd Qu.:1.0000   3rd Qu.:4.000   3rd Qu.:4.000  
 Max.   :1.0000   Max.   :5.000   Max.   :8.000  
```

::::::::::::::::::::::::::::::::::::: keypoints 

- Avoid uploading your real data to the chat
- Use packages like FakeDataR for constructing fake data representing the structure of your data.

::::::::::::::::::::::::::::::::::::::::::::::::

