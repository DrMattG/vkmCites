#' Plot python trade network
#'
#' @param Taxon Species name
#' @param importer Country of import (defaults to "NO" - Norway)
#' @param min_year A year filter default is >2009 (so start year is 2010)
#' @return Visnetwork graph of origin, export and import of live and derived products of pythons
#' @importFrom rlang .data
#' @export
#'
#' @examples
#' plot_python_trade_network(Taxon="Python bivittatus")
#' plot_python_trade_network(Taxon="Morelia bredli")

# Add a date range option
# Add in option for all trades
plot_python_trade_network<-function(Taxon, importer="NO",min_year=2009){

  dat<-NULL

   dat=vkmCites::Pythons |>
    dplyr::mutate(Term2=dplyr::case_when(
      .data$Term=="live"~"live",
      .data$Term=="eggs (live)"~"live",
      TRUE~"parts or product"
    ))|>
    dplyr::filter(.data$Taxon=={{Taxon}}) |>
    dplyr::filter(.data$Importer=={{importer}}) |>
    dplyr::mutate(Term=.data$Term2) |>
    dplyr::filter(.data$Year>{{min_year}}) |>
    dplyr::group_by(.data$Year, .data$Term, .data$Origin, .data$Exporter,.data$Importer) |>
    dplyr::tally()
  if(dim(dat)[1]<1) stop("Not enough data for your chosen taxon")


  type = dplyr::tibble("Type"=c(dat$Term, dat$Term))
  source = dplyr::tibble("Source"=c(dat$Origin,dat$Exporter))
  target = dplyr::tibble("Target"=c(dat$Exporter,dat$Importer))
  value =  dplyr::tibble("Value"=c(dat$n, dat$n))

  node_label1<-unique(dat$Origin)
  node_label2<-unique(dat$Exporter)
  node_label3<-unique(dat$Importer)

  node_label<-c(node_label1, node_label2, node_label3)
  node_label<-unique(node_label)

  relations=cbind(source, target)
  nodes<-data.frame("node"=node_label,
                    color.background=c("darkgreen"))

  nodes=nodes |>
    dplyr::mutate(id=dplyr::row_number()) |>
    dplyr::mutate(label=nodes$node)

  edges<-data.frame(from=relations$Source, to=relations$Target,
                    type=type$Type, value=value$Value)

  edges=edges |>
    dplyr::left_join(nodes,by=c("from"="node")) |>
    dplyr::mutate(from_id=edges$id) |>
    dplyr::select(-edges$id)

  edges=edges |>
    dplyr::left_join(nodes,by=c("to"="node")) |>
    dplyr::mutate(to_id=edges$id) |>
    dplyr::select(-edges$id)

  edges=edges |>
    dplyr::mutate(from=edges$from_id,
                  to=edges$to_id)

  edges =edges |>
    dplyr::mutate(color=dplyr::case_when(type=="live"~ "#FF0000",
                           TRUE~"#00FFFF"))

  edges=edges |>
    dplyr::mutate(width=value)

  # edges=edges |>
  #   mutate(label= type)
  ledges <- data.frame(color = c("#FF0000", "#00FFFF"),
                       label = c("live", "product"))
  visNetwork::visNetwork(nodes, edges)  |>
    visNetwork::visPhysics(enabled = FALSE) |>
    visNetwork::visLegend(addEdges = ledges)

}


