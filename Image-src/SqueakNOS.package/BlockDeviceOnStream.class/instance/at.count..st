as yet unclassified
at: aBlockNumber count: blocksCount
	"Retrieve sector number aBlockNumber from device"

	stream position: (aBlockNumber - 1 * self blockSize).
	^stream next: self blockSize * blocksCount.