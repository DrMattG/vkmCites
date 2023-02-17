#' Map the locations of the species using GBIF data
#'
#' @param Species The species name e.g. "Python bivittatus"
#'
#' @return ggplot map of species location records (can include non-native records)
#' @export
#'
#' @examples
#' map_GBIF_locs(Species="Morelia amethistina")
#'
map_GBIF_locs<-function(Species){
  recs<-red::records(Species)
  if(dim(recs)[1]<1) stop("Not enough records to plot. Please check the taxon name")
  ggplot2::theme_set(ggplot2::theme_bw())
  world <- rnaturalearth::ne_countries(scale = "medium", returnclass = "sf")
  p=ggplot2::ggplot(data = world) +
    ggplot2::geom_sf(color = "black", fill = "grey") +
    ggplot2::geom_point(data = recs, ggplot2::aes(x = long, y = lat), colour="darkred") +
    ggplot2::theme(plot.margin=grid::unit(c(0,0,0,0), "mm")) +
    ggplot2::xlab('Longitude') +
    ggplot2::ylab('Latitude')+
    ggplot2::ggtitle(paste0("Location records from GBIF for ", Species))
  return(p)
  }



