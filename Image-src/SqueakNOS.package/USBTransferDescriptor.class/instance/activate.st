accessing - status etc.
activate
	self statusActLen: (self statusActLen bitOr: 1 << 23)