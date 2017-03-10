accessing - addresses map
baseMemory64AddressRegisterSize: index original: originalLo
	| enabled answer originalHi |

	enabled := self hasMemoryEnabled.

	originalHi := self baseAddressRegister: index+1.

	self baseAddressRegister: index put: 16rFFFFFFFF.
	self baseAddressRegister: index+1 put: 16rFFFFFFFF.

	"from spec it's not clear if reg at index+1 has lower bits correct or not. From testing, apparently it has"
	answer := (self baseAddressRegister: index + 1) << 32 + (self baseAddressRegister: index).

	self baseAddressRegister: index put: originalLo.
	self baseAddressRegister: index+1 put: originalHi.

	enabled ifTrue: [self enableMemory].

	^ ((answer bitAnd: 15 bitInvert) bitInvert + 1) bitAnd: 16rFFFFFFFFFFFFFFFF
