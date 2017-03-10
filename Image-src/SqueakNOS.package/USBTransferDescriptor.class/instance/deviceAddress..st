accessing - max len etc.
deviceAddress: anInteger
	self maxLenAddr: anInteger << 8 + (self maxLenAddr bitAnd: 16rFFFF80FF)