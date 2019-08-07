#' Get how the osm data looked at certain time
#'
#' @param bbox place name or bbox object
#' @param datetime The timestamp where you want the data
#' @export
#' @examples
#' osmtt("bhaktapur","2019-01-01T12:00:00Z")
osmtt <- function(bbox,datetime){
  bbox <- osmdata::getbb(bbox)
  oq <- osmdata::opq(bbox = bbox)
  oq <- add_date(oq,datetime)
  oq$datetime <- datetime
  class (oq) <- append ("osmtt",class (oq))
  oq
}

#' Get how the osm data looked at certain time
#'
#' @param bbox place name or bbox object
#' @param datetime The timestamp where you want the data
#' @export
osmadiff <- function(bbox,datetime){
  bbox <- osmdata::getbb(bbox)
  oq <- osmdata::opq(bbox = bbox)
  oq <- add_adiff(oq,datetime)
  class (oq) <- append ("osmdiff",class (oq))
  return(oq)
}
