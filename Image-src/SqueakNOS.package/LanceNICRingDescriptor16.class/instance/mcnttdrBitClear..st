accessing - no auto
mcnttdrBitClear: index
	^ self mcnttdr: (self mcnttdr bitAnd: (1 << index) bitInvert)