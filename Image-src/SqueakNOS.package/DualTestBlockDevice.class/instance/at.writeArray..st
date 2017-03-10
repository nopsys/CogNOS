as yet unclassified
at: firstBlockNumber writeArray: aByteArray
	"Write aByteArray to disk starting at firstBlockNumber. aByteArray size should be multiple of the sector size"
	
	deviceA at: firstBlockNumber writeArray: aByteArray.
	(deviceB at: firstBlockNumber writeArray: aByteArray).
	
	self at: firstBlockNumber count: aByteArray size / self blockSize.
	