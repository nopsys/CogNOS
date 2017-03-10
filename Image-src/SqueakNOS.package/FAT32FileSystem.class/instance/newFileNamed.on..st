services
newFileNamed: aString on: aDirectory
	| cluster record number name |
	name := aString size > 11 ifTrue: [self pureFAT32FilenameFor: aString] 
							     ifFalse: [aString].
	number := self clusterNumberWithFreeRecordsFor: aDirectory.
	cluster := self clusterNumber: number.
	record := cluster addRecordNamed: (self as83Format: name) firstCluster: 0.
	^File named: record name identifier: record firstCluster filesystem: self directory: aDirectory size: record size