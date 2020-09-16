# MixtComp Docker

```
sudo docker build -t testmc .
sudo docker run --rm -t -i -v /home/grimonprez/Documents/MixtComp/MixtComp/Docker/input:/input testmc
sudo docker run --rm -t -i -v /home/grimonprez/Documents/MixtComp/MixtComp/Docker/input:/input testmc input/data2.csv input/model2.csv input/algo2.json input/param2.json
sudo docker run --rm -t -i -v /home/grimonprez/Documents/MixtComp/MixtComp/Docker/input:/input testmc input/data.csv input/model.csv input/algo.json input/param.json input/resLearn.RData
```


## Learn mode

4 files:

- data csv file with semicolon (;) as separator and the first line as column names
- model csv file with semicolon (;) as separator and the first line as column names
- algo json file containing the SEM algorithm's parameters (see associated documentation in *RMixtComp* or *input/algo.json* file)
- param json file containing the mixtCompLearn/mixtCompredict function parameters (see associated documentation in *RMixtComp* or *input/param.json* file)

The output is saved as *input/resLearn.RData*.


## Predict mode

5 files:

- same 4 first files as learn mode
- res containing the learnt model (".RData" file with a saved MixtComp object named *res*)


The output is saved as *input/resPredict.RData*.
