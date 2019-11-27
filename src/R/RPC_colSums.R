#' Return column sums.
#'
#' @param expl_vars Variables to include.
#' @return column sums
RPC_colSums <- function(df, expl_vars) {
    return(base::colSums(df[expl_vars]))
}


