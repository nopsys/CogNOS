accessing - status etc.
disableShortPacketDetect
	self statusActLen: (self statusActLen bitClear: 1 << 29)