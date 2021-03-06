jumbodb.find <-
function(host, collection, query='{"limit": 1}', user=NULL, password=NULL, authenticate="basic"){
  require(httr)
  require(rjson)
  
  #check host string
  if( !grepl("http", host) ){
    stop("http is missing in host")
  }
  
  
  # create query
  url <- paste(host, '/jumbodb/jumbodb/rest/query/', collection, '/', sep="")
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
  options(show.error.messages = TRUE)
  try( out <- POST(url = url, config = conf, body = query) )
  
  
  #check output for JSON
  if( class(out) =="response" && substr(out, 1, 6) =="<html>" ){
    # HTML
    stop("HTTP Error: ", out$status_code)
  } else if ( substr(out, 1, 2) =="[{" || substr(out, 1, 1) =="{" ){
    # JSON - everything fine
    out <- fromJSON(as.character(out))
  } else {
    stop("WRONG output format from JumboDB: ", out)
  } 
  
  # Check for query error
  if( is.null( out$message ) ){
    # everything is fine
    out <- out$results
  } else {
    # error in query
    stop("Error in query: ", out$message)
  }
  
  return(out)
}
