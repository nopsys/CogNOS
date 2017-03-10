accessing - max len etc.
deviceAddress
	^ self maxLenAddr >> 8 bitAnd: 16r7F