#' Return column sums.
#'
#' @param client Instance of \code{vantage.infrastructure::Client}
#' @param expl_vars \code{Character} vector of variables to include
#'
#' @return \code{data.frame} with one row for each site.
#' @export
#'
#' @examples
colSums <- function(client, expl_vars) {
    writeln("Retrieving colSums")
    image.name <- "harbor.distributedlearning.ai/vantage/vtg.basic:test"

    client$set.task.image(
        image.name,
        task.name="colSums"
    )

    sites <- client$call("colSums", expl_vars)
    return

    for (k in 1:length(sites)) {
        if (k == 1) {
            result <- sites[[k]]
        } else {
            result <- rbind(result, sites[[k]])
        }
    }

    if (length(sites) > 1) {
        rownames(result) <- 1:k
    }

    return(result)
}
