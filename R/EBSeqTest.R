

EBSeqTest <- function(data,conditions,uc, AllParti=NULL, iLabel = 1,sizefactor = 1,
iter = 50,alpha = 0.4, beta = 0, step1 = 1e-6,step2 = 1e-4,
thre = 1.15, sthre = 0, filter = 1, stopthre = 1e-4, nequal = 0) {
    
    if(!is.matrix(data))
    {
        stop("data must be a numerical matrix")
    }
    if(length(conditions) != ncol(data))
    {
        stop("incorrect length of conditions")
    }
    if(length(beta) > 1)
    {
        if(length(beta) != nrow(data)){stop("incorrect length of hyper parameters")}
    }
    if(beta == 0)
    {
        beta = rep(2,nrow(data))
    }
    if(is.atomic(beta) && length(beta) == 1)
    {
        beta = rep(beta,nrow(data))
    }
    if(length(iLabel) == 1 && iLabel == 1)
    {
        iLabel = rep(1,nrow(data))
    }
    if(length(iLabel) != nrow(data))
    {
        stop("incorrect length of isoform label")
    }
    if(length(sizefactor) == 1 && sizefactor == 1)
    {
        sizefactor = rep(1,ncol(data))
    }
    if(length(sizefactor) != ncol(data))
    {
        stop("incorrect length of size factor")
    }
    if(is.null(AllParti))
    {
        AllParti = matrix(0,nrow=1,ncol=length(levels(conditions)))
    }
    if(sthre >= 1)
    {
        stop("too big sthreshold, as only DE patterns above this threshold will be selected")
    }
    if(nequal == 0)
    {
        # default to disable equal handle 
        nequal = length(levels(conditions)) - 1
    }
    if(!is.atomic(alpha) || length(alpha) != 1)
    {
       stop("error, hyperparameter alpha should be scalar")
    }
    .Call('EBSeq',
    scExpMatrix = data,
    groupLabel = conditions,
    AllParti = AllParti,
    iLabel = iLabel,
    sizeFactor = sizefactor,
    iter = iter,
    alpha = alpha,
    beta = beta,
    step1 = step1,
    step2 = step2,
    uc = uc,
    thre = thre,
    sthre = sthre,
    filter = filter,
    stopthre = stopthre,
    nequal = nequal)
    
    
}



