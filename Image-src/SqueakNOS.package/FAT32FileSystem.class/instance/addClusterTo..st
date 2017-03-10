private
addClusterTo: aFilesystemContent
	| index id |
	id := aFilesystemContent identifier.
	index := fat addClusterTo: id.
	aFilesystemContent isDirectory ifTrue: [(self clusterNumber: index) initializeUnused].	
	^index