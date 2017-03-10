accessing - status etc.
beLowSpeedDevice
	self statusActLen: (self statusActLen bitOr: 1 << 26)