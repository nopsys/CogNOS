services
addFirstClusterToFileNamed: aString cluster: aNumber
	| index record |
	index := self indexOfRecordNamed: aString.
	record := self recordAt: index.
	record firstCluster: aNumber