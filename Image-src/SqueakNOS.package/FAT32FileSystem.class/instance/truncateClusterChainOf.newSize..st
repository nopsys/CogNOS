services
truncateClusterChainOf: aFile newSize: aNumber
	| clusterSize  clusters needed |
	clusterSize := self bytesPerCluster.
	clusters := self clustersChainFor: aFile.
	needed := (aNumber / clusterSize) ceiling.
	
	needed <= clusters size ifTrue: [clusters removeLast: clusters size - needed]
