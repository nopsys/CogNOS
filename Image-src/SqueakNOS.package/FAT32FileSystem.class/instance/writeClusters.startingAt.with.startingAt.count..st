private
writeClusters: clusters startingAt: aNumber with: stringOrByteArray startingAt: anotherNumber count: count
	| written adjacentClustersList start toWrite |
	written := 0.
	start := aNumber - 1.
	"count < 1000"
	"clusters first = 51761 ifTrue: [self halt]."
	self adjacentClustersListFrom: clusters do: [ :clusterStartNumber :numberOfClusters | |cluster|
		"(51761 between: clusterStartNumber and: clusterStartNumber + numberOfClusters) ifTrue: [self halt]."
		cluster := self clusterNumber: clusterStartNumber.
		toWrite := cluster size * numberOfClusters - start min: count - written.
		self setPositionToCluster: clusterStartNumber.
		stream skip: start.
		stream next: toWrite putAll: stringOrByteArray startingAt: anotherNumber + written.
		start := 0.
		written := written + toWrite.
	].
	^written