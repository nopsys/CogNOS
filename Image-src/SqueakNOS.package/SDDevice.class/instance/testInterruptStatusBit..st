private
testInterruptStatusBit: bit
	^self interruptStatus anyMask: (1 bitShift: bit)