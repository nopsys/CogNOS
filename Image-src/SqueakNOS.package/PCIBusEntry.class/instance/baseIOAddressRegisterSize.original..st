accessing - addresses map
baseIOAddressRegisterSize: index original: original
	| enabled answer |

	enabled := self hasIOEnabled.

	self baseAddressRegister: index put: 16rFFFFFFFF.
	answer := self baseAddressRegister: index.
	self baseAddressRegister: index put: original.

	enabled ifTrue: [self enableIO].

	(answer noMask: 16rFFFF0000)
		ifTrue: [answer := answer + 16rFFFF0000].

	^ ((answer bitAnd: 3 bitInvert) bitInvert + 1) bitAnd: 16rFFFFFFFF
