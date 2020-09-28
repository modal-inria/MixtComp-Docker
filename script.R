library(RMixtComp)
library(jsonlite)


## read provided parameters

args <- commandArgs(trailingOnly = TRUE)


dataFile <- args[1]
modelFile <- args[2]

cat("Data file:", dataFile, "\n")
cat("Model file:", modelFile, "\n")

mode <- "learn"

if(length(args) >= 3)
{
  algoFile <- args[3]
  cat("Algo file:", algoFile, "\n")
}
if(length(args) >= 4)
{
  paramFile <- args[4]
  cat("Param file:", paramFile, "\n")
}
if(length(args) == 5)
{
  resFile <- args[5]
  mode = ifelse(file.exists(resFile), "predict", "learn")
  cat("Learnt model file:", resFile, "\n")
}
  


## check mandatory files
if(!file.exists(dataFile))
  stop("data file is missing")
if(!file.exists(modelFile))
  stop("model file is missing")


## param file: non mandatory parameters for mixtCompLearn and mixtCompPredict
if(!file.exists(paramFile))
{
  param <- list()
}else{
  param <- fromJSON(paramFile)
}

# if some parameters are missing, we add default values
defaultParam <- list(nClass = 2, criterion = "ICL", nRun = 3, nCore = 1)
param = c(param, defaultParam[which(!(names(defaultParam)%in%names(param)))])


## algo: if not provided, we use default values
if(!file.exists(algoFile))
{
  algo <- createAlgo()
}else{
  algo <- fromJSON(algoFile)
}


data <- read.table(dataFile, sep = ";", header = TRUE)
model <- read.table(modelFile, sep = ";", header = TRUE)


## temporary correction: to remove when RMixtCompUtilities 4.1.3 will be on CRAN
if(("matrix" %in% class(model)) || ("data.frame" %in% class(model)))
{
  model = apply(model, 2, function(x) {
    out <- list(type = as.character(x[1]))
    if(length(x) >= 2)
      out$paramStr = as.character(x[2])
    
    out
  })
}
##



## run MixtComp in the desired mode
if(mode == "learn")
{
  resLearn <- mixtCompLearn(data, model, algo, nClass = param$nClass, criterion = param$criterion, nRun = param$nRun,
                            nCore = param$nCore, verbose = TRUE)

  save(resLearn, file = "data/resLearn.RData")
}else{

  load(resFile)


  resPredict <- mixtCompPredict(data, model, algo, resLearn, nClass = param$nClass, nRun = param$nRun,
                                nCore = param$nCore, verbose = TRUE)

  save(resPredict, file = "data/resPredict.RData")
}


