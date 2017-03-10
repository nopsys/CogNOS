accessing - command register
maxPacketSize: anInteger
	anInteger == 32 ifTrue: [^self clearCommandBit: 7].
	anInteger == 64 ifTrue: [^self setCommandBit: 7].
	self error: 'Invalid maxPacketSize. Only 32 or 64 bytes allowed'