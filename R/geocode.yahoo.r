#' Returns the longitude and latitude of a geocoded point using the Yahoo
#' Maps API.
#' 
#' @param address the street address to geocode.
#' @param key the Yahoo Maps API key.
#' @references \url{http://developer.yahoo.com/geo/placefinder/guide/}
#' @return a geocoded point.
#' @export
geocode.yahoo <- function(address, key) {
	data(YahooAccuracyCodes)
	data(YahooStatusCodes)
	yahoo.url = "http://where.yahooapis.com/geocode?"
	u = url(URLencode( paste(yahoo.url, "q=", address, "&output=xml&appid=", key)))
	#print(u)
	r = readLines(u, n=-1, warn=FALSE)
	doc = xmlInternalTreeParse(r)
	root = xmlRoot(doc)
	lat = xmlValue(root[['Result']][["latitude"]][[1]])
	lon = xmlValue(root[['Result']][["longitude"]][[1]])
	close(u)
	sta = xmlValue(root[['Error']])
	acc = xmlValue(root[['Result']][['quality']])
	pt <- list(longitude=lon, 
			   latitude=lat,
			   address=address,
			   accuracy.code=acc,
			   accuracy=YahooAccuracyCodes[which(YahooAccuracyCodes$Value == acc),'Description'],
			   status=YahooStatusCodes[which(YahooStatusCodes$Code == sta),'Code'],
			   source='Yahoo'
	)
	class(pt) <- "geocode"
	return(pt)
}
