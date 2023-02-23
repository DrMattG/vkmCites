#' Plot the number of imports by Term
#'
#' @param data The dataset to use (needs to be an export from the CITES database)
#' @param Species The species name e.g. "Python bivittatus"
#' @param fullTerms TRUE or FALSE - plot all categories or use a simplified set of terms ("live" and "parts or product")
#' @param min_year A year filter default is >2009 (so start year is 2010)
#' @importFrom rlang .data
#' @return ggplot of the number of imports in the database
#' @export
#'
#' @examples
#' Plot_imports(data=vkmCites::Pythons, Species="Python bivittatus", fullTerms = FALSE)
#' Plot_imports(data=vkmCites::Pythons , Species="Morelia bredli", fullTerms = FALSE)


Plot_imports<-function(data,Species, fullTerms=FALSE, min_year=2009){

  if(fullTerms==FALSE){
    data |>
      dplyr::mutate(Term2 = dplyr::case_when(
        .data$Term=="live"~"live",
        .data$Term=="eggs (live)"~"live",
        TRUE~"parts or product"
      ))|>
      dplyr::filter(.data$Taxon=={{Species}}) |>
      dplyr::mutate(Term=.data$Term2) |>
      dplyr::filter(.data$Year>{{min_year}}) |>
      dplyr::group_by(.data$Year, .data$Term) |>
      dplyr::tally() |>
      ggplot2::ggplot(ggplot2::aes(.data$Year, .data$n, fill=.data$Term))+
      ggplot2::geom_histogram(stat="identity")+
      ggplot2::labs(y="The number of imports")+
      viridis::scale_fill_viridis(discrete=T)+
      ggplot2::theme_classic()


  }else{
    data |>
      dplyr::filter(.data$Taxon=={{Species}}) |>
      dplyr::group_by(.data$Year, .data$Term) |>
      dplyr::tally() |>
      ggplot2::ggplot(ggplot2::aes(.data$Year, .data$n, fill=.data$Term))+
      ggplot2::geom_histogram(stat="identity")+
      ggplot2::labs(y="The number of imports")+
      viridis::scale_fill_viridis(discrete=T)+
      ggplot2::theme_classic()
  }
  }


