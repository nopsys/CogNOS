private
testCapabilitiesBit: bit
	^self capacilitiesRegister anyMask: (1 bitShift: bit)