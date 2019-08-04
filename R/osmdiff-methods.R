read.osmttdiff <- function(obj,doc){
  if (missing (doc))
  {
    doc <- osmdata:::overpass_query (query = obj$overpass_call, quiet = quiet,
                           encoding = encoding)

    docx <- xml2::read_xml (doc)
    obj$meta <- list (timestamp = get_timestamp (docx),
                      OSM_version = get_osm_version (docx),
                      overpass_version = get_overpass_version (docx))
  } else
    if (is.character (doc))
    {
      if (!file.exists (doc))
        stop ("file ", doc, " does not exist")
      doc <- xml2::read_xml (doc)
    }
    obj$doc <- doc
    return(obj)
}
