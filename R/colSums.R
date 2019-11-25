colSums <- function(client) {
    writeln("Retrieving colSums")
    image.name <- "harbor.distributedlearning.ai/vantage/vantage.basic:test"

    client$set.task.image(
        image.name,
        task.name="colSums"
    )

    colsums <- client$call("colSums")
    result <- c()

    for (item in colsums) {
        result <- c(result, colsums$result)
    }

    return(result)
}
