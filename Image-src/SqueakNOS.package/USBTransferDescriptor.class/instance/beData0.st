accessing - max len etc.
beData0
	self maxLenAddr: (self maxLenAddr bitClear: 1 << 19)