private
primSetPosition: id to: anInteger
	anInteger > id size ifTrue: [self error: 'Out of bounds'].
	offset := anInteger