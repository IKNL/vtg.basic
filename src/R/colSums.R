colSums <- function(client, expl_vars) {
    writeln("Retrieving colSums")
    image.name <- "harbor.distributedlearning.ai/vantage/vantage.basic:test"

    client$set.task.image(
        image.name,
        task.name="colSums"
    )

    sites <- client$call("colSums", expl_vars)
    return

    for (k in 1:length(sites)) {
        if (k == 1) {
            result <- sites[[k]]$result
        } else {
            result <- rbind(result, sites[[k]]$result)
        }
    }

    rownames(result) <- 1:k
    return(result)
}
