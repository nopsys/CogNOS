testing
areMemoryAddressesValid
	"Addresses are valid if first bit of the flags is set"
	^(self flags bitAnd: 16r00000001) = 16r00000001