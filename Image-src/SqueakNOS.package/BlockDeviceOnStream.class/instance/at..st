as yet unclassified
at: aBlockNumber 
	"Retrieve sector number aBlockNumber from device"

	stream position: (aBlockNumber - 1 * self blockSize).
	^stream next: self blockSize.