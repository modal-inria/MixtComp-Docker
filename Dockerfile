# https://hub.docker.com/r/rocker/r-ver
FROM rocker/r-ver:4.0.2

RUN Rscript -e "install.packages(c('RMixtComp'));"

## package for reading param file
RUN Rscript -e "install.packages(c('jsonlite'));"

WORKDIR /home/docker
COPY script.R .

ENTRYPOINT ["Rscript", "script.R"]
CMD ["data/data.csv", "data/model.csv", "data/algo.json", "data/params.json"]
