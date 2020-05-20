.onLoad <- function(libname, pkgname) {
    # writeln('  vtg.basic .onLoad')
    # writeln(paste('    libname:', libname))
    # writeln(paste('    pkgname:', pkgname))
    # writeln('-----------------------------------------')
    # writeln()

    # fileName <- system.file('extdata', 'startup.message.txt', package=pkgname)
    # msg <- readChar(fileName, file.info(fileName)$size)
    # packageStartupMessage(msg)

    log <- lgr::get_logger_glue("vantage/vtg.basic")
    assign("log", log, envir=parent.env(environment()))
    set.option(
        "image.name",
        "harbor.distributedlearning.ai/vantage/vtg.basic:trolltunga"
    )
}

.onAttach <- function(libname, pkgname) {
    # writeln('vantage.basic .onAttach')
    # writeln(paste('  libname:', libname))
    # writeln(paste('  pkgname:', pkgname))
    # writeln()
}

options <- new.env()

set.option <- function(name, value) {
    assign(name, value, envir=options)
}

get.option <- function(name) {
    return(get(name, envir=options))
}

# FIXME: This is as close as I can get to a package-wide 'import x from y'
#        Anyone know a better way?
writeln <- vtg::writeln