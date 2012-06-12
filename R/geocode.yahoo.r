#' Returns the longitude and latitude of a geocoded point using the Yahoo
#' Maps API.
#' 
#' @param address the street address to geocode.
#' @param key the Yahoo Maps API key.
#' @return a geocoded point.
#' @export
geocode.yahoo <- function(key, address) {
	yahoo.url = "http://local.yahooapis.com/MapsService/V1/geocode?"
	u = url(URLencode( paste(yahoo.url, "location=", address, "&output=xml&appid=", key)))
	r = readLines(u, n=-1, warn=FALSE)
	doc = xmlInternalTreeParse(r)
	root = xmlRoot(doc)
	lat = xmlValue(root[[1]]["Latitude"][[1]])
	lon = xmlValue(root[[1]]["Longitude"][[1]])
	close(u)
	data.frame(longitude=lon, latitude=lat)
}
