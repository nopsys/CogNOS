accessing - command register
clearCommandBit: bit
	^ self command: (self command bitClear: 1 << bit)