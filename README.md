# MixtComp Docker

Build

```
sudo docker build -t mixtcomp/docker .
```

Learn with default files (*data.csv*, *model.csv*, *algo.json*, *param.json*)

```
sudo docker run --rm  -v <data_directory>:/home/docker/data mixtcomp/docker
```

Predict with the learnt model

```
sudo docker run --rm -v <data_directory>:/home/docker/data mixtcomp/docker data/data.csv data/model.csv data/algo.json data/param.json data/resLearn.RData
```

## Learn mode

4 files:

- data csv file with semicolon (;) as separator and the first line as column names
- model csv file with semicolon (;) as separator and the first line as column names
- algo json file containing the SEM algorithm's parameters (see associated documentation in *RMixtComp* or *data[-functional]-example/algo.json* file)
- param json file containing the mixtCompLearn/mixtCompredict function parameters (see associated documentation in *RMixtComp* or *data[-functional]-example/param.json* file)

The output is saved in *<data_directory>/resLearn.RData*.

## Predict mode

5 files:

- same 4 first files as learn mode
- res containing the learnt model (".RData" file with a saved MixtComp object named *res*)

The output is saved in *<data_directory>/resPredict.RData*.
