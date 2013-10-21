jumbodb.getIndexes <-
function(host, collection, user=NULL, password=NULL, authenticate="basic"){
  
  require(httr)
  require(rjson)
  options(show.error.messages = TRUE)
  
  #check host string
  if( !grepl("http", host) ){
    stop("http is missing in host")
  }
  
  
  # create query
  url <- paste(host, '/jumbodb/jumbodb/rest/query/collections', sep="")
  conf <- c(add_headers(Connection = "keep-alive"), accept_json())
  if( !is.null(user) && !is.null(password) ){
    conf <- append(conf, authenticate(user, password, authenticate))
  }
  
  # check if collection exists
  try( col <- jumbodb.collections(host, user=user, password=password, authenticate=authenticate) )
  if( length( which( collection == col) ) == 0 ){
    stop("Collection not existing: ", collection)
  }
  
  
  # ask JumboDB
  try( out <- GET(url = url, config = conf) )
  
  
  #check output for JSON
  if( class(out) =="response" && substr(out, 1, 6) =="<html>" ){
    # HTML
    out <- out$status_code
    stop("HTTP Error: ", out)
  } else if ( substr(out, 1, 2) =="[{" ){
    # JSON - everything fine
    out <- fromJSON(as.character(out))
    collections <- sapply(out, function(x){return(x$collection)})
    id <- which(collections==collection)
    indexes <- sapply(out[[id]]$indexes, function(x){return(x)})
  } else {
    stop("WRONG output format from JumboDB: ", out)
  } 
  
 
  return(indexes)
}
