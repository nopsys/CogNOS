accessing - no auto
bufferAddress
	^ self badr1 << 16 + self badr0 + (self address bitAnd: 16rFF000000)