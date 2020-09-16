## https://hub.docker.com/_/r-base
FROM r-base:latest

## Install RMixtComp and its dependencies
RUN apt update && apt install  -y --no-install-recommends \
  libcurl4-openssl-dev \
  libssl-dev

RUN Rscript -e "install.packages(c('RMixtComp'), repos='http://cran.rstudio.com/');"

## package for reading param file
RUN Rscript -e "install.packages(c('jsonlite'), repos='http://cran.rstudio.com/');"

## input is the folder containing the data
COPY input input

COPY script.R .

ENTRYPOINT ["Rscript", "script.R"]
CMD ["input/data.csv", "input/model.csv", "input/algo.json", "input/param.json"]
