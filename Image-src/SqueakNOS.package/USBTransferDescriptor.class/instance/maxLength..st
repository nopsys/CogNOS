accessing - max len etc.
maxLength: anInteger
	anInteger > 1280 ifTrue: [self error: 'Maximum allowed length for USB transfers is 1280'].
	self maxLenAddr: (self maxLenAddr bitAnd: 16r1FFFFF) + (anInteger - 1 << 21)