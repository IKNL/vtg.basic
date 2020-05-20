#' Return column names.
#'
#' @param client Instance of \code{vtg::Client}
#' @param expl_vars \code{Character} vector of variables to include
#'
#' @return \code{data.frame} with one row for each site.
#' @export
#'
#' @examples
colnames <- function(client) {
    log$debug("Retrieving column names")

    image.name <- get.option('image.name')
    log$debug("Using image: '{image.name}'")

    client$set.task.image(image.name, task.name="colnames")
    result <- client$call("colnames")

    return(result)
}