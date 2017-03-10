services
at: firstBlockNumber writeArray: aByteArray
	"Write aByteArray to disk starting at firstBlockNumber. aByteArray size should be multiple of the sector size"
	controller at: firstBlockNumber of: deviceNumber putAll: aByteArray.