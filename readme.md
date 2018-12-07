# stringfix : infix operators for strings manipulations

#### Some infix operators and other functions to make syntax more left to right. 


```r
"In a manner of coding, I just want to say..." % % "Nothing."
#>[1] "In a manner of coding, I just want to say... Nothing."
```

### Examples


#### paste

```r
'Hello ' %+% 'world'
#> [1] "Hello world"
'Your pastas tastes like ' %+% '%>%'
#> [1] "Your pastas tastes like %>%"
'coco' %+% 'bolo'
#> [1] "cocobolo"
```

```r
'Hello' % % 'world'
#> [1] "Hello world"
'Your pastas tastes like' % % '%>%'
#> [1] "Your pastas tastes like %>%"
'Hello' %,% 'world...'
#> [1] "Hello, world..."
'Your pastas tastes like ' %+% '%>%...' %,% 'or %>>%...'
#> [1] "Your pastas tastes like %>%..., or %>>%..."
```

#### grepl

##### Case sensitive

```r
'pig' %g% 'The pig is in the corn'
#> [1] TRUE
'Pig' %g% 'The pig is in the corn'
#> [1] FALSE
```

##### Case insensitive (ignore.case)

```r
'pig' %gic% 'The pig is in the corn'
#> [1] TRUE
'PIG' %gic% 'The PiG is in the corn'
#> [1] TRUE
```

#### substring

```r
'NFKA008' %s% '1.4'
#> [1] "NFKA"
'NFKA008' %s% .4
#> [1] "NFKA"
'where is' % % ('the pig is in the corn' %s% '1.7') % % '?'
#> [1] "where is the pig ?"
```

#### count

```r
fruit <- c("apple", "banana", "pear", "pineapple")
"a" %count% fruit
#> [1] 1 3 1 1
c("a", "b", "p", "p") %count% fruit
#> [1] 1 1 1 3
```

#### pad, lpad and rpad

```r
5 %lpad% '0.5'
#> [1] "00005"
5 %lpad%   .5
#> [1] "00005"
5 %lpad%  '.5'
#> [1] "    5"
5 %lpad% '2.5'
#> [1] "22225"
'é' %lpad% 'é.5'
#> [1] "ééééé"
```

#### names of tibbles : tolower and toupper

```r
library(magrittr)
iris %>% toupper_names %>% head
#>   SEPAL.LENGTH SEPAL.WIDTH PETAL.LENGTH PETAL.WIDTH SPECIES
#> 1          5.1         3.5          1.4         0.2  setosa
#> 2          4.9         3.0          1.4         0.2  setosa
#> 3          4.7         3.2          1.3         0.2  setosa
#> 4          4.6         3.1          1.5         0.2  setosa
#> 5          5.0         3.6          1.4         0.2  setosa
#> 6          5.4         3.9          1.7         0.4  setosa
```
