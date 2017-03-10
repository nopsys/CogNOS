private
clusterWithFileNamed: aString for: aDirectory
	| chain |
	chain := self clustersChainFor: aDirectory.
	^chain detect: [:number | (self clusterNumber: number) hasRecordNamed: aString]