\name{geolite.version}
\alias{geolite.version}
\title{Returns the version of the currently available GeoLite City database}

\description{
  Prints the version of the currently available GeoLite City database. The version is printed
  as the date of the update (i.e. yyyymmdd).
}

\usage{
geolite.version()
}

\author{Jason Bryer \email{jason@bryer.org}}

\seealso{
	\code{\link[geocode]{geolite.delete}},
	\code{\link[geocode]{geolite.load}},
	\code{\link[geocode]{geocode.ips}},
	\code{\link[geocode]{geolite.update}}
}

\examples{
    library(geocode)
    geolite.update()
    geocode.ips("205.143.68.51")
}

\keyword{gis, geolite, ip, geocode}
