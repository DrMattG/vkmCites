#' Plot the number of imports by Term
#'
#' @param data The dataset to use (needs to be an export from the CITES database)
#' @param Species The species name e.g. "Python bivittatus"
#' @param fullTerms TRUE or FALSE - plot all categories or use a simplified set of terms ("live" and "parts or product")
#'
#' @return ggplot of the number of imports in the database
#' @export
#'
#' @examples
#' Plot_imports(data=vkmCites::Pythons, Species="Python bivittatus", fullTerms = FALSE)
#' Plot_imports(data=vkmCites::Pythons , Species="Morelia bredli", fullTerms = FALSE)


Plot_imports<-function(data,Species, fullTerms=TRUE){

  if(fullTerms==FALSE){
    data |>
      dplyr::mutate(Term2=case_when(
        Term=="live"~"live",
        Term=="eggs (live)"~"live",
        TRUE~"parts or product"
      ))|>
      dplyr::filter(Taxon=={{Species}}) |>
      dplyr::mutate(Term=Term2) |>
      dplyr::group_by(Year, Term) |>
      dplyr::tally() |>
      ggplot2::ggplot(aes(Year, n, fill=Term))+
      ggplot2::geom_histogram(stat="identity")+
      ggplot2::labs(y="The number of imports")+
      viridis::scale_fill_viridis(discrete=T)+
      ggplot2::theme_classic()


  }else{
    data |>
      dplyr::filter(Taxon=={{Species}}) |>
      dplyr::group_by(Year, Term) |>
      dplyr::tally() |>
      ggplot2::ggplot(aes(Year, n, fill=Term))+
      ggplot2::geom_histogram(stat="identity")+
      ggplot2::labs(y="The number of imports")+
      viridis::scale_fill_viridis(discrete=T)+
      ggplot2::theme_classic()
  }
  }


