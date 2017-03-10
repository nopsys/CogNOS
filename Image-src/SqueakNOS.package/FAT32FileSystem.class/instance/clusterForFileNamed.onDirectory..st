private
clusterForFileNamed: aString onDirectory: aDirectory
	| chain |
	chain := self clustersChainFor: aDirectory.
	chain do: [:number | | cluster | cluster := self clusterNumber: number. (cluster hasRecordNamed: aString) ifTrue: [^cluster]].
	self error:'cluster not found!'