accessing - max len etc.
maxLength
	^ self maxLenAddr >> 21 bitAnd: 16r7FF