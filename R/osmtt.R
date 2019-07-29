#' Get how the osm data looked at certain time
#'
#' @param bbox place name or bbox object
#' @param datetime The timestamp where you want the data
#' @export
#' @examples
#' osmtt("bhaktapur","2019-01-01T12:00:00Z")
osmtt <- function(bbox,datetime,...){
  bbox <- osmdata::getbb(bbox)
  oq <- osmdata::opq(bbox = bbox,...)
  add_date(oq,datetime)
}

#' Get how the osm data looked at certain time
#'
#' @param bbox place name or bbox object
#' @param datetime The timestamp where you want the data
#' @export
#' @examples
#' osmtt("bhaktapur","2019-01-01T12:00:00Z")
osmadiff <- function(bbox,datetime){
  bbox <- osmdata::getbb(bbox)
  oq <- osmdata::opq(bbox = bbox)
  add_adiff(oq,datetime)
}

#' Add date attribute to overpass query
#'
#' @param opq An`overpass_query` object
#' @param datetime datetimestring in the form %Y-%m-%dT%H:%M:%SZ e.g. 2019-01-01T12:00:00Z
#' @return \link{opq} object
#' @references
#' <https://wiki.openstreetmap.org/wiki/Overpass_API/Overpass_QL#date>
#' @export
#' @examples
#' \dontrun{
#' oq <- osmdata::opq('bhaktapur')
#' add_date(oq,datetime)
#' }
add_date <- function (opq,datetime)
{
  datetime_string <- as.character(datetime,format = "%Y-%m-%dT%H:%M:%SZ")
  opq$prefix <- paste('[date:\"',datetime_string,'\"]',opq$prefix,sep = "")
  # print(opq$prefix)
  opq
}

#' Add adiff attribute to overpass query
#'
#' @param opq An`overpass_query` object
#' @param datetime datetimestring in the form %Y-%m-%dT%H:%M:%SZ e.g. 2019-01-01T12:00:00Z
#' @return \link{opq} object
#' @references
#' <https://wiki.openstreetmap.org/wiki/Overpass_API/Overpass_QL#date>
#' @export
#' @examples
#' \dontrun{
#' oq <- osmdata::opq('bhaktapur')
#' add_date(oq,datetime)
#' }
add_adiff <- function (opq,olddatetime,newdatetime = Sys.time())
{
  olddatetime_string <- as.character(olddatetime,format = "%Y-%m-%dT%H:%M:%SZ")
  newdatetime_string <- as.character(newdatetime,format = "%Y-%m-%dT%H:%M:%SZ")
  opq$prefix <- paste('[adiff:\"',olddatetime_string,'\",\"',newdatetime_string,'\"]',opq$prefix,sep = "")
  opq$suffix <- paste(opq$suffix,'out geom;')
  # print(opq$prefix)
  opq
}
