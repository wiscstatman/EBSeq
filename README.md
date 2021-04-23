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

Reference for the package can be found at "link to bioRxiv"

Analysis is available at https://github.com/wiscstatman/bigEB

# Compatible with EBSeq.v1

The original EBSeq.v1 is nested in the package, using the `fast` option can alternate between v2 and v1. 

```
Sizes = MedianNorm(GeneMat)
EBOut = EBTest(Data=GeneMat, Conditions=as.factor(rep(c("C1","C2"),each=5)),fast = F,maxround = 5,
       sizeFactors = Sizes)
PP = GetPPMat(EBOut)
```

