
enrobeur <- function(a, robe = "\'", colonne = F, interstice = ", ", symetrique = F){
  strReverse <- function(x) sapply(lapply(strsplit(x, NULL), rev), paste,
                                   collapse="")

  b <- paste0(robe,a,ifelse(symetrique == F,robe, strReverse(robe)))
  if (colonne == F){
    return(paste0(b, collapse = interstice))
  }
  else { return(b)}

}

shiny::shinyServer(function(input, output) {

  ll <- "A00, A01, A02"
  type <- shiny::reactive({input$type})
  output$ll2 <- shiny::reactive({
    ll <- input$listi
    ll <- purrr::flatten_chr(str_split(ll, input$sepi))

    qu <- stringr::str_replace_all(input$qu,'¨', '')
    switch( type() ,
            'List' = enrobeur(ll, robe = qu, colonne = F, interstice = input$sepi),
            'Pipe' = enrobeur(ll, robe = "", colonne = F, interstice = "|"),
            'SQL' = enrobeur(ll, paste0(qu,"%"), colonne = F, interstice = " | \n", symetrique = T),
            '')
  })
  output$ll3 <- shiny::reactive({
    ll <- input$listi2
    type2 <- shiny::reactive({input$type2})
    #ll <- "A00\nA01\nA02"
    ll <- purrr::flatten_chr(str_split(ll, "\n"))
    qu <- stringr::str_replace_all(input$qu,'¨', '')
    switch( type2() ,
            'List' = enrobeur(ll, robe = qu, colonne = F, interstice = input$sepi),
            'Pipe' = enrobeur(ll, robe = "", colonne = F, interstice = "|"),
            'SQL' = enrobeur(ll, paste0(qu,"%"), colonne = F, interstice = " | \n", symetrique = T),
            '')
  })
  output$ll4 <- shiny::reactive({
    ll <- input$listi3
    type3 <- shiny::reactive({input$type3})
    #ll <- "A00\nA01\nA02"
    switch( type3() ,
            'column > line' = stringr::str_replace_all(ll, "\n", input$sepi),
            'line > column' = stringr::str_replace_all(ll, input$sepi, "\n"),
            '')
  })
})
