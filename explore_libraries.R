library(tidyverse)

pkgs <- as_tibble(installed.packages())
nrow(pkgs)
pkgs %>% count(LibPath)
pkgs %>% count(LibPath,Priority)
pkgs %>% count(NeedsCompilation) %>% mutate(prop = n / sum(n))
pkgs %>% count(Built)