methodsFor:
at: anAddress size: aNumberOfBytes
	pointer := Alien forPointer: anAddress.
	size := aNumberOfBytes.