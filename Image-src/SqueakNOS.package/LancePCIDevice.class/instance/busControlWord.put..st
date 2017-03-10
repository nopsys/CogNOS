accessing - bus control
busControlWord: index put: word
	^ self
		address: index;
		busControlData: word.