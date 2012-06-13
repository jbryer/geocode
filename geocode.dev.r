install.packages(c('RCurl','XML','devtools','roxygen2'))

require(devtools)
require(roxygen2)

setwd('C:/Dropbox/Projects')
setwd('~/Dropbox/Projects')

document('geocode')
build('geocode')
install('geocode')

require(geocode)
ls('package:geocode')
