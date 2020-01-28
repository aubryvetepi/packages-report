## deja vu from earlier!

## create a data frame of your installed packages
## hint: installed.packages() is the function you need

## optional: select just some of the variables, such as
##   * Package
##   * LibPath
##   * Version
##   * Priority
##   * Built

## write this data frame to data/installed-packages.csv
## hint: readr::write_csv() or write.table()
## idea: try using here::here() to create the file path

## YES overwrite the file that is there now (or delete it first)
## that's a old result from me (Jenny)
## it an example of what yours should look like and where it should go

library(tidyverse)
library(here)

dat <- as_tibble(installed.packages()) %>%
  select(Package, LibPath, Version, Priority, Built)
write.csv(dat, here("installed-packages.csv"))

## filter out the base and recommended packages
## keep the variables Package and Built
## if you use dplyr, code like this will work:
addon <- dat %>%
  filter(is.na(Priority)) %>%
  select(Package, Built)

write.table(addon, here("add-on-packages.csv"))

## write this new, smaller data frame to data/add-on-packages.csv
## hint: readr::write_csv() or write.table()
## make a frequency table of package by the version in Built
## if you use dplyr, code like this will work:
addon_freqtable <- addon %>%
  count(Built) %>%
  mutate(prop = n / sum(n))

write.table(addon_freqtable, here("add-on-packages-freqtable.csv"))

## make a barchart from the frequency table in data/add-on-packages-freqtable.csv
## if you use ggplot2, code like this will work:
dat <- read.csv(here("add-on-packages-freqtable.csv"), sep=" ")
ggplot(dat, aes(x = Built, y = n)) +
  geom_col()
