#' osmdiff class def
#'
#' @param bbox bounding box
#' @param overpass_call overpass_call
#' @param meta metadata of overpass query, including timestamps and version
#' numbers
#' @param osm_points OSM nodes as \pkg{sf} Simple Features Collection of points
#'                   or \pkg{sp} SpatialPointsDataFrame
#' @param osm_lines OSM ways \pkg{sf} Simple Features Collection of linestrings
#'                  or \pkg{sp} SpatialLinesDataFrame
#' @param osm_polygons OSM ways as \pkg{sf} Simple Features Collection of
#'                     polygons or \pkg{sp} SpatialPolygonsDataFrame
#' @param osm_multilines OSM relations as \pkg{sf} Simple Features Collection
#'                       of multilinestrings or \pkg{sp} SpatialLinesDataFrame
#' @param osm_multipolygons OSM relations as \pkg{sf} Simple Features
#'                          Collection of multipolygons or \pkg{sp}
#'                          SpatialPolygonsDataFrame
#' @param ... other options ignored
#'
#' @note Class constructor should never be used directly, and is only exported
#' to provide access to the print method
#'
#' @export
osmdiff <- function (bbox = NULL, file = NULL, base_url = "http://overpass-api.de/api",
                     silent = FALSE)
{
  obj <- list (
    bbox = bbox,
    base_url = base_url,
    silent = silent,
    create = list(),
    modify = list(),
    delete = list()
    )
  class (obj) <- append (class (obj), "osmadiff")
  return (obj)
}
