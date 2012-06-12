#' Package to geocode street and IP addresses.
#' 
#' @name geocode-package
#' @aliases geocode
#' @docType package
#' @title Package for geocoding street and IP addresses.
#' @author Jaosn Bryer \email{jason@@bryer.org}
#' @keywords geocode gis mapping
#' @import RCurl RgoogleMaps
NULL

geolite.location <- data.frame()
geolite.blocks <- data.frame()

.onAttach <- function(libname, pkgname) {
	#pkgEnv = ps.to.env(match('package:geocode', search()))
	#assignInNamespace()
}


