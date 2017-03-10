services
point: aFatClusterNumber to: anotherFatClusterNumber
	"Alter the FAT so that it's cluster number aFatClusterNumber points to anotherFatClusterNumber"
	| bytes |
	self setPositionTo: aFatClusterNumber.
	bytes := (ByteArray new: 4).
	bytes unsignedLongAt: 1 put: anotherFatClusterNumber.
	contents nextPutAll: bytes.