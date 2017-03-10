accessing - bus control
busControlWord: index
	self address: index.
	^ self busControlData