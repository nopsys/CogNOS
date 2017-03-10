accessing - bus control
softwareStyleRegister: newStyle
	^ self busControlWord: 20 put: newStyle