accessing - command register
disableCommandBit: bit
	^ self command: (self command bitAnd: 16rFFFF - (1 << bit))