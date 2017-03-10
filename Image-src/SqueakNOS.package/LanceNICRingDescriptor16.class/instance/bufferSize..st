accessing - no auto
bufferSize: size
	^ self bcnt: (size negated bitAnd: 16rFFFF)