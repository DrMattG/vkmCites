#' Plot the number of live imports by Source
#'
#' @param data The dataset to use (needs to be an export from the CITES database)
#' @param Species The species name e.g. "Python bivittatus"
#' @param min_year A year filter default is >2009 (so start year is 2010)
#' @importFrom rlang .data
#' @export
#' @examples
#' Plot_live_imports(data=vkmCites::Pythons, Species="Python bivittatus")

# 2010 onwards and global change

Plot_live_imports<-function(data,Species, min_year=2009){
  data |>
    dplyr::filter(.data$Taxon=={{Species}}) |>
    dplyr::filter(.data$Term=="live"|.data$Term=="eggs (live)") |>
    dplyr::filter(.data$Year>{{min_year}}) |>
    dplyr::group_by(.data$Year, .data$Source) |>
    dplyr::tally() |>
    ggplot2::ggplot(ggplot2::aes(.data$Year, .data$n, fill=.data$Source))+
    ggplot2::geom_histogram(stat="identity")+
    ggplot2::labs(y="Number of live imports")+
    viridis::scale_fill_viridis(discrete=T)+
    ggplot2::theme_classic()
  }


