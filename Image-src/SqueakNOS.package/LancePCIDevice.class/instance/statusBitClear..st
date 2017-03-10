accessing - status
statusBitClear: index
	^ self status: (self status bitAnd: (1 << index) bitInvert)