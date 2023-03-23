#' Plot the number of imports by Term
#'
#' @param data The dataset to use (needs to be an export from the CITES database)
#' @param Species The species name e.g. "Python bivittatus"
#' @param fullTerms TRUE or FALSE - plot all categories or use a simplified set of terms ("live" and "parts or product")
#' @param min_year A year filter default is >2009 (so start year is 2010)
#' @return ggplot of the number of imports in the database
#' @export
#'
#' @examples
#' Plot_imports_tc(data=vkmCites::Pythons, Species="Python bivittatus", fullTerms = FALSE)
#' Plot_imports_tc(data=vkmCites::Pythons , Species="Morelia bredli", fullTerms = FALSE)


Plot_imports_tc<-function(data,Species, fullTerms=FALSE, min_year=2009){

  if(fullTerms==FALSE){
    data |>
      dplyr::mutate(Term2=case_when(
        Term=="live"~"live",
        Term=="eggs (live)"~"live",
        TRUE~"parts or product"
      ))|>
      dplyr::filter(Taxon=={{Species}}) |>
      dplyr::mutate(Term=Term2) |>
      dplyr::filter(Year>{{min_year}}) |>
      dplyr::group_by(Year, Term) |>
      dplyr::tally() |>
      ggplot2::ggplot(aes(Year, n, fill=Term))+
      ggplot2::geom_histogram(stat="identity")+
      ggplot2::labs(y="Number of imports")+
      viridis::scale_fill_viridis(discrete=T)+
      #ggplot2::scale_fill_discrete(labels=c("Live", "Parts or\nproducts"))+
      ggplot2::theme_classic()+
      ggplot2::ggtitle(paste0("Total imports"))
      #ggplot2::ggtitle(paste0("Import data for ", Species))


  }else{
    data |>
      dplyr::filter(Taxon=={{Species}}) |>
      dplyr::group_by(Year, Term) |>
      dplyr::tally() |>
      ggplot2::ggplot(aes(Year, n, fill=Term))+
      ggplot2::geom_histogram(stat="identity")+
      ggplot2::labs(y="Number of imports")+
      #ggplot2::scale_fill_discrete(labels=c("Live", "Parts or\nproducts"))+
      viridis::scale_fill_viridis(discrete=T)+
      ggplot2::theme_classic()
  }
  }


