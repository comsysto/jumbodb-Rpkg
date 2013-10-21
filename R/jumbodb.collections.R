jumbodb.collections <-
function(host, user=NULL, password=NULL, authenticate="basic"){
  
  require(httr)
  require(rjson)
  options(show.error.messages = TRUE)
  
  #check host string
  if( !grepl("http", host) ){
    stop("http is missing in host")
  }
  
  url <- paste(host, '/jumbodb/jumbodb/rest/query/collections', sep="")
  conf <- c(add_headers(Connection = "keep-alive"), accept_json())
  
  if( !is.null(user) && !is.null(password) ){
    conf <- append(conf, authenticate(user, password, authenticate))
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
    out <- sapply(out, function(x){return(x$collection)})
  } else {
    stop("WRONG output format from JumboDB: ", out)
  } 
  
  return(out)
}
