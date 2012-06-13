#' Data frame containing status codes from geocoding using Yahoo.
#' @references \url{http://developer.yahoo.com/geo/placefinder/guide/responses.html}
#' @docType data
YahooStatusCodes = as.data.frame(matrix(c(
	'0', 'No error',
	'1', 'Feature not supported',
	'100', 'No input parameters',
	'102', 'Address data not recognized as valid UTF-8',
	'103', 'Insufficient address data',
	'104', 'Unknown language',
	'105', 'No country detected',
	'106', 'Country not supported',
	'10NN', 'Internal problem detected'
	), byrow=TRUE, ncol=3), stringsAsFactors=FALSE)
names(YahooStatusCodes) = c('Code', 'Description')

#' Data frame containing accuracy codes from geocoding using Yahoo.
#' @references \url{http://developer.yahoo.com/geo/placefinder/guide/responses.html}
#' @docType data
YahooAccuracyCodes = as.data.frame(matrix(c(
	99,	'Coordinate',
	90,	'POI',
	87,	'Address match with street match',
	86,	'Address mismatch with street match',
	85,	'Address match with street mismatch',
	84,	'Address mismatch with street mismatch',
	82,	'Intersection with street match',
	80,	'Intersection with street mismatch',
	75,	'Postal unit/segment (Zip+4 in US)',
	74,	'Postal unit/segment, street ignored (Zip+4 in US)',
	72,	'Street match',
	71,	'Street match, address ignored',
	70,	'Street mismatch',
	64,	'Postal zone/sector, street ignored (Zip+2 in US)',
	63,	'AOI',
	62,	'Airport',
	60,	'Postal district (Zip Code in US)',
	59,	'Postal district, street ignored (Zip Code in US)',
	50,	'Level4 (Neighborhood)',
	49,	'Level4, street ignored (Neighborhood)',
	40,	'Level3 (City/Town/Locality)',
	39,	'Level3, level4 ignored (City/Town/Locality)',
	30,	'Level2 (County)',
	29,	'Level2, level3 ignored (County)',
	20,	'Level1 (State/Province)',
	19,	'Level1, level2 ignored (State/Province)',
	10,	'Level0 (Country)',
	9,	'Level0, level1 ignored (Country)',
	0,	'Not an address'
	), byrow=TRUE, ncol=2), stringsAsFactors=FALSE)
names(YahooAccuracyCodes) = c('Value', 'Description')
