accessing - addresses map
baseMemoryAddressRegisterSize: index original: original
	| size |
	original isZero ifTrue: [^ 0].

	size := original bitAnd: 2r110.
	
	size = 2r100 ifTrue: [^ self baseMemory64AddressRegisterSize: index original: original].
	size = 2r110 ifTrue: ["reserved mode" ^ self error: 'Unknown memory model'].

	" can be 2r000 (32 bits) or 2r010 (32 bits < 1Meg) "
	^ self baseMemory32AddressRegisterSize: index original: original.