as yet unclassified
from: firstBlock to: lastBlock
	| helper | 
	helper := BlockArithmetic new size: self chunkSize.
	
	helper alignedStart: firstBlock end: lastBlock with: [ :firstBlockOfFirstChunk :lastBlockOfLastChunk | | firstBlockOfLastChunk |
		firstBlockOfLastChunk := lastBlockOfLastChunk - self chunkSize + 1.
		^self concatenationFrom: firstBlock - firstBlockOfFirstChunk + 1
				to: lastBlock - firstBlockOfFirstChunk + 1
				of: (self chunksFrom: firstBlockOfFirstChunk to: firstBlockOfLastChunk).
	].
	
	