# MixtComp Docker


Build

```
sudo docker build -t testmc .
```

Learn with default files (*input/data.csv*, *input/model.csv*, *input/algo.json*, *input/param.json*)

```
sudo docker run --rm -t -i -v /home/grimonprez/Documents/MixtComp/MixtComp-Docker/input:/input testmc
```

Predict with the learnt model

```
sudo docker run --rm -t -i -v /home/grimonprez/Documents/MixtComp/MixtComp-Docker/input:/input testmc input/mixtcomp-example.csv input/model.csv input/algo.json input/paramPredict.json input/resLearn.RData
```

Learn with different files

```
sudo docker run --rm -t -i -v /home/grimonprez/Documents/MixtComp/MixtComp-Docker/input:/input testmc input/mixtcomp-functional-example.csv input/model-functional.csv input/algo-functional.json input/param.json
```


## Learn mode

4 files:

- data csv file with semicolon (;) as separator and the first line as column names
- model csv file with semicolon (;) as separator and the first line as column names
- algo json file containing the SEM algorithm's parameters (see associated documentation in *RMixtComp* or *input/algo.json* file)
- param json file containing the mixtCompLearn/mixtCompredict function parameters (see associated documentation in *RMixtComp* or *input/param.json* file)

The output is saved in *input/resLearn.RData*.


## Predict mode

5 files:

- same 4 first files as learn mode
- res containing the learnt model (".RData" file with a saved MixtComp object named *res*)


The output is saved in *input/resPredict.RData*.
