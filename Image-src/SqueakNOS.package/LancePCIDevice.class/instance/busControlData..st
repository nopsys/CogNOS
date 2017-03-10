accessing - bus control
busControlData: word
	^ self shortAt: 16r16 put: word