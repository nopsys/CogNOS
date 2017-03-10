services
contentsFor: aFile startingAt: aNumber count: anotherNumber
	| clusterOffset clusters size needed bytesPerCluster |
	
	bytesPerCluster := self bytesPerCluster.
	aFile identifier > 0 ifFalse: [^ByteArray new].
	size := anotherNumber min: aFile size.
	clusterOffset := aNumber \\ bytesPerCluster.
	needed := (size + clusterOffset / bytesPerCluster) ceiling.
	clusters := self clustersChainFor: aFile.
	clusters removeFirst: aNumber // bytesPerCluster.
	clusters size >= needed ifTrue: [clusters removeLast: clusters size - needed].
	^self readFromClusters: clusters startingAt: clusterOffset count: size.
