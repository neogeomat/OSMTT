#' Add date attribute to overpass query
#'
#' @param opq An`overpass_query` object
#' @param datetime datetimestring in the form %Y-%m-%dT%H:%M:%SZ e.g. 2019-01-01T12:00:00Z
#' @return osmtt object
#' @references \url{https://wiki.openstreetmap.org/wiki/Overpass_API/Overpass_QL#date}
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
#' @param olddatetime datetimestring in the form %Y-%m-%dT%H:%M:%SZ e.g. 2019-01-01T12:00:00Z
#' @param newdatetime optional: datetimestring in the form %Y-%m-%dT%H:%M:%SZ e.g. 2019-01-01T12:00:00Z, if empty current time is used
#' @return osmdiff object
#' @references \url{https://wiki.openstreetmap.org/wiki/Overpass_API/Overpass_QL#date}
#' @export
#' @examples
#' \dontrun{
#' oq <- osmdata::opq('bhaktapur')
#' add_date(oq,datetime)
#' }
add_adiff <- function (opq, olddatetime, newdatetime)
{
  olddatetime_string <- as.character(olddatetime,format = "%Y-%m-%dT%H:%M:%SZ")
  if(missing(newdatetime)){
    newdatetime = Sys.time()
    }
  newdatetime_string <- as.character(newdatetime,format = "%Y-%m-%dT%H:%M:%SZ")
  opq$prefix <- paste('[adiff:\"',olddatetime_string,'\",\"',newdatetime_string,'\"]',opq$prefix,sep = "")
  opq$suffix <- paste(opq$suffix,'out geom;')
  # print(opq$prefix)
  opq
}
