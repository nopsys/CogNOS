services
addClusterTo: aNumber
	| last index chain |
	last := aNumber > 0 ifTrue: 
		[(self clustersChainFor: aNumber) last]
	 ifFalse:
		 [0].
	index := self firstFreeClusterSince: last.
	"Transcript show: 'Adding cluster: ', index printString, 'to: ', aNumber printString, Character cr."
	self addCluster: index to: aNumber.
	^index