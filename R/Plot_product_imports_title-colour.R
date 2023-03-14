#' Plot the number of live imports by Source
#'
#' @param data The dataset to use (needs to be an export from the CITES database)
#' @param Species The species name e.g. "Python bivittatus"
#' @param min_year A year filter default is >2009 (so start year is 2010)
#' @export
#' @examples
#' Plot_product_imports_tc(data=vkmCites::Pythons, Species="Python bivittatus")

# 2010 onwards and global change

Plot_product_imports_tc<-function(data,Species, min_year=2009){
  source_colours=c(NULL = "black",C = "dodgerblue", 
                   F = "blue", I = "red", 
                   U = "grey", 
                   R = "orange", 
                   O = "lightgreen",
                   W = "yellow", 
                   Y = "green4", 
                   X = "darkblue", 
                   D= "red3", 
                   A="brown")
  
  data |>
    dplyr::filter(Taxon=={{Species}}) |>
    dplyr::filter(Term=="bodies"|Term=="skins"|Term=="unspecified"|
                    Term=="specimens"|Term=="skulls"|Term=="lether products (small)"|Term=="shoes"|
                    Term=="leather"|Term=="skin pieces"|Term==""|Term=="skeletons"|
                    Term=="leather items"|Term=="garments"|Term=="skin scraps"|Term=="horn scraps"|
                    Term=="trophies"|Term=="ivory carvings"|Term=="carvings"|Term=="derivatives"|
                    Term=="leather products (large)"|Term=="oil"|Term=="meat"|Term=="plates"|
                    Term=="extract"|Term=="bone products"|Term=="bone carvings"|Term==""|
                    Term=="eggs"|Term=="gall"|Term=="gall bladders"|Term=="heads"|
                    Term=="scales"|Term=="cloth"|Term=="frog legs"|Term=="leaves"|
                    Term=="calipse"|Term=="medicine"|Term=="tails"|Term=="jewellery"|Term=="bones"|Term=="chipes") |>
    dplyr::filter(Year>{{min_year}}) |>
    dplyr::group_by(Year, Source) |>
    dplyr::tally() |>
    ggplot2::ggplot(aes(Year, n, fill=Source))+
    ggplot2::geom_histogram(stat="identity")+
    ggplot2::labs(y="Number of imports of parts and products")+
    ggplot2::scale_fill_manual(values=source_colours)+
    ggplot2::theme_classic()+
    ggplot2::ggtitle(paste0("Part and product imports for ", Species))
  }


