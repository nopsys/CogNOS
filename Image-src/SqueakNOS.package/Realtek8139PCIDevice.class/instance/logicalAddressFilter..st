accessing
logicalAddressFilter: anInteger
	self longAt: 16rC put: anInteger // 16r100000000.
	^ self longAt: 8 put: anInteger \\ 16r100000000