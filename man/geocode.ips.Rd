\name{geocode.ips}
\alias{geocode.ips}
\title{Geocode Internet Protocol (IP) Addresses}

\description{
  Geocode Internet Protocol (IP) addresses. The return data frame will have the following
  columns: country, region, city, postalCode, latitude, longitude, metroCode, and areaCode.
}

\usage{
geocode.ips(ips)
}

\arguments{
\item{ips}{a vector of character strings representing the Internet Protocal (IP) addresses to be geocoded.}
}

\author{Jason Bryer \email{jason@bryer.org}}

\seealso{
	\code{\link[geocode]{geolite.delete}},
	\code{\link[geocode]{geolite.load}},
	\code{\link[geocode]{geolite.version}},
	\code{\link[geocode]{geolite.update}}
}

\examples{
    library(geocode)
    geolite.update()
    geocode.ips("205.143.68.51")
}

\keyword{gis, geolite, ip, geocode}
