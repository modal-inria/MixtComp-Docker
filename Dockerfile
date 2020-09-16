https://hub.docker.com/r/rocker/r-ver
FROM rocker/r-ver

RUN Rscript -e "install.packages(c('RMixtComp'));"

## package for reading param file
RUN Rscript -e "install.packages(c('jsonlite'));"

## input is the folder containing the data
COPY input input

COPY script.R .

ENTRYPOINT ["Rscript", "script.R"]
CMD ["input/data.csv", "input/model.csv", "input/algo.json", "input/param.json"]
