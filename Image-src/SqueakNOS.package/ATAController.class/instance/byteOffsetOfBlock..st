private
byteOffsetOfBlock: aBlockNumber
	"Returns the position of the first byte of the block"
	^ aBlockNumber - 1 * self blockSize + 1.