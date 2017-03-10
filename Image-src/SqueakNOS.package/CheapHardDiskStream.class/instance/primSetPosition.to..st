primitives
primSetPosition: id to: anInteger
	anInteger > fileSize ifTrue: [self error: 'Out of bounds'].
	offset := anInteger