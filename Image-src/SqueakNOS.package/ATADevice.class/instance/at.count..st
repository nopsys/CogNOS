services
at: firstBlockNumber count: numberOfBlocks
	"Retrieve numberOfBlocks sector number aBlockNumber from device.
	 NumberOfBlocks should be no more than 256"
	
	^controller at: firstBlockNumber count: numberOfBlocks device: deviceNumber.
	
	