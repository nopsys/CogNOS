receiving
receiveBufferAddress: anExternalAddressOrInteger
	^ self longAt: 16r30 put: anExternalAddressOrInteger asInteger