accessing - status etc.
actualLength
	^ (self statusActLen bitAnd: 16r3FF) + 1