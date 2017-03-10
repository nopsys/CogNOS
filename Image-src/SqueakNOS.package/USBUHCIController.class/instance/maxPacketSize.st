accessing - command register
maxPacketSize
	^(self testCommandBit: 7)
		ifTrue: [64]
		ifFalse: [32]