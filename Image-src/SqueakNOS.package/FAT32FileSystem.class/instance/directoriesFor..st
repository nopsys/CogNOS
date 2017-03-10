services
directoriesFor: aDirectory
	| cluster directories clusters |
	directories := OrderedCollection new.
	clusters := self clustersChainFor: aDirectory.
	clusters do: [ :aNumber |
		cluster := self clusterNumber: aNumber.
		directories addAll: (cluster directoryRecords select: [:record | record isInternal not] thenCollect: [:record | Directory named: record name identifier: record firstCluster filesystem: self directory: aDirectory])
	].
	^directories