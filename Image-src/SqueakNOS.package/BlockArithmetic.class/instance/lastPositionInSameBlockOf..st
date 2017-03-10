accessing
lastPositionInSameBlockOf: position
	^(self firstPositionInSameBlockOf: position) + blockSize - 1.