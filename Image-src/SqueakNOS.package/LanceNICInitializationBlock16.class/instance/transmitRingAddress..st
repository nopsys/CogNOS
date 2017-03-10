accessing - noauto
transmitRingAddress: address
	((address bitXor: self address) bitAnd: 16rFF000000) isZero
		ifFalse: [^ self error: 'In 16 bits mode all addresses must share the higher byte'].
	self tdra0: (address bitAnd: 16rFFFF).
	^ self tdra1: (address >> 16 bitAnd: 16rFF)