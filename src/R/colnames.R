#' Return column names.
#'
#' @param client Instance of \code{vantage.infrastructure::Client}
#' @param expl_vars \code{Character} vector of variables to include
#'
#' @return \code{data.frame} with one row for each site.
#' @export
#'
#' @examples
colnames <- function(client) {
    writeln("Retrieving column names")
    image.name <- "harbor.distributedlearning.ai/vantage/vtg.basic:trolltunga"

    client$set.task.image(
        image.name,
        task.name="colnames"
    )

    result <- client$call("colnames")
    return(result)

}