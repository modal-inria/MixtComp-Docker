# https://hub.docker.com/r/rocker/r-ver
FROM rocker/r-ver:4.0.2

RUN Rscript -e "install.packages(c('RMixtComp'));"

## package for reading param file
RUN Rscript -e "install.packages(c('jsonlite'));"

## package for reading named arguments from Rscript
RUN Rscript -e "install.packages(c('R.utils'));"

WORKDIR /home/docker
COPY script.R .

ENTRYPOINT ["Rscript", "script.R"]
CMD ["--data=data/data.csv", "--model=data/model.csv", "--algo=data/algo.json", "--params=data/params.json"]
