# EBSeq.v2 package

## Installation
You can install EBSeq.v2 from github with:
```
# install.packages("devtools")
devtools::install_github("wiscstatman/EBSeqNew")
```


## Two conditions example
Simulation data 
```
data(GeneMat)
str(GeneMat)
```
`EBTest` is the function for two condition comparison. Most arguments of EBTest have default settings, expression data, condition label and size factors for normalization are required. If data is already normalized, then size factor for each sample is 1 and `sizeFactors = rep(1,ncol(Data))`, otherwise, we use median normalization to account for library size. 
`GetPPMat` yields the posterior probabilities being equivalent expressed and differential expressed. 
```
Sizes = MedianNorm(GeneMat)
EBOut = EBTest(Data=GeneMat, Conditions=as.factor(rep(c("C1","C2"),each=5)),
       sizeFactors = Sizes)
PP = GetPPMat(EBOut)
```

## More than two conditions
Simulation data
```
data(MultiGeneMat)
```
`EBMultiTest` is the function considering differential expression patterns over more than two conditions. 
Similar as `EBTest`, except for one more argument requiring user specified. `uc` is a number to constrain how many uncertain positions at most for each unit. `MultiOut$AllParti` outputs the selected patterns, `MultiPP` gives the posterior probabilities for each expression patterns. 
```
Conditions = c("C1","C1","C2","C2","C3","C3")
MultiSize = MedianNorm(MultiGeneMat)
MultiOut = EBMultiTest(MultiGeneMat,Conditions=Conditions,uc = 2,
                     sizeFactors=MultiSize)
patterns = MultiOut$AllParti
MultiPP = GetMultiPP(MultiOut)
```

More details and examples can be found in `vignettes`

Reference for the package can be found at "link to Bioarchive"

Analysis is available at https://github.com/wiscstatman/bigEB


