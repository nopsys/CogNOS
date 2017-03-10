internal
writeHeaderOn: aStream fromMemory: anAddress
	| contents |
	contents := Buffer at: anAddress size: Smalltalk headerSize.
	aStream nextPutAll: contents contents