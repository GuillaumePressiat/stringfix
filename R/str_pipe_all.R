

#' @import stringr

#' @title paste0 in the way of pipe operator
#'
#' @details This functions is a pipe version of paste0
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
#' @details This functions is a pipe version of paste
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
#' @details This functions is a pipe version of grepl
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
#' @details This functions is a pipe version of grepl with ignore.case = TRUE
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
#' @details This functions is a pipe version of substr
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
#' @details This functions is a pipe version of stringr::count
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
#' @details This functions is a pipe version of stringr::pad
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
#' @param pad.width string or .digit where to indicate the pad and width
#' @return A character vector or NULL
#' @details This functions is a pipe version of stringr::pad
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
#' @param pad.width string or .digit where to indicate the pad and width
#' @return A character vector or NULL
#' @details This functions is a pipe version of stringr::pad
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


#' @title  Explode a character string
#'
#' @param x A character string
#' @param p A pattern
#' @return a character vector
#' @details This function is a pipe version of stringr::str_split for a character string, with simplify = TRUE
#' @examples
#' 'The little horse under the weather' %e% ' '
#' 'The little horse under the weather' %e% ''
#' @export
`%e%` <- function(x, p){
  stringr::str_split(x, p, simplify = TRUE)[1,]
}

#' @title  Explode a character vector
#'
#' @param x A character vector
#' @param p A pattern
#' @return a tibble
#' @import tibble
#' @details This function is a pipe version of stringr::str_split for a character vector, with simplify = TRUE
#' @examples
#' c('The little horse under the weather',
#' "He who gave courage",
#' "It was a little white horse",
#' 'All behind, all behind',
#' "It was time of the little white horse",
#' "All behind him before") %ee% " |'|, "
#'
#' @export
`%ee%` <- function(x, p){
  tibble::as_tibble(stringr::str_split(x, p, simplify = TRUE))
}


#' @title  Collapse a character vector to a character string
#'
#' @param x A character vector
#' @param y Character string, collapse parameter of paste0
#' @details This function is a pipe version of paste0 with collapse parameter to specify
#' @return A character string
#' @examples
#' c('N', 'F', 'K', 'A') %c% ' '
#' 'All I wanna do' %e% '' %c% ''
#' @export
`%c%` <-  function(x, y){
  paste0(x, collapse = y)
}

