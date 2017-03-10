accessing - command register
enableCommandBit: bit
	^ self command: (self command bitOr: 1 << bit)