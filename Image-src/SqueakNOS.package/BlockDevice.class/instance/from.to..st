real access
from: firstBlockNumber to: lastBlockNumber
	"returns a bytearray containing all blocks from firstBlockNumber to lastBlockNumber included. Block number is a 1-based index."
	^ self subclassResponsibility.
	