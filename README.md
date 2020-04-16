# vtg.basic

Basic Algorithms for the [vantage6](https://github.com/IKNL/vantage6) federated infrastructure.

Contains the following algorithms:
* colSums
* colnames

## Installation

```R
# This also installs the package vtg
devtools::install_github('IKNL/vtg.basic', subdir='src')
```

## Example use
```R
# Function to create a client
setup.client <- function() {
  # Username/password should be provided by the administrator of
  # the server.
  username <- "username@example.com"
  password <- "password"
  
  host <- 'https://trolltunga.vantage6.ai'
  api_path <- ''
  
  # Create the client & authenticate
  client <- vtg::Client$new(host, api_path=api_path)
  client$authenticate(username, password)

  return(client)
}

# Create a client
client <- setup.client()

# Get a list of available collaborations
print( client$getCollaborations() )

# Should output something like this:
#   id     name
# 1  1 ZEPPELIN
# 2  2 PIPELINE

# Instruct the client to use collaboration "PIPELINE".
client$setCollaborationId(2)

# Since vtg.basic exports function names that collide with built-in functions, 
# it's probably better to not attach the package, but call functions with a prefix instead. 
vtg.basic::colnames(client)
```
