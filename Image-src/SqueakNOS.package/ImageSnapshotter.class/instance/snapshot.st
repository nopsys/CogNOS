services
snapshot
	| imageCopy memory aStream |
	self preSnapshot.
	aStream := self imageFileStreamForWrite. 
	aStream binary.
	self writeHeaderOn: aStream fromMemory: computer snapshotStartAddress.
	self writeObjectMemory: aStream.
	aStream truncate: computer snapshotEndAddress + Smalltalk headerSize; close.
	self postSnapshot