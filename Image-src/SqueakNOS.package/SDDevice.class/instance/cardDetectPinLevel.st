low level
cardDetectPinLevel
	^(self testPresentStateBit: 18) ifTrue: [1] ifFalse: [0]