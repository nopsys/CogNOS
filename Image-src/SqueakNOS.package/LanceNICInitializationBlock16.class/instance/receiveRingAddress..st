accessing - noauto
receiveRingAddress: address
	((address bitXor: self address) bitAnd: 16rFF000000) isZero
		ifFalse: [^ self error: 'In 16 bits mode the address for the receive buffer must share the higher byte with that of the initialization block'].
	self rdra0: (address bitAnd: 16rFFFF).
	^ self rdra1: (address >> 16 bitAnd: 16rFF)