accessing - status etc.
beFullSpeedDevice
	self statusActLen: (self statusActLen bitClear: 1 << 26)