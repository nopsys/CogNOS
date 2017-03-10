accessing - addresses map
baseAddressRegister: index
	index > 5 ifTrue: [self errorSubscriptBounds: index].
	^ self configLong: index * 4 + 16