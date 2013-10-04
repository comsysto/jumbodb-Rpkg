\name{jumbodb.count}
\alias{jumbodb.count}
\title{Count documents in query to jumboDB}
\description{
A function which counts the number of results of your query to a jumboDB collection.
}
\usage{
jumbodb.count(host, collection, query = "{\"limit\": 1}", user = NULL, password = NULL, authenticate = "basic")
}
\arguments{
  \item{host}{the hostname}
  \item{collection}{the collection name}
  \item{query}{the jumbodb formated query you are intersted in}
  \item{user}{the user name for authentication}
  \item{password}{the password for authentication}
  \item{authenticate}{the http authentication (\link{authenticate}) method}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
https://github.com/comsysto/jumbodb-Rpkg
https://github.com/comsysto/jumbodb
}
\author{
Markus Schmidberger; markus.schmidberger@comsysto.com
}

\examples{
\dontrun{
library(RjumboDB)
host <- "localhost:8080"
collection <- "test"
jumbodb.count(host, collection)
}
}
\keyword{ data }
\keyword{ manip }
\keyword{ database }
