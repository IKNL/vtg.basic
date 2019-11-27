# The Dockerfile tells Docker how to construct the image with your algorithm.
# Once pushed to a repository, images can be downloaded and executed by the
# network hubs.
FROM custom-r-base

LABEL maintainer="Melle Sieswerda <m.sieswerda@iknl.nl>"


# Install R package from github
# COPY docker/install_packages.R /app
# RUN Rscript install_packages.R
COPY src /usr/local/R/vantage.basic/
WORKDIR /usr/local/R/vantage.basic
RUN Rscript -e 'library(devtools)' -e 'install_deps(".")'
RUN R CMD INSTALL --no-multiarch --with-keep.source .


# Change directory to '/app’ and create files that will be
# used to mount input, output and database.
WORKDIR /app
RUN touch input.txt
RUN touch output.txt
RUN touch database


# Tell docker to execute `docker.wrapper()` when the image is run.
CMD Rscript -e 'library(vantage.basic)' -e 'vantage.infrastructure::docker.wrapper()'

