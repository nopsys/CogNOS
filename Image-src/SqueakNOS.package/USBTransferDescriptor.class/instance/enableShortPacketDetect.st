accessing - status etc.
enableShortPacketDetect
	self statusActLen: (self statusActLen bitOr: 1 << 29)