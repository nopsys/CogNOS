accessing - status
testStatusBit: bit
	^ self status anyMask: 1 << bit