as yet unclassified
from: firstBlockNumber to: lastBlockNumber
	"Retrieve sectorst from firstBlockNumber to lastBlockNumber"

	^self at: firstBlockNumber count: lastBlockNumber - firstBlockNumber + 1.