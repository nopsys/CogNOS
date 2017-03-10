private
addRecordNamed: aString firstCluster: aNumber
	| index record addEndOfDirectoryRecord |
	index := self firstFreeRecordIndex.
	addEndOfDirectoryRecord := (index = self firstIndex or: [(self recordAt: index) isEndOfDirectory and: [(index = self lastIndex) not]]).
	record := FAT32ClusterRecord named: aString firstCluster: aNumber.
	self add: record at: index.
	addEndOfDirectoryRecord ifTrue: [self addEndOfDirectoryRecord].
	^record
	