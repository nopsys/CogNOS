private
testErrorInterruptStatusBit: bit
	^self errorInterruptStatus anyMask: (1 bitShift: bit)