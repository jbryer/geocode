\name{geolite.update}
\alias{geolite.update}
\title{Download and Update GeoLite City Database}

\description{
  This function will download the latest GeoLite City data files from MaxMind's website.
  These data are typically updated on the first of every month and therefore it is only necessary
  to run this function once a month at most. Note that the download file is approximately
  30MB and will require an additional 120MB once downloaded. Occassionally the data files are
  not posted until later in the month, in those instances used the month and/or year parameters.
}

\usage{
geolite.update()
}

\arguments{
\item{month}{\textit{optional} the month of the GeoLite data file to download and use.}
\item{year}{\textit{optional} the year of the GeoLite data fiel to download and use.}
}

\author{Jason Bryer \email{jason@bryer.org}}

\seealso{
	\code{\link[geocode]{geolite.delete}},
	\code{\link[geocode]{geolite.load}},
	\code{\link[geocode]{geocode.ips}},
	\code{\link[geocode]{geolite.version}}
}

\examples{
    library(geocode)
    geolite.update()
    geocode.ips("205.143.68.51")
}

\keyword{gis, geolite, ip, geocode}
