accessing
setBaudRate: baud
	| brd |
	baudRate := baud.
	brd := self baudRateDivisorFor: baud.
	self lineControlRegister: 16r80.
 	self interruptEnableRegister: (brd bitShift: -8).
	self byteAt: 0 put: (brd bitAnd: 255).