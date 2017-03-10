private
testPresentStateBit: bit
	^self presentState anyMask: (1 bitShift: bit)