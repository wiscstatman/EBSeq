GetSelectedPatterns<-function(EBout){
    
    AllParti = EBout$AllParti
    Conditions = EBout$Conditions
    if (!is.factor(Conditions))
        Conditions = as.factor(Conditions)
    NumCond = nlevels(Conditions)
    CondLevels = levels(Conditions)
	colnames(AllParti) = CondLevels
	rownames(AllParti) = paste("Pattern",1:nrow(AllParti),sep="")
	AllParti
}
