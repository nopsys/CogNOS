accessing - addresses map
romAddressRegister: addr
	^ self configLong: 16r30 put: addr