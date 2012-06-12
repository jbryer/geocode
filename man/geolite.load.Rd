\name{geolite.load}
\alias{geolite.load}
\title{Loads the GeoLite City data files into memory}

\description{
  Loads the GeoLite City data files into memory. This method will be called automatically
  upon the first \code{\link[geocode]{geocode.ip}} call.
}

\usage{
geolite.load()
}

\author{Jason Bryer \email{jason@bryer.org}}

\seealso{
	\code{\link[geocode]{geolite.delete}},
	\code{\link[geocode]{geolite.version}},
	\code{\link[geocode]{geocode.ips}},
	\code{\link[geocode]{geolite.update}}
}

\examples{
    library(geocode)
    geolite.update()
    geocode.ips("205.143.68.51")
}

\keyword{gis, geolite, ip, geocode}
