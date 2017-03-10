accessing - status etc.
disableInterruptOnComplete
	self statusActLen: (self statusActLen bitAnd: (1 << 24) bitInvert)