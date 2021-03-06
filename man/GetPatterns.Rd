\name{GetPatterns}
\alias{GetPatterns}
\title{
Generate all possible patterns in a multiple condition study
}
\description{
'GetPatterns' generates all possible patterns in a multiple condition study.
}
\usage{
GetPatterns(EBout)
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
Conditions = c("C1","C1","C2","C2","C3","C3")
PosParti = GetPatterns(Conditions)
}
