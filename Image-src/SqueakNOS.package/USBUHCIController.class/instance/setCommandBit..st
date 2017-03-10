accessing - command register
setCommandBit: bit
	^ self command: (self command bitOr: 1 << bit)
