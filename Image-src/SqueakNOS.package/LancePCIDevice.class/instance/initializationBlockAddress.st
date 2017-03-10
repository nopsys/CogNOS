accessing - control status
initializationBlockAddress
	^ (self controlStatusWord: 2) << 16 + (self controlStatusWord: 1)