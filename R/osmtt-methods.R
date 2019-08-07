#' @export
print.osmtt <- function(x){
  osmdata::opq_string(x)
}

#' Plots osmdata using sf plot methods
#'
#' @export
plot.osmdata <- function(x) {
  plot(sf::st_geometry(x$osm_points))
  plot(sf::st_geometry(x$osm_lines), add=TRUE, col = 'Blue')
}

#' queries overpass object and convert to osmdata object
#'
#' @param q osmtt object
#' @return osmdata object
#' @examples
#' \dontrun{
#' new_url <- "http://overpass-api.de/api/interpreter"
#' osmdata::set_overpass_url(new_url)
#' op <- osmtt("sudal nepal","2019-01-01T12:00:00Z")
#' op_sf <- osmtt_sf(op,quiet = FALSE)
#' }
osmtt_sf <- function(q){
  # class(q)
  q_sf <- osmdata::osmdata_sf(q)
  return(q_sf)
}
