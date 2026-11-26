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

Øh? der er noget galt med forks? ugeb=

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
        mpg cyl     disp        hp     drat       wt     qsec         vs
1  19.12528   8 285.5630 160.45427 3.594672 2.478744 22.08074 0.15520393
2  20.83148   8 250.4760 219.17735 3.163273 2.762443 21.46453 0.08426788
3  13.73261   4 445.0530 175.01981 4.852017 4.909273 21.51444 0.37254560
4  18.84371   4 415.4027 256.11758 3.254034 3.802177 14.78888 0.01618452
5  32.85777   8 426.8628 247.07998 3.605120 2.328102 22.42979 0.41851229
6  31.35890   4 189.3271 181.27970 3.692144 4.073077 21.18308 0.12045994
7  16.62281   8 381.0030 228.93947 2.881391 5.012368 22.84255 0.47129765
8  24.77898   8 447.4249 213.99830 4.287169 1.894424 16.62291 0.69072565
9  32.02274   8 286.4349 297.51431 4.008569 3.085024 21.46993 0.62103689
10 11.73729   6 163.8748 324.98904 4.804263 4.268822 18.53534 0.87199876
11 14.64353   6 125.1194 184.11127 3.802916 5.107392 19.63770 0.19674862
12 28.70341   4 290.4731 326.72711 3.117440 3.109281 15.42558 0.31999186
13 32.26000   8 197.4664 265.89354 3.937728 3.214929 15.33055 0.85331801
14 13.35693   4 304.4443 289.51817 3.307266 3.162427 22.29375 0.15461452
15 18.76079   6 420.6877 175.99092 4.295170 4.412270 20.10299 0.22983618
16 24.18906   4 415.0916 218.96507 3.610416 1.852950 19.67466 0.13297133
17 14.23219   4 413.6387 155.19942 3.487825 4.572270 22.74984 0.05972546
18 20.47704   8 105.8257 281.74574 3.202189 3.837502 15.91935 0.77615197
19 11.17313   4 460.4110  71.75469 4.195229 4.790217 17.96971 0.13904895
20 30.18749   4 140.6490 116.82509 2.766975 4.459609 19.42785 0.13747183
21 12.62084   6 112.6879 288.25430 2.807380 3.079154 18.04064 0.56302699
22 23.52176   4 146.0627 130.58472 3.255920 1.801917 19.03051 0.46109653
23 28.56941   4 248.3753 153.28623 4.868769 1.749756 18.32726 0.81476531
24 30.62316   4 238.6245 325.31575 3.502113 3.395571 20.85065 0.17547563
25 19.30793   6 105.8283 298.61931 4.565078 5.160184 21.97693 0.63407930
26 19.65146   8 300.8513 102.19537 4.134456 2.690317 20.69228 0.36893424
27 19.29299   8 442.7713 187.27476 2.907509 2.944827 21.52961 0.41838363
28 10.59043   6 436.5720  60.27256 2.810458 2.622090 21.66539 0.35195645
29 28.64031   8 449.0413 315.16510 3.605023 1.868032 14.94702 0.85663882
30 30.21299   4 128.4854 205.12664 3.543653 4.845567 15.93812 0.03130699
           am     gear     carb
1  0.44222772 4.386911 4.028659
2  0.92155582 3.273818 5.743337
3  0.37530759 4.182047 1.656272
4  0.66598338 4.297911 4.872638
5  0.72119632 4.834186 4.279150
6  0.03743467 3.851676 7.309161
7  0.74756056 4.978430 1.848335
8  0.91615523 3.291862 4.171507
9  0.76509827 4.068698 7.807860
10 0.39298628 4.239361 6.588375
11 0.82596859 3.807205 4.874989
12 0.30985715 4.909649 4.604931
13 0.87695469 4.279126 7.481987
14 0.88705566 4.655367 1.641812
15 0.83716280 3.505395 1.814594
16 0.69400789 3.786770 7.124489
17 0.33284587 4.976410 1.635591
18 0.22663963 3.431469 2.251738
19 0.31014547 3.422416 3.875352
20 0.85838551 3.989730 1.915143
21 0.14615992 4.755014 5.684965
22 0.85522485 4.122001 5.884387
23 0.10762053 4.367061 7.953113
24 0.36964608 4.291887 2.696736
25 0.09497041 4.851686 6.575180
26 0.87450564 3.612453 4.301710
27 0.65444648 3.142945 5.329289
28 0.16266344 4.003126 3.760610
29 0.98026206 4.037026 7.883665
30 0.81038155 4.639823 2.309268
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

