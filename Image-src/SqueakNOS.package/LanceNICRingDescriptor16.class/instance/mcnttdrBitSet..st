accessing - no auto
mcnttdrBitSet: index
	^ self mcnttdr: (self mcnttdr bitOr: 1 << index)