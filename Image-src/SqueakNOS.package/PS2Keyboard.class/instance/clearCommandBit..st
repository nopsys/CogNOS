command byte
clearCommandBit: bit
	^ self commandByte: (self commandByte bitClear: 1 << bit)
