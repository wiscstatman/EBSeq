\name{EBSeqTest}
\alias{EBSeqTest}
\title{EBSeq core}
\usage{
EBSeqTest(data, conditions, uc, AllParti = NULL, iLabel = 1, sizefactor = 1,
  iter = 50, alpha = 0.4, beta = 0, step1 = 1e-6, step2 = 1e-4,
  thre = 1.15, sthre = 0, filter = 1, stopthre = 1e-4, nequal = 0)
}
\arguments{
\item{data}{A data matrix contains expression values for each transcript (gene or isoform level). In which rows should be transcripts and columns should be samples. For single cell data, normalized counts are required}

\item{conditions}{condition label for samples}

\item{uc}{number of unceratin positions, unit level}

\item{AllParti}{user specified set of partitions}

\item{iLabel}{label for isoform, indicating how beta are shared among units}

\item{sizefactor}{The normalization factors. It should be a vector with lane specific numbers (the length of the vector should be the same as the number of samples, with the same order as the columns of Data).}

\item{iter}{maximum iteration step of EM}

\item{alpha}{start value of hyper parameter alpha}

\item{beta}{start value of hyper parameter beta}

\item{step1}{stepsize for gradient ascent of alpha}

\item{step2}{stepsize for gradietn ascent of beta}

\item{thre}{threshold for determining the state of a position}

\item{sthre}{shrinkage threshold for iterative pruning during the EM updates}

\item{filter}{filterthreshold for low expression units}

\item{stopthre}{stopping threshold for EM}

\item{nequal}{when there is a chain of equal states with the number of equal states bigger than nequal, equalhandle algorithm will be used to further checking the homogeneity between the group means}
}
\value{
a list containing selected DE patterns and their posterior probabilities, values for alpha and beta, some moments of the data
}
\description{
core function of EBSeq computation. Users are expected to use the wrappers, 2 conditions scenario, using EBTest, more than 2 condtiions, using EBMultiTest
}
