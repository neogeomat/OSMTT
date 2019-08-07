#' Add date attribute to overpass query
#'
#' @param opq An`overpass_query` object
#' @param datetime datetimestring in the form 2019-01-01T12:00:00Z
#' @return osmtt object
#' @export
#' @examples
#' oq <- osmdata::opq('bhaktapur')
#' add_date(oq,"2019-01-01T12:00:00Z")
add_date <- function (opq,datetime)
{
  datetime_string <- as.character(datetime,format = "%Y-%m-%dT%H:%M:%SZ")
  opq$prefix <- paste('[date:\"',datetime_string,'\"]',opq$prefix,sep = "")
  # print(opq$prefix)
  opq
}

#' Add adiff attribute to overpass query
#'
#' @param opq An overpass_query object
#' @param olddatetime datetimestring in the form 2019-01-01T12:00:00Z
#' @param newdatetime optional datetimestring in the form 2019-01-01T12:00:00Z, if empty current time is used
#' @return osmdiff object
#' @export
#' @examples
#' oq <- osmdata::opq('bhaktapur')
#' add_adiff(oq,"2019-01-01T12:00:00Z","2019-08-01T12:00:00Z")
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
