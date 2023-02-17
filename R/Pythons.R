#' @title Pythons
#' @description Downloaded (2023.02.16) Pythons trade data from the CITES Trade database.
#' @format A data frame with 1697301 rows and 20 variables:
#' \describe{
#'   \item{\code{Id}}{double Globally Unique Identifer for each import record}
#'   \item{\code{Year}}{integer Year of import}
#'   \item{\code{Appendix}}{character Relevant Appendix}
#'   \item{\code{Taxon}}{character Taxon}
#'   \item{\code{Class}}{character Class}
#'   \item{\code{Order}}{character Order}
#'   \item{\code{Family}}{character Family}
#'   \item{\code{Genus}}{character Genus}
#'   \item{\code{Term}}{character Term describing the trade (e.g. live, specimen, skins, bone, shoes, etc ) }
#'   \item{\code{Quantity}}{double Number of objects (not always individuals)}
#'   \item{\code{Unit}}{character Unit describing Quantity}
#'   \item{\code{Importer}}{character Two letter country code for importing country}
#'   \item{\code{Exporter}}{character Two letter country code for exporting country}
#'   \item{\code{Origin}}{character Two letter country code for country of origin}
#'   \item{\code{Purpose}}{character 12 single letter codes \link[vkmCites]{Purpose_codes} describing the trade purpose (e.g. commerical, scientific, etc.)}
#'   \item{\code{Source}}{character 11 single letter codes \link[vkmCites]{Source_codes} describing the source of the trade (e.g. captive breeding, wild caught, etc.)}
#'   \item{\code{Reporter.type}}{character I= Importer, E= Exporter}
#'   \item{\code{Import.permit.RandomID}}{character Globally Unique Identifier}
#'   \item{\code{Export.permit.RandomID}}{character Globally Unique Identifier}
#'   \item{\code{Origin.permit.RandomID}}{character Globally Unique Identifier}
#'}
#' @details Dataset for testing functions in the package
"Pythons"

