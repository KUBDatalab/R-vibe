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
```

``` error
Error in `library()`:
! there is no package called 'FakeDataR'
```

``` r
generate_fake_data(mtcars) |> saveRDS(file = "/episodes/data/test.rds")
```

``` error
Error in `generate_fake_data()`:
! could not find function "generate_fake_data"
```

``` r
FakeDataR::generate_llm_prompt("test.rds", write_file = FALSE) 
```

``` error
Error in `loadNamespace()`:
! there is no package called 'FakeDataR'
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

``` error
Error in `generate_fake_data()`:
! could not find function "generate_fake_data"
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

