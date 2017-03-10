accessing - interrupt register
testInterruptBit: bit
	^ self interruptEnable anyMask: 1 << bit