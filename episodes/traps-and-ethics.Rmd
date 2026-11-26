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

::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content
- Use `.Rmd` files for episodes when you need to generate output
- Run `sandpaper::check_lesson()` to identify any issues with your lesson
- Run `sandpaper::build_lesson()` to preview your lesson locally

::::::::::::::::::::::::::::::::::::::::::::::::

