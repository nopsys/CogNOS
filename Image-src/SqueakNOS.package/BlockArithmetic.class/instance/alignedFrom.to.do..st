accessing
alignedFrom: first to: last do: aBlock
	| nextEnd remaining |
	
	nextEnd := last min: (self lastPositionInSameBlockOf: first).
	aBlock value: first value: nextEnd.
	remaining := last - nextEnd.
	[remaining > 0] whileTrue: [ | nextStart |
		nextStart := nextEnd + 1.
		nextEnd := nextEnd + (remaining min: blockSize).
		aBlock value: nextStart value: nextEnd.
		remaining := remaining - blockSize.
	].
	