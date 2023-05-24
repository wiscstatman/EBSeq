\name{GetSelectedPatterns}
\alias{GetSelectedPatterns}
\title{
Get selected patterns in a multiple condition study
}
\description{
'GetSelectedPatterns' get selected patterns in a multiple condition study.
}
\usage{
GetSelectedPatterns(EBout)
}
\arguments{
  \item{EBout}{Results from EBMultiTest}
}

\value{A matrix describe selected patterns. }

\references{
Ning Leng, John A. Dawson, James A. Thomson, Victor Ruotti, Anna I. Rissman, Bart M.G. Smits, Jill D. Haag, Michael N. Gould, Ron M. Stewart, and Christina Kendziorski. EBSeq: An empirical Bayes hierarchical model for inference in RNA-seq experiments. Bioinformatics (2013)
}

\author{
Ning Leng, Xiuyu Ma
}

\examples{
data(MultiGeneMat)
Conditions=c("C1","C1","C2","C2","C3","C3")
MultiSize=MedianNorm(MultiGeneMat)
MultiOut=EBMultiTest(MultiGeneMat,Conditions=Conditions,
 sizeFactors=MultiSize)
PosParti=GetSelectedPatterns(MultiOut)
}
