print.osmttdiff <- function(obj)
{
  msg <- "Object of class 'osmdata' with:\n"
  msg <- c (msg, c (rep (' ', 17)))
  nm <- c (rep (" ", 17 - length(obj$create)), "Created: ", length(obj$create))
  msg <- c(msg,nm)
  message(msg)
}

#' Converts overpass diff xml to osmttdiff object
#'
#' @param xml xml document from overpass diff query
#' @export
#' @examples
#' \dontrun{
#' (od<-osmadiff("sanga","2019-01-01T12:00:00Z"))
#' odd<-osmdata:::overpass_query(osmdata::opq_string(od))
#' osmttdiff_sf(odd) -> odd_sf
#' }
osmttdiff_sf <- function(xml){
  obj <- osmttdiff(xml)

  # created elements
  odd_xml_create <- xml2::xml_find_all(odd_xml,'//action[@type="create"]/*')
  osm_create <- xml2::xml_new_root('osm')
  for (i in odd_xml_create) {
    # print(odd_xml_way)
    # print(i)
    xml2::xml_add_child(osm_create,i)
  }
  parse_odd_create <- osmdata:::rcpp_osmdata_sf(as.character(osm_create))

  obj$create <- parse_odd_create
}
