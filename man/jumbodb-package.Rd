\name{RjumboDB}
\alias{jumbodb-Rpkg-package}
\alias{jumbodb-Rpkg}
\alias{RjumboDB}
\docType{package}
\title{
R package to connect with the jumboDB database (\url{https://github.com/comsysto/jumbodb})
}
\description{
A simple package to get data from jumboDB database (\url{https://github.com/comsysto/jumbodb}). It provides simple query functionaltiy 
as find, count, getIndexes, etc.
}
\details{
\tabular{ll}{
Package: \tab RjumboDB\cr
Type: \tab Package\cr
Version: \tab 0.2\cr
Date: \tab 2013-10-04\cr
License: \tab AGPL-3\cr
}
}
\author{
Markus Schmidberger; markus.schmidberger@comsysto.com
}

\keyword{ package }
\keyword{ data }
\keyword{ manip }
\keyword{ database }
\seealso{
https://github.com/comsysto/jumbodb-Rpkg
https://github.com/comsysto/jumbodb
}
\examples{
\dontrun{
library(RjumboDB)
host <- "localhost:8080"
collection <- "test"
test <- jumbodb.collections(host)
test2 <- jumbodb.getIndexes(host, collection)
test3 <- jumbodb.getOperations(host, collection)
test4 <- jumbodb.find(host, collection, query='{"limit": 1}')
test5 <- jumbodb.count(host, collection, query='{"limit": 1}')
}
}
