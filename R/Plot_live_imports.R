#' Plot the number of live imports by Source
#'
#' @param data The dataset to use (needs to be an export from the CITES database)
#' @param Species The species name e.g. "Python bivittatus"
#' @export
#' @examples
#' Plot_live_imports(data=vkmCites::Pythons, Species="Python bivittatus")

Plot_live_imports<-function(data,Species){
  data |>
    dplyr::filter(Taxon=={{Species}}) |>
    dplyr::filter(Term=="live"|Term=="eggs (live)") |>
    dplyr::group_by(Year, Source) |>
    dplyr::tally() |>
    ggplot2::ggplot(aes(Year, n, fill=Source))+
    ggplot2::geom_histogram(stat="identity")+
    ggplot2::labs(y="Number of live imports")+
    viridis::scale_fill_viridis(discrete=T)+
    ggplot2::theme_classic()
  }


