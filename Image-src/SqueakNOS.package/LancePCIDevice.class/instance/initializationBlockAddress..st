accessing - control status
initializationBlockAddress: addr
	^ self
		controlStatusWord: 1 put: (addr bitAnd: 16rFFFF);
		controlStatusWord: 2 put: (addr >> 16).