accessing - status etc.
beIsochronous
	self statusActLen: (self statusActLen bitOr: 1 << 25)