as yet unclassified
updateChunk: aChunk withWritesAt: firstBlockOfChunk
	writeList writeFrom: firstBlockOfChunk - 1 * self blockSize + 1
			  to: firstBlockOfChunk + self chunkSize - 1 * self blockSize
			  into: aChunk.
	
	