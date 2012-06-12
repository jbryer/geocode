\name{geolite.delete}
\alias{geolite.delete}
\title{Deletes all GeoLite City database files}

\description{
  Deletes all GeoLite City database files.
}

\usage{
geolite.delete()
}

\author{Jason Bryer \email{jason@bryer.org}}

\seealso{
	\code{\link[geocode]{geolite.version}},
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
