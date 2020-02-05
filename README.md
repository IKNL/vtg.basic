# vtg.basic

Basic Algorithms for the [Vantage6](https://github.com/IKNL/VANTAGE6) federated infrastructure.

Contains the following algorithms:
* colSums
* colnames

## Installation

```R
# This also installs the package vtg
devtools::install_github('mellesies/vtg.basic', subdir='src')
```

## Example use
```R
# Load the package
library(vtg.basic)

# Function to create a client
setup.client <- function() {
  # Define parameters
  username <- "username@example.com"
  password <- "password"
  collaboration_id <- 1
  host <- 'https://api-test.distributedlearning.ai'
  api_path <- ''
  
  # Create the client
  client <- vtg::Client(host, username, password, collaboration_id, api_path)
  client$authenticate()

  return(client)
}

# Create a client
client <- setup.client()
```
