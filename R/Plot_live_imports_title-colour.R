#' Plot the number of live imports by Source
#'
#' @param data The dataset to use (needs to be an export from the CITES database)
#' @param Species The species name e.g. "Python bivittatus"
#' @param min_year A year filter default is >2009 (so start year is 2010)
#' @export
#' @examples
#' Plot_live_imports_tc(data=vkmCites::Pythons, Species="Python bivittatus")

# 2010 onwards and global change

Plot_live_imports_tc<-function(data,Species, min_year=2009){
  data |>
    dplyr::filter(Taxon=={{Species}}) |>
    dplyr::filter(Term=="live"|Term=="eggs (live)") |>
    dplyr::filter(Year>{{min_year}}) |>
    dplyr::group_by(Year, Source) |>
    dplyr::tally() |>
    ggplot2::ggplot(aes(Year, n, fill=Source))+
    ggplot2::geom_histogram(stat="identity")+
    ggplot2::labs(y="Number of live imports")+
    viridis::scale_fill_viridis(discrete=T)+
    #ggplot2::scale_colour_manual(values=c(NULL = "black",
     #                                     C = "dodgerblue", 
      #                                    F = "blue", I = "red", 
       #                                   U = "grey", 
        #                                  R = "orange", 
         #                                 O = "lightgreen",
          #                                W = "yellow", 
           #                               Y = "green4", 
            #                              X = "darkblue", 
             #                             D= "red3", A="brown"))+
    ggplot2::labs(y="Number of live imports")+
    ggplot2::theme_classic()+
    ggplot2::ggtitle(paste0("Live imports for ", Species))
  }


