accessing - max len etc.
endpoint: anInteger
	self maxLenAddr: anInteger << 15 + (self maxLenAddr bitAnd: 16rFFC07FFF)