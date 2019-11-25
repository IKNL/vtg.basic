colnames <- function(client) {
    writeln("Retrieving column names")
    image.name <- "harbor.distributedlearning.ai/vantage/vantage.basic:test"

    client$set.task.image(
        image.name,
        task.name="colnames"
    )

    result <- client$call("colnames")
    return(result)

}