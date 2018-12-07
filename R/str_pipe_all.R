

#' @import stringr

#' @title paste0 in the way of pipe operator
#'
#' @param x A string (or coerced to)
#' @param y A string (or coerced to)
#' @return The concatenation of \code{x} and \code{y} strings
#'
#' @examples
#' 'Hello ' %+% 'world'
#' 'Your pastas tastes like ' %+% '%>%'
#' 'coco' %+% 'bolo'
#' @export
`%+%` <- function(a,b){
  paste0(a, b)
}


#' @title paste ', ' in the way of pipe operator
#'
#' @param x A string (or coerced to)
#' @param y A string (or coerced to)
#' @return The concatenation of \code{x} and \code{y} strings
#' @examples
#' 'Hello' % % 'world'
#' 'Your pastas tastes like' % % '%>%'
#' @export
`% %` <- function(a,b){
  paste(a, b)
}
#' @examples
#' 'Hello' %,% 'world...'
#' 'Your pastas tastes like ' %+% '%>%...' %,% 'or %>>%...'
#' @export
`%,%` <- function(a, b){
  paste(a,b, sep = ", ")
}

#' @title grepl in the way of pipe operator (case sensitive)
#'
#' @param x string where to search pattern with grepl
#' @param y pattern submitted to grepl
#' @return A boolean
#' @examples
#'
#' 'pig' %g% 'The pig is in the corn'
#' 'Pig' %g% 'The pig is in the corn'
#' @export
`%g%` <- function(x,y) {
  grepl(x, y)
}


#' @title grepl in the way of pipe operator (ignore case)
#'
#' @param x string where to search pattern with grepl
#' @param y pattern submitted to grepl
#' @return A boolean
#' @examples
#'
#' 'pig' %gic% 'The pig is in the corn'
#' 'PIG' %gic% 'The PiG is in the corn'
#' @export
`%gic%` <- function(x,y) {
  grepl(x, y, ignore.case = TRUE)
}

#' @title negation of in infix operator
#'
#'
#' @details This function comes from https://github.com/pierucci/rmngb/tree/master/rmngb
#'
#' @param a Vector or NULL, values to be matched
#' @param b Vector or NULL, values to be matched
#' @return a boolean
#' @examples
#'
#' 'coca' %out% c('cola')
#' 'coca' %out% c('coca', 'cola')
#' @export
`%out%` <- function(a,b){
  ! a %in% b
}

#' @title substring in the way of pipe operator
#'
#' @param x Vector or NULL, values to be substringed
#' @param y.z  A character or 0.digit to call substr
#' @return A string or NULL
#' @examples
#'
#' 'NFKA008' %s% '1.4'
#' 'NFKA008' %s% .4
#' 'where is' % % ('the pig is in the corn' %s% '1.7') % % '?'
#' 'NFKA008' %s% 5.7
#' @export
`%s%` <- function(x, yz){
  y.z <- stringr::str_split(as.character(yz), '\\.', simplify = TRUE)[1,]
  if (y.z[1] == ""){
    y.z[1] <- 1
  }
  stringr::str_sub(x,y.z[1],y.z[2])
}

#' @title count pattern in strings the way of pipe operator
#'
#' @param x Pattern to count in string
#' @param y  string where to count pattern
#' @return A vector of integer
#' @examples
#'
#' fruit <- c("apple", "banana", "pear", "pineapple")
#' "a" %count% fruit
#' c("a", "b", "p", "p") %count% fruit
#' @export
`%count%` <- function(x,y){
  stringr::str_count(y, x)
}



#' @title Left pad strings the way of pipe operator
#'
#' @param string Character vector or NULL
#' @param pad.width string or .digit where to indicate the pad and widht
#' @return A character vector or NULL
#' @examples
#'
#' 5 %lpad% '0.5'
#' 5 %lpad%   .5
#' 5 %lpad%  '.5'
#' 5 %lpad% '2.5'
#' 'é' %lpad% 'é.5'
#' @export
`%lpad%`<- function(string, pad.width){
  p.w <- stringr::str_split(as.character(pad.width), '\\.', simplify = TRUE)[1,]
  if (p.w[1] == ""){
    p.w[1] = " "
    }
  stringr::str_pad(string, p.w[2], side = "left", pad = p.w[1])
}

#' @title Right pad strings the way of pipe operator
#'
#' @param string Character vector or NULL
#' @param pad.width string or .digit where to indicate the pad and widht
#' @return A character vector or NULL
#' @examples
#'
#' 5 %rpad% '.2'
#' 'é' %rpad% 'è.5'
#' @export
`%rpad%`<- function(string, pad.width){
  p.w <- stringr::str_split(as.character(pad.width), '\\.', simplify = TRUE)[1,]
  if (p.w[1] == ""){
    p.w[1] = " "
  }
  stringr::str_pad(string, p.w[2], side = "right", pad = p.w[1])
}

#' @title Both side pad strings the way of pipe operator
#'
#' @param string Character vector or NULL
#' @param pad.width string or .digit where to indicate the pad and widht
#' @return A character vector or NULL
#' @examples
#'
#' 5 %pad% '.3'
#' 5 %rpad% '0.3'
#' @export
`%pad%`<- function(string, pad.width){
  p.w <- stringr::str_split(as.character(pad.width), '\\.', simplify = TRUE)[1,]
  if (p.w[1] == ""){
    p.w[1] = " "
  }
  stringr::str_pad(string, p.w[2], side = "both", pad = p.w[1])
}

#' @title Make names of a tibble tolower
#'
#' @param d tibble
#' @return A tibble
#' @examples
#' library(magrittr)
#' iris %>% tolower_names %>% head
#' @export
tolower_names <- function(d){
  nd <- names(d)
  names(d) <- tolower(names(d))
  d
}

#' @title Make names of a tibble toupper
#'
#' @param d tibble
#' @return A tibble
#' @examples
#' library(magrittr)
#' iris %>% toupper_names %>% head
#' @export
toupper_names <- function(d){
  nd <- names(d)
  names(d) <- toupper(names(d))
  d
}
