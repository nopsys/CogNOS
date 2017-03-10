services
filesFor: aDirectory
	| cluster files clusters |
	files := OrderedCollection new.
	clusters := self clustersChainFor: aDirectory.
	clusters do: [ :aNumber |
		cluster := self clusterNumber: aNumber.
		files addAll:	(cluster fileRecords collect: [:record | File named: record name identifier: record firstCluster filesystem: self directory: aDirectory size: record size])
	].
	^files