# About EBSeq

EBSeq is a Bioconductor package for processing sequence-based transcriptional profiling (RNA-Seq) data.   It is based upon empirical Bayesian methodology, taking a matrix of expression data as input and returning transcript-specific vectors of local posterior probabilities that score various patterns of differential expression among the group labels associated with the samples.

The code here is a major version update of the original EBSeq method; it deploys some algorithmic changes to improve computational efficiency, especially in the multi-group setting.

This version 2.0 update of EBSeq is the topic of bioRxiv 10.1101/2020.06.19.162180 https://biorxiv.org/cgi/content/short/2020.06.19.162180v1

# EBSeq.v2 package

## Installation
You can install EBSeq.v2 from github with:
```
# install.packages("devtools")
devtools::install_github("wiscstatman/EBSeq")
library(EBSeq)
```


## A synthetic two-group example
 
```
data(GeneMat)
str(GeneMat)
```
`EBTest` is the function for two-condition comparison. Most arguments of EBTest have default settings, expression data, condition label and size factors for normalization are required. If input data are normalized, then size factor for each sample is 1 and `sizeFactors = rep(1,ncol(Data))`, otherwise, we use median normalization to account for library size. 
`GetPPMat` yields the posterior probabilities being equivalent expressed and differential expressed. 
```
Sizes = MedianNorm(GeneMat)
EBOut = EBTest(Data=GeneMat, Conditions=as.factor(rep(c("C1","C2"),each=5)),
       sizeFactors = Sizes)
PP = GetPPMat(EBOut)
```

The posterior probabilities in `PP` are specific to each gene (i.e., `local`) and to each pattern of equality/inequality of underlying
means.   The conditional false discovery rate of a list of reported genes is the mean of local probababilities of equivalent expression.

## More than two conditions

Synthetic example: 

```
data(MultiGeneMat)
```
`EBMultiTest` is the function considering differential expression patterns over more than two conditions. 
`MultiOut$AllParti` outputs the selected patterns, `MultiPP` gives the posterior probabilities for each expression patterns. 
```
Conditions = c("C1","C1","C2","C2","C3","C3")
MultiSize = MedianNorm(MultiGeneMat)
MultiOut = EBMultiTest(MultiGeneMat,Conditions=Conditions,
                     sizeFactors=MultiSize)
patterns = MultiOut$AllParti
MultiPP = GetMultiPP(MultiOut)
```

More details and examples can be found in `vignettes`

Reference for the package can be found at "link to bioRxiv"

Analysis is available at https://github.com/wiscstatman/bigEB

# Compatible with EBSeq.v1

The original EBSeq.v1 is embedded in the package, using the `fast` option to alternate between v2 and v1. 
By default `fast` is set to `TRUE` and EBSeq.v2 is called. 
To use EBSeq.v1, simply switch `fast` to `FALSE` 


for example, the two group senario:

```
Sizes = MedianNorm(GeneMat)
EBOut = EBTest(Data=GeneMat, Conditions=as.factor(rep(c("C1","C2"),each=5)),fast = F,maxround = 5,
       sizeFactors = Sizes)
PP = GetPPMat(EBOut)
```
or more than two groups scenario:
```
Conditions = c("C1","C1","C2","C2","C3","C3")
MultiSize = MedianNorm(MultiGeneMat)
MultiOut = EBMultiTest(MultiGeneMat,Conditions=Conditions,fast = F,maxround = 5,
                     sizeFactors=MultiSize)
MultiPP = GetMultiPP(MultiOut)
```                     

# Also support user-specified paritions

Like EBSeq.v1, user can use the argument `AllParti` to input self-specified partitions, that is, using prior knowledge, only considering a subset of total partitions.  

```
Conditions = c("C1","C1","C2","C2","C3","C3")
PosParti=GetPatterns(Conditions)
PosParti
Parti=PosParti[-3,]
Parti
```
If we only consider patterns 1,2,4 and 5.
```
MultiSize = MedianNorm(MultiGeneMat)
MultiOut = EBMultiTest(MultiGeneMat,Conditions=Conditions,AllParti = Parti,
                     sizeFactors=MultiSize)
MultiPP = GetMultiPP(MultiOut)
```             

# OpenMP Parallelization for Speed-Up (Linux Only)

OpenMP parallelization is enabled on Linux systems to further accelerate computations. For optimal performance, it is recommended to use this package on a Linux OS.