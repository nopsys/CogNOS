accessing - status etc.
enableInterruptOnComplete
	self statusActLen: (self statusActLen bitOr: 1 << 24)