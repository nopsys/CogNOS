services
shrinkClusterChainOf: aNumber to: length
	| chain size toRemove last |
	chain := self clustersChainFor: aNumber.
	size := chain size.
	size > length ifFalse: [^self].
	toRemove := length - size.
	last := chain at: length.
	self	 point: last to: (self finishClustersChainValue unsignedLongAt: 1). 
	chain := chain last: toRemove.
	chain do: [:number | self point: number to: 0].
	
