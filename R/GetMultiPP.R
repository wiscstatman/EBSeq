GetMultiPP <- function(EBout){
    if(is.null(ncol(EBout$Mean)))
    {
        if(length(EBout$Mean) < 3)
            stop("The input doesn't seem like an output from EBMultiTest")

    }else{
        if(ncol(EBout$Mean) < 3)
        stop("The input doesn't seem like an output from EBMultiTest")
    }
    
	PP=EBout$PPMat
	UnderFlow=which(is.na(rowSums(PP)))
	if(length(UnderFlow)!=0)Good=c(1:nrow(PP))[-UnderFlow]
	else Good=c(1:nrow(PP))
	MAP=rep(NA,nrow(PP))
	names(MAP)=rownames(PP)
	MAP[Good]=colnames(PP)[apply(PP[Good,],1,which.max)]
	MAP[UnderFlow]="NoTest"
	AllParti=EBout$AllParti
    rownames(AllParti) = sapply(1:nrow(AllParti),function(x) paste0("Pattern",x))
	out=list(PP=PP, MAP=MAP,Patterns=AllParti)
}
