#' Get how the osm data looked at past time
#'
#' @export
#' @param bbox place name or bbox object
#' @param datetime The timestamp where you want the data
#' @examples
#' plot(osmtt("muenster",""))
osmtt <- function(bbox,datetime){
  bbox <- osmdata::getbb(bbox)
}
