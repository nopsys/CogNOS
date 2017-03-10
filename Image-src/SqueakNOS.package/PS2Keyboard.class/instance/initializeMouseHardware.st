initialization
initializeMouseHardware

	self report: 'Performing mouse initialization'.

	self testMouseInterface ifTrue: [
		self report: 'Mouse present'.
		self mouseSampleRate: 16rC8. 
		self mouseSampleRate: 16r64. 
		self mouseSampleRate: 16r50.
		self mouseId = 16r03
			ifTrue: [
				self report: 'Enabling mouse scrolling.'.
				self enableMouseScrollingParsing]
			ifFalse: [self disableMouseScrollingParsing].
"		self disableMouseScrollingParsing."
		self "disableMouse;
			resetMouse;"
			enableMouse";
			enableMouseInputBufferFullInterrupt;	 not needed, commandByte: 16r47 enables all 
			enableMouseInterface"].
