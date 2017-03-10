initialization
initializeKeyboardHardware

	self report: 'Performing keyboard initialization';
		commandByte: 0.
	self report: 'reseting keyboard'.
	self
		resetKeyboard;
		commandByte: 0;
		report: 'keyboard reset.'.

	self testController
		ifFalse: 
			[self report: 'controller self test: failed.'.
			^ false].

	self report: 'controller self test: Ok'.
	self testKeyboardInterface
		ifFalse: 
			[self report: 'keyboard self test: failed.'.
			^ false].
	self report: 'keyboard self test: Ok'.

	self testKeyboardEcho
		ifFalse: 
			[self report: 'keyboard echo: failed.'.
			^ false].
	self report: 'keyboard echo: Ok'";
		keyboardLeds: 0;
		keyboardScanCodeSet: 1".		" this two commented out because they take too long to complete :( "
