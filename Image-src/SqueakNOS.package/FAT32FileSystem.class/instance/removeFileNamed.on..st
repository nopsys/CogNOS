services
removeFileNamed: aString on: aDirectory
	| cluster number id name |
	name := self pureFAT32FilenameFor: aString.
	number := self clusterWithFileNamed: name  for: aDirectory.
	cluster := self clusterNumber: number.
	id := cluster identifierOfRecordNamed: name .
	cluster removeRecordNamed: name .
	id > 0 ifTrue: [fat removeChainOf: id]
	