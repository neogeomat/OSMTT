print.osmtt <- function(x){
  osmdata::opq_string(x)
}

plot.osmdata <- function(x) {
  plot(sf::st_geometry(x$osm_points))
  plot(sf::st_geometry(x$osm_lines), add=TRUE, col = 'Blue')
}
