accessing
interruptMask: aShort
	^ self shortAt: 16r3C put: aShort