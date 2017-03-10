initialization
initializeHardware
	self report: 'Performing keyboard initialization'.
	self controllerSelfTest
		ifFalse: 
			[self report: 'controller self test: failed.'.
			^ false].
	self report: 'controller self test: Ok'.
	self keyboardSelfTest
		ifFalse: 
			[self report: 'keyboard self test: failed.'.
			^ false].
	self report: 'keyboard self test: Ok'.
	self enableKeyboard.
	self report: 'keyboard enabled'.
	self resetKeyboard. 
	self report: 'keyboard reset'.
