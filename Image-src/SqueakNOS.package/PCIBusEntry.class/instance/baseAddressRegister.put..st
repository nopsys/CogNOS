accessing - addresses map
baseAddressRegister: index put: address
	index > 5 ifTrue: [self errorSubscriptBounds: index].
	^ self configLong: index * 4 + 16 put: address