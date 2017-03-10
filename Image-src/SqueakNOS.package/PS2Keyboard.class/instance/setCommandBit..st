command byte
setCommandBit: bit
	^ self commandByte: (self commandByte bitOr: 1 << bit)