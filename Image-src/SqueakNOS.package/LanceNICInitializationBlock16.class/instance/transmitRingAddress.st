accessing - noauto
transmitRingAddress
	^ self tdra1 << 16 + self tdra0 + (self address bitAnd: 16rFF000000)