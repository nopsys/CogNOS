accessing
firstPositionInSameBlockOf: position
	^position - (position \\ blockSize)