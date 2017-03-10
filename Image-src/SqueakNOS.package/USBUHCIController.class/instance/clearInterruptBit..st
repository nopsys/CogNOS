accessing - interrupt register
clearInterruptBit: bit
	^ self interruptEnable: (self interruptEnable bitClear: 1 << bit)
