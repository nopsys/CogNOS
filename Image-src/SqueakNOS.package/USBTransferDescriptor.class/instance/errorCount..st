accessing - status etc.
errorCount: anInteger
	^ self statusActLen: (self statusActLen bitAnd: (3 << 27) bitInvert) + (anInteger << 27)
