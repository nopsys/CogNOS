accessing
interruptStatusBit: index
	^ self interruptStatus anyMask: 1 << index