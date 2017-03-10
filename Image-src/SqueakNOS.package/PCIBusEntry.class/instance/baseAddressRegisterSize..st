accessing - addresses map
baseAddressRegisterSize: index
	| original |
	
	original := self baseAddressRegister: index.
	original even
		ifTrue: [^ self baseMemoryAddressRegisterSize: index original: original]
		ifFalse: [^ self baseIOAddressRegisterSize: index original: original]
