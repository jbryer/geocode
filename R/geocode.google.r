#' Returns the longitude and latitude of a geocoded point using the Google
#' Maps API.
#' 
#' @param address the street address to geocode.
#' @param key the Google Maps API key.
#' @return a geocoded point.
#' @export
geocode.google <- function(address, key='anonymous') {
	#TODO: update to use version 3 of the API
	#https://developers.google.com/maps/documentation/geocoding/
	data(GoogleAccuracyCodes)
	data(GoogleStatusCodes)
	google.url = "http://maps.google.com/maps/geo?"
	u = url(URLencode( paste(google.url, "q=", address, "&output=csv&key=", key, sep="") ))
	r = readLines(u, n=1, warn=FALSE)
	split = strsplit(r, ",")[[1]]
	sta = split[1]
	acc = split[2]
	lat = split[3]
	lon = split[4]
	close(u)
	pt <- data.frame(longitude=lon, latitude=lat, 
			   accuracy=GoogleAccuracyCodes[which(GoogleAccuracyCodes$Value == acc),'Description'],
			   status=GoogleStatusCodes[which(GoogleStatusCodes$Code == sta),'Code'],
			   stringsAsFactors=FALSE)
	class(pt) <- "geocode"
	return(pt)
}
