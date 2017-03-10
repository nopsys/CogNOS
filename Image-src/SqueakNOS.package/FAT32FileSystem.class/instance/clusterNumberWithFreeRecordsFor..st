private
clusterNumberWithFreeRecordsFor: aDirectory
	| chain |
	chain := self clustersChainFor: aDirectory.
	^chain detect: [:number | (self clusterNumber: number) hasFreeRecords] ifNone: [self addClusterTo: aDirectory]