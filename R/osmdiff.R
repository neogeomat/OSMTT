#' osmdiff class def
#'
#' @param bbox bounding box
#' @param file previous export
#' @param base_url change if required, default is "http://overpass-api.de/api"
#' @param silent produce warning messages
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
