as yet unclassified
updateChunksFrom: destOffset bytesCount: bytesCount with: source startingAtByte: sourceOffset
	| helper sourceStart |
	helper := BlockArithmetic new size: self chunkSize * self blockSize.
	sourceStart := sourceOffset.
	
	helper alignedFrom: destOffset to: destOffset + bytesCount - 1 do: [ :nextStart :nextEnd |
		chunks at: (helper firstPositionInSameBlockOf: nextStart) - 1 // self blockSize + 1 ifPresent: [ :aByteArray |
			aByteArray replaceFrom: (helper positionInBlockOf: nextStart) to: (helper positionInBlockOf: nextEnd) with: source startingAt: sourceStart.
			sourceStart := sourceStart + self blockSize.
		].
	].