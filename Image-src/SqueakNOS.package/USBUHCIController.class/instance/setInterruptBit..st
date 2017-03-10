accessing - interrupt register
setInterruptBit: bit
	^ self interruptEnable: (self interruptEnable bitOr: 1 << bit)
