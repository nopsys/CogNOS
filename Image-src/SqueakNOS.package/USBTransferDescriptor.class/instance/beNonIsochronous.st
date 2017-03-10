accessing - status etc.
beNonIsochronous
	self statusActLen: (self statusActLen bitClear: 1 << 25)