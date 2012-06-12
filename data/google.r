#' Data frame containing status codes from geocoding using Google.
#' @docType data
GoogleStatusCodes = as.data.frame(matrix(c(
	200, "G_GEO_SUCCESS", "No errors occurred; the address was successfully parsed and its geocode was returned.",
	500, "G_GEO_SERVER_ERROR", "A geocoding or directions request could not be successfully processed, yet the exact reason for the failure is unknown.",
	601, "G_GEO_MISSING_QUERY", "An empty address was specified in the HTTP q parameter.",
	602, "G_GEO_UNKNOWN_ADDRESS", "No corresponding geographic location could be found for the specified address, possibly because the address is relatively new, or because it may be incorrect.",
	603, "G_GEO_UNAVAILABLE_ADDRESS", "The geocode for the given address or the route for the given directions query cannot be returned due to legal or contractual reasons.",
	610, "G_GEO_BAD_KEY", "The given key is either invalid or does not match the domain for which it was given.",
	620, "G_GEO_TOO_MANY_QUERIES", "The given key has gone over the requests limit in the 24 hour period or has submitted too many requests in too short a period of time. If you're sending multiple requests in parallel or in a tight loop, use a timer or pause in your code to make sure you don't send the requests too quickly."
	), byrow=TRUE, ncol=3), stringsAsFactors=FALSE)
names(GoogleStatusCodes) = c('Code', 'Label', 'Description')

#' Data frame containing accuracy codes from geocoding using Google.
#' @docType data
GoogleAccuracyCodes = as.data.frame(matrix(c(
	0, "Unknown accuracy.",
	1, "Country level accuracy.",
	2, "Region (state, province, prefecture, etc.) level accuracy.",
	3, "Sub-region (county, municipality, etc.) level accuracy.",
	4, "Town (city, village) level accuracy.",
	5, "Post code (zip code) level accuracy.",
	6, "Street level accuracy.",
	7, "Intersection level accuracy.",
	8, "Address level accuracy.",
	9, "Premise (building name, property name, shopping center, etc.) level accuracy."
	), byrow=TRUE, ncol=2), stringsAsFactors=FALSE)
names(GoogleAccuracyCodes) = c('Value', 'Description')

