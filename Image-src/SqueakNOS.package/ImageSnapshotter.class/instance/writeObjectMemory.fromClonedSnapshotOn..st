internal
writeObjectMemory: aStream fromClonedSnapshotOn: anAddress
	| contents |
	contents := Buffer at: computer snapshotStartAddress size: computer snapshotEndAddress. 
	aStream nextPutAll: contents contents