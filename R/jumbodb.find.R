jumbodb.find <-
function(host, collection, query='{"limit": 1}', user=NULL, password=NULL, authenticate="basic"){
  require(httr)
  require(rjson)
  
  #check host string
  if( !grepl("http", host) ){
    stop("http is missing in host")
  }
  
  url <- paste(host, '/jumbodb/jumbodb/rest/query/', collection, '/', sep="")
  conf <- c(add_headers(Connection = "keep-alive"), accept_json())
  
  if( !is.null(user) && !is.null(password) ){
    conf <- append(conf, authenticate(user, password, authenticate))
  }
  
  
  # ask JumboDB
  options(show.error.messages = TRUE)
  try( out <- POST(url = url, config = conf, body = query) )
  
  
  #check output for JSON
  if( class(out) =="response" && substr(out, 1, 6) =="<html>" ){
    # HTML
    out <- out$status_code
    stop("HTTP Error: ", out)
  } else if ( substr(out, 1, 2) =="[{" ){
    # JSON - everything fine
    out <- fromJSON(as.character(out))
  } else {
    stop("WRONG output format from JumboDB: ", out)
  } 
  
  return(out$results)
}
