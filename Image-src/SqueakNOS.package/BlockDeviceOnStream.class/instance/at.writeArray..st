as yet unclassified
at: firstBlockNumber writeArray: aByteArray
	"Write aByteArray to disk starting at firstBlockNumber. aByteArray size should be multiple of the sector size"

	stream position: (firstBlockNumber - 1 * self blockSize).
	stream nextPutAll: aByteArray.