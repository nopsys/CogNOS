private
addEndOfDirectoryRecord
	| index record |
	index := self firstFreeRecordIndex.
	record := FAT32ClusterRecord endOfDirectory.
	self add: record at: index.
	