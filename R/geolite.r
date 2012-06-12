#'
#' @export
geolite.update <- function(month=NULL, year=NULL) {
	urlBase = "http://geolite.maxmind.com/download/geoip/database/GeoLiteCity_CSV/GeoLiteCity_"
	if(is.null(month)) {
		month = format(Sys.time(), "%m")
	}
	if(is.null(year)) {
		year = paste("20", format(Sys.time(), "%y"), sep="")
	}
	newversion = paste(year, month, "01", sep="")
	if(nrow(geolite.version()) > 0) {
		print("Data files are already up to date.")
	} else {
		geolite.delete()
		url = paste(urlBase, newversion, sep="")
		url = paste(url, ".zip", sep="")
		dir = system.file(package="geocode")
		dest = paste(dir, "/data/GeoLiteCity.zip", sep="")
		download.file(url, dest, mode="wb")
		#zip.unpack(dest, paste(dir, "/data", sep=""))
		unzip(dest, exdir=paste(dir, "/data", sep=""))
		unlink(dest)
	}
}

#'
#' @export
geolite.delete <- function() {
	data.dir = paste(system.file(package="geocode"), "/data/", sep="")
	files = list.files(path=data.dir)
	for(f in files) {
		unlink(paste(data.dir, f, sep=""), recursive=TRUE)
	}
}

#'
#' @export
geolite.load <- function() {
	if(length(names(geolite.location)) == 0 || length(names(geolite.blocks)) == 0) {
		print("Loading GeoLiteCity database files. This may take a while, please be patient...")
		flush.console()
		data.dir = paste(system.file(package="geocode"), "/data/", sep="")
		data.dir = paste(data.dir, "GeoLiteCity_", geolite.version()$version[1], "/", sep="")
		geolite.location <<- read.csv(paste(data.dir, "GeoLiteCity-Location.csv", sep=""), skip=1, header=TRUE)
		print("Locations loaded...")
		flush.console()
		geolite.blocks <<- read.csv(paste(data.dir, "GeoLiteCity-Blocks.csv", sep=""), skip=1, header=TRUE)
		print("Blocks loaded...")
	}
}

#'
#' @export
geolite.version <- function() {
	data.dir = paste(system.file(package="geocode"), "/data/", sep="")
	files = list.files(data.dir)
	r = data.frame(version=character())
	for(i in 1:length(files)) {
		if(substr(files[i], 1, 12) == "GeoLiteCity_") {
			parts = unlist(strsplit(list.files(data.dir)[i], "_"))
			r = rbind(r, data.frame(version=parts[2]))
			break()
		}
	}
	r
}

#'
#' @export
geocode.ips <- function(ips) {
	geolite.load()
	ans = data.frame()
	for(ip in ips) {
		parts = unlist(strsplit(ip, "\\."))
		ipnum = 16777216*as.numeric(parts[1]) + 65536*as.numeric(parts[2]) + 256*as.numeric(parts[3]) + as.numeric(parts[4])
		group1 = geolite.blocks[which(geolite.blocks$startIpNum < ipnum),]
		group2 = group1[which(group1$endIpNum > ipnum),]
		if(nrow(group2) > 0) {
			ans = rbind(ans, 
						cbind(ip=ip, geolite.location[which(geolite.location$locId == group2[1,]$locId),])
						)
		} else {
			ans = rbind(ans, data.frame(ip=ip, locId=NA, country=NA, region=NA, city=NA, postalCode=NA, latitude=NA, longitude=NA, metroCode=NA, areaCode=NA))
		}
	}
	row.names(ans) = 1:nrow(ans)
	ans
}

