jumbodb.getIndexes <-
function(host, collection, user=NULL, password=NULL, authenticate="basic"){
  require(httr)
  require(rjson)
  
  url <- paste(host, '/jumbodb/jumbodb/rest/query/collections', sep="")
  conf <- c(add_headers(Connection = "keep-alive"), accept_json())
  
  if( !is.null(user) && !is.null(password) ){
    conf <- append(conf, authenticate(user, password, authenticate))
  }
  
  out <- GET(url = url, config = conf)
  out <- fromJSON(as.character(out))
  collections <- sapply(out, function(x){return(x$collection)})
  id <- which(collections==collection)
  indexes <- sapply(out[[id]]$indexes, function(x){return(x)})
  
  return(indexes)
}
