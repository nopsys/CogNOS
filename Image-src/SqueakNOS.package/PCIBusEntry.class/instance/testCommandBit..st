accessing - command register
testCommandBit: bit
	^ self command anyMask: 1 << bit
