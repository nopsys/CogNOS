initialization
initialize
	super initialize.

	mouseDataCount := modifiersAndButtons := 0.
	mouseCoord := DisplayScreen actualScreenSize // 2.
	configBits := 0.
	
	keysMapping := self class generatedEnglishKeysMapping.
	decoder :=  ScancodeDecoder new.

	self initializeHardware.
	self initializeEventsQueue.