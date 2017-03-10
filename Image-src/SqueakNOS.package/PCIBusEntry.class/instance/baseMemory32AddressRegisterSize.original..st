accessing - addresses map
baseMemory32AddressRegisterSize: index original: original
	| enabled answer |

	enabled := self hasMemoryEnabled.

	self baseAddressRegister: index put: 16rFFFFFFFF.
	answer := self baseAddressRegister: index.
	self baseAddressRegister: index put: original.

	enabled ifTrue: [self enableMemory].

	^ ((answer bitAnd: 15 bitInvert) bitInvert + 1) bitAnd: 16rFFFFFFFF
