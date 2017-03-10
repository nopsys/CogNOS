accessing
initializeLineControlRegisterStopBitsType: stopBitsInteger parityType: parityInteger dataBits: numDataBits 
	| lcr |
	numDataBits = 7
		ifTrue: [lcr := 2]
		ifFalse: [lcr := 3].
	stopBits = 2 ifTrue: [lcr := lcr bitOr: 4].
	parity = 0
		ifFalse: 
			[lcr := lcr bitOr: 8.
			parity = 2 ifTrue: [lcr := lcr bitOr: 16]].
	self lineControlRegister: lcr