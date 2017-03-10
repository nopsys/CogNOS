accessing
firstPositionInSameBlockOf: position
	^position - (position - 1 \\ blockSize)