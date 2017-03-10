services
addCluster: aNumber to: anotherNumber
	| chain last |
	anotherNumber > 0 ifTrue: [
		chain := self chainFor: anotherNumber.
		last := chain last.
		chain add: aNumber.
		self point: last to: aNumber].
	self	 point: aNumber to: (self finishClustersChainValue unsignedLongAt: 1).
	