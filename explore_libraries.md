explore\_libraries.R
================
aubryp
2020-01-27

``` r
library(tidyverse)
```

    ## Warning: package 'tidyverse' was built under R version 3.6.2

    ## -- Attaching packages ------------------------------------------------- tidyverse 1.3.0 --

    ## v ggplot2 3.2.1     v purrr   0.3.3
    ## v tibble  2.1.3     v dplyr   0.8.3
    ## v tidyr   1.0.0     v stringr 1.4.0
    ## v readr   1.3.1     v forcats 0.4.0

    ## Warning: package 'ggplot2' was built under R version 3.6.2

    ## Warning: package 'tibble' was built under R version 3.6.2

    ## Warning: package 'tidyr' was built under R version 3.6.2

    ## Warning: package 'readr' was built under R version 3.6.2

    ## Warning: package 'purrr' was built under R version 3.6.2

    ## Warning: package 'dplyr' was built under R version 3.6.2

    ## Warning: package 'stringr' was built under R version 3.6.2

    ## Warning: package 'forcats' was built under R version 3.6.2

    ## -- Conflicts ---------------------------------------------------- tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
pkgs <- as_tibble(installed.packages())
nrow(pkgs)
```

    ## [1] 391

``` r
pkgs %>% count(LibPath)
```

    ## # A tibble: 1 x 2
    ##   LibPath                                         n
    ##   <chr>                                       <int>
    ## 1 C:/Users/aubryp/Documents/R/R-3.6.1/library   391

``` r
pkgs %>% count(LibPath,Priority)
```

    ## # A tibble: 3 x 3
    ##   LibPath                                     Priority        n
    ##   <chr>                                       <chr>       <int>
    ## 1 C:/Users/aubryp/Documents/R/R-3.6.1/library base           14
    ## 2 C:/Users/aubryp/Documents/R/R-3.6.1/library recommended    15
    ## 3 C:/Users/aubryp/Documents/R/R-3.6.1/library <NA>          362

``` r
pkgs %>% count(NeedsCompilation) %>% mutate(prop = n / sum(n))
```

    ## # A tibble: 3 x 3
    ##   NeedsCompilation     n   prop
    ##   <chr>            <int>  <dbl>
    ## 1 no                 191 0.488 
    ## 2 yes                188 0.481 
    ## 3 <NA>                12 0.0307

``` r
pkgs %>% count(Built)
```

    ## # A tibble: 10 x 2
    ##    Built     n
    ##    <chr> <int>
    ##  1 3.4.1    26
    ##  2 3.4.3     3
    ##  3 3.4.4   151
    ##  4 3.5.0     8
    ##  5 3.5.1    14
    ##  6 3.5.2    17
    ##  7 3.5.3    61
    ##  8 3.6.0     4
    ##  9 3.6.1    33
    ## 10 3.6.2    74
