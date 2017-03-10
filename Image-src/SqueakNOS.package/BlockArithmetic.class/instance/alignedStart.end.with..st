accessing
alignedStart: first end: last with: aBlock
	aBlock value: (self firstPositionInSameBlockOf: first) value: (self lastPositionInSameBlockOf: last).