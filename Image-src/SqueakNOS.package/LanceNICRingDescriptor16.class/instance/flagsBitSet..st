accessing - no auto
flagsBitSet: index
	^ self flags: (self flags bitOr: 1 << index)