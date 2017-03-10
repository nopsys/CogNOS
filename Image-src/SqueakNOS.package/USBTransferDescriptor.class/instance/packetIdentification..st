accessing - max len etc.
packetIdentification: anInteger
	self maxLenAddr: anInteger + (self maxLenAddr bitClear: 16rFF)