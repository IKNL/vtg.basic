#' Return number of rows.
#'
#' @param client Instance of \code{vtg::Client}
#'
#' @return \code{data.frame} with one row for each site.
#' @export
#'
#' @examples
nrow <- function(client) {
    log$debug("Retrieving number of rows")

    image.name <- get.option('image.name')
    log$debug("Using image: '{image.name}'")

    client$set.task.image(image.name, task.name="nrow")
    result <- client$call("nrow")

    return(result)
}