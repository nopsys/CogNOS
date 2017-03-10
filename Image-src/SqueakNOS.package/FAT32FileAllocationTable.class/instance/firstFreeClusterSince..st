services
firstFreeClusterSince: aNumber
	| index next |
	index := aNumber.
	next := self nextClusterFor: index.
	[next isZero or: [index = (aNumber - 1)]] whileFalse: [
		index := index + 1 \\ (self countOfClusters - 1).
		next := self nextClusterFor: index.	
	].
	next isZero ifFalse: [self error: 'No more free space on filesystem'].
	^index