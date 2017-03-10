accessing - no auto
flagsBitClear: index
	^ self flags: (self flags bitAnd: (1 << index) bitInvert)