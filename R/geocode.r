#' 
#' @export
print.geocode <- function(x) {
	cat(paste(x$address, ' was geocoded using ', x$source, '\n',
			  '  Accuracy: ', x$accuracy, '\n',
			  '  Long/Lat: ', x$longitude, ', ', x$latitude, sep=''))
}

plot.geocode <- function(x) {
	
}
